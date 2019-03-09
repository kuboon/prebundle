Feature: CLI
  Scenario: In Ubuntu
    When I run `prebundle show`
    Then the output should contain "apt install"

