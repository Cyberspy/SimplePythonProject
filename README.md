# Setup Instructions

- Make sure Python is installed and note the verions number - version 3.12 for example. If you are not sure, run \
`Python -V`

- For a new project, create a new folder. Or, clone a Git repo `git clone https://github.com/<path>.git` to a download the code into a new project folder

- In a command prompt, go to the project folder  (e.g. `\my_project`)

- Is `pipenv` installed? Run `pipenv --help` from the command line. If it fails, run `pip install pipenv`. This installs `pipenv` at a system level.

- Make sure it's been installed to somewhere in your `PATH` - try running `pipenv` gain. If it still doesn't work, the installation will have shown you where it's installed. Make sure the path is added to your `PATH`

- Initialise the Python pipenv environment. Run `pipenv --python 3.12` (or later version if that is what you have)

- To manually enter the pipenv virtual environment, in your project folder, run `pipenv shell`. You should see something like this - note the name of the virtual environment in brackets:
```
C:\Users\adam\Documents\Projects\Python\XAL-ST>pipenv shell
Launching subshell in virtual environment...
Microsoft Windows [Version 10.0.22631.5768]
(c) Microsoft Corporation. All rights reserved.

(Blank_Project-Ypbq2ipJ) C:\Users\adam\Documents\Projects\Python\Blank Project>
```

- If it's an existing project, Now we need to install the dependecies. Run `pipenv install`. This will install the packages in the `Pipfile.lock` file.

- If it's a new project, you can now start to add `.py` files and install packages with pip e.g. \
`pip install requests`

- Once you have installed some packages, run `pipenv lock` to create/update the `Pipfil.lock` file, so you have a record of what is installed in your project.

# Python Upgrade
The current `Pipfile` & `Pipfile.lock` expect Python `3.12` (or whatever you used)

If a later version is installed, then there may be issues running `pipenv install`

If this happens, update `Pipfile` and change:
```
[requires]
python_version = "3.12"
python_full_version = "3.12.4"
```
To match the version of Python you have installed.

Then, run `pipenv update` to update the `Pipfile.lock` file and update the installed packages.

# Batch file to automate running the app with localised config

Remebering to run `pipenv shell` and, optionally, configuring your app each time you run it is frustrating and easy to mess up if not automated.

Here is a process that uses a batch file (example using WIndows CMD files, but the process can be converted to run on Linux or Mc OS).

This process is especially useful if your app is to be run automtically - as a sceduled app for example - as it wraps all the virtual environment initialisation up in a repeatable manner that cleans up after it self

- Open and edit `windows-env-dev.cmd`. Update/Add/Delete the variables as required for your project. \
the project folder, in a subfolder called `/files`

- The app can now be run with either:
    - `run-dev.cmd`

- For a 'Production' version:
    - Copy and rename `run-dev.cmd`, `shell-dev.cmd` and `windows-env-dev.cmd` as `run-prod.cmd`, `shell-prod.cmd` and `windows-env-prod.cmd`
    - Edit `run-prod.cmd` to change `pipenv run cmd /C shell-dev.cmd` to `pipenv run cmd /C shell-prod.cmd`.
    - Edit `shell-prod.cmd` to change `call windows-env-dev.cmd` to `call windows-env-prod.cmd`
    - Edit `windows-env-prod.cmd` to use whatever Production variables you need

You can now use `run-prod.cmd` to run the same code with different values


The `run-dev.cmd` file runs `pipenv` (to initialise the Python virtual environment) and runs a second command shell (`shell-dev.cmd`) in that context. In there, it runs `windows-env-dev.cmd` which contains all the environment variables for your project and then runs the actual app, `main.py`. When this finishes, the command shells exit so no virtual environments or environment variables with credentials are left lying around!


