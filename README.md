# Project

[smog.pp.ua](https://smog.pp.ua)

## Install

### Clone the repository

```shell
git clone git@github.com:kkkiikkk/smog.git
cd smog
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.2.3`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.2.3
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
rake app:migrate_images
```
## Serve

```shell
rails s
```

## Deploy
Docker and docker compose should be installed
```shell
ssh user@IP
cd /var/www/
```
Clone the git repository
```shell
cd smog
docker compose build
docker compose run web rails db:create db:migrate db:seed
docker compose run web rails asssets:precompile
docker compose run web rails app:migrate_images
docker compose up -d
```
