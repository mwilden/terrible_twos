# coding: UTF-8
Feature: Terrible Twos

  Scenario: Start program
    Given I run "terrible_twos"
    Then I should see the following output from process "terrible_twos":
    """
    Mark Wilden
    """
    When I enter "Z" into process "terrible_twos"
    Then I should see the following output from process "terrible_twos":
    """
    Incorrect.
    """
