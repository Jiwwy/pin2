#! /bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl enable httpd --now
echo "<h1> PIN2 Jimmy Faican </h1>" > /var/www/html/index.html
