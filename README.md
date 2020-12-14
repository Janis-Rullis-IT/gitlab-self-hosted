# gitlab-self-hosted

Setup the self-hosted Community Edition GitLab (free to use).

## FIRST TIME? HOW TO SET THIS UP?

#### [1. Install docker](https://github.com/Janis-Rullis-IT/dev/tree/master/Tools/Docker#install)

Docker is a virtual environment with all the required software included. See [all other benefits](https://github.com/Janis-Rullis-IT/flexi-tic-tac-toe/blob/523698d731e5de6aae2a168565d99a621c3e382d/Why-use-docker.md).

#### 2. Provide Your environment values

- Copy the `.env.example` to `.env` and fill `FILL_THIS` values in it.

#### 3. Execute

It will download, install and prepare all the required software.

```shell
./setup.sh
```

## ALREADY SET-UP?

* `./start-.sh` - Start containers once the setup has been done.

## TO EXPORT a code and issues from an already existing repo

* Go to the repo's EDIT page - https://REPO/edit .
* Find the `Export project` seciton.
* Export this project with all its related data in order to move your project to a new GitLab instance. Once the export is finished, you can import the file from the "New Project" page.