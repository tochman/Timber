Feature: User can upload attached file
  As a user
  In order to upload photos to my photo album page
  I would like to be able to attach a local file and upload it

  Background:
    Given the following family exist
      | name         |
      | The Simpsons |

    Given the following user is part of a family
      | email          | first_name | password    | password_confirmation | family       |
      | lisa@gmail.com | Lisa       | heythere123 | heythere123           | The Simpsons |

    And I am logged in as "lisa@gmail.com"
    When I visit the index page
    When I click "New album"
    And I fill in "Title" with "Lisa's renovation"
    And I click "Create album"
    And I click "Add photo"

  Scenario: User can upload attached file [Happy path]
    When I fill in "Title" with "Something"
    And I upload file "random.png"
    And I click "Upload"
    And I should see "Successfully created a new photo!"
    And I fill in "Title" with "Something else"
    And I upload file "random2.png"
    And I click "Upload and save to album"
    Then I should be on the album "Lisa's renovation" page
    And I should see "random.png" image
    And I should see "random2.png" image

  Scenario: User attempts to upload photo without filling in title [Sad path]
    When I upload file "random.png"
    And I click "Upload"
    And I should see "Error, no photo was created"
    And I should see "Title can't be blank"

  Scenario: User attempts to upload photo without filling in Title and choosing a file [Sad path]
    When I click "Upload"
    And I should see "Error, no photo was created"

  Scenario: User can upload multiple file [Happy path]
    When I fill in "Title" with "Something"
    And I upload multiple files: "random.png random2.png"
    And I click "Upload and save to album"
    And I should see "Successfully created 2 photos!"
    Then I should be on the album "Lisa's renovation" page
    And I should see "random.png" image
    And I should see "random2.png" image
