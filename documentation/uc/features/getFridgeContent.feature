Feature: Get Fridge Content - Please work

Scenario: Get Fridge Content, user is authenticated
    Given user is authenticated for fridge
    And fridge is not empty
    When user is navigates to "Content Overview"-Page
    Then load all items
    And show items

Scenario: Get Fridge Content, user is not authenticated
    Given user is not authenticated for fridge
    When user navigates to "Content Overview"-Page
    Then redirect to "Fridges Overview"
    And send error message

Scenario: Get Fridge Content, fridge is empty
    Given user is authenticated
    And fridge is empty
    When user navigates to "Content Overview"-Page
    Then show empty list
    And show add item (manually and via scanning) button
    And show text -> "Fridge is currently empty"