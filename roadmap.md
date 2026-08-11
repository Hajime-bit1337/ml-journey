# Роадмап ML/DS — 6 уровней

Источник: канал @magerdev1, посты 121-132.

## LEVEL 0 — Фундамент

- Linux/Bash: `cd`, `ls`, `mkdir`, `rm`, `chmod`/`chown`, SSH, простые `.sh` скрипты
- Git: `init`/`add`/`commit`/`push`/`pull`, ветки, merge, `.gitignore`
- Окружение: VS Code + дебаггер, Jupyter Notebook, venv/conda
- Технический английский

## LEVEL 1 — Data Stack. Превращаем Python в инструмент  ← Я ЗДЕСЬ

- **SQL:** SELECT/WHERE/GROUP BY/HAVING; JOINs (INNER/LEFT/CROSS); оконные функции
  (ROW_NUMBER, RANK, LAG/LEAD, OVER PARTITION BY) — спрашивают на каждом собесе.
  Ресурсы: тренажёр по SQL на Stepik, sql-ex.ru
- **NumPy:** векторизация (никаких for по массивам), broadcasting, shapes
- **Pandas:** DataFrame, чтение csv/json/sql, пропуски (fillna), pivot_table,
  merge/concat, groupby.
  Ресурсы: Kaggle Learn (Pandas, Data Cleaning), mlcourse.ai Тема 1
- **Визуализация:** Matplotlib (оси, размеры, сохранение), Seaborn (heatmap,
  boxplot, pairplot). Справочник: Python Graph Gallery
- **ПРОЕКТ ЭТАПА:** EDA по Titanic в Jupyter — загрузка через Pandas, поиск и
  заполнение пропусков, графики через Seaborn (кто выживал чаще: м/ж, богатые/бедные)

## LEVEL 2 — Math Core. Математика без фанатизма

- **Линал:** векторы/матрицы, dot product как мера схожести, размерности и shape mismatch
- **Матан:** производная, градиент, chain rule (основа backprop)
- **Теорвер и статистика:** распределения, правило 3 сигм, среднее vs медиана,
  стандартное отклонение, проверка гипотез, A/B-тесты, p-value
- Ресурсы: 3Blue1Brown (Essence of linear algebra, Essence of calculus),
  Stepik «Основы статистики» Карпова (части 1 и 2),
  книги: Траск «Грокаем глубокое обучение», «Статистика и котики»

## LEVEL 3 — Classic ML (основной инструмент: scikit-learn)

- **Алгоритмы:** линейная/логистическая регрессия как baseline, деревья решений,
  ансамбли — Random Forest, градиентный бустинг (CatBoost/XGBoost/LightGBM)
- **Метрики и валидация:** train/test split, кросс-валидация;
  классификация — Precision, Recall, F1, ROC-AUC (accuracy обманывает при дисбалансе);
  регрессия — MAE, MSE, RMSE
- **Feature engineering:** One-Hot/Label Encoding, StandardScaler
- Ресурсы: mlcourse.ai темы 3-10, Géron «Hands-On ML» (Part 1), sklearn User Guide
- **ПРОЕКТ:** Titanic всерьёз — кодирование пола, заполнение возраста в зависимости
  от класса каюты, RandomForestClassifier, ROC-AUC, submit на Kaggle
- Другие датасеты: House Prices (регрессия), Credit Card Fraud (дисбаланс классов),
  Fashion MNIST (CV), SMS Spam (NLP), Wine Quality (мультикласс)

## LEVEL 4 — Deep Learning (PyTorch)

- **PyTorch:** тензоры, autograd, `torch.nn` + functional, Dataset/DataLoader,
  цикл forward → loss → backward → step
- **Архитектуры:** MLP, CNN (CV: классификация, детекция, сегментация),
  RNN/LSTM/GRU, Transformers и attention
- **Training best practices:** подбор loss/метрики, dropout и weight decay,
  Adam/AdamW + LR scheduler, early stopping и чекпойнты, seed'ы и фиксация версий,
  mixed precision (AMP), нормализация и аугментации
- Transfer learning вместо обучения с нуля в 90% случаев
- Железо: Google Colab / Kaggle Notebooks (бесплатный GPU)
- Ресурсы: fast.ai Practical DL for Coders, DeepLearning.AI (Andrew Ng),
  PyTorch Blitz, Hugging Face Course
- **ПРОЕКТ:** transfer learning на ResNet для простой CV-задачи, замена головы,
  3-5 эпох, accuracy + confusion matrix, `torch.save` + inference-скрипт

## LEVEL 5 — MLOps & Engineering

- **Docker:** Dockerfile, build/run, порты и ENV, volumes, docker-compose.
  Правило: проект поднимается одной командой
- **FastAPI:** `/predict` (JSON + валидация через Pydantic), `/health`,
  версионирование `/v1/predict`. Плюс Streamlit для демо
- **MLOps:** MLflow (трекинг экспериментов, реестр моделей), DVC (версии данных
  и моделей), Airflow/Prefect (пайплайны), pytest + ruff/black + pre-commit,
  CI/CD через GitHub Actions, мониторинг (логи, latency, error rate, data/model drift)
- Ресурсы: Made With ML, FastAPI Tutorial, MLflow Docs, DVC Docs
- **ФИНАЛЬНЫЙ ПЕТ-ПРОЕКТ** (то, что реально продаёт на собесе): модульный код без
  «лапши в ноутбуке», конфиги, обучение + валидация + воспроизводимость,
  FastAPI-сервис, Dockerfile + compose, README с примером curl-запроса

---

# Что в этом роадмапе слабо (добираем отдельно)

- **Нет алгоритмов и структур данных** — а на собесах в ML их спрашивают.
  LeetCode easy/medium фоном, 2-3 задачи в неделю с недели 4.
- **Нет ML System Design** — обязательно для позиций выше стажёра.
  Добавить между Level 4 и Level 5, с недели 12.
- **Математика дана обзорно** (видео 3Blue1Brown). Их недостаточно: после видео
  обязательно реализовывать руками на numpy — градиентный спуск, линейную
  регрессию, backprop для простой сети.
- **Level 1 легко проскочить мимо SQL**, увлёкшись Pandas. Не давать этого сделать:
  оконные функции спрашивают почти всегда.

---

# План на 16 недель

| Недели | Что делаем |
|---|---|
| 1 | Git + venv + терминал. Дочитать Kaggle Pandas (уроки 5-6). NumPy. |
| 2 | SQL: база, JOINs, оконные функции. Практика на sql-ex. |
| 3 | Matplotlib/Seaborn + EDA по Titanic → первый репозиторий на GitHub. |
| 4-5 | Level 2. Статистика Карпова (обе части) — это главное, её нет совсем. Линал/матан — повторение под ML + руками на numpy. |
| 6-9 | Level 3, самый важный блок. mlcourse.ai темы 3-10, Géron Part 1. Проекты: Titanic всерьёз, House Prices, Credit Card Fraud. |
| 10 | Резюме, GitHub, LinkedIn. **НАЧИНАЮ РАССЫЛАТЬ.** Параллельно учусь дальше. |
| 10-12 | Level 4. PyTorch, тренировочный цикл, transfer learning. Одно направление: CV или NLP. Не оба. |
| 13-15 | Level 5. Docker, FastAPI, MLflow, CI/CD. Финальный пет-проект: модель + сервис + контейнер + README. |
| 16 | Полировка портфолио, мок-собесы, разбор отказов. |

Фоном: LeetCode 2-3 задачи в неделю с недели 4. ML System Design с недели 12.

## Правила по темпу

- Отставание больше чем на неделю — сказать прямо и предложить, что урезать,
  а не «наверстаем».
- Не зависать на математике дольше двух недель. Цель — понимать, а не сдать экзамен.
- Каникулы кончатся, и 35-45 часов превратятся в 10-15. Тяжёлые блоки
  (математика, Classic ML) грузим сейчас.
- Реалистичное ожидание: к концу 4-го месяца я готов подаваться. Оффер,
  скорее всего, придёт на 6-8-м месяце. Это нормально, а не провал.
- Расширять воронку: Data Analyst и Python-бэкенд с ML-задачами — нормальные
  точки входа.
