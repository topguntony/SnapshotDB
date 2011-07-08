# Snapshot BS Release Notes

Snapshot BS was created by George Drummond for Hainault Forest High School. Below are some quick notes on its usage and how to get it up and running.

**I strongly suggest using Heroku as it makes life a lot easier!**

## Requirements to run

Snapshot is built using [ruby on rails](http://http://rubyonrails.org/) and has a number of requirements to run. It requires Ruby, Rubygems, Rails, a database, git, and I also suggest memcached. Heroku takes care of all of this.

## Running on Heroku

The easiest option is to use [Heroku](http://heroku.com) as you can deploy the application with a single command. Sign up for a heroku account and follow their deployment documentation [here](http://devcenter.heroku.com/articles/creating-apps) and [here](http://devcenter.heroku.com/articles/git). Once deployed please go to the **bootstrapping the database** section of this guide.

## Installing in house

Running the app in house might sound like a nice idea but it is a lot harder to do than via heroku. If you wish to host it in house you will be required to set up a server (I strongly suggest a Linux server) to run the app. The easiest and most reliable method of installation will probably be via [phusion passenger](http://www.modrails.com/) but I dont recommend this for a novice.

For a choice of database I suggest [PostgreSQL](http://www.postgresql.org/). You will need to visit their site for installation and configuration instructions. You will also need to configure the database within the app (see [```config/database.yml```](https://github.com/georgedrummond/SnapshotDB/blob/master/config/database.yml)).

## Bootstrapping the Database

Snapshot DB needs a student list and staff list to populate the database before the app can be run. For help with this please see [```db/README.markdown```](https://github.com/georgedrummond/SnapshotDB/blob/master/db/README.markdown) for a guide on how to set up the seed data.

Once all this seed data is checked into your repository (run ```git add . && git commit -a -m 'seed data'``` from the command line from the apps root directory) run one of the following commands.

### Heroku
    git push
    heroku console
    heroku rake db:schema:load
    heroku rake db:seed

### Own server
    bundle exec rake db:schema:load
    bundle exec rake db:seed

## Taking database backups

Heroku makes it very easy to make database backups and the guide for this can be found [here](http://devcenter.heroku.com/articles/pgbackups).

To run backups on your own server you will need to read up on the documentation provided by the database authors but it shouldnt be too hard to work out.

## Sending Emails

Snapshot BS sends out a number of emails to users when accounts are created etc. For this I am using [postmarkapp](http://postmarkapp.com/) and you will need to sign up for an account and obtain an ```api key``` which you must enter into ```config/environments/production.rb```.

## License

Released under the MIT License