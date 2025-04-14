#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/build:$PATH"
}

@test "creates user successfully" {
  printf '%s' "CorrectHorseBatteryStaple" > user_pass
  run -0 axon.sh user create user='sankyu' displayname='thirty-nine' admin=false password_file=user_pass
}
