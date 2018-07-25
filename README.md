[![Build Status](https://travis-ci.org/BryanH/colemanconnection.svg?branch=master)](https://travis-ci.org/BryanH/colemanconnection)

HCC Coleman Connection
======================

HCC Coleman Connection is an online system for potential students of HCC Coleman
College to begin the process of applying to one of our programs.

Developers
----------

Perform the following steps to get up and running.

    git clone https://github.com/BryanH/colemanconnection.git
    cd coleman_connection
    bundle install
    rake db:create:all
    rake db:migrate
    rake db:seed

Run the Rails server and then navigate to `http://localhost:<port>/flair` to
learn about the coding style for this application.
