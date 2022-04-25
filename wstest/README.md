# Socket.io App Challenge

## Setup

1. Clone this repository
2. `yarn`

## Run Server

Just run `yarn server`.

Server sends two kinds of events:

- `connected` when socket connection is established
- `count` - ticks(a number) every second

## Run sample client

Just run `yarn client`

## Challenge

Make an App, which'd connect to this [sample server](#run-server).

It must just a big screen with label text in the middle.

Label must be: `Counts received: N`, where N is last received count from server.

Background must be colored. Background must:

- turn green if `count % 2 == 0`
- turn yellow if `count % 3 == 0`
- turn red if `count` is the prime number
- turn black or white if non of the conditions are met

App must be submitted as Github repo. Don't forget to invite me(@slntopp), so i can see it.

Github repo must have a Release with two Assets:

- `.apk` file with the build for Android
- `.snap` file with the build for Ubuntu Core

## Bonuses

### CI

Great bonus would be to write Workflow files to build and publish Assets to a new Release, when repo receives a tag.
