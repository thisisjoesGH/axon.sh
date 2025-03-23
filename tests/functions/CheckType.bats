#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/src/util:$PATH"

  load Assert
  load $PROJECT_ROOT/src/logging/Log
  load $PROJECT_ROOT/src/logging/LogTerm
  load $PROJECT_ROOT/src/logging/LogFile
}

@test "returns type ARRAY for array" {
  load CheckType
  declare -a array
  declare type
  CheckType array type
  [[ "$type" == ARRAY ]]
}

@test "returns type HASH for hashmap" {
  load CheckType
  declare -A hash
  declare type
  CheckType hash type
  [[ "$type" == HASH ]]
}

@test "returns type INT for integer" {
  load CheckType
  declare -i integer
  declare type
  CheckType integer type
  [[ "$type" == INT ]]
}

@test "returns type EXPORT for export" {
  load CheckType
  declare -x export
  declare type
  CheckType export type
  [[ "$type" == EXPORT ]]
}

@test "returns type OTHER for string" {
  load CheckType
  declare string
  declare type
  CheckType string type
  [[ "$type" == OTHER ]]
}

@test "returns error for undefined variable" {
  load CheckType
  declare type
  run -1 CheckType undefined type
}

@test "returns error when name reference not passed" {
  load CheckType
  declare var
  run -1 CheckType var
}
