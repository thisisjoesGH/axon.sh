#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"

  axon.sh config config_path "$PROJECT_ROOT/axon"
}

@test "whoami returns MXID" {
  run -0 axon.sh whoami
  username="$(axon.sh config admin_user)"
  assert_line -n -1 "Authenticated as: @$username:matrix.thisisjoes.site"
}
