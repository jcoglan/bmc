Feature: Users can add articles
  In order to point out some bad science
  As a user
  I want to be able to add links to external articles
  
  Background:
    Given I am logged in as "jcoglan"
  
  Scenario: Finding the new article page
    Given I am on the home page
    When I follow "Add an article"
    Then I should see "Add an article" within ".main"
  
  Scenario: Adding an article fetches the title automatically
    Given I am on the new article page
    When I fill in "URL" with "http://www.guardian.co.uk/science/2009/nov/06/cern-big-bang-goes-phut"
    And I press "Submit"
    Then I should see "Edit article: Big bang goes phut as bird drops baguette into Cern machinery"
    When I press "Save"
    Then I should see "Viewing article: Big bang goes phut as bird drops baguette into Cern machinery"
  
  Scenario: Adding an article from a new source
    Given I am on the new article page
    And I fill in "URL" with "http://www.timesonline.co.uk/tol/news/politics/article6906914.ece"
    And I press "Submit"
    Then I should see "Edit article: Science Minister renews attack over adviser's sacking"
    When I choose "Other"
    And I fill in "Source" with "The Times"
    When I press "Save"
    Then I should see "Viewing article: Science Minister renews attack over adviser's sacking"
    And I should see "From The Times, posted by you" within ".attribution"
  
  Scenario Outline: Adding an article from a registered source
    Given there is a Source called "The Daily Mail" with domain "dailymail.co.uk"
    And there is a Source called "Mail on Sunday" with domain "dailymail.co.uk"
    And I am on the new article page
    When I fill in "URL" with "http://www.dailymail.co.uk/news/article-1225643/Sack-exam-chiefs-dumbed-science-says-Royal-Society-Chemistry.html"
    And I press "Submit"
    Then I should see "Edit article: 'Sack exam chiefs over dumbed-down science' says Royal Society of Chemistry"
    And I should see "The Daily Mail" within ".sources"
    And I should see "Mail on Sunday" within ".sources"
    And the "The Daily Mail" checkbox should be checked
    When I choose "<source>"
    And I press "Save"
    Then I should see "Viewing article: 'Sack exam chiefs over dumbed-down science' says Royal Society of Chemistry"
    And I should see "From <source>, posted by you" within ".attribution"
    Examples:
      | source          |
      | The Daily Mail  |
      | Mail on Sunday  |
  
  Scenario Outline: Articles are attributed to the user who posted them
    Given there is a User with the username "imrankhan"
    And there is an Article titled "Rails causes cancer"
    And the Article was submitted by "<user>"
    When I visit the page for the Article
    Then I should see "Viewing article: Rails causes cancer"
    And I should see "Posted by <attributee>" within ".attribution"
    Examples:
      | user      | attributee  |
      | jcoglan   | you         |
      | imrankhan | imrankhan   |

