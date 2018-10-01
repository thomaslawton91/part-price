# Price Rule Creator
This is a small rule creation app for car parts.

The purpose is for a user to upload a CSV of a list of car parts, prices, etc., create rules by which they'd like to price the parts, then output the new prices to a new CSV.

# Pre-requisites
To run this app you will need Ruby, Rails, Foreman, Redis, and PostgresQL installed.

Please follow the instructions on how to install Ruby and Rails for your repsective system [here](https://www.ruby-lang.org/en/documentation/installation/). 

Once Ruby is installed all you need to do to install rails is type `gem install rails`.

To install Foreman you can also type `gem install foreman`.

To install Redis please see these [instructions](https://redis.io/topics/quickstart).

To install Postgres please see these instructions for [windows](http://www.postgresqltutorial.com/install-postgresql/), for [mac](https://www.postgresql.org/download/macosx/), or [linux](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04).

# Running the app
After you've followed the directions in the pre-requisites section and you're sure that everything is running smoothly, go ahead and clone this repository locally by running `git clone https://www.github.com/thomaslawton91/part-price.git`.

Once you've cloned the repo, you can open a command prompt inside the root directory, enter `bin/setup` to create the database and get the project set up. 

Run `bin/startup` to start the project. It will be up and running on localhost:3000.
