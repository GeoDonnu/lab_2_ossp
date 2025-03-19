#!/bin/bash

# Запит шляху до локального каталогу
read -p "Введіть шлях до локального каталогу: " LOCAL_DIR

# Перевірка, чи існує каталог
if [ ! -d "$LOCAL_DIR" ]; then
  echo "Помилка: Каталог '$LOCAL_DIR' не існує."
  exit 1
fi

# Запит URL віддаленого репозиторію
read -p "Введіть URL віддаленого репозиторію (наприклад, https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git): " REMOTE_REPO

# Перехід до каталогу
cd "$LOCAL_DIR" || { echo "Помилка: Не вдалося перейти у каталог $LOCAL_DIR"; exit 1; }

# Ініціалізація локального репозиторію
git init

# Перевірка, чи додано віддалений репозиторій
if git remote | grep -q origin; then
  echo "Віддалений репозиторій вже додано."
else
  git remote add origin "$REMOTE_REPO"
fi

# Додавання всіх файлів у репозиторій
git add .

# Створення коміту (перевіряємо, чи є зміни для коміту)
if git diff --cached --quiet; then
  echo "Немає змін для коміту."
else
  git commit -m "Initial commit"
fi

# Встановлення гілки main
git branch -M main

# Спочатку виконати git pull, щоб синхронізувати локальні і віддалені зміни
git pull origin main --allow-unrelated-histories --no-rebase

# Відправлення у віддалений репозиторій
git push -u origin main

echo "Файл успішно додано в репозиторій!"
