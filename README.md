[![Code Climate](https://codeclimate.com/github/vpatel90/redditapp/badges/gpa.svg)](https://codeclimate.com/github/vpatel90/redditapp)
##Blue Hair
### a reddit like app

* Run the `rails s` command from the root of the project to start the server
* Go to `http://localhost:3000/`

![homepage](http://i.imgur.com/tvC9zNQ.png?1 =200px)

* Site has User, Link, Comment, Board and Vote models
* A Board has many Links
* A Link has many votes, comments and belongs to a User
* A Comment belongs to a User, Link and has many votes
* A User has many links, comments and votes


###Boards
* Boards can be accessed by going to `/b`
* To go to a specific board you can type the boards name in `/b/catpics`
* New Boards can be created by logged in users `/b`

![homepage](http://i.imgur.com/Lj7zEjT.png?1 =200px)

###Links
* Links can be seen on the hope page or any board pages
* Links can also be viewed individually by clicking on the comments button (This displays the link and all comments associated with that link)
* New Links can be created from the Nav bar by logged in users

![homepage](http://i.imgur.com/jVmjUPS.png?1 =200px)

###Comments
* Comments can be seen when viewing a link individually
* Comments can be created for a link when viewing that link

![homepage](http://i.imgur.com/P5N0vTX.png?1 =200px)


###Users
* Users can be created by clicking Sign Up
* Users can login using their email (no passwords ATM) on the Login page
* Users can view their own profile by clicking their name in the top right
* Users can view other users by clicking the Users button on the Nav bar
* Users can also view individual users by going to their id `/users/id`
* Viewing individual users allows you to view differnt stats about that user

###And more
* This App is semi optomized for mobile view as well

![homepage](http://i.imgur.com/OK4HjGL.png?1 =200px)
