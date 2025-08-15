# Moodle Docker: Установка за 1 минуту

Простой способ запустить Moodle через Docker без специальных знаний.

## Как установить

1. Откройте терминал
2. Выполните одну команду:
```bash
curl -sSL https://raw.githubusercontent.com/RoXyGeNOFF/moodle-docker-ALLinOne/install.sh | bash
```

## После установки
- Moodle будет доступен: [http://localhost:8000](http://localhost:8000)
- Для завершения работы: `docker-compose down`
- Для повторного запуска: `docker-compose up -d`

## Как это работает
1. Скрипт автоматически:
   - Устанавливает Docker и Git
   - Клонирует официальный репозиторий Moodle Docker
   - Создаёт необходимые директории
   - Настраивает окружение
   - Запускает контейнеры

## Требования
- Linux/MacOS
- Доступ в интернет
- Права sudo

> **Важно**: Для первого запуска потребуется 2-3 минуты на загрузку образов Docker. Последующие запуски мгновенны.

---
💖 Поддержать разработчика:
USDT (TRC20): `TDb2rmYkYGoX2o322JmPR12oAUJbkgtaWg`

![Donate](donate_qr.jpeg)
