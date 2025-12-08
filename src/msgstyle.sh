assert_lenght_between_12_and_72() {

    return 1

}

assert_no_scope_or_type() {

    return 1

}

assert_no_trailing_punctuation() {

    return 1

}

assert_no_weird_characters() {

    return 1

}

assert_start_with_allowed_verb() {

    return 1
}

main() {

    assert_lenght_between_12_and_72 "$@"
    assert_no_scope_or_type "$@"
    assert_no_trailing_punctuation "$@"
    assert_no_weird_characters "$@"
    assert_start_with_allowed_verb "$@"
    return 1

}

main "$@"
