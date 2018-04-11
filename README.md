# Experimenter Platform

## Installation
If you are using [anaconda](https://www.anaconda.com/distribution/) on Windows, follow these steps:
1. Create environment `py27` with Python 2.7 installed: `conda create -n py27 python=2.7 anaconda`
2. Activate the environment: `activate py27`
3. Install [tornado](http://www.tornadoweb.org/en/stable/): `conda install tornado`

## Usage

To start web application: 
- go inside web application folder 
- start virtual environment (type: `activate py27` into terminal)
- in terminal: `python start_MSNV_study.py`
- go to `http://localhost:8888` in your browser

After the study, terminate the server by typing `Ctrl+C` in the terminal.
