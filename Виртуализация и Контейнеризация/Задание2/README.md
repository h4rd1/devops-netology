
Задача 1

Установите на личный Linux-компьютер или учебную локальную ВМ с Linux следующие сервисы(желательно ОС ubuntu 20.04):

    VirtualBox,
    Vagrant, рекомендуем версию 2.3.4
    Packer версии 1.9.х + плагин от Яндекс Облако по инструкции
    уandex cloud cli Так же инициализируйте профиль с помощью yc init .

Примечание: Облачная ВМ с Linux в данной задаче не подойдёт из-за ограничений облачного провайдера. У вас просто не установится virtualbox.

vbox

    virtualboxvm -h
    Oracle VM VirtualBox VM Runner v6.1.50_Ubuntu
    (C) 2005-2024 Oracle Corporation
    All rights reserved.
    
    
hyper-v/docker_desktop

    PS C:\WINDOWS\system32> Get-VM | Format-List Name,Generation


    Name       : DockerDesktopVM
    Generation : 2

    Name       : Ubuntu 20.04 LTS
    Generation : 2

    Name       : VMBitrix9.0-0-CentOSStream9-HyperV
    Generation : 1

Vagrant 

    h4rd@vm1:~$ vagrant -v
    Vagrant 2.2.6

Ansible 

    h4rd@vm1:~$ ansible --version
    ansible 2.9.6
      config file = /etc/ansible/ansible.cfg
      configured module search path = ['/home/h4rd/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
      ansible python module location = /usr/lib/python3/dist-packages/ansible
      executable location = /bin/ansible
      python version = 3.8.10 (default, Mar 15 2022, 12:22:08) [GCC 9.4.0]

Packer

    h4rd@vm1:~/Загрузки$ packer --version
    1.7.4

Yandex cloud 

    h4rd@vm1:~$ yc init
    Welcome! This command will take you through the configuration process.

Задача 2

    Убедитесь, что у вас есть ssh ключ в ОС или создайте его с помощью команды ssh-keygen -t ed25519
    Создайте виртуальную машину Virtualbox с помощью Vagrant и Vagrantfile в директории src.
    Зайдите внутрь ВМ и убедитесь, что Docker установлен с помощью команды:

docker version && docker compose version

    Если Vagrant выдаёт ошибку (блокировка трафика):

URL: ["https://vagrantcloud.com/bento/ubuntu-20.04"]     
Error: The requested URL returned error: 404:

Выполните следующие действия:

    Скачайте с сайта файл-образ "bento/ubuntu-20.04".
    Добавьте его в список образов Vagrant: "vagrant box add bento/ubuntu-20.04 <путь к файлу>".

Важно:

    Если ваша хостовая рабочая станция - это windows ОС, то у вас могут возникнуть проблемы со вложенной виртуализацией. Ознакомиться со cпособами решения можно по ссылке.

    Если вы устанавливали hyper-v или docker desktop, то все равно может возникать ошибка:
    Stderr: VBoxManage: error: AMD-V VT-X is not available (VERR_SVM_NO_SVM)
    Попробуйте в этом случае выполнить в Windows от администратора команду bcdedit /set hypervisorlaunchtype off и перезагрузиться.

    Если ваша рабочая станция в меру различных факторов не может запустить вложенную виртуализацию - допускается неполное выполнение(до ошибки запуска ВМ)

Ответ: 

1 Сгенерировал ключ командой ssh-keygen и распространил ssh-copy-id $host

2 Пакет docker установил

    h4rd@vm1:~/.ssh$ docker version && docker compose version
    Client:
     Version:           26.1.3
     API version:       1.45
     Go version:        go1.22.2
     Git commit:        26.1.3-0ubuntu1~20.04.1
     Built:             Mon Oct 14 22:06:01 2024
     OS/Arch:           linux/amd64
     Context:           default

   ![Screenshot_5](https://github.com/user-attachments/assets/782d2cc9-9e91-4655-8f5b-27071c2b8ff7)

   
Задача 3

    Отредактируйте файл mydebian.json.pkr.hcl или mydebian.jsonl в директории src (packer умеет и в json, и в hcl форматы):
        добавьте в скрипт установку docker. Возьмите скрипт установки для debian из документации к docker,
        дополнительно установите в данном образе htop и tmux.(не забудьте про ключ автоматического подтверждения установки для apt)
    Найдите свой образ в web консоли yandex_cloud
    Необязательное задание(*): найдите в документации yandex cloud как найти свой образ с помощью утилиты командной строки "yc cli".
    Создайте новую ВМ (минимальные параметры) в облаке, используя данный образ.
    Подключитесь по ssh и убедитесь в наличии установленного docker.
    Удалите ВМ и образ.
    ВНИМАНИЕ! Никогда не выкладываете oauth token от облака в git-репозиторий! Утечка секретного токена может привести к финансовым потерям. После выполнения задания обязательно удалите секретные данные из файла mydebian.json и mydebian.json.pkr.hcl. (замените содержимое токена на "ххххх")
    В качестве ответа на задание загрузите результирующий файл в ваш ЛК.
Ответ:

    h4rd@vm1:~/Загрузки$ packer init config.pkr.hcl 
    Installed plugin github.com/hashicorp/yandex v1.1.3 in "/home/h4rd/.packer.d/plugins/github.com/hashicorp/yandex/packer-plugin-yandex_v1.1.3_x5.0_linux_amd64"

h4rd@vm1:~/Загрузки$ yc compute image list
+----------------------+------------------+--------+----------------------+--------+
|          ID          |       NAME       | FAMILY |     PRODUCT IDS      | STATUS |
+----------------------+------------------+--------+----------------------+--------+
| fd8l03cd04tu94nk5ftp | debian-11-docker |        | f2e88b7r5u1m5dn542ib | READY  |
+----------------------+------------------+--------+----------------------+--------+

![{7F3032B9-1E55-450A-997C-F15F06C96C76}](https://github.com/user-attachments/assets/40504e77-1cc4-418e-ae8b-450d71020e45)


 












