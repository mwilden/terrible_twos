# coding: UTF-8
Feature: Terrible Twos

  Scenario: Start program
    Given I run "terrible_twos -b A_"
    Then I should see
    """
    Mark Wilden
    """
    When I enter "Z" into process "terrible_twos"
    Then I should see
    """
    Incorrect.
    """
