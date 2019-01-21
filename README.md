## Setup

```
bundle install
./resetdb
bin/start
```


## Run a migration

```
bundle exec rake db:create_migration NAME=add_foo_bar
bundle exec rake db:migrate
```

## Run a console

```
bin/console
```
