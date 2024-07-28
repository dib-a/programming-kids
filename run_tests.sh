#!/bin/bash

# Farben für die Ausgabe
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Keine Farbe

# Verzeichnisse
ROOT_DIR=$(pwd)
LIB_DIR="$ROOT_DIR/lib"
JUNIT_JAR="$LIB_DIR/junit-4.13.2.jar"
HAMCREST_JAR="$LIB_DIR/hamcrest-core-1.3.jar"

# Projektverzeichnisse auflisten
PROJECTS=($(ls -d */))
PROJECTS=("${PROJECTS[@]%/}") # Entferne den abschließenden Schrägstrich

# Projekt auswählen
echo "Wähle ein Projekt aus:"
PS3="Bitte wähle ein Projekt: "
select PROJECT_DIR in "${PROJECTS[@]}"; do
    if [[ -n $PROJECT_DIR ]]; then
        break
    else
        echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
    fi
done

# Verzeichnisse im gewählten Projekt
SRC_DIR="$ROOT_DIR/$PROJECT_DIR/src"
TEST_DIR="$ROOT_DIR/$PROJECT_DIR/test"
BIN_DIR="$ROOT_DIR/$PROJECT_DIR/bin"

# Erstelle das bin Verzeichnis, falls es nicht existiert
mkdir -p "$BIN_DIR"

# Kompiliere alle Java Dateien im src/ Verzeichnis
echo -e "${GREEN}Kompiliere Programme...${NC}"
javac -cp "$JUNIT_JAR":"$HAMCREST_JAR" -d "$BIN_DIR" "$SRC_DIR"/*.java "$TEST_DIR"/*.java

if [ $? -ne 0 ]; then
    echo -e "${RED}Fehler beim Kompilieren der Java-Dateien!${NC}"
    exit 1
fi

# Führe die Programme aus
echo -e "${GREEN}Führe Programme aus...${NC}"
for program_file in $SRC_DIR/*.java; do
    program_class=$(basename "$program_file" .java)
    echo -e "${GREEN}--- Beginn der Ausgabe von ${program_class} ---${NC}"
    java -cp "$BIN_DIR" "$program_class"
    echo -e "${GREEN}--- Ende der Ausgabe von ${program_class} ---${NC}"
done

# Führe die Tests aus
echo -e "${GREEN}Führe Tests aus...${NC}"
for test_file in $TEST_DIR/*Test.java; do
    test_class=$(basename $test_file .java)
    echo -e "${GREEN}Teste ${test_class}...${NC}"
    java -cp "$BIN_DIR":"$JUNIT_JAR":"$HAMCREST_JAR" org.junit.runner.JUnitCore "$test_class"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Alle Tests für ${test_class} bestanden!${NC}"
    else
        echo -e "${RED}Einige Tests für ${test_class} sind fehlgeschlagen.${NC}"
    fi
done

# Lösche das bin Verzeichnis
rm -rf $BIN_DIR

echo -e "\n${GREEN}Alle Tests abgeschlossen.${NC}"
