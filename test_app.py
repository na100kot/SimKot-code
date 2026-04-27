import unittest
import sqlite3
import os
from main import init_db, add_user

class TestMusicSalon(unittest.TestCase):
    def setUp(self):
        if os.path.exists('music_salon.db'):
            os.remove('music_salon.db')
        init_db()

    def test_db_creation(self):
        self.assertTrue(os.path.exists('music_salon.db'))

    def test_add_user(self):
        add_user('test_admin', 'some_hash_value', 'admin')
        conn = sqlite3.connect('music_salon.db')
        res = conn.execute("SELECT username FROM USERS WHERE username='test_admin'").fetchone()
        self.assertIsNotNone(res)
        self.assertEqual(res[0], 'test_admin')
        conn.close()

    def test_cd_table_exists(self):
        conn = sqlite3.connect('music_salon.db')
        res = conn.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='COMPACT_DISCS'").fetchone()
        self.assertIsNotNone(res)
        conn.close()

if __name__ == '__main__':
    unittest.main()
