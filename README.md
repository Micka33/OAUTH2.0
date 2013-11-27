OAUTH2.0
========

RubyOnRails implementation of an OAUTH2.0 provider&amp;client using doorkeeper&amp;oauth2


DESCRIPTION
========

 - <b>Provider:</b> contains a ruby on rails implementation of an OAUTH2.0 provider using [Doorkeeper](https://github.com/applicake/doorkeeper)
 - <b>Client:</b> contains a ruby on rails implementation of an OAUTH2.0 client using [OAUTH2](https://github.com/intridea/oauth2)
 - <b>nginx.conf:</b> contains the nginx conf to make these projects works

INFORMATIONS
========

 - <b>[Nginx](http://wiki.nginx.org/Main):</b> used as a reverse proxy to simulate `provider.dev` and `rorclient.dev`
 - <b>[Pow](http://pow.cx/):</b> used to auto-instantiate the rails projects and act as a dns (the magic is `sudo ipfw del 00100`)
 - <b>[mongodb](http://www.mongodb.org/)</b>
 - <b>Rails 4:</b> To work with older version of Rails, `gem 'mongoid', git: 'https://github.com/mongoid/mongoid.git'` in `provider/Gemfile` should be changed to `gem 'mongoid'`
