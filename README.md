# Mea publisher
Collection of opinions on technological experience

* Ruby version
3.2.1

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
```bash
docker compose up
```
