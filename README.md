# my_api

# Setup

  1. Clone this repo
  2. `bundle install`
  3. `bundle exec rails db:create db:migrate`
  4. Done

# Algorithm

  So we are using an algorithm to generate the unique identifier for access_code of each url. In this algorithm, we are using bijective_encode function which actually take a number as a paramter and return the corresponding single or multiple unique character as access_code and we store it for url.
  This algorithm is defined here in UniqueIdentifierGenerator concern.

# Gems
  Nokogiri: We are using it to parse the html document

# Testing

  1. bundle exec rails test

  Above command will run all the test cases which we have in this application and will check the functionality
