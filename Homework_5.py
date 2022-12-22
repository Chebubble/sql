import psycopg2
from pprint import pprint


def create_db(cur):
    cur.execute("""
                CREATE TABLE IF NOT EXISTS clients(
                id SERIAL PRIMARY KEY,
                first_name VARCHAR(60) NOT NULL,
                last_name VARCHAR(60) NOT NULL,
                email VARCHAR(60) UNIQUE
                );
                CREATE TABLE IF NOT EXISTS clients_phones(
                id SERIAL PRIMARY KEY,
                client_id INT NOT NULL REFERENCES clients(id),
                phones VARCHAR(14)
                );
                """)

def add_client(cur, first_name, last_name, email, phones=None):
    cur.execute("""
                    INSERT INTO clients(first_name, last_name, email)
                    VALUES (%s, %s, %s)
                    RETURNING id;
                    """, (first_name, last_name, email))
    client_id = cur.fetchone()
    if phones:
        cur.execute("""
                    INSERT INTO clients_phones(client_id, phones)
                    VALUES (%s, %s)
                    """, (client_id, phones))

def add_phone(cur, client_id, phones):
        cur.execute("""
                    INSERT INTO clients_phones(client_id, phones)
                    VALUES (%s, %s)
                    """, (client_id, phones))

def change_client(cur, client_id, first_name=None, last_name=None, email=None, phones=None):
    if phones != None:
        cur.execute("""
                    UPDATE clients_phones
                    SET phones = %s
                    WHERE client_id = %s
                    """, (phones, client_id))
    if email != None:
        cur.execute("""
                    UPDATE clients
                    SET email = %s
                    WHERE id = %s
                    """, (email, client_id))
    if last_name != None:
        cur.execute("""
                   UPDATE clients
                   SET last_name = %s
                   WHERE id = %s
                   """, (last_name, client_id))
    if first_name != None:
        cur.execute("""
                    UPDATE clients
                    SET first_name = %s
                    WHERE id = %s
                    """, (first_name, client_id))

def delete_phone(cur, client_id=None, phone=None):
    cur.execute("""
            DELETE FROM clients_phones WHERE id=%s or phones=%s;
            """, (client_id, phone))


def delete_client(cur, client_id):
    cur.execute("""
            DELETE FROM clients_phones WHERE id=%s;
            """, (client_id))
    delete_phone(cur, None, client_id)

def find_client(cur, **data):
    query = "SELECT first_name, last_name, email, cp.phones FROM clients c \
        JOIN clients_phones cp ON c.id  = cp.client_id \
        WHERE " + ' and '.join(f"{k} like '{v}'" for k, v in data.items())
    cur.execute(query)
    return cur.fetchall()


with psycopg2.connect(database="clients_db", user="postgres", password="12345678") as conn:
    with conn.cursor() as cur:
        create_db(cur)
        add_client(cur, 'Dmitriy', 'Cheblukov', 'cheba@mail.ru', '+79999999')
        add_phone(cur, '1', '+799999991')
        change_client(cur, 1)
        delete_phone(cur, '+799999991')
        client = find_client(cur, first_name='Dmitriy', phones='+79999999')
        print(client)
        conn.commit()


conn.close()