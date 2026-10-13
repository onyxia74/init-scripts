#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: Python file with basic mathematical operations: addition, subtraction, multiplication, division
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/definition.py")"
cat > "${WORK_DIR}/definition.py" <<'ONYXIA_FILE_822a5223953f'
def addition(a, b):
    """Return the sum of a and b."""
    return a + b


def subtraction(a, b):
    """Return the difference of a and b."""
    return a - b


def multiplication(a, b):
    """Return the product of a and b."""
    return a * b


def division(a, b):
    """Return the quotient of a and b. Raises ZeroDivisionError if b is 0."""
    if b == 0:
        raise ZeroDivisionError("Cannot divide by zero.")
    return a / b


if __name__ == "__main__":
    # Example usage
    x, y = 10, 3
    print(f"Addition:       {x} + {y} = {addition(x, y)}")
    print(f"Subtraction:    {x} - {y} = {subtraction(x, y)}")
    print(f"Multiplication: {x} * {y} = {multiplication(x, y)}")
    print(f"Division:       {x} / {y} = {division(x, y)}")
ONYXIA_FILE_822a5223953f

