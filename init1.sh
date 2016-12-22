#docker build  -t ruby .
#docker run -ti -v /home/luciana:/app --memory=1G -p 3306:3306 -p 3000:3000 luciana /bin/bash
#docker run -t -d -v /var/lib/mysql:/var/lib/mysql -p 3306:3306 mysql:5.7 
docker run -ti -v /home/atos/projetos/:/app --memory=1G -p 3001:3000 -v /var/lib/mysql-atos:/var/lib/mysql job-board /bin/bash
