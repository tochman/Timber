Feature: User can send invite to another user via email
  As a user,
  In order to make it possible for my family to share photos with me
  I would like to be able to invite other users via email

  Background:

    Given the following family exist
      | name     |
      | Simpsons |

    Given the following user is part of a family
      | email          | first_name | password    | password_confirmation | family   |
      | lisa@gmail.com | Lisa       | heythere123 | heythere123           | Simpsons |

    Given I am logged in as "lisa@gmail.com"
    And I visit the invitation page

  Scenario: User gets an invite from visitor
    When I fill in "Email" with "name@example.com"
    And I click "Send an invitation" button
    And I click "Log out"
    Then "name@example.com" should receive an email
    When "name@example.com" opens the email
    And I should see "Invitation to Timber" in the email subject
    And I should see "Hello name@example.com" in the email body
    And I should see "You have been invited to the Simpsons family" in the email body
    And I should see "Accept Timbers invitation" in the email body
    When I click "Accept Timbers invitation" in the email
    Then I should be redirected to the "Accept invitation" page
    And I fill in "First name" with "Zeus"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I click "Set my first name and password"
    And the new user's family should be "Simpsons"
    Then I should be redirected to the "index" page
    And I should see "Your password was set successfully. You are now signed in."
