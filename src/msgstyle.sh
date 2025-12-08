#!/bin/bash

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2155

assert_lenght_between_12_and_72() {

    local payload=$(head -n 1 "$1")
    if [[ ${#payload} -ge 12 && ${#payload} -le 72 ]]; then return 0; fi
    echo "❌ Commit message must be between 12 and 72 characters long"
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
    local allowed=("Accept" "Adjust" "Bundle" "Bypass" "Cancel" "Concat" "Create" "Decode" "Delete" "Deploy" "Enable" "Encode" "Ensure" "Export" "Filter" "Forbid" "Format" "Freeze" "Harden" "Ignore" "Import" "Insert" "Loosen" "Permit" "Rebase" "Refine" "Reject" "Resume" "Return" "Revert" "Reword" "Secure" "Submit" "Switch" "Unpack" "Update" "Vanish" "Verify")
    for element in "${allowed[@]}"; do [[ "$payload" == "$element" ]] && return 0; done
    echo "❌ Commit message must start with an allowed verb: ${allowed[*]}"
    echo "Your message starts with: '$payload'" && exit 1

}

main() {

    assert_lenght_between_12_and_72 "$1"
    assert_no_scope_or_type "$1"
    assert_no_trailing_punctuation "$1"
    assert_no_weird_characters "$1"
    assert_start_with_allowed_verb "$1"

}

main "$1"
