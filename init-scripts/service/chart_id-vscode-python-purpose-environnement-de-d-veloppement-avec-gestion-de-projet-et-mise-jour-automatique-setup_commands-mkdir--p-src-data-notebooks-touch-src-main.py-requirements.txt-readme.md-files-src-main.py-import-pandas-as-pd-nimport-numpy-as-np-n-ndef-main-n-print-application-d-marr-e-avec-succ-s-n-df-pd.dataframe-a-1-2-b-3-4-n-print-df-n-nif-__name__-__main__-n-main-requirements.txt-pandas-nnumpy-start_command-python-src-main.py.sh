#!/usr/bin/env bash
set -euo pipefail

# This init script prepares service on Onyxia.
# Purpose: {chart_id: "vscode-python",purpose: "environnement de développement avec gestion de projet et mise à jour automatique",setup_commands: ["mkdir -p src data notebooks", "touch src/main.py requirements.txt README.md"],files: {"src/main.py": "import pandas as pd\nimport numpy as np\n\ndef main():\n    print('Application démarrée avec succès !')\n    df = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})\n    print(df)\n\nif __name__ == '__main__':\n    main()", "requirements.txt": "pandas\nnumpy"}, "start_command": "python src/main.py"}}
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
echo "No initialization action requested."
