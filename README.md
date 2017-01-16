## InventoryApp
A Ruby on Rails 5 based web app
#### Usage:
    git clone git@github.com:rajdeepbhatia/inventory_app.git
    cd inventory_app
    bundle

After bundling, create database.yml file and add configuration, sample configuration can be found in database.yml.example file, then do

    rake db:create
    rake db:migrate
    rake db:seed


After setting up the DB, you can either create a new user or login using following credentials

    admin@example.com
    password

#### Upcoming features

Make Datatables ajaxified and write unit tests.

Thanks!

