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
SRC_DIR="$ROOT_DIR/Programmes/src"
TEST_DIR="$ROOT_DIR/Programmes/test"
BIN_DIR="$ROOT_DIR/bin"

# Liste der verfügbaren Projekte
PROJECTS=($(ls -d $SRC_DIR/*))
PROJECTS=("${PROJECTS[@]##*/}") # Entferne den Pfad und behalte nur die Verzeichnisnamen

# Projekt auswählen
echo "Wähle ein Projekt aus:"
PS3="Bitte wähle ein Projekt: "
select PROJECT in "${PROJECTS[@]}"; do
    if [[ -n $PROJECT ]]; then
        break
    else
        echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
    fi
done

# Verzeichnisse im gewählten Projekt
PROJECT_SRC_DIR="$SRC_DIR/$PROJECT"
PROJECT_TEST_DIR="$TEST_DIR/$PROJECT"

# Erstelle das bin Verzeichnis, falls es nicht existiert
mkdir -p $BIN_DIR

# Kompiliere alle Java Dateien im Projektverzeichnis
echo -e "${GREEN}Kompiliere Programme...${NC}"
javac -cp $JUNIT_JAR:$HAMCREST_JAR -d $BIN_DIR $PROJECT_SRC_DIR/*.java $PROJECT_TEST_DIR/*.java

if [ $? -ne 0 ]; then
    echo -e "${RED}Fehler beim Kompilieren der Java-Dateien!${NC}"
    exit 1
fi

# Führe die Programme aus
echo -e "${GREEN}Führe Programme aus...${NC}"
for program_file in $PROJECT_SRC_DIR/*.java; do
    program_class=$(basename $program_file .java)
    echo -e "${GREEN}Ausgabe von ${PROJECT}.${program_class}:${NC}"
    java -cp $BIN_DIR ${PROJECT}.${program_class}
    echo -e "${GREEN}--- Ende der Ausgabe von ${PROJECT}.${program_class} ---${NC}"
done

# Führe die Tests aus
echo -e "${GREEN}Führe Tests aus...${NC}"
for test_file in $PROJECT_TEST_DIR/*Test.java; do
    test_class=$(basename $test_file .java)
    echo -e "${GREEN}Teste ${PROJECT}.${test_class}...${NC}"
    java -cp $BIN_DIR:$JUNIT_JAR:$HAMCREST_JAR org.junit.runner.JUnitCore ${PROJECT}.${test_class}

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Alle Tests für ${PROJECT}.${test_class} bestanden!${NC}"
    else
        echo -e "${RED}Einige Tests für ${PROJECT}.${test_class} sind fehlgeschlagen.${NC}"
    fi
done

# Lösche das bin Verzeichnis
echo -e "${GREEN}Lösche das bin Verzeichnis...${NC}"
rm -rf $BIN_DIR

echo -e "${GREEN}Alle Tests abgeschlossen.${NC}"
