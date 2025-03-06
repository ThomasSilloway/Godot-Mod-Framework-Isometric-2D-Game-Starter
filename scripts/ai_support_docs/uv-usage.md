# Running Scripts

A Python script is a file intended for standalone execution, e.g., with `python <script>.py`. Using `uv` to execute scripts ensures that script dependencies are managed without manually managing environments.

## Note

If you are not familiar with Python environments: every Python installation has an environment that packages can be installed in. Typically, creating virtual environments is recommended to isolate packages required by each script. `uv` automatically manages virtual environments for you and prefers a declarative approach to dependencies.

## Running a Script Without Dependencies

If your script has no dependencies, you can execute it with `uv run`:

**example.py**

```python
print("Hello world")
```

```sh
uv run example.py
```

Similarly, if your script depends on a module in the standard library, there's nothing more to do:

**example.py**

```python
import os
print(os.path.expanduser("~"))
```

```sh
uv run example.py
```

Arguments may be provided to the script:

**example.py**

```python
import sys
print(" ".join(sys.argv[1:]))
```

```sh
uv run example.py test
uv run example.py hello world!
```

Additionally, your script can be read directly from `stdin`:

```sh
echo 'print("hello world!")' | uv run -
```

Or, if your shell supports here-documents:

```sh
uv run - <<EOF
print("hello world!")
EOF
```

Note that if you use `uv run` in a project (i.e., a directory with a `pyproject.toml`), it will install the current project before running the script. If your script does not depend on the project, use the `--no-project` flag:

```sh
uv run --no-project example.py
```

## Running a Script With Dependencies

When your script requires other packages, they must be installed into the environment that the script runs in. `uv` prefers to create these environments on-demand instead of using a long-lived virtual environment with manually managed dependencies.

For example, the following script requires `rich`:

**example.py**

```python
import time
from rich.progress import track

for i in track(range(20), description="For example:"):
    time.sleep(0.05)
```

If executed without specifying a dependency, this script will fail:

```sh
uv run --no-project example.py
```

Request the dependency using the `--with` option:

```sh
uv run --with rich example.py
```

Constraints can be added to the requested dependency if specific versions are needed:

```sh
uv run --with 'rich>12,<13' example.py
```

Multiple dependencies can be requested by repeating the `--with` option.

## Creating a Python Script

Python recently added a standard format for inline script metadata. Use `uv init --script` to initialize scripts with the inline metadata:

```sh
uv init --script example.py --python 3.12
```

### Declaring Script Dependencies

Use `uv add --script` to declare the dependencies for the script:

```sh
uv add --script example.py 'requests<3' 'rich'
```

This will add a script section at the top of the script declaring the dependencies using TOML:

**example.py**

```python
# /// script
# dependencies = [
#   "requests<3",
#   "rich",
# ]
# ///

import requests
from rich.pretty import pprint

resp = requests.get("https://peps.python.org/api/peps.json")
data = resp.json()
pprint([(k, v["title"]) for k, v in data.items()][:10])
```

`uv` will automatically create an environment with the dependencies necessary to run the script:

```sh
uv run example.py
```

## Locking Dependencies

`uv` supports locking dependencies for PEP 723 scripts using the `uv.lock` file format:

```sh
uv lock --script example.py
```

Running `uv lock --script` will create a `.lock` file adjacent to the script (e.g., `example.py.lock`).

## Improving Reproducibility

Use the `exclude-newer` field in the `tool.uv` section of inline script metadata to limit `uv` to only considering distributions released before a specific date.

**example.py**

```python
# /// script
# dependencies = [
#   "requests",
# ]
# [tool.uv]
# exclude-newer = "2023-10-16T00:00:00Z"
# ///

import requests
print(requests.__version__)
```

## Using Different Python Versions

**example.py**

```python
import sys
print(".".join(map(str, sys.version_info[:3])))
```

```sh
uv run example.py  # Use the default Python version
uv run --python 3.10 example.py  # Use a specific Python version
```

## Using GUI Scripts

On Windows, `uv` will run scripts ending with `.pyw` using `pythonw`:

**example.pyw**

```python
from tkinter import Tk, ttk

root = Tk()
root.title("uv")
frm = ttk.Frame(root, padding=10)
frm.grid()
ttk.Label(frm, text="Hello World").grid(column=0, row=0)
root.mainloop()
```

Similarly, it works with dependencies as well:

**example_pyqt.pyw**

```python
import sys
from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QGridLayout

app = QApplication(sys.argv)
widget = QWidget()
grid = QGridLayout()

text_label = QLabel()
text_label.setText("Hello World!")
grid.addWidget(text_label)

widget.setLayout(grid)
widget.setGeometry(100, 100, 200, 50)
widget.setWindowTitle("uv")
widget.show()
sys.exit(app.exec_())
```
