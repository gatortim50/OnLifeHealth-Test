RoR Demo
========

Ruby on Rails app used by OnLifeHealth for testing candidates:

```
the directions and input files are in the doc directory
```

To run the app:

```
  git clone git@github.com:gatortim50/OnLifeHealth-Test.git
  cd OnLifeHealth-Test
  bundle install
  rake db:create
  rake db:migrate
  rails s
  open brower to http://0.0.0.0:3000/uploads
  click on "New Upload" button and browse to doc/Batting-07-12.csv
  the output sent to std.out
```
