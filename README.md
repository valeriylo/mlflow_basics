## Локальный запуск проекта MLflow

1. 🔍 **Проверяем Docker**  
   Выполните `docker --version`. Если команда не найдена, установите Docker Desktop с официального сайта и убедитесь, что Docker Engine запущен.
   (см. [Docker Desktop](https://www.docker.com))

2. 🔧 **Убеждаемся, что установлен Git**  
   Запустите `git --version`.
   
   Если Git отсутствует, обратитесь к инструкции [Git](https://git-scm.com).

3. 📁 **Клонируем репозиторий в рабочую директорию**  
   ```bash
   git clone https://github.com/valeriylo/mlflow_basics <название_рабочей_директории>
   ```
   Перейдите в созданную директорию проекта.

4. 🗝️ **Настраиваем переменные окружения**  
   Создайте файл `.env` и скопируйте в него содержимое файла `example.env` и измените значения кредов на свои, при необходимости.

5. 🏗️ **Запускаем контейнеры**  
   ```bash
   docker-compose up -d --build
   ```

6. 🔄 **Проверяем состояние контейнеров**  
   Просмотрите запущены ли контейнеры командой `docker ps` и проверьте логи командой `docker-compose logs`. Все сервисы должны быть в статусе `healthy`, без ошибок.

7. 🐍 **Создаём виртуальное окружение**
   Для Linux/MacOS:
   ```bash
   python3 -m venv venv
   ```
   Для Windows
   ```bash
   py -m venv venv
   ```
   Активируйте окружение перед следующими шагами командой `source venv/bin/activate` или `source venv/Scripts/activate` для Windows.

8. 📦 **Устанавливаем зависимости для теста модели**  
   ```bash
   cd test_model
   pip install -r requirements.txt
   ```

9. ▶️ **Запускаем проверочный скрипт**  
   ```bash
   python test_model.py
   ```

10. 🌐 **Сервисы проекта**  
    - MLflow UI: `http://localhost:5000`
    - MinIO Console: `http://localhost:9001`  
    - PostgreSQL: `localhost:5432`

11. ✅ **Проверяем результат**  
    Убедитесь, что скрипт завершился без ошибок и новая модель появилась в MLflow UI.
