#!/bin/bash

# Farben für die Ausgabe
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # Keine Farbe

# Verzeichnisse
ROOT_DIR=$(pwd)
LIB_DIR="$ROOT_DIR/lib"
JUNIT_JAR="$LIB_DIR/junit-4.13.2.jar"
HAMCREST_JAR="$LIB_DIR/hamcrest-core-1.3.jar"
SRC_DIR="$ROOT_DIR/Programmes/src"
TEST_DIR="$ROOT_DIR/Programmes/test"
BIN_DIR="$ROOT_DIR/bin"

# Überprüfen, ob die Verzeichnisse existieren
if [[ ! -d $SRC_DIR ]]; then
    echo -e "${RED}Das Quellverzeichnis $SRC_DIR existiert nicht!${NC}"
    exit 1
fi

if [[ ! -d $TEST_DIR ]]; then
    echo -e "${RED}Das Testverzeichnis $TEST_DIR existiert nicht!${NC}"
    exit 1
fi

# Liste der verfügbaren Projekte
PROJECTS=($(ls -d $SRC_DIR/* 2>/dev/null))
PROJECTS=("${PROJECTS[@]##*/}") # Entferne den Pfad und behalte nur die Verzeichnisnamen

if [ ${#PROJECTS[@]} -eq 0 ]; then
    echo -e "${RED}Keine Projekte gefunden!${NC}"
    exit 1
fi

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

# Option auswählen: Testen oder Bearbeiten
echo "Was möchtest du tun?"
PS3="Bitte wähle eine Option: "
options=("Programm testen" "Programm bearbeiten")
select OPTION in "${options[@]}"; do
    if [[ -n $OPTION ]]; then
        break
    else
        echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
    fi
done

# Funktion zum Kompilieren und Ausführen der Programme und Tests
run_tests() {
    # Erstelle das bin Verzeichnis, falls es nicht existiert
    mkdir -p $BIN_DIR

    # Finde alle Java-Dateien im Projekt- und Testverzeichnis
    PROGRAM_FILES=($(find $PROJECT_SRC_DIR -name "*.java"))
    TEST_FILES=($(find $PROJECT_TEST_DIR -name "*Test.java"))

    if [ ${#PROGRAM_FILES[@]} -eq 0 ]; then
        echo -e "${RED}Keine Java-Quellcode-Dateien im Projektverzeichnis gefunden!${NC}"
        exit 1
    fi

    if [ ${#TEST_FILES[@]} -eq 0 ]; then
        echo -e "${RED}Keine Testdateien im Testverzeichnis gefunden!${NC}"
        exit 1
    fi

    # Kompiliere alle Java Dateien im Projektverzeichnis und erfasse die Ausgabe
    echo -e "${GREEN}Kompiliere Programme...${NC}"
    COMPILATION_OUTPUT=$(javac -J-Duser.language=de -cp $JUNIT_JAR:$HAMCREST_JAR -d $BIN_DIR "${PROGRAM_FILES[@]}" "${TEST_FILES[@]}" 2>&1)
    if [ $? -ne 0 ]; then
        echo -e "${RED}Fehler beim Kompilieren der Java-Dateien!${NC}"
        echo "$COMPILATION_OUTPUT"
        exit 1
    fi
    echo -e "${GREEN}Kompilierung erfolgreich!${NC}"

    # Führe die Programme aus
    echo -e "${GREEN}Führe Programme aus...${NC}"
    for program_file in "${PROGRAM_FILES[@]}"; do
        program_class=$(basename $program_file .java)
        echo -e "${GREEN}--- Anfang der Ausgabe von ${program_class} ---${NC}"
        java -Duser.language=de -cp $BIN_DIR ${PROJECT}.${program_class} 2>&1 | while IFS= read -r line; do
            echo -e "${YELLOW}$line${NC}"
        done
        echo -e "${GREEN}--- Ende der Ausgabe von ${program_class} ---${NC}"
    done

    # Führe die Tests aus und erfasse die Ausgabe
    echo -e "${GREEN}Führe Tests aus...${NC}"
    for test_file in "${TEST_FILES[@]}"; do
        test_class=$(basename $test_file .java)
        echo -e "${GREEN}Teste ${test_class}...${NC}"
        TEST_OUTPUT=$(java -Duser.language=de -cp $BIN_DIR:$JUNIT_JAR:$HAMCREST_JAR org.junit.runner.JUnitCore ${PROJECT}.${test_class} 2>&1)
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Alle Tests für ${test_class} bestanden!${NC}"
        else
            echo -e "${RED}Einige Tests für ${test_class} sind fehlgeschlagen.${NC}"
            echo "$TEST_OUTPUT"
        fi
    done

    # Lösche das bin Verzeichnis
    echo -e "${GREEN}Lösche das bin Verzeichnis...${NC}"
    rm -rf "$BIN_DIR"

    echo -e "${GREEN}Alle Tests abgeschlossen.${NC}"
}

# Funktion zum Bearbeiten der Dateien
edit_files() {
    FILES=($(find "$PROJECT_SRC_DIR" -name "*.java"))
    FILES=("${FILES[@]##*/}") # Entferne den Pfad und behalte nur die Dateinamen

    if [ ${#FILES[@]} -eq 0 ]; then
        echo -e "${RED}Keine Java-Quellcode-Dateien zum Bearbeiten gefunden!${NC}"
        exit 1
    fi

    echo "Wähle eine Datei zum Bearbeiten aus:"
    PS3="Bitte wähle eine Datei: "
    select FILE in "${FILES[@]}"; do
        if [[ -n $FILE ]]; then
            nvim $PROJECT_SRC_DIR/$FILE
            break
        else
            echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
        fi
    done
}

# Aktionen basierend auf der ausgewählten Option ausführen
case $OPTION in
    "Programm testen")
        run_tests
        ;;
    "Programm bearbeiten")
        edit_files
        ;;
    *)
        echo -e "${RED}Ungültige Option. Skript wird beendet.${NC}"
        ;;
esac
