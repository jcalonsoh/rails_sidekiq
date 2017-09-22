[![Build Status](https://travis-ci.org/jcalonsoh/rails_sidekiq.svg?branch=master)](https://travis-ci.org/jcalonsoh/rails_sidekiq)
[![Code Climate](https://codeclimate.com/github/jcalonsoh/rails_sidekiq/badges/gpa.svg)](https://codeclimate.com/github/jcalonsoh/rails_sidekiq)
[![Test Coverage](https://codeclimate.com/github/jcalonsoh/rails_sidekiq/badges/coverage.svg)](https://codeclimate.com/github/jcalonsoh/rails_sidekiq/coverage)
[![Issue Count](https://codeclimate.com/github/jcalonsoh/rails_sidekiq/badges/issue_count.svg)](https://codeclimate.com/github/jcalonsoh/rails_sidekiq)

# Rails with sidekiq

This is simple sample of rails project on

### Log Rails

```ruby
Started POST "/emails" for 127.0.0.1 at 2017-09-22 15:20:27 -0300
   (0.6ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
Processing by Api::EmailsController#create as */*
  Parameters: {"email"=>{"mailto"=>"j.carlos.alonso.h@yahoo.cl", "mailbody"=>"SuperBlah"}}
--- !ruby/object:ActionController::Parameters
parameters: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
  email: !ruby/hash:ActiveSupport::HashWithIndifferentAccess
    mailto: j.carlos.alonso.h@yahoo.cl
    mailbody: SuperBlah
  controller: api/emails
  action: create
permitted: false

   (0.2ms)  BEGIN
  SQL (0.6ms)  INSERT INTO "emails" ("mailto", "mailbody", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["mailto", "j.carlos.alonso.h@yahoo.cl"], ["mailbody", "SuperBlah"], ["created_at", "2017-09-22 18:20:27.674020"], ["updated_at", "2017-09-22 18:20:27.674020"]]
   (1.0ms)  COMMIT
[ActiveJob] Enqueued EmailsenderJob (Job ID: 7ac9205e-d53b-42bc-8ba4-793a9893d93a) to Sidekiq(default) with arguments: {:mail_id=>41}
Completed 201 Created in 23ms (Views: 1.4ms | ActiveRecord: 5.5ms)
```

### Log Sidekiq

```ruby
         m,
         `$b
    .ss,  $$:         .,d$
    `$$P,d$P'    .,md$P"'
     ,$$$$$bmmd$$$P^'
   .d$$$$$$$$$$P'
   $$^' `"^$$$'       ____  _     _      _    _
   $:     ,$$:       / ___|(_) __| | ___| | _(_) __ _
   `b     :$$        \___ \| |/ _` |/ _ \ |/ / |/ _` |
          $$:         ___) | | (_| |  __/   <| | (_| |
          $$         |____/|_|\__,_|\___|_|\_\_|\__, |
        .d$$                                       |_|

2017-09-22T18:20:18.405Z 4839 TID-ovkw00np0 INFO: Running in ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
2017-09-22T18:20:18.406Z 4839 TID-ovkw00np0 INFO: See LICENSE and the LGPL-3.0 for licensing details.
2017-09-22T18:20:18.406Z 4839 TID-ovkw00np0 INFO: Upgrade to Sidekiq Pro for more features and support: http://sidekiq.org
2017-09-22T18:20:18.406Z 4839 TID-ovkw00np0 INFO: Booting Sidekiq 5.0.4 with redis options {:id=>"Sidekiq-server-PID-4839", :url=>nil}
2017-09-22T18:20:18.411Z 4839 TID-ovkw00np0 INFO: Starting processing, hit Ctrl-C to stop
2017-09-22T18:20:27.681Z 4839 TID-ovkw3g694 EmailsenderJob JID-647aad11ba42f8dce14ac341 INFO: start
2017-09-22T18:20:27.689Z 4839 TID-ovkw3g694 EmailsenderJob JID-647aad11ba42f8dce14ac341 INFO: done: 0.009 sec
```