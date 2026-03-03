$ErrorActionPreference = 'Stop'

$docsPath = Join-Path $PSScriptRoot '..\docs'
$docsPath = (Resolve-Path $docsPath).Path

function Get-TitleFromContent {
    param(
        [string]$FileName,
        [string]$Content
    )

    $headingMatch = [regex]::Match($Content, '(?m)^#\s+(.+?)\s*$')
    if ($headingMatch.Success) {
        return $headingMatch.Groups[1].Value.Trim()
    }

    return [System.IO.Path]::GetFileNameWithoutExtension($FileName)
}

$encoding = New-Object System.Text.UTF8Encoding($false)
$files = Get-ChildItem -LiteralPath $docsPath -File -Filter '*.md'

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)

    $normalizedContent = $content
    while ($normalizedContent -match '%25([0-9A-Fa-f]{2})') {
        $normalizedContent = $normalizedContent -replace '%25([0-9A-Fa-f]{2})', '%$1'
    }

    $nameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $mediaFolderName = ($nameWithoutExt -replace '\s[0-9a-f]{32}$', '')
    $mediaFolderPath = Join-Path $docsPath $mediaFolderName
    if (Test-Path -LiteralPath $mediaFolderPath -PathType Container) {
        $encodedMediaFolderName = [System.Uri]::EscapeDataString($mediaFolderName)
        $normalizedContent = $normalizedContent -replace [regex]::Escape("($encodedMediaFolderName/"), "($mediaFolderName/"
    }

    if ($normalizedContent -notmatch '^(?s)---\r?\n.*?\r?\n---\r?\n') {
        $title = Get-TitleFromContent -FileName $file.Name -Content $normalizedContent
        $frontMatter = @(
            '---'
            "title: $title"
            'nav_exclude: true'
            '---'
            ''
        ) -join "`r`n"

        $normalizedContent = $frontMatter + $normalizedContent
    }

    [System.IO.File]::WriteAllText($file.FullName, $normalizedContent, $encoding)
}

Write-Output "Normalized $($files.Count) markdown files in $docsPath"