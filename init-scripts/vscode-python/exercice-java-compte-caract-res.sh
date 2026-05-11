#!/usr/bin/env bash
set -euo pipefail

# This init script prepares vscode-python on Onyxia.
# Purpose: exercice java compte caractères
# Expected parameters : None

WORK_DIR="${WORK_DIR:-/home/onyxia/work}"
mkdir -p "${WORK_DIR}"
# Create workspace files.
mkdir -p "$(dirname "${WORK_DIR}/CharacterCounter.java")"
cat > "${WORK_DIR}/CharacterCounter.java" <<'ONYXIA_FILE_a995323ae3a4'
import java.util.Scanner;

public class CharacterCounter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Entrez une chaîne de caractères : ");
        if (scanner.hasNextLine()) {
            String input = scanner.nextLine();
            System.out.println("Nombre de caractères : " + input.length());
        }
        scanner.close();
    }
}
ONYXIA_FILE_a995323ae3a4

