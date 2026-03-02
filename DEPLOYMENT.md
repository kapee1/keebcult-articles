---
layout: default
title: Как развернуть на GitHub Pages
nav_order: 9
---

# Развертывание на GitHub Pages

Это подробное руководство по опубликованию вашей документации на GitHub Pages.

## Предварительные требования

- GitHub аккаунт
- Git установлен на компьютере
- Знание базовых команд Git

## Шаг 1: Создайте репозиторий на GitHub

1. Перейдите на [GitHub](https://github.com)
2. Нажмите **New repository**
3. Назовите репозиторий: `keebcult-articles` (или другое имя)
4. Выберите **Public** (чтобы был доступен через Pages)
5. Нажмите **Create repository**

## Шаг 2: Инициализируйте Git в проекте

```bash
cd c:\Users\volod\keebcult-articles
git init
git add .
git commit -m "Initial commit: Jekyll site with Just the Docs"
```

## Шаг 3: Добавьте удаленный репозиторий

```bash
git remote add origin https://github.com/YOUR_USERNAME/keebcult-articles.git
git branch -M main
git push -u origin main
```

Замените `YOUR_USERNAME` на ваше имя пользователя GitHub.

## Шаг 4: Включите GitHub Pages

1. Перейдите в **Settings** репозитория
2. Найдите секцию **Pages** в боковой панели
3. В разделе "Source" выберите ветку `main`
4. Нажмите **Save**

## Шаг 5: Настройте URL (опционально)

Если вы хотите использовать свой домен, добавьте "CNAME" файл с вашим доменом.

Для GitHub Pages URL будет таким:
- `https://YOUR_USERNAME.github.io/keebcult-articles/`

## Локальное тестирование

Перед публикацией можете протестировать локально:

### Windows PowerShell

```powershell
# Установите Ruby (если не установлен)
# С https://rubyinstaller.org/

# Установите Bundler
gem install bundler

# Установите зависимости
bundle install

# Запустите локальный сервер
bundle exec jekyll serve
```

Затем откройте `http://localhost:4000` в браузере.

## Обновления

После каждого изменения:

```bash
git add .
git commit -m "Описание изменений"
git push origin main
```

GitHub Pages автоматически обновит сайт в течение нескольких минут.

## Проблемы и решения

### Сайт не обновляется
- Ждите 3-5 минут после push'а
- Проверьте GitHub Pages настройки в Settings

### Ошибки сборки
- Проверьте `_config.yml` синтаксис
- Посмотрите вкладку "Actions" в репозитории для логов ошибок

### Стиль не применяется
- Убедитесь, что `theme: just-the-docs` в `_config.yml`
- Перейдите в Settings → Pages и выберите "Jekyll" как построитель

## Полезные ссылки

- [GitHub Pages документация](https://pages.github.com/)
- [Jekyll документация](https://jekyllrb.com/)
- [Just the Docs документация](https://just-the-docs.github.io/just-the-docs/)
