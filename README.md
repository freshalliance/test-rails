# Тестовый проект

Запуск:

```
bundle
rails db:setup
rails s
```

### Админка

http://localhost:3000/admin

Email: admin@example.com

Password: password

### Задание

Изначально компания продает физическим лицам (client_type: basic) какую-то продукцию и использует этот код.

С недавнего времени стали поступать заказы от других компаний и для них
нужно предоставить отдельный интерфейс со своим списком позиций по
другой цене и отдельной авторизацией:

- сторонние компании могут авторизаться под своей учеткой
- сторонние компании могут видеть доступные позиции и цены на них
- сторонние компании могут сделать заказ на доступные позиции
- наша компания может добавлять сторонние компании и управлять позициями в /admin

Технически это будет примерно так:
 - модель ExternalShop с полями email, password
 - модель ExternalShopProduct описывает связь ExternalShop и Product с
   полями product_id, external_shop_id, price

Выбор инструментов ничем не ограничен. Оформлять никак не нужно. Тесты
писать не нужно. Только, просьба, дописать db/seeds.rb с новыми даннымы.

Задание не должно занимать больше часа, максимум 3 часа с учетом времени
знакомства с activeadmin. Если занимает больше, то вы что-то не так
поняли или не справляетесь, не нужно вливать сюда больше.
