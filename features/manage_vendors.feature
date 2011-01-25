Feature: Manage vendors
  In order to have a guide with vendors
  A logged in user
  wants to manage the vendors on the site.
  
  Scenario: Register new vendor
    Given I am on the new vendor page
    And I am logged into the site
    When I fill in "Name" with "Vendor Name"
    And I fill in "Description" with "Vendor Description"
    And I press "Create"
    Then I should see "Vendor Name"

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

