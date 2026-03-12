#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "creates room successfully" {
  result="$(axon.sh room create name="Chinese Room" topic="thought experiments" preset="private" federate="false")"
  [[ "$result" =~ 'Room ID: !' ]]
}
