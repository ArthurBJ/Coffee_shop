# Coffeeshop Application

## Stack
* UIKit(programmatically)
* URLSession
* UserDefaults
* Yandex MapKit
* Custom UI elements
* MVP + Coordinator

Сетевой слой работает с API `http://147.78.66.203:3210/swagger`. При регистрации токен в формате JWT сохраняется на устройстве. Токен хранится какое-то определенное время и при входе в приложение проверяется **tokenLifetime**, и, если нужно обновить токен, переходит в меню входа.

Register Screen             | Coffeeshop List             |  Selected Coffeeshop Menu                  |  Order Screen                           |  Map Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/ArthurBJ/Coffee_shop/blob/main/assets/1.png)  |  ![](https://github.com/ArthurBJ/Coffee_shop/blob/main/assets/2.png)  |  ![](https://github.com/ArthurBJ/Coffee_shop/blob/main/assets/3.png) |  ![](https://github.com/ArthurBJ/Coffee_shop/blob/main/assets/4.png)   |  ![](https://github.com/ArthurBJ/Coffee_shop/blob/main/assets/5.png)  

## Test this app
1. To test this app you need to register in the [Developer tech Yandex](https://yandex.ru/maps-api/products/mapkit?ysclid=lvvc0r0c93347630746). And add `MapKit mobile SDK`
2. Setup this project for iOS.
3. Add Podfile `pod init`
4. Add `'pod 'YandexMapsMobile', '4.6.1-lite'`
5. `pod install`
6. Create `Config.plist`
7. Add **key** `API_KEY` with **value** `Your api key`
