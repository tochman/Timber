Feature: User can share photos with family
  As a user
  In order to share photos with my family
  I would like to be able to display photos on family album page

  Background:
    Given the following family exist
      | name         |
      | The Simpsons |

    Given the following user is part of a family
      | email          | first_name | password    | password_confirmation | family       |
      | lisa@gmail.com | Lisa       | heythere123 | heythere123           | The Simpsons |

    Given the following image exist in album
      | title     | image_file_name | album_title       | family          |
      | Something | random.png      | Lisa's renovation | The Simpsons    |
      | New       | random2.png     | Lisa's cats       | The Simpsons    |

    And I am logged in as "lisa@gmail.com"
    When I visit the index page

  Scenario: User can visit family album page and see shared content
    And I click "Shared albums"
    Then I should be redirected to the "Shared albums" page
    And I should see "Shared albums"
    And I should see "random.png" image
    And I should see "Lisa's renovation"
    And I should see "Lisa's cats"
