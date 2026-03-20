.DEFAULT_GOAL := help

help:
	@echo "Доступные команды:"
	@echo "  make start		- Запустить контейнер в фоновом режиме"
	@echo "  make stop		- Остановить контейнер"
	@echo "  make reload	- Перезапустить контейнер"
	@echo "  make fix		- Исправление порта прокси"
	@echo "  make prepare	- Установка Docker Docker-compose"

fix:
	@echo "Подготовка окружения..."
	@NEW_PORT=$$((RANDOM % (65535 - 1024 + 1) + 1024)); \
	echo "PORT=$$NEW_PORT" > .env; \
	echo "Создан новый порт $$NEW_PORT"
	@echo "Готово!"

start:
	@echo "Запуск контейнера..."
	@docker-compose up -d || { \
		echo "Ошибка при запуске контейнера. Запуск подготовки окружения..."; \
		$(MAKE) fix; \
		echo "Повторный запуск контейнера..."; \
		docker-compose up -d; \
	}
	@echo "Контейнер запущен"
	@./show-link.sh

stop:
	@echo "Остановка контейнера..."
	docker-compose down
	@echo "Контейнер запущен"

reload:
	@echo "Перезапуск контейнера..."
	docker-compose up -d --force-recreate
	@echo "Контейнер перезапущен"

prepare:
	@echo "Установка утилит"
	apt update && apt upgrade
	apt install curl docker-compose -y
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	rm -f get-docker.sh
	@echo "Установка завершена"
	docker --version
	docker-compose --version
	