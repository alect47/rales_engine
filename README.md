# README

# README
# [Work In Progress]
# Rails Engine
Rails Engine is a Turing school of software & design project that uses Rails and ActiveRecord
to build a JSON API which exposes SalesEngine data


# Environment Setup
  - Ruby 2.4.1
  - Rails 5.1.7

 # clone this:
 - $ git clone https://github.com/alect47/rales_engine
 - $ cd rails_engine
 - $ bundle install

 # Database Setup
 - $ rake db:{drop,create,migrate,seed}
 - $ rake import:{customers,merchants,invoices,items,invoice_items,transactions}

 # Testing
 - $rspec for local testing of controller and model
 - $minitest for spec harness

 The test suite can be accessed from the spec harness, clone the following into the project folder on the same level as the project

 - $git clone https://github.com/turingschool/rales_engine_harness.git
 - In a separate terminal:
   - $ cd rails_engine
   - $ rails s
 - $ cd ../rales_engine_spec_harness
 - $ bundle install
 - $ bundle exec rake
