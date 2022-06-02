# axon.sh

[![License](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=license&color=red&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/labels/@license&query=$.description)](https://git.thisisjoes.site/joe/axon.sh/src/branch/dev/LICENSE)
[![Latest Release](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=latest%20release&color=green&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/releases&query=$[0].tag_name)](https://git.thisisjoes.site/joe/axon.sh/releases)

A Matrix Synapse administration tool written in bash. In early development.

## Supported operations
  #### Session management
  - logging in with username and password
  - homeserver discovery using '.well-known' files
  - logging out and invalidating session

  #### Homeserver operations
  - getting server version information
  - sending server notices

  #### Federation operations
  - getting details about federation destination
  - resetting the connection timeout for federation destination

  #### Room operations
  - resolving room aliases
  - purging room history
  - deleting and blocking rooms

  #### User operations
  - getting list of joined rooms for user
  - resetting password for user
  - creating new users
  - deactivating users
  - shadowbanning users


 ## How to use
 
### building

 This project uses [LINAC](https://git.thisisjoes.site/joe/linac). To use the provided version of LINAC to build
 axon.sh, do `./utils/linac build axon.sh.build`.

### running

 Invoke like any other bash script, e.g. `bash build/axon.sh`

### using

 Type `help` at the axon.sh prompt for builtin help. You will probably want to `login` first.
