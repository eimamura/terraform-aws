#! /bin/bash
sudo apt-get update
sudo apt-get install -y wget gnupg2
wget -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install -y postgresql-16
psql --version
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo systemctl status postgresql
sudo -i -u postgres
# psql
# CREATE DATABASE mydatabase;
# CREATE USER myuser WITH ENCRYPTED PASSWORD 'mypassword';
# GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;
# CREATE TABLE mytable (
#     id SERIAL PRIMARY KEY,
#     name VARCHAR(100),
#     age INT);
# \l
# \q
# \c mydatabase
# \dt
# SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

# psql -h your_remote_host -p your_remote_port -U your_username -d your_database