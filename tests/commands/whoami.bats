#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "whoami returns MXID" {
  run -0 axon.sh whoami
  username="$(axon.sh config admin_user)"
  homeserver="$(axon.sh config homeserver)"
  assert_line -n -1 "Authenticated as: @$username:$homeserver"
}
