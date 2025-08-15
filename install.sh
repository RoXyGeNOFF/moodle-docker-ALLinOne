#!/bin/bash

set -e

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

echo -e "${YELLOW}=== Moodle Docker: установка... ===${NC}"

# Проверка прав sudo
if [[ $EUID -ne 0 ]]; then
   echo -e "${YELLOW}Скрипт будет запрашивать sudo для установки зависимостей${NC}"
fi

# Установка зависимостей
if ! command -v docker &> /dev/null; then
    echo -e "${GREEN}Устанавливаем Docker...${NC}"
    sudo apt update
    sudo apt install -y docker.io
    sudo systemctl enable docker --now
fi

if ! command -v docker-compose &> /dev/null; then
    echo -e "${GREEN}Устанавливаем Docker Compose...${NC}"
    sudo apt install -y docker-compose
fi

if ! command -v git &> /dev/null; then
    echo -e "${GREEN}Устанавливаем Git...${NC}"
    sudo apt install -y git
fi

# Клонирование moodle-docker
if [ ! -d "moodle-docker" ]; then
    git clone https://github.com/moodlehq/moodle-docker.git
fi

cd moodle-docker

# Копируем .env
if [ ! -f ".env" ]; then
    cp ../.env.example .env
fi

# Создание директорий
mkdir -p moodle postgres

# Запуск
docker-compose up -d

echo -e "${GREEN}==============================================${NC}"
echo -e "${GREEN}Moodle успешно установлен!${NC}"
echo -e "Доступ: ${YELLOW}http://localhost:8000${NC}"
echo -e "${GREEN}==============================================${NC}"
echo "Для остановки: docker-compose down"
echo "Для запуска: docker-compose up -d"

# Показ QR-кода для доната
if [ -f "../donate_qr.jpeg" ]; then
    echo -e "${YELLOW}Поддержать разработчика:${NC}"
    echo "USDT (TRC20): TDb2rmYkYGoX2o322JmPR12oAUJbkgtaWg"
    if command -v xdg-open &> /dev/null; then
        xdg-open ../donate_qr.jpeg >/dev/null 2>&1 &
    elif command -v open &> /dev/null; then
        open ../donate_qr.jpeg
    fi
fi
