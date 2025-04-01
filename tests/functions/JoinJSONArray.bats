#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/src/json:$PATH"

  load $PROJECT_ROOT/src/logging/Log
  load $PROJECT_ROOT/src/logging/LogTerm
  load $PROJECT_ROOT/src/logging/LogFile
  load $PROJECT_ROOT/src/util/CatchStream
}

@test "returns comma-joined strings for normal array" {
  load JoinJSONArray
  run -0 JoinJSONArray '["nihil","sub","sole","novum"]'
  assert_output 'nihil,sub,sole,novum'
}

@test "returns custom joiner-joined strings for normal array" {
  load JoinJSONArray
  run -0 JoinJSONArray '["gratia","estis","salvati"]' ',\n'
  assert_output $'gratia,\nestis,\nsalvati'
}

@test "returns comma-joined strings for array of objects" {
  load JoinJSONArray
  run -0 JoinJSONArray '[{"type":"plane","mode":"flight"},{"type":"train","mode":"locomotion"},{"type":"automobile","mode":"driving"}]'
  assert_output '{"type":"plane","mode":"flight"},{"type":"train","mode":"locomotion"},{"type":"automobile","mode":"driving"}'
}

@test "returns comma-joined strings for array of arrays" {
  load JoinJSONArray
  run -0 JoinJSONArray '[[0,1,1,2,3,5,8,13,21],[1,3,5,7,11,13,17,19,23,29,31,37],[3,1,4,1,5,9,2,6,5,3,5,8,9]]'
  assert_output '[0,1,1,2,3,5,8,13,21],[1,3,5,7,11,13,17,19,23,29,31,37],[3,1,4,1,5,9,2,6,5,3,5,8,9]'
}

@test "returns error for invalid JSON" {
  load JoinJSONArray
  run -1 JoinJSONArray '["invalid":[nonsense]]'
}

@test "returns error for missing JSON" {
  load JoinJSONArray
  run -1 JoinJSONArray ''
}
