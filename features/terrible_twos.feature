# coding: UTF-8
Feature: Terrible Twos
  To get better at Scrabble
  Because I'm old-skool

  Scenario: Start program
    Given process activity is logged to "greenletters.log"
    Given a process from command "terrible_twos -b A_"
    When I execute the process
    When I enter "Z"
    Then I should see the following output:
    """
    Incorrect.
    """
