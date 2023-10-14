# Mea publisher
Collection of opinions on technological experience.

## Features
* User registration and authentication;
* Storing user records and logging manipulations with them;
* Emailing notification after adding new post.

## Local use
* Ruby version:
3.2.1 or higher
* Ruby on Rails version:
7.1.0 or higher
* Install app
Add the `.env` file from `.env.sample`.
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
To monitor Sidekiq look at `localhost:3000\sidekiq`
## Work with docker container
Fill environment variables into the .env file. Follow the instructions given in it.

 * Create docker image
```bash
docker build . -t mea_publisher
```
* Run docker container

then run:
```bash
docker compose up
```
* Look at Health monitoring
```bash
watch -n1 docker ps
```
* Utilize SWARM to deploy
