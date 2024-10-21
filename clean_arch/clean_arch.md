## Clean Architecture
### 1-domain
(entities - repository - use_case) 
### 2-data
(models - data_source - repository)
### 3-presentation
(controller - screens)
> start with domain layer
- 1- first entities >> only data that i need بعمل فيها ال انا بستخدمه بس من الريسبونس
- 2- second repository >> بعمل فيها الداله ال انا عايزه انفذها
- 3- third use_case >> باخذ ريفرنس من الريبو وانفذ بقي الداله ال في الريبو هنا
> then data layer
- 1- first models >> extent it from entity
- 2- data source >> remote(dio) & local(hive) for ex
- 3- repository >> refrence from data source
> then presentation layer
- 1- controller(cubit)
- 2- screens
