 
#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome to Spandycool - Terraform</h1>" > /var/www/html/index.nginx-debian.html

