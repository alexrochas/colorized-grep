Feature: Color Pattern

    Scenario: Color by pattern
        When I run `cgrep -p this:red color this`
        Then the output should contain "color this"

    Scenario: Color piped string
        When I run `echo "Should accept this" | cgrep -i -p this:red`
        Then the output should contain "Should accept this"
