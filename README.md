# axon.sh

[![License](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=license&color=red&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/labels/@license&query=$.description)](https://git.thisisjoes.site/joe/axon.sh/src/branch/dev/LICENSE)
[![Latest Release](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=latest%20release&color=green&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/releases&query=$[0].tag_name)](https://git.thisisjoes.site/joe/axon.sh/releases)
[![Matrix](https://shields.thisisjoes.site/matrix/axon%3Amatrix.thisisjoes.site?fetchMode=summary&logo=matrix&logoColor=%2395b1fb&color=%2395b1fb)](matrix:/r/axon:matrix.thisisjoes.site)

A Matrix Synapse administration tool written in bash. In early development, but works pretty well!

## Project status
Due partly to a lack of interest from the wider homeserver admin community axon.sh's development has significantly slowed. The program does basically everything I personally need it to do to administrate my homeservers.
Pull requests and issues are still welcome, but barring specific feature requests or contributions, axon.sh will likely never completely support Synapse's admin API.

## Supported operations
  #### Session management
  - logging in with username and password
  - homeserver discovery using '.well-known' files
  - logging out and invalidating session

  #### Homeserver operations
  - getting server version information
  - getting event reports
  - sending server notices

  #### Federation operations
  - getting details about federation destination
  - resetting the connection timeout for federation destination

  #### Room operations
  - resolving room aliases
  - creating room aliases
  - deleting room aliases
  - purging room history
  - deleting and blocking rooms
  - getting details about forward extremities
  - deleting forward extremities

  #### User operations
  - getting list of joined rooms for user
  - looking up user by third-party ID (3PID)
  - resetting password for user
  - creating new users
  - deactivating users
  - shadowbanning users
  - managing ratelimits for users


 ## How to use
 
### building

 This project uses [LINAC](https://git.thisisjoes.site/joe/linac). To use the provided version of LINAC to build
 axon.sh, do `./utils/linac build axon.sh.build`.

### running

 Invoke like any other bash script, e.g. `bash build/axon.sh`

### using

 Type `help` at the axon.sh prompt for builtin help. You will probably want to `login` first.
