Feature: initialize a plateau

As a NASA director
I want to setup a plateu
So that I can explore mars with the rover squad

Scenario: initialize a plateau
Given I want to setup a plateu
When I start the rover squad interactive console
Then I should see a prompt "Enter plateu size:"
