@regression
Feature: Login into app

  # Test ID: #66022
  Background: Navigate into LoginScreen before every scenario
    Given that I have opened the app to confirm Splash Screen
    When the splash image view is displayed
    Then the text info is as follows:
      """
      The F1 FORMULA 1 logo, F1 logo, F1, FORMULA 1, FIA FORMULA ONE WORLD CHAMPIONSHIP, GRAND PRIX and related marks are trade marks of Formula One Licensing BV, a Formula 1 company. All rights reserved.
      """
    When I tap on the login button
    Then the login view title is displayed "Login using your F1 account"

  Scenario: Validating login screen
    And the login view contains following fields:
      | Email               |
      | Password            |
      | Forgotten Password? |
      | LOGIN               |
      | SUBSCRIBE           |

  Scenario: Verify login and logout functionality
    Given I sign in as a subscribed user
    When I tap on Logout button
    Then the login view title is displayed "Login using your F1 account"

  Scenario: Verify login with invalid credentials
    Given I sign in as a subscribed user InvalidEmail
    Then error message is displayed "Invalid email"
    And I sign in as a subscribed user InvalidPasswd
    Then error message is displayed "Login or Password is not valid" or "failed due to LoginRevoked"
