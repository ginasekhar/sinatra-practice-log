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

## Create database
rake db:migrate
seed database
rake db:seed
Run shotgun from the terminal

## Running
 the program
In your browser, go to localhost:9393

## User instructions
The following routes are available:

|----------|-------------------------|-----------|--------------------------------------| 
|   NAME   |     PATH                | HTTP VERB |            PURPOSE                   |
|----------|-------------------------|-----------|--------------------------------------| 
| Index    | /practice_logs          |  GET      | Displays all practice logs           |
| New      | /practice_logs/new      |  GET      | Shows new form for new log entry     |
| Create   | /practice_logs          |  POST     | Creates a new practice log entry     |
| Show     | /practice_logs/:id      |  GET      | Shows one specified practice log     |
| Edit     | /practice_logs/:id/edit |  GET      | Shows edit form for one practice log |
| Update   | /practice_logs/:id      |  PATCH    | Updates a particular practice log    |
| Delete   | /practice_logs/:id      |  DELETE   | Deletes a particular practice log    |
|----------|-------------------------|-----------|--------------------------------------| 


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

  
