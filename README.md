# README

# Overview
This is a simple Rails Application that will take a user's inputted
URL and display the Open Graph Image associated with that page
(if any)

# Approach
Started with a POC of the async requirement to determine simple
and cleanest way. Always try to keep stuff as vanilla-Rails as possible
unless there is a justifiable business/technical need to go custom!

After that scaffolded basic CRUD as a starting point but that might
have been overkill. Changed the create page to basically be just
a one stop shop for the user input form and display.

Used ajax submit for the form to meet requirement 'image displayed
on same page as where the url is entered'. Then created an
endpoint in the controller that would keep checking queue status
(not hitting the DB every time!) until job is complete and then
simply rendering the image for the user in a partial view

Every attempt was made to be as straightforward as possible!

# Future Versions
TODO: Left CRUD like show, index, and destory: Should put this
 behind an admin security wall (login, cookie, key, etc.). This
 was done on purpose due to the requirement 'persistant storage' -
 whenever you have persistant storage, you need some sort of way
 to clean it up and display it then just db command line.
TODO: Use Sidekiq or equivalent to persistantly store processing
 queue. This is all done in memory using cache here but that is
 not very scalable and can easily lose data!
 TODO: Determine more use cases like if this will be used as an API, or
 there needs to be some sort of batching from structured data of some
 kind or what exactly this will be used in in order to determine
 next steps (if any)!

# Deployment
This was developed on MacOS just like the instructions said it would
be deployed on so should be straight forward. 

Ensure system has the following versions of Rails and
Ruby installed. Then simply do "gem install X" for each of the
3rd party gems (see below).
* Ruby/Rails versions
ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-darwin18]

* Rails 6.0.3.1

DB is Postgres to match DocSend

* 3rd party gems

opengraph_parser - Used to handle calling 3rd party websites and parsing
    out the Open Graph data

activejob-status - Used to check the status of Jobs more easily

It was noted that Postgres was already in use so just run basic
commands:
```bash
rake db:create
bundle install
rails s
```

For deployment to Heroku, this should be useful:
https://devcenter.heroku.com/articles/getting-started-with-rails6

## Authors
Dan Ellenbaum

