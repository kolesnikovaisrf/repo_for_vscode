	FROM ubuntu:18.04
	RUN apt update
	RUN apt install nginx -y
	EXPOSE 80
	RUN rm -rf /var/www/html/*
	ADD index.html /var/www/html/
	CMD ["nginx", "-g", "daemon off;"]