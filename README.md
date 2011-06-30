urlbot2
=======

Requirements 
------------

* Ruby 1.9.2 (use rvm! - https://rvm.beginrescueend.com/)
* Bundler (anything past 1.0.13 should be good, latest should be fine - http://gembundler.com)

Installation
------------
* rvm install 1.9.2
* rvm use 1.9.2
* rvm gemset create urlbot
* rvm gemset use 1.9.2@urlbot
* git clone git://github.com/tonyc/urlbot2.git 
* cd urlbot2
* (optional, recommended) echo "rvm 1.9.2@urlbot" > .rvmrc
* bundle install

Running
-------

* $ NICK=urlbot SERVER=irc.example.com CHANNEL=#awesome ./urlbot.rb
