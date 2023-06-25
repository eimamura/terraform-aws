#!/bin/bash
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx.service
sudo systemctl enable nginx
# sudo amazon-linux-extras install postgresql14