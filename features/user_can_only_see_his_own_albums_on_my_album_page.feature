Feature: User can only see albums created by him/her on My albums
  As a user,
  In order to manage my uploaded photos,
  I would like to be able to delete and edit photos after I upload them

  Background:
    Given the following family exist
      | name         |
      | The Simpsons |
      | The Griffins |

    Given the following user is part of a family
      | email          | first_name | password    | password_confirmation | family       |
      | lisa@gmail.com | Lisa       | heythere123 | heythere123           | The Simpsons |
      | pete@gmail.com | Pete       | heythere123 | heythere123           | The Griffins |

    Given the following image exist in album
      | title     | image_file_name | album_title       | family       | created_by     |
      | Something | random.png      | Lisa's renovation | The Simpsons | lisa@gmail.com |
      | XXX       | random.png      | Pete's Workout    | The Griffins | pete@gmail.com |


  Scenario: User can see his own albums
    And I am logged in as "lisa@gmail.com"
    When I visit the index page
    And I click "My albums"
    Then I should see "Lisa's renovation"
    And I should not see "XXX"
