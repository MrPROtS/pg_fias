# PostgreSQL FIAS

### Установка
Зависимости
```sh
$ pip2 install dbf2csv
$ pip3 install psycopg2
$ mv .env.example .env
```
Настройте перемнные окружения в .env

### Развертывание БД
Отредактируйте regions.csv. Оставте нужные вам регионы
```sh
$ psql DBNAME < schema/FIAS.sql 
$ psql DBNAME < ./sql/add_regions.sql
```

### Первичная загрузка

запустите fias2pg.py

```sh
$ python3 fias2pg.py
```
Скрипт загрузит полную версию ФИАС и сохранит его в ./dbf/full.zip
В зависимости от выбранных регионов, будет развернута полная база ФИАС
Обновение полной версии ФИАС full.zip происходит раз в месяц

### Обновление

просто запустите скрипт повторно

```sh
$ python3 fias2pg.py
```
Создайте cron задание на обновление. ФИАС обычно обновляется во вторник и четверг, в редких случаях в среду и пятницу

### Структура Базы
| Таблица | Описание |
| ------ | ------ |
| AddressObjects |  Классификатор адресообразующих элементов (край > область > город > район > улица) |
| Houses | Сведения по номерам домов улиц городов и населенных пунктов, номера земельных участков и т.п |
| Rooms | Сведения по помещениям |
| EstateStatus | Признак владения |
| StructureStatus | Признак строения |
| RoomType | Типы помещений |
| Regions | Список регионов для выгрузки и обновлений |
| Version | Версия ФИАС |

### Добавление новых регионов
```sh
INSERT INTO regions ( "code", "name" ) VALUES ('02', 'Республика Башкортостан');
```
и запустить скрипт
```sh
$ python3 fias2pg.py
```

### Благодарности
За основу была взята серия статей автора [@gladkovs](https://habr.com/ru/users/gladkovs/posts/) c [HABR](https://habr.com/)



