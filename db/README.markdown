# Setting up the database

For SnapshotDB to run the database needs to be seeded with the raw data first. Here is a quick guide to setting this up.

## Pupil Seed Data

Design a report on SIMS containing the following information. **The data must be in the format described here, and in the correct order, or it will not work.**

    Student UPN
    Student First Name
    Student Last Name
    Student Ethnicity Code
    Student Gender
    Student Free School Meals
    Student Year Group
    Student Form Group

**Please remove the headings from each column and save as a ```CSV``` format**

Save in ```db/seed_data/students.csv```

## Staff Seed Data

Design another report on SIMS for all the staff in the school and include the following fields in the following order.

    Staff First Name
    Staff Last Name
    Salutation


Remove the headings again and save as a ```CSV``` file in ```db/seed_data/staff.csv```

## Learning zone referral reasons

All learning zone referral reasons can be found in the following file ```db/seed_data/lz_reasons.csv```. You can customise this once, when you first set up the database for the year.

## Load data into the database

Once everything has been setup correctly run the following commands:

    git add .
    git commit -a -m 'seed data'
    
### Heroku
    git push heroku
    heroku console
    heroku rake db:seed
    
### Own server
    bundle exec rake db:seed
