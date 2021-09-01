#!/Users/ragz/anaconda3/envs/nvimenv/bin/python

from os import path
import re
import shutil
import subprocess
import sys
import tempfile

default_template = """<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" href="{root_path}style.css" type="text/css"
         media="screen" title="no title" charset="utf-8">
        <link rel="stylesheet" href="{root_path}pygmentize.css" type="text/css"
         media="screen" title="no title" charset="utf-8">
    </head>
    <body>

%content%

    </body>
</html>
"""

def convert(
    force,
    syntax,
    extension,
    output_dir,
    input_file,
    css_file,
    template_path,
    template_default,
    template_ext,
    root_path,
    custom_args,
):
    if shutil.which("pandoc") is None:
        print("Error: pandoc not found", file=sys.stderr)
        sys.exit(1)

    if syntax != "markdown":
        print("Error: Unsupported syntax", file=sys.stderr)
        sys.exit(1)

    input_file_name = path.splitext(path.basename(input_file))[0]
    output_file = path.join(output_dir, input_file_name) + path.extsep + "html"

    with open(input_file, "r", encoding="utf8") as f:
        lines = f.read()

    lines = re.sub(r"\[([^]]+)\]\((.+)\)", repl, lines)

    print(root_path)
    command = [
        "pandoc",
        "--section-divs",
        "--toc",
        "-s",
        "-c",
        f"{template_path}/styling.css",
        "-f",
        "markdown",
        "-t",
        "html5",
        "-o",
        output_file,
        "-",
    ]

    # Prune empty elements from command list
    command = list(filter(None, command))

    # Run command
    subprocess.run(command, check=True, encoding="utf8", input=lines)


def repl(match):
    link = path.splitext(match.group(2))[0] + ".html"
    return "[{}]({})".format(match.group(1), link)


if __name__ == "__main__":
    convert(*sys.argv[1:])
