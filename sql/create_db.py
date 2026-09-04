import numpy, sqlite3 as sq3
from datetime import date, timedelta
from pathlib import Path

conn = Path(__file__).resolve().parent / "shop.db"
cur = conn.cursor()
cur.executescript("""
    DROP TABLE IF EXISTS customers;

    CREATE TABLE customers(
        id INTEGER PRIMARY KEY,
        name TEXT,
        city TEXT,
        signup_date TEXT
    );

    INSERT INTO customers (id, name, city, signup_date) VALUES (1, 'Андрей', 'Токио', '2024-04-24');
    INSERT INTO customers (id, name, city, signup_date) VALUES (2, 'Маша', 'Париж','2025-12-17');
    INSERT INTO customers (id, name, city, signup_date) VALUES (3, 'Никита', 'Стамбул', '2026-02-01');
    INSERT INTO customers (id, name, city, signup_date) VALUES (4, 'Артур', 'Лондон', '2025-01-30');
    INSERT INTO customers (id, name, city, signup_date) VALUES (5, 'Гоша', 'Москва', '2024-04-12');
    INSERT INTO customers (id, name, city, signup_date) VALUES (6, 'Мухамед', 'Париж','2025-11-30');
    INSERT INTO customers (id, name, city, signup_date) VALUES (7, 'Никита', 'Москва', '2023-01-02');
    INSERT INTO customers (id, name, city, signup_date) VALUES (8, 'Павел', NULL, '2026-03-15');

    DROP TABLE IF EXISTS orders;

    CREATE TABLE orders(
        id INTEGER PRIMARY KEY,
        customer_id INTEGER,
        amount REAL,
        order_date TEXT
    )
""")

rng = numpy.random.default_rng(42)
rows = []
for i in range(1, 41):
    id = i
    if id == 9:
        customer_id = 999
        amount = float(rng.uniform(100.0, 10000.0))
        d = date(2025, 1, 1) + timedelta(days=int(rng.integers(0, 700)))
        order_date = d.isoformat()
        rows.append((id, customer_id, amount, order_date))
        continue
    while True:
        customer_id = int(rng.integers(1, 9))
        if customer_id != 7:
            break
    amount = float(rng.uniform(100.0, 10000.0))
    d = date(2025, 1, 1) + timedelta(days=int(rng.integers(0, 700)))
    order_date = d.isoformat()
    rows.append((id, customer_id, amount, order_date))

cur.executemany('INSERT INTO orders VALUES (?, ?, ?, ?)', rows)

conn.commit()
conn.close()