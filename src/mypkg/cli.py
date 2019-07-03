import click

@click.command()
@click.argument("name")
def main(name):
    print(f'Hello {name}!')
