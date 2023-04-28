# Mea publisher
Collection of opinions on technological experience

* Ruby version:
3.2.1
* Ruby on Rails version:
7.1.0.alpha
* Install app
```bash
bundle install 
bundle exec rails db:create
bundle exec rails db:migrate
```
* Run tests
```bash
rspec spec
```
* Create docker image
```bash
docker build . -t mea_publisher
```
* Run docker container

Fill environment variables into the .env file, then run:
```bash
docker compose up
```
* Look at Health monitoring
```bash
watch -n1 docker ps
```
