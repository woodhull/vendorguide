Feature: Review vendors
  In order to have reviews
  A logged in user
  wants to rate various vendors

  Scenario: Review a vendor
    Given a vendor exists
    And I am logged into the site
    And I am on the vendor page
    When I fill in "Review" with "describing the vendor"
    And  I fill in "Score" with "5"
    And  I press "Create"
    Then I should see "describing the vendor"
    

  Scenario: Edit a new vendor
    Given a vendor exists
    And I am on the vendor page
    And I am logged into the site
    When I follow "Edit Description"
    And I fill in "Description" with "New Vendor Foo"
    And I press "Save"
    Then I should see "New Vendor Foo"
    And I follow "History"
    Then I should see "New Vendor Foo"
    And I should see "Vendor Description"

