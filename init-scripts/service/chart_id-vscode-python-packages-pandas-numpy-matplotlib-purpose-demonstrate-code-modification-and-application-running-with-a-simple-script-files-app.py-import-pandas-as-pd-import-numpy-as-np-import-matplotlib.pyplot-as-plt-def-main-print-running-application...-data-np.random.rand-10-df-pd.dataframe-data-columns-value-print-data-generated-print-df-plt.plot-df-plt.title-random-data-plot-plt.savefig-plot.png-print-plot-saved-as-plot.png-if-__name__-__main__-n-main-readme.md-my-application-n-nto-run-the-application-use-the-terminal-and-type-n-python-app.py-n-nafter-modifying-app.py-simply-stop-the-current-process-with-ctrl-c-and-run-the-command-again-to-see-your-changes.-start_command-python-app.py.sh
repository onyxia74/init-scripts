#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {"chart_id":"vscode-python","packages":["pandas","numpy","matplotlib"],"purpose":"demonstrate code modification and application running with a simple script","files":{"app.py":"import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def main():
    print("Running application...")
    data = np.random.rand(10)
    df = pd.DataFrame(data, columns=["Value"])
    print("Data generated:")
    print(df)
    plt.plot(df)
    plt.title("Random Data Plot")
    plt.savefig("plot.png")
    print("Plot saved as plot.png")

if __name__ == \"__main__\":\n    main()","README.md":"# My Application\n\nTo run the application, use the terminal and type:\n`python app.py`\n\nAfter modifying `app.py`, simply stop the current process with `Ctrl+C` and run the command again to see your changes."},"start_command":"python app.py"}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
