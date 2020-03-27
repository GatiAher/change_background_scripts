# Change Background Scripts

Script to change wallpaper to random picture from https://apod.nasa.gov (astronomy picture of the day). Uses python3, bash. Can use cron to change wallpaper every hour.

## Requirements
* Linux os, bash and python3

## Set-Up

1. make sure both `change_background.sh` and `_get_online_image_space_themed.py` are executable

change permissions with:
* `$ chmod +x change_background.sh`
* `$ chmod +x _get_online_image_space_themed.py`

2. make sure `_get_online_image_space_themed.py` is using your absolute path to your default image

#### If you are using pipenv to manage python virtual environment:

* `$ cd <path to repo>`
* `$ pipenv install`
* find *your* path to pipenv by using `$ which pipenv`
* make sure `change_background.sh` is using *your* path to pipenv

#### Else:

**Warning**: *this installs python packages to your user. Using a virtual environment is better practice!*
* `$ pip3 install requests beautifulsoup4 lxml`
* in `change_background.sh`, comment the lines under "pipenv version", uncomment the line under "not pipenv version"

## Run From Command-Line
* `$ <path_to_repo>/change_background_scripts/change_background.sh`

To store output in a text file:
* `$ <path_to_repo>/change_background_scripts/change_background.sh >>
 <path_to_repo>/change_background_scripts/store.txt 2>&1`

## Run From Cron

CRON is a script scheduler for Unix. It can be used to make a task run periodically automatically.

### Set Up Cron

* `crontab -e`
* Add to crontab file to run once every hour

```
 0 * * * * <path_to_repo>/change_background_scripts/change_background.sh >> <path_to_repo>/change_background_scripts/store.txt 2>&1
```

### Trouble-Shooting

* do not forget to end crontab file with new-line
* if commands are not found, add path to cron's path (cron keeps its own list of directories to check to find the command).

```
PATH=/usr/bin:/bin:/<path_to_repo>
```
