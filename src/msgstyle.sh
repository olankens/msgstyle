#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2155

assert_lenght_between_10_and_35() {

    local payload=$(head -n 1 "$1")
    if [[ ${#payload} -ge 10 && ${#payload} -le 35 ]]; then return 0; fi
    echo "❌ Commit message must be between 10 and 35 characters long"
    echo "Your message is: '$payload'" && exit 1

}

assert_no_digits() {

    local payload=$(head -n 1 "$1")
    local pattern='[0-9]'
    if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
    echo "❌ Commit message must not contain digits"
    echo "Your message is: '$payload'" && exit 1

}

assert_no_scope_or_type() {

    local payload=$(head -n 1 "$1")
    local pattern='^[a-zA-Z]+[[:space:]]*(\([a-zA-Z0-9_-]+\))?!?:'
    if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
    echo "❌ Commit message must not contain scope or type"
    echo "Your message is: '$payload'" && exit 1

}

assert_no_trailing_punctuation() {

    local payload=$(head -n 1 "$1")
    local pattern='[.,;:!?]$'
    if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
    echo "❌ Commit message must not contain trailing punctuation"
    echo "Your message is: '$payload'" && exit 1

}

assert_no_weird_characters() {

    local payload=$(head -n 1 "$1")
    local pattern='[][@#$%^&*(){}<>|\\~`]'
    if [[ ! "$payload" =~ $pattern ]]; then return 0; fi
    echo "❌ Commit message must not contain special characters"
    echo "Your message is: '$payload'" && exit 1

}

assert_start_with_allowed_verb() {

    local payload=$(head -n 1 "$1" | awk '{print $1}' | sed 's/[:,]$//')
    local allowed=(
        "Accept" "Add" "Adjust" "Allow" "Ban" "Bundle" "Bypass" "Cancel" "Check" "Code"
        "Concat" "Create" "Decode" "Delete" "Deny" "Deploy" "Drop" "Ease" "Edit" "Enable"
        "Encode" "End" "Ensure" "Expand" "Export" "Filter" "Flip" "Forbid" "Format" "Freeze"
        "Give" "Harden" "Hide" "Hone" "Ignore" "Import" "Insert" "Join" "Kill" "Let"
        "Load" "Lock" "Loosen" "Make" "Move" "Open" "Pack" "Permit" "Put" "Read"
        "Rebase" "Refine" "Reject" "Rename" "Resume" "Return" "Revert" "Reword" "Secure" "Send"
        "Set" "Ship" "Skip" "Start" "Stop" "Style" "Submit" "Swap" "Switch" "Take"
        "Test" "Undo" "Unpack" "Update" "Vanish" "Verify"
    )
    for element in "${allowed[@]}"; do [[ "$payload" == "$element" ]] && return 0; done
    echo "❌ Commit message must start with an allowed verb: ${allowed[*]}"
    echo "Your message starts with: '$payload'" && exit 1

}

assert_start_with_capital_rest_lowercase() {

    local payload=$(head -n 1 "$1")
    local pattern='^[A-Z][a-z0-9 -]*$'
    if [[ "$payload" =~ $pattern ]]; then return 0; fi
    echo "❌ Commit message must start with a capital letter and the rest must be lowercase"
    echo "Your message is: '$payload'" && exit 1

}

main() {

    assert_lenght_between_10_and_35 "$1"
    assert_no_digits "$1"
    assert_no_scope_or_type "$1"
    assert_no_trailing_punctuation "$1"
    assert_no_weird_characters "$1"
    assert_start_with_allowed_verb "$1"
    assert_start_with_capital_rest_lowercase "$1"

}

main "$1"
