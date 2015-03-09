Spreadcalc
================

Idea of the app is to count spread values on few different sites and compare them, finding best actual and average sites for each currency. It is designed to add new data automatically in even periods of time set before running the app.
Please initialize the seeds for swift an effective use of app (it may take some time depending on your bandwidth).

Due to some sites (i.e. heroku) not allowing cron jobs they are prepared in schedule.rb via whenever gem, but concurrency is provided by threading additional tasks in parsing_pages.rb file.

Creating new admin roles is available only through console. Default admin name is admin@admin.con and password is adminadmin
-------------

This application requires:

- Ruby 2.2.0
- Rails 4.1.8

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
