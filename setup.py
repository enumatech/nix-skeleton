import io
import os
import glob

from setuptools import find_packages, setup

# Package meta-data.
NAME = "mypkg"
DESCRIPTION = "Some blablah"
URL = "some url"
EMAIL = "some email"
AUTHOR = "some person"

REQUIRED = []

here = os.path.abspath(os.path.dirname(__file__))

with io.open(os.path.join(here, "README.md"), encoding="utf-8") as f:
    long_description = "\n" + f.read()

# Where the magic happens:
setup(
    name=NAME,
    version="0.1.0",
    description=DESCRIPTION,
    long_description=long_description,
    author=AUTHOR,
    author_email=EMAIL,
    url=URL,
    packages=find_packages(where="src", exclude=("tests",)),
    package_dir={"": "src"},
    entry_points={"console_scripts": ["cli = mypkg.cli:main"]},
    install_requires=REQUIRED,
)
