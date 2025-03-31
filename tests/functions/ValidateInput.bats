#!/usr/bin/env bats

setup() {
  load ../test_helper/common-setup
  _common_setup
  PATH="$PROJECT_ROOT/src/input:$PROJECT_ROOT/src/json:$PROJECT_ROOT/src/util:$PATH"

  load $PROJECT_ROOT/src/logging/Log
  load $PROJECT_ROOT/src/logging/LogTerm
  load $PROJECT_ROOT/src/logging/LogFile
}

@test "Integer normal" {
  load ValidateInput
  run -0 ValidateInput integer 9001
}

@test "Integer negative" {
  load ValidateInput
  run -1 ValidateInput integer -9001
}

@test "Integer out of range" {
  load ValidateInput
  run -1 ValidateInput integer 9223372036854775808
}

@test "Integer alpha" {
  load ValidateInput
  run -1 ValidateInput integer five
}

@test "Integer float" {
  load ValidateInput
  run -1 ValidateInput integer 3.0
}

@test "Boolean true" {
  load ValidateInput
  run -0 ValidateInput boolean true
}

@test "Boolean false" {
  load ValidateInput
  run -0 ValidateInput boolean false
}

@test "Boolean truthy" {
  load ValidateInput
  run -1 ValidateInput boolean yes
}

@test "Boolean falsey" {
  load ValidateInput
  run -1 ValidateInput boolean no
}

@test "Boolean wishy-washy" {
  load ValidateInput
  run -1 ValidateInput boolean maybe
}

@test "Text printable" {
  load ValidateInput
  run -0 ValidateInput text "test the world!\n"
}

@test "Text non-printable" {
  load ValidateInput
  run -1 ValidateInput text $'\n'
}

@test "Text emoji" {
  load ValidateInput
  run -0 ValidateInput text 🧪
}

@test "Text unicode" {
  load ValidateInput
  run -0 ValidateInput text よろしく
}

@test "JSON valid" {
  load CatchStream
  load ValidateJSON
  load ValidateInput
  run -0 ValidateInput json '{"object":"impermanence"}'
}

@test "JSON invalid" {
  load CatchStream
  load ValidateJSON
  load ValidateInput
  run -1 ValidateInput json '{:-(}'
}

@test "Host IP valid" {
  load ValidateInput
  run -0 ValidateInput host 203.0.113.88
}

@test "Host IP invalid" {
  load ValidateInput
  run -0 ValidateInput host 256.255.254.253
}

@test "Host hostname valid" {
  load ValidateInput
  run -0 ValidateInput host example.org
}

@test "Host hostname illegal characters" {
  load ValidateInput
  run -1 ValidateInput host '3|_I73'
}

@test "Host hostname starts with dash" {
  load ValidateInput
  run -1 ValidateInput host -bad.example.test
}

@test "Host hostname label exceeds max length" {
  load ValidateInput
  run -1 ValidateInput host a-really-super-duper-extra-mega-hyper-giga-long-loong-looong-subdomain.example.test
}

@test "Host hostname exceeds max length" {
  load ValidateInput
  run -1 ValidateInput host a.really.really.really.super.duper.extra.mega.hyper.giga.long.loong.looong.loooong.looooong.hostname.that.would.really.be.a.pain.to.type.out.when.connecting.over.ssh.for.the.first.time.i.mean.wow.it.is.still.going.who.named.this.host.probably.the.bofh.test
}

@test "Hostname hostname valid" {
  load ValidateInput
  run -0 ValidateInput hostname example.org
}

@test "Hostname hostname illegal characters" {
  load ValidateInput
  run -1 ValidateInput hostname '@room hi!'
}

@test "Hostname hostname label exceeds max length" {
  load ValidateInput
  run -1 ValidateInput hostname a-really-super-duper-extra-mega-hyper-giga-long-loong-looong-subdomain.example.test
}

@test "Hostname hostname exceeds max length" {
  load ValidateInput
  run -1 ValidateInput hostname a.really.really.really.super.duper.extra.mega.hyper.giga.long.loong.looong.loooong.looooong.hostname.that.would.really.be.a.pain.to.type.out.when.connecting.over.ssh.for.the.first.time.i.mean.wow.it.is.still.going.who.named.this.host.probably.the.bofh.test
}

@test "Hostname IP" {
  load ValidateInput
  run -0 ValidateInput hostname 203.0.113.88
}

@test "IP valid" {
  load ValidateInput
  run -0 ValidateInput ip 203.0.113.88
}

@test "IP hostname" {
  load ValidateInput
  run -1 ValidateInput ip host.test
}

@test "IP octet out of range" {
  load ValidateInput
  run -1 ValidateInput ip 203.0.113.256
}

@test "IP missing octet" {
  load ValidateInput
  run -1 ValidateInput ip 203.0.113.
}

@test "Internet port valid" {
  load ValidateInput
  run -0 ValidateInput port 22
}

@test "Internet port out of range" {
  load ValidateInput
  run -1 ValidateInput port 65536
}

@test "Internet port negative" {
  load ValidateInput
  run -1 ValidateInput port -1
}

@test "Unkown type" {
  load ValidateInput
  run -1 ValidateInput untype
}
