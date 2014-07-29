Scholarly Observed Celestial Measurements
=========================================
SOCM was developed at Wentworth Institute of Technology by:
  - [Alex Clement](https://github.com/alexrdclement)
  - [Patrick McGee](https://github.com/patrickwmcgee)
  - [David Miller](https://github.com/djmill)
  - [Robert Moss](https://github.com/mossr)

under the guidance of Professor James G. O'Brien. SOCM serves as a two fold service, both as a comprehensive source of galactic rotation measurements, but is also used as the service layer API for RoCM [rotationcurve.herokuapp.com](http://rotationcurve.herokuapp.com).

Ruby version
============
  - Ruby 2.0.0

System dependencies
===================
  - Ruby 2.0.0
  - Rails 4

Initial Setup
=============

    bundle install


Configuration
=============
  - PostgreSQL must be installed on the machine you want to run SOCM on

Database creation
=================
  - Use the data in **/db/database.yml** file to create databases and database users
  - Use **PostgreSQL** commandline or Admin tool to create users and databases
  - **Note:** This application was developed using PostgreSQL 9.3

Database initialization
=======================

    rake db:migrate

  - Run this after creating DEV, Test, and Prod databases (Prod if necessary)


Run Tests
=========================

    bundle exec rspec spec

Seeding the DB w/Data
=====================

    rake db:seed

  - In **/db/seeds.rb**, there's syntax to load in all Galaxy and Observed Velocity data from .CSV files. Citation data is also included
  - This will load in all data to SOCM

Deployment instructions
=======================
  - After setting up the DB and running migrations, create a Super User:

.

    rails c
    a = Admin.new
    a.email = "admins_email@some_address.com"
    a.password = "some_password_123"
    a.approved = true
    a.super_user = true
    a.save!
  - As long as a.save! doesn't return any errors, you've created your Super User!
  - This Super User can approve and destroy other admin accounts
  - Without a Super User, you cannot approve any other admins that sign up

Authors & Contributors
======================
  - [Alex Clement](https://github.com/alexrdclement)
  - [Patrick McGee](https://github.com/patrickwmcgee)
  - [David Miller](https://github.com/djmill)
  - [Robert Moss](https://github.com/mossr)
