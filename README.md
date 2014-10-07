Scholarly Observed Celestial Measurements
=========================================
SOCM was developed at Wentworth Institute of Technology by:
  - [Alex Clement](https://github.com/alexrdclement)
  - [Patrick McGee](https://github.com/patrickwmcgee)
  - [David Miller](https://github.com/djmill)
  - [Robert Moss](https://github.com/mossr)

under the guidance of Professor James G. O'Brien. SOCM serves as a two fold service, both as a comprehensive source of galactic rotation measurements, but is also used as the service layer API for RoCM [rotationcurve.herokuapp.com](http://rotationcurve.herokuapp.com).

A running version of SOCM can be found at [socm.herokuapp.com](http://socm.herokuapp.com).

Ruby version
============
  - Ruby 2.0.0

System dependencies
===================
  - Ruby 2.0.0
  - Rails 4.1.1

Initial Setup
=============

    bundle install


Configuration
=============
  - PostgreSQL must be installed on the machine you want to run SOCM on

Database creation
=================
  - Use configurations in **/db/database.yml** file to create databases and database users via rake db:create when running SQLite3.
  - **SQLite3:** useful to use for development. Uncomment the section in database.yml and comment out the Postgres section to use it.
  - **PostgreSQL:** use commandline or Admin tool to create users and databases.
  - **PostgreSQL in Dev:** to use Postgres in development, copy the line **gem 'pg'** in Gemfile out of **:production** and the into **:development** section.

Database initialization
=======================
.

    1. Choose database. If **SQLite3**, move to #2. If **Postgres**, see **Database creation** section of this readme.

.

    2. rake db:create

.

    3. rake db:migrate

Running Tests & Code Coverage
=========================

    bundle exec rspec spec

  - Running the command above runs all unit tests and will also generate a code coverage report.
  - **/coverage/index.html** is the main coverage page. Open with a browser to view the current test coverage for SOCM.

Seeding the DB w/Data
=====================
.
  - Create all Galaxies and their velocities


    rake db:seed

.
  - Create all Citations


    rake citation\_importer:import\_citations

.
  - Create relationships between Galaxies and their Citations


    rake citation\_importer:give\_galaxies_citations


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
  - This Super User can approve and destroy other admin accounts
  - Without a Super User, you cannot approve any other admins that sign up

Authors & Contributors
======================
  - [Alex Clement](https://github.com/alexrdclement)
  - [Patrick McGee](https://github.com/patrickwmcgee)
  - [David Miller](https://github.com/djmill)
  - [Robert Moss](https://github.com/mossr)
