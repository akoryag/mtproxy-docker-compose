# Telegram MTProto Proxy

Данный проект разворачивает MTProto прокси для Telegram с использованием Docker.

## Предварительные требования

- Установленный Git
- Docker и Docker Compose (версия 2 или выше)
- Права на выполнение команд с sudo (если требуется)

## Команды Make

```bash
make help
```

| Команда | Описание |
|---------|----------|
| `make start` | Запустить контейнер в фоновом режиме |
| `make stop` | Остановить контейнер |
| `make reload` | Перезапустить контейнер |
| `make fix` | Исправление порта прокси (отрабатывает автоматоматически) |
| `make prepare` | Установка Docker Docker-compose |

## Установка и запуск

### 0. Подготовка
```bash
apt update
apt install make git -y
git clone https://github.com/akoryag/mtproxy-docker-compose.git
cd mtproxy-docker-compose
```
Затем выполнить команду, либо вручную установить Docker и Docker-compose
```bash
make prepare
```
После выполнения make prepare будет установлен Docker и Docker-compose

### 1. Запуск
Запуск производится командой make
```bash
make start
```
Либо в ручном режиме, но может потребоваться замена порта в docker-compose.yml\
443:443 Например на 33813:443
```bash
docker-compose up -d
```
После запуска контейнера, в терминале будет ссылка для подключения прокси
Пример
```
tg://proxy?server=IP&port=443&secret=SECRET
```
Либо в ручном режиме, посмотреть через логи
```
docker compose logs
```