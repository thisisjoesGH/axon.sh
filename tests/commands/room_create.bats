#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "creates room successfully" {
  run axon.sh room create name="Chinese Room" topic="thought experiments" preset="private" federate="false"
  echo "$output"
  assert_output --partial "Room ID: !"
}
