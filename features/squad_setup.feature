Feature: setup mars rovers squad

As a NASA director
I want to setup the squad of rovers
So I can start moving them

Scenario: initialize squad
Given I don't have any rover placed in the plateu.
When I enter the coordinates and where they're facing
Then I should be able to enter another coordinate
And If I enter a blank space I can see the result