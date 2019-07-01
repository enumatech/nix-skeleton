#!/usr/bin/env python
# -*- coding: utf-8 -*-

import io
import os
import glob

from setuptools import find_packages, setup

# Package meta-data.
NAME = "app"
DESCRIPTION = "Some blablah"
URL = "some url"
EMAIL = "some email"
AUTHOR = "some person"

REQUIRED = []
data_files = [("data", ["test.txt"])]

here = os.path.abspath(os.path.dirname(__file__))

with io.open(os.path.join(here, "README.md"), encoding="utf-8") as f:
    long_description = "\n" + f.read()

# Load the package's __version__.py module as a dictionary.
about = {}
with open(os.path.join(here, NAME, "__version__.py")) as f:
    exec(f.read(), about)

# Where the magic happens:
setup(
    name=NAME,
    version=about["__version__"],
    description=DESCRIPTION,
    long_description=long_description,
    author=AUTHOR,
    author_email=EMAIL,
    url=URL,
    packages=find_packages(exclude=("tests",)),
    # If your package is a single module, use this instead of 'packages':
    # py_modules=['mypackage'],
    entry_points={"console_scripts": ["api = app.app:main"]},
    install_requires=REQUIRED,
    data_files=data_files,
)
