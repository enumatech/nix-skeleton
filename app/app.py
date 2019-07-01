import os
import sys

import click
from flask import Flask


app = Flask(__name__)

data_file_path = os.path.join(sys.prefix, "data", "test.txt")


@app.route("/", methods=["GET", "POST"])
def blah():
    with open(data_file_path) as f:
        return f.read().strip()


def setup():
    return app


@click.command()
@click.option("--debug", "-d", is_flag=True)
def main(debug):
    app = setup()
    app.run(debug=debug, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))


if __name__ == "__main__":
    main()
