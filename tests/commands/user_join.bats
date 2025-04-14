#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "joins user to room" {
  room_id="$(axon.sh room create name="Chinese Room" topic="thought experiments" preset="private" federate="false" format=plain)"
  run -0 axon.sh user join user=admin room="$room_id"
}

@test "fails to join non-existent user" {
  room_id="$(axon.sh room create name="Chinese Room 2 Electric Boogaloo" topic="far-out thought experiments" preset="private" federate="false" format=plain)"
  run -1 axon.sh user join user=carmen_sandiego room="$room_id"
  assert_line -n -1 "ERROR - Server returned error message 'M_NOT_FOUND: User not found'"
}


