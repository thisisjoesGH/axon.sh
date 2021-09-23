# axon.sh

[![License](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=license&color=red&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/labels/@license&query=$.description)](https://git.thisisjoes.site/joe/axon.sh/src/branch/dev/LICENSE)
[![Latest Release](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=latest%20release&color=green&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/releases&query=$[0].tag_name)](https://git.thisisjoes.site/joe/axon.sh/releases)

A Matrix Synapse administration tool written in bash

In early development. Currently supports:
 - logging in with username and password
 - logging out and invalidating session
 - retrieving and saving access token
 - getting server version information
 - creating new users
 - resetting user password
 - deactivating users
 - sending server notices

 ## How to use
 
### building

 This project uses [LINAC](https://git.thisisjoes.site/joe/linac). To use the provided version of LINAC to build
 axon.sh, do `./utils/linac build axon.sh.build`.

### running

 Invoke like any other bash script, e.g. `bash build/axon.sh`
