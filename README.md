# Mea publisher
Collection of opinions on technological experience.
## Features
* User registration and authentication;
* Storing user records;
* Sending an email notification after adding, modifying, and deleting any post.

## Local use
* Ruby version:
3.2.1
* Ruby on Rails version:
7.1.0.alpha
* Install app
```bash
bundle install 
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```
* Run tests
```bash
rspec spec
```
* Run Sidekiq
```bash
$ bundle exec sidekiq
```
* Run server
```bash
$ rails s
```
* Open in browser
```bash
localhost:3000
```
## Work with docker container
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
* Utilize SWARM to deploy
