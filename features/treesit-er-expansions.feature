@Treesit
Feature: treesit expansions
  Background:
    Given there is no region selected
    And rust-ts-mode is enabled

    Scenario: Successively expand the region
    When I insert "fn foo() -> Option<()> {\n  let foo = Some(1)?;\n  None\n}"
    And I place the cursor before "Some"
    And I press "C-@"
    Then the region should be "Some"
    And I press "C-@"
    Then the region should be "Some(1)"
    And I press "C-@"
    Then the region should be "Some(1)?"
    And I press "C-@"
    Then the region should be "let foo = Some(1)?;"
