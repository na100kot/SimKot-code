import sqlite3

def init_db():
    conn = sqlite3.connect('music_salon.db')
    with open('database.sql', 'r') as f:
        conn.executescript(f.read())
    conn.close()

def add_user(username, password_hash, role):
    conn = sqlite3.connect('music_salon.db')
    cursor = conn.cursor()
    cursor.execute("INSERT INTO USERS (username, password_hash, role) VALUES (?, ?, ?)", 
                   (username, password_hash, role))
    conn.commit()
    conn.close()
