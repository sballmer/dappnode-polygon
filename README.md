# FORK from main:

This fork was made in order to use the polygon-testnetwork mumbai instead of the mainnet. The chain-id need to be changed in the configuration, the seeds and the enode.

You may setup the node you wish (archive of full) by seting up the snapshot desired. Please find the urls here https://snapshots.matic.today/

## build dappnode package

`dappnodesdk build`

## publish package

`dappnodesdk publish`


# Polygon Node DAppNode package

You can use this package without installing it in your DAppNode following these instructions:

## Prerequisites

- git

  Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) command line tool.

- docker

  Install [docker](https://docs.docker.com/engine/installation). The community edition (docker-ce) will work. In Linux make sure you grant permissions to the current user to use docker by adding current user to docker group, `sudo usermod -aG docker $USER`. Once you update the users group, exit from the current terminal and open a new one to make effect.

- docker-compose

  Install [docker-compose](https://docs.docker.com/compose/install)

**Note**: Make sure you can run `git`, `docker ps`, `docker-compose` without any issue and without sudo command.

## Building

`docker-compose build`

## Running

### Start

`docker-compose up -d`

### View logs

`docker-compose logs -f`

### Stop

`docker-compose down`

## Extra options

You can edit the `docker-compose.yml` and add extra options, such as:
```
 <TODO:// list all Polygon options>
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
