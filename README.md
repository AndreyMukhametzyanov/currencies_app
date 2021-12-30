# Currency with views on Rails

Сервис собирает данные с 'https://www.cbr.ru/scripts/XML_daily.asp' и выводит пользователю актуальные на сегодняшний день данные по всем валютам мира

Запуск:

- Установить зависимости
```shell
bundle install
```

- Создать БД
```shell
rails db:create
```

- Запустить миграции
```shell
rails db:migrate
```

- Запустить загрузку данных
```shell
rake load_currencies
```
- Установить гем 'foreman' https://github.com/ddollar/foreman
```shell
gem install foreman
```

- Запустить 'foreman'
```shell
foreman start
```
