#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/src/synapse:$PROJECT_ROOT/src/util:$PATH"

  load Assert
  load GetType
  load $PROJECT_ROOT/src/logging/Log
  load $PROJECT_ROOT/src/logging/LogTerm
  load $PROJECT_ROOT/src/logging/LogFile

  # mock server version
  SynapseVersion() { printf '1.100.1'; }
}

@test "returns success on adequate version" {
  load CheckServerSupport
  minimum_version='1.100.1'
  run -0 CheckServerSupport minimum_version
}

@test "returns success on adequate version after release candidate" {
  load CheckServerSupport
  minimum_version='1.100.1rc1'
  run -0 CheckServerSupport minimum_version
}

@test "returns error on inadequate major version" {
  load CheckServerSupport
  minimum_version='2.100.1'
  run -1 CheckServerSupport minimum_version
}

@test "returns error on inadequate minor version" {
  load CheckServerSupport
  minimum_version='1.101.1'
  run -1 CheckServerSupport minimum_version
}

@test "returns error on inadequate patch version" {
  load CheckServerSupport
  minimum_version='1.100.2'
  run -1 CheckServerSupport minimum_version
}

@test "returns error when empty reference passed" {
  load CheckServerSupport
  minimum_version=''
  run -1 CheckServerSupport minimum_version
}

@test "returns error when no reference passed" {
  load CheckServerSupport
  run -1 CheckServerSupport ''
}
