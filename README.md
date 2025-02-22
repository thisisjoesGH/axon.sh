# axon

[![License](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=license&color=red&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/labels/@license&query=$.description)](https://git.thisisjoes.site/joe/axon.sh/src/branch/dev/LICENSE)
[![Latest Release](https://shields.thisisjoes.site/badge/dynamic/json.svg?label=latest%20release&color=green&url=https://git.thisisjoes.site/api/v1/repos/joe/axon.sh/releases&query=$[0].tag_name)](https://git.thisisjoes.site/joe/axon.sh/releases)
[![Matrix](https://shields.thisisjoes.site/matrix/axon%3Amatrix.thisisjoes.site?fetchMode=summary&logo=matrix&logoColor=%2395b1fb&color=%2395b1fb)](matrix:/r/axon:matrix.thisisjoes.site)

A Matrix Synapse administration CLI. Better than typing curl requests!

## Seeking user feedback
If you have used axon please provide your feedback, positive or negative. Feel free to open an issue or leave a message in the [matrix] room at `#axon:matrix.thisisjoes.site`.

In particular, feedback on command usability and desired functionality would be valuable.

## Getting started
### Using a release
Download `axon.sh` from the [releases page](https://git.thisisjoes.site/joe/axon.sh/releases).
Mark it as executable: `chmod +x axon.sh`.

#### Checking the signature
Each release is signed with the [project signing key](https://git.thisisjoes.site/joe/axon.sh/wiki/Project-Signing-Key).
To verify the signature, download `axon.sh.asc` and run `gpg --verify axon.sh.asc axon.sh`.

### Building from the sources
Clone and enter the repo directory:
`git clone https://git.thisisjoes.site/joe/axon.sh && cd axon.sh`

Use the provided copy of LINAC to build axon:
`./utils/linac build axon.sh`

LINAC will output the result at `build/axon.sh`.

### First run
Start axon and you will be presented with the axon prompt.
Type `login` to login to an account using your MXID.
Type `help` for usage info.

If your environment does not support homeserver discovery, you may configure axon.sh directly by using the `config` command.
See [manual configuration](https://git.thisisjoes.site/joe/axon.sh/wiki/Manual-Configuration) on the wiki for more guidance.

## Supported operations
  #### Session management
  - logging in with MXID
  - invalidating session on logout

  #### Homeserver operations
  - sending server notices to one or many users
  - getting server version information
  - getting event reports

  #### Federation operations
  - getting connection details about federation destinations
  - resetting the connection timeout for federation destinations
  - getting server software and version information from federation destinations
  - federation destination discovery using .well-known files

  #### Room operations
  - resolving room aliases to their associated ID
  - creating new room aliases
  - deleting room aliases
  - adding rooms to the public directory
  - removing rooms from the public directory
  - purging local and remote room history
  - evacuating users from rooms
  - migrating users from evacuated rooms to a new room
  - blocking users from joining rooms
  - getting details about forward extremities
  - deleting forward extremities

  #### User operations
  - getting list of joined rooms for users
  - looking up user by third-party ID (3PID)
  - resetting password for users
  - creating new users
  - deactivating users
  - shadowbanning users
  - redacting all of a user's events
  - managing ratelimits for users
