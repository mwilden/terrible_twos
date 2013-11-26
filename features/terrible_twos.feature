# coding: UTF-8
Feature: Terrible Twos
  Starting up the program

  Scenario: Start program
    When I run `terrible_twos`
    Then the stdout should contain "Terrible Twos 0.1 (16 Nov 2013) by Mark Wilden 
