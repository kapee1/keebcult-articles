# Инструкции по настройке и развертыванию Keebcult Wiki

Это полное руководство по подготовке и публикации вашего сайта на GitHub Pages.

## 📋 Что вы получите

- ✅ Полностью готовый Jekyll сайт с темой Just the Docs
- ✅ **25+ подробных статей** о механических клавиатурах
- ✅ Красивая навигация и поиск
- ✅ Мобильная оптимизация
- ✅ Возможность легко добавлять новые статьи

## 🚀 Шаг за шагом

### Шаг 1: Подготовка GitHub

1. Перейдите на [github.com](https://github.com)
2. Нажмите **+** → **New repository**
3. Заполните форму:
   - **Repository name:** `keebcult-articles`
   - **Description:** "База знаний о механических клавиатурах"
   - **Public** — выберите (обязательно!)
4. Нажмите **Create repository**

### Шаг 2: Инициализация Git (в VS Code терминал)

```powershell
cd c:\Users\volod\keebcult-articles

git init
git add .
git commit -m "Initial commit: Keebcult Wiki Jekyll site"
git branch -M main
```

### Шаг 3: Добавьте удаленный репозиторий

```powershell
git remote add origin https://github.com/YOUR_USERNAME/keebcult-articles.git
git push -u origin main
```

**Замените `YOUR_USERNAME` на ваше имя на GitHub**

### Шаг 4: Включите GitHub Pages

1. Перейдите в репозиторий на GitHub
2. Откройте **Settings** (⚙️)
3. В боковой панели найдите **Pages**
4. В разделе "Source" выберите:
   - Branch: `main`
   - Folder: `/ (root)`
5. Нажмите **Save**

### Шаг 5: Ждите развертывания

- ⏳ GitHub Pages начнет собирать сайт (3-5 минут)
- ✅ Когда будет готово, вы увидите ссылку вверху страницы Pages
- Обычно это: `https://YOUR_USERNAME.github.io/keebcult-articles/`

## 🔧 Локальное тестирование (опционально)

Перед отправкой на GitHub можете протестировать локально.

### На Windows (PowerShell)

```powershell
# Если у вас нет Ruby, скачайте с https://rubyinstaller.org/

# Перейдите в папку проекта
cd c:\Users\volod\keebcult-articles

# Установите зависимости
bundle install

# Запустите локальный сервер
bundle exec jekyll serve
```

### Открыть сайт

Перейдите в браузер: `http://localhost:4000`

Вы увидите сайт! Он автоматически обновляется при изменении файлов.

## 📝 Структура файлов

```
keebcult-articles/
├── _config.yml              # Конфигурация Jekyll ⚙️
├── index.md                 # Главная страница
├── DEPLOYMENT.md            # Гайд развертывания
├── GETTING_STARTED.md       # Гайд для новичков
├── SETUP_INSTRUCTIONS.md    # Этот файл
├── Gemfile                  # Зависимости
├── LICENSE                  # MIT Лицензия
├── .gitignore              # Git исключения
└── docs/
    ├── keyboards/          # 📖 Клавиатуры
    ├── switches/           # 📖 Свичи
    ├── stabilizers/        # 📖 Стабилизаторы
    ├── keycaps/            # 📖 Кейкапы
    ├── tools/              # 📖 Инструменты
    ├── community/          # 📖 От комьюнити
    ├── resources/          # 📖 Ресурсы
    └── quick-reference.md  # 📖 Быстрая справка
```

## ✏️ Добавление новых страниц

### Создайте новый файл

Например, новую статью "Выбор корпуса":

1. Создайте файл: `docs/keyboards/choosing-case.md`

2. Добавьте в начало файла:

```markdown
---
layout: default
title: Выбор корпуса для клавиатуры
parent: Клавиатуры
nav_order: 4
---

# Выбор корпуса для клавиатуры

Содержание вашей статьи здесь...
```

3. Сохраните и отправьте на GitHub:

```powershell
git add .
git commit -m "Add article: choosing keyboard case"
git push origin main
```

4. Сайт обновится в течение 3-5 минут

## 🔍 Важные параметры frontmatter

```markdown
---
layout: default          # Всегда используйте "default"
title: Название          # Будет в навигации
parent: Название родителя  # Для вложенных страниц опционально
nav_order: 1            # Порядок в меню (1, 2, 3...)
has_children: true      # Если эта страница содержит подстраницы
---
```

## 🎨 Кастомизация конфигурации

Отредактируйте `_config.yml` для усовершенствования:

```yaml
title: Keebcult Wiki                    # Название сайта
baseurl: "/keebcult-articles"           # URL страницы
url: "https://github.com"               # Основной URL
color_scheme: "light"                   # "light" или "dark"
```

## 🐛 Решение проблем

### Сайт не обновляется

- ⏳ Подождите 5 минут
- 🔄 Очистите кэш браузера (Ctrl+Shift+Del)
- 📋 Проверьте статус в **Actions** вкладке репозитория

### YAML ошибки

Jekyll не примет файл с ошибками в YAML frontmatter:

```markdown
❌ Неправильно:
---
layout: default
title: Слишком :"много "кавычек"
---

✅ Правильно:
---
layout: default
title: "Слишком: много кавычек"
---
```

### Стиль не применяется

- Проверьте, что в `_config.yml` указано: `theme: just-the-docs`
- Убедитесь, что сайт собирается (смотрите в **Actions**)

## 📚 Дополнительные ресурсы

- [Just the Docs документация](https://just-the-docs.github.io/just-the-docs/)
- [Jekyll документация](https://jekyllrb.com/docs/)
- [GitHub Pages помощь](https://docs.github.com/en/pages)
- [Markdown шпаргалка](https://www.markdownguide.org/)

## ✨ Следующие шаги

1. ✅ Развертайте сайт на GitHub Pages
2. 📝 Добавьте свои статьи
3. 🔗 Поделитесь ссылкой с сообществом Keebcult
4. 👥 Приглашайте людей контрибьютить (через Pull Requests)
5. 🎨 Кастомизируйте под ваши нужды

## 🤝 Участие в проекте

Хотите добавить статью или исправить ошибку?

1. Создайте форк репозитория
2. Отредактируйте файлы
3. Откройте Pull Request
4. Мы рассмотрим и объединим изменения

## 📞 Помощь

Если что-то не работает:

- 💬 Спросите в [Telegram чате Keebcult](https://t.me/keebcult)
- 🐛 Создайте Issue в репозитории
- 📧 Отправьте [обратную связь](https://t.me/+ZyzFf2iS72NhZDIy)

---

**Поздравляем! Вы готовы запустить Keebcult Wiki!** 🚀

Это всё. После шага 4 ваш сайт будет живой и доступен в Интернете.
