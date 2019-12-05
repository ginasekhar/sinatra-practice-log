# SinatraPracticeLogs

This Ruby program provides a user interface that allows music students to log their practice hours and notes on their practice. 

## Getting Started
These instructions will get you a copy of the project up and running on your local machine.  

In your target directory

    git clone git@github.com:ginasekhar/sinatra-practice-log.git


## Prerequisites
This program requires the following gems:

## list all the gems required
sinatra-flash

## Installation
Install the gems required by this program

    gem install sinatra-flash
    bundle install 

## Server side tasks

From a terminal window execute the following:
    rake db:migrate
    seed database
    rake db:seed
    shotgun

## Running the program
In your browser, go to localhost:9393.  This will bring you to a welcome page that allows you to login or sign up for a new account or shows a summary page if user is already logged in.

## User instructions
From the welcome page, the user has the option of signing up for a new account.
    ## Sign Up 
    All the required fields have a '*' in front of the label.
      Fullname - Must start with a letter, must be between 2 and 40 characters and only contain alphanumeric or (. , - ')
      Username - must start with alpha, be 2 to 10 characters and only contain lower case alpha and numeric or (_). Will not allow you to               enter a duplicate username
      Email -   Must have the proper email format. Will not allow user to enter a duplicate email.
      Password - must be atleast 4 characters.  Passweord Confirmation must match password
    Once the user signs up, the system automatically logs them in and brings them to their practice log index page. 

    ## 


If the user was already logged in, it brings the user to an index page that lists all their practice logs. At the top of the list, it also has a summary of the total minutes they have logged and the class average.  The user has the option of creating a new practice log by clicking on the 'New Practice Log' button at the bootom of the list.  They can also choose to click on one of the existing logs to view detailed notes, edit it or delete it.





 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'vivacious-proc-1313'/sinatra-practice-logs.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# sinatra-practice-logs

 input[type=submit] {
    background-color: orange;
    border: blue;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
  }

  input[type=text] {
    width: 300;
    height: 100;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
  }

  input[type=text] {
    width: 400;
    height: 100;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
  }

  
