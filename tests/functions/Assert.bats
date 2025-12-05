#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/src/util:$PATH"

  load Assert
  load GetType
  load $PROJECT_ROOT/src/logging/Log
  load $PROJECT_ROOT/src/logging/LogTerm
  load $PROJECT_ROOT/src/logging/LogFile
}

@test "returns true for declared variable" {
  declare variable='valve timing'
  run Assert variable
}

@test "returns true for empty declared variable" {
  declare empty_variable
  run Assert empty_variable
}

@test "returns false for undeclared variable" {
  run -1 Assert var
}

@test "returns true for declared array" {
  declare -a array=(f o o)
  run Assert array
}

@test "returns true for empty declared array" {
  declare -a empty_array=()
  run Assert empty_array
}

@test "returns true for declared array element" {
  declare -a array=(b a r)
  run Assert array[1]
}

@test "returns false for undeclared array element" {
  declare -a array=(b a z)
  run -1 Assert array[3]
}

@test "returns true for declared hash" {
  declare -A hash=([beef]='corned')
  run Assert hash
}

@test "returns true for empty declared hash" {
  declare -A empty_hash
  run Assert empty_hash
}

@test "returns true for declared hash element" {
  declare -A hash=([slasher]='slinging')
  run Assert hash[slasher]
}

@test "returns false for undeclared hash element" {
  declare -A hash=([bash]='mash')
  run -1 Assert hash[balderdash]
}
