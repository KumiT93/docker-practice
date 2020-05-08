# README

* Ruby version
ruby:2.5.3

* サービスのビルド、DB構築
  $ docker-compose build
  $ docker-compose up
  $ docker-compose run web rails db:create db:migrate db:seed
