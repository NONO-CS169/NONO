# Night Out Night Off

CS 169 Fall 2019 <br>
Team 17 Final Project <br>

## Build Status
[![Build Status](https://travis-ci.org/NONO-CS169/NONO.svg?branch=master)](https://travis-ci.org/NONO-CS169/NONO)

## Code Style
[![Maintainability](https://api.codeclimate.com/v1/badges/86d7ce6bed2eb0b000f7/maintainability)](https://codeclimate.com/github/NONO-CS169/NONO/maintainability)  
<a href="https://codeclimate.com/github/NONO-CS169/NONO/test_coverage"><img src="https://api.codeclimate.com/v1/badges/86d7ce6bed2eb0b000f7/test_coverage" /></a>

## Installation
`git clone` this repository and then change directory (`cd`) into the directory. Ensure that your local ruby version is correct and all dependencies are installed by running the `bundle install` command.

Once you've configured this information correctly, run the following command.

```bash
rails server
```

The server should be spun up accordingly and the website will be available at `http://localhost:3000`.

To instantiate the mock database, run the command `rake db:reset db:migrate`. This will populate the database with events from the `db/seeds.rb` file.

## Tests
Cucumber and Rspec have been enabled, and there are some starter tests to cover the basic controller files within the `/spec` and `/features` directories. To run the Rspec unit tests, run `bundle exec rake`. To run the Cucumber behavior tests, run `cucumber`. Last but not least, the `simplecov` gem is also included. To view the test coverage, after running either the Rspec or Cucumber tests, open `/coverage/index.html`.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Links
Pivotal Tracker [link](https://www.pivotaltracker.com/n/projects/2406210)  
Code Climate [link](https://codeclimate.com/github/NONO-CS169/NONO)

## Authors
Rohith Krishna, Wilson Wang, Christine Lee, Aismit Das, John Yang, Grant Shimada, Pooja Nagpal

## License
[MIT](https://choosealicense.com/licenses/mit/)
