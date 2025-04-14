#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "creates room successfully" {
  run -0 axon.sh room create name="Chinese Room" topic="thought experiments" preset="private" federate="false"
  assert_output --partial "Room ID: !"
}
