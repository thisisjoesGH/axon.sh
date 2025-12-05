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
  load GetType
  declare -a array
  declare type
  GetType array type
  [[ "$type" == ARRAY ]]
}

@test "returns type HASH for hashmap" {
  load GetType
  declare -A hash
  declare type
  GetType hash type
  [[ "$type" == HASH ]]
}

@test "returns type INT for integer" {
  load GetType
  declare -i integer
  declare type
  GetType integer type
  [[ "$type" == INT ]]
}

@test "returns type EXPORT for export" {
  load GetType
  declare -x export
  declare type
  GetType export type
  [[ "$type" == EXPORT ]]
}

@test "returns type OTHER for string" {
  load GetType
  declare string
  declare type
  GetType string type
  [[ "$type" == OTHER ]]
}

@test "returns type UNDECLARED for undeclared variable" {
  load GetType
  declare type
  GetType undeclared type || true
  [[ "$type" == UNDECLARED ]]
}

@test "returns type of reference variable for name reference" {
  load GetType
  declare -A hash
  declare -n ref=hash
  declare type
  GetType ref type
  [[ "$type" == HASH ]]
}

@test "returns error when name reference not passed" {
  load GetType
  declare var
  run -1 GetType var
}
