import sqlalchemy
from sqlalchemy.orm import sessionmaker
import datetime
from models import create_tables, Book, Publisher, Shop, Stock, Sale

DSN = 'postgresql://postgres:12345678@localhost:5432/bookstore'
engine = sqlalchemy.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)

session = Session()

def add_data(session):
    publisher1 = Publisher(name='Пушкин')
    book1 = Book(title='Капитанская дочка', id_publisher='1')
    shop1 = Shop(name='Буквоед')
    stock1 = Stock(id_book='1', id_shop='1')
    sale1 = Sale(price='600', date_sale='09-11-2022', id_stock='1', count='1')

    session.add_all([publisher1, book1, shop1, stock1, sale1])
    session.commit()


def find_publisher(session, data_find):
    query = session.query(Stock, Book.title, Shop.name, Sale.price, Sale.date_sale)
    query = query.join(Sale)
    query = query.join(Shop)
    query = query.join(Book)
    query = query.join(Publisher)
    recodrs = query.filter(Publisher.name == (data_find))
    res = list()
    for c in recodrs:
        res.append(f'{c[1]} | {c[2]} | {c[3]} | {str(c[4])}')
    return res


if __name__ == '__main__':
    create_tables(engine)
    add_data(session)
    data_find = input('Издатель: ')
    res = find_publisher(session, data_find)
    print(*res)

session.close()
