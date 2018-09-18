# Harvest Helper

One of my friends runs an organization in Indianapolis that manages 7 urban farms and gives produce and plant starts to the community. She said that there is often a scenario where she will give folks plant starts and provide verbal instructions on how to grow the plant but no other resource. This app is meant to be that resource. It provides growing, harvesting and recipe information for the 45 plants in the database as well as a json api so that people can hopefully use this data to build other apps.

Production Hosted [here](http://harvesthelper.herokuapp.com)
Api Information Hosted [here](http://harvesthelper.herokuapp.com/developers)

##### User Workflow
 ![user workflow](app/assets/images/workflow.gif)
 

### Goals
##### Mobile UX Design
Since folks don't often take their computers into their gardens, I decided to make this app's design mobile focused.  It looks better on the phone than it does on a laptop.  Pull requests always accepted :)

#### Technical Overview
* Full stack ruby-on-rails
* jQuery/Ajax
* Facebook Oauth2
* Ruby Geocoder
* Edamam API
* Amazon Web Services S3 API
* Paperclip
* Testing with rspec and Capybara

### Setup 
Create databases for test and development environments

### Testing
All testing in Harvest Helper was done via [RSpec-rails](https://github.com/rspec/rspec-rails).  I used [shoulda matchers](https://github.com/thoughtbot/shoulda-matchers) to test database validations and relationships.  Our coverage was tested using [simplecov](https://github.com/colszowka/simplecov).

##### Running tests
Once you have the repo cloned, make sure to reset the database on your local machine and bundle.

In order to run the tests, enter `rspec` in the command line.

If you would like to run a specific test enter, the whole path of that test, preceeded by the rspec command: ie. 

```
rspec spec/path_to_file/file_name.rb
```

In order to see coverage for our testing suite simply type the command `open coverage/index.html` and it will show the index page for our simple cov code coverage. 

Happy testing!
