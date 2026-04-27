import sqlite3

def init_db():
    conn = sqlite3.connect('music_salon.db')
    with open('database.sql', 'r') as f:
        conn.executescript(f.read())
    conn.close()

def add_user(username, role):
    conn = sqlite3.connect('music_salon.db')
    cursor = conn.cursor()
    cursor.execute("INSERT INTO USERS (username, role) VALUES (?, ?)", (username, role))
    conn.commit()
    conn.close()

if __name__ == "__main__":
    init_db()
    print("База данных инициализирована!")
