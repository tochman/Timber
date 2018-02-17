Feature: Navbar
  As a user
  In order to navigate the site
  I would like to see a navbar with a sign up and log in buttons



  Background:
   Given the following user exists
    | email                | password       | password_confirmation     |
    | lisa@gmail.com       | heythere123    | heythere123               |

    And I am logged in as "lisa@gmail.com"

  Scenario: Display new navbar links when user is logged in
  	Given I visit the index page
   	Then I should see "My albums"
   	And I should see "Shared albums"
   	And I should see "Invite"
   	And I should see "Edit profile"
   	And I should see "New album"
   	And I should see "Logged in as: lisa@gmail.com"
   	And I should see "Log out"
