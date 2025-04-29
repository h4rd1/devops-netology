
Задача 1

Сценарий выполнения задачи:

    Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.
    Если dockerhub недоступен создайте файл /etc/docker/daemon.json с содержимым: {"registry-mirrors": ["https://mirror.gcr.io", "https://daocloud.io", "https://c.163.com/", "https://registry.docker-cn.com"]}
    Зарегистрируйтесь и создайте публичный репозиторий с именем "custom-nginx" на https://hub.docker.com (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП);
    скачайте образ nginx:1.21.1;
    Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:

<html>
<head>
Hey, Netology
</head>
<body>
<h1>I will be DevOps Engineer!</h1>
</body>
</html>

    Соберите и отправьте созданный образ в свой dockerhub-репозитории c tag 1.0.0 (ТОЛЬКО ЕСЛИ ЕСТЬ ДОСТУП).
    Предоставьте ответ в виде ссылки на https://hub.docker.com/<username_repo>/custom-nginx/general .

![{0F98537F-C490-4CB3-90BB-9A8222437A1F}](https://github.com/user-attachments/assets/7eb47bc5-664d-4862-90a9-0f15e6c79ec7)

![{AD41FEAE-EC38-4078-AA60-FD946D300EAA}](https://github.com/user-attachments/assets/bca8cb68-198a-484f-a7dc-d3c289740515)

![{3CF15698-90C9-499C-BC65-C6DB088CC7F2}](https://github.com/user-attachments/assets/1bb974d0-d9fe-4feb-b998-237184f9b59f)


image доступен [h4rdl/kapustin-netology:1.0.0](https://hub.docker.com/repository/docker/h4rdl/kapustin-netology/general)


Задача 2

    Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:

    имя контейнера "ФИО-custom-nginx-t2"
    контейнер работает в фоне
    контейнер опубликован на порту хост системы 127.0.0.1:8080

    Не удаляя, переименуйте контейнер в "custom-nginx-t2"
    Выполните команду date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html
    Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

![{D47870A2-30BA-4084-A918-7BF1BC402A98}](https://github.com/user-attachments/assets/61d3780c-aff9-44e4-b308-6ca50cec6822)
![{E69AE2D7-E489-4A6C-BDD8-BD558A0B7418}](https://github.com/user-attachments/assets/4787d9ee-f904-4015-9f1a-49e0e5a4e3d0)
![{2BAB2976-4EC3-43BD-9928-957780D6E034}](https://github.com/user-attachments/assets/45b71002-0b4f-4e52-a805-e4981ae126f4)
![{E6F92C93-B90E-41D0-B340-A306E1552D92}](https://github.com/user-attachments/assets/23053a0f-2c5a-40b5-a4d8-6b31ee8bf2e4)

Задача 3

    Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".
    Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
    Выполните docker ps -a и объясните своими словами почему контейнер остановился.
    Перезапустите контейнер
    Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
    Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
    Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".
    Запомните(!) и выполните команду nginx -s reload, а затем внутри контейнера curl http://127.0.0.1:80 ; curl http://127.0.0.1:81.
    Выйдите из контейнера, набрав в консоли exit или Ctrl-D.
    Проверьте вывод команд: ss -tlpn | grep 127.0.0.1:8080 , docker port custom-nginx-t2, curl http://127.0.0.1:8080. Кратко объясните суть возникшей проблемы.
        Это дополнительное, необязательное задание. Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. пример источника
    Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

![{0AA5F042-84B5-4262-9ADF-54C6D8FE851D}](https://github.com/user-attachments/assets/3ea8e6f5-1036-4d52-a38d-530a819c9758)

    ctrl+c выполняет отправляет SIGKILL. Особый сигнал который используется для завершения процесса для завершения процесса.
    
![{3A6CC655-C093-4363-AD62-BF03C14850D1}](https://github.com/user-attachments/assets/9206e6d2-f3dc-4f18-88d8-35b6c0e5935c)

![{BF5251B1-31B8-4076-AAFC-29F039E2F811}](https://github.com/user-attachments/assets/f8d6f547-abeb-460d-8f7b-7acfd99649dc)

    Проблема в том что порт с локальной машинки смотрит на 80, а nginx публикует на 81. Исправить можно 2мя способами. 
    1 удалить контейнер и исправить на наеобходимый порт [-p 80:81] таким образом будет использоваться порт локальной машинки 80, но направлен будет на 81 [логично что предварительно сохранив изменения с помощью docker commit]
    2 поменять порт в конфиг nginx [либо подмонтировав файл как вольюм или в конфиге самомго контейнера]
    
    

![{A0625E91-7908-4F8B-A8DD-8AC8707B0FEF}](https://github.com/user-attachments/assets/b44026fc-d414-48a5-af13-73f8fe990f07)

   


Задача 4

    Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку текущий рабочий каталог $(pwd) на хостовой машине в /data контейнера, используя ключ -v.
    Запустите второй контейнер из образа debian в фоновом режиме, подключив текущий рабочий каталог $(pwd) в /data контейнера.
    Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.
    Добавьте ещё один файл в текущий каталог $(pwd) на хостовой машине.
    Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

![{644AAC5D-2B57-4749-A636-F986A16393D3}](https://github.com/user-attachments/assets/e8deadd7-e027-409f-95d8-0fc5d432bbf4)


![{C0796C8C-A19B-4063-86B7-E4A370313F82}](https://github.com/user-attachments/assets/25d34b4d-e510-4333-93e2-fa6a5d3fbdae)


![{8406062E-A671-40F9-82FB-4AFA3C4C908A}](https://github.com/user-attachments/assets/3cdf9ff8-2a58-4dd6-907e-a8737f49a0f5)


![{93B65837-9931-4E7E-B4F5-D0A37E1199EF}](https://github.com/user-attachments/assets/fcfa8386-efe7-4506-bdcb-c772576a44c7)

![{9D144A4E-19A5-407D-9532-CD19DF7514E0}](https://github.com/user-attachments/assets/f075efae-f46f-4259-b0c8-5634d67fe954)




Задача 5

    Создайте отдельную директорию(например /tmp/netology/docker/task5) и 2 файла внутри него. "compose.yaml" с содержимым:

version: "3"
services:
  portainer:
    network_mode: host
    image: portainer/portainer-ce:latest
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock

"docker-compose.yaml" с содержимым:

version: "3"
services:
  registry:
    image: registry:2

    ports:
    - "5000:5000"

И выполните команду "docker compose up -d". Какой из файлов был запущен и почему? (подсказка: https://docs.docker.com/compose/compose-application-model/#the-compose-file )

    Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла. (подсказка: https://docs.docker.com/compose/compose-file/14-include/)

    Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry. Дополнительная документация: https://distribution.github.io/distribution/about/deploying/

    Откройте страницу "https://127.0.0.1:9000" и произведите начальную настройку portainer.(логин и пароль адмнистратора)

    Откройте страницу "http://127.0.0.1:9000/#!/home", выберите ваше local окружение. Перейдите на вкладку "stacks" и в "web editor" задеплойте следующий компоуз:

version: '3'

services:
  nginx:
    image: 127.0.0.1:5000/custom-nginx
    ports:
      - "9090:80"

    Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver".
    Удалите любой из манифестов компоуза(например compose.yaml). Выполните команду "docker compose up -d". Прочитайте warning, объясните суть предупреждения и выполните предложенное действие. Погасите compose-проект ОДНОЙ(обязательно!!) командой.


![{D4564EB8-5115-4F74-ABFA-444627CA5D7C}](https://github.com/user-attachments/assets/6be9c1e7-4557-45e0-9ee7-1a30f2844009)

![{DCECA0FB-B539-4B7D-A232-FC6D1D006536}](https://github.com/user-attachments/assets/1b191c1c-ab61-43bf-b741-7d2330b0bc44)

![{B6F4D69A-2959-4F90-9094-769C546F8A7B}](https://github.com/user-attachments/assets/2564094a-64c4-4b80-85c4-82650bda3497)

![{5DCCC236-7773-4180-A054-A6232F916F54}](https://github.com/user-attachments/assets/7172b3a8-21db-4757-9877-235a2d859e93)

![{F4AADFF8-FE4C-48F4-AD26-27686AC40334}](https://github.com/user-attachments/assets/1475b6ee-2959-479a-bd84-0b3364e92f3f)

    Ошибка не найден файл. Такого файла или каталога нет. '/tmp/netology/docker/task5/compose.yml' 
    Выключить проект docker-compose -f docker-compose.yml down но так как файл не найден будет ошибка.
    
    docker rm -f $(docker ps -aq)

    
![{A1372917-229D-4FF3-8EA7-03E1DABD406B}](https://github.com/user-attachments/assets/0e15f92e-6f5c-4c81-83c7-4c74d07aeaba)


[DOCKER-COMPOSE FILE](https://github.com/h4rd1/devops-netology/tree/main/%D0%92%D0%B8%D1%80%D1%82%D1%83%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B8%20%D0%9A%D0%BE%D0%BD%D1%82%D0%B5%D0%B9%D0%BD%D0%B5%D1%80%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F/%D0%97%D0%B0%D0%B4%D0%B0%D0%BD%D0%B8%D0%B53/src/compose)
    



    

