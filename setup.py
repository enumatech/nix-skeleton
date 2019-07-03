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
    entry_points={"console_scripts": ["cli = mypkg.cli:main"]},
    install_requires=REQUIRED,
)
