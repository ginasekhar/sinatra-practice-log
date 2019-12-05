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

From a terminal window execute the following:
    bundle install 
    rake db:migrate
    
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

    ## Create new practice log
    From the practice logs index page, the user can click on the 'New Practice Log' button to create a new practice log.
    All the required fields have a '*' in front of the label.
    Date - Pick a date from the calendar for the log.  Date should not be in the future or earlier than a year ago.
    Practice minutes  - must be a number between 10 and 600 
  
    ## From the index page, the user can click the link to view, edit or delete a log.

    ## From any page, they can logout.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'vivacious-proc-1313'/sinatra-practice-logs.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# sinatra-practice-logs


  
