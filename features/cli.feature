Feature: CLI
  Scenario: In Ubuntu
    When I run `prebundle all`
    Then the output should contain "apt install"

