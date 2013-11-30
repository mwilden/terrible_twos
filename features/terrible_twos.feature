# coding: UTF-8
Feature: Terrible Twos
  To get better at Scrabble
  Because I'm old-skool

  Scenario: Start program
    Given process activity is logged to "greenletters.log"
    Given a process "terrible_twos" from command "terrible_twos -b A_"
    When I execute the process "terrible_twos"
    Then I should see the following output from process "terrible_twos":
    """
    Mark Wilden
    """
