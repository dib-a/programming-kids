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

# Funktion zum Kompilieren und Ausführen der Programme und Tests
run_tests() {
    # Erstelle das bin Verzeichnis, falls es nicht existiert
    mkdir -p $BIN_DIR

    # Finde alle Java-Dateien im Projekt- und Testverzeichnis
    PROGRAM_FILES=($(find $PROJECT_SRC_DIR -name "*.java"))
    TEST_FILES=($(find $PROJECT_TEST_DIR -name "*Test.java"))

    if [ ${#PROGRAM_FILES[@]} -eq 0 ]; then
        echo -e "${RED}Keine Java-Quellcode-Dateien im Projektverzeichnis gefunden!${NC}"
        return
    fi

    if [ ${#TEST_FILES[@]} -eq 0 ]; then
        echo -e "${RED}Keine Testdateien im Testverzeichnis gefunden!${NC}"
        return
    fi

    # Kompiliere alle Java Dateien im Projektverzeichnis und erfasse die Ausgabe
    echo -e "${GREEN}Kompiliere Programme...${NC}"
    COMPILATION_OUTPUT=$(javac -J-Duser.language=de -cp $JUNIT_JAR:$HAMCREST_JAR -d $BIN_DIR "${PROGRAM_FILES[@]}" "${TEST_FILES[@]}" 2>&1)
    if [ $? -ne 0 ]; then
        echo -e "${RED}Fehler beim Kompilieren der Java-Dateien!${NC}"
        echo "$COMPILATION_OUTPUT"
        return
    fi
    echo -e "${GREEN}Kompilierung erfolgreich!${NC}"

    # Führe die Programme aus
    echo -e "${GREEN}Führe Programme aus...${NC}"
    for program_file in "${PROGRAM_FILES[@]}"; do
        program_class=$(basename $program_file .java)
        echo -e "${GREEN}Ausgabe von ${PROJECT}.${program_class}:${NC}"
        java -Duser.language=de -cp $BIN_DIR ${PROJECT}.${program_class} 2>&1 | while IFS= read -r line; do
            echo -e "${YELLOW}$line${NC}"
        done
        echo -e "${GREEN}--- Ende der Ausgabe von ${PROJECT}.${program_class} ---${NC}"
    done

    # Führe die Tests aus und erfasse die Ausgabe
    echo -e "${GREEN}Führe Tests aus...${NC}"
    TEST_OUTPUT_FILE=$(mktemp)
    for test_file in "${TEST_FILES[@]}"; do
        test_class=$(basename $test_file .java)
        echo -e "${GREEN}Teste ${PROJECT}...${NC}"
        java -Duser.language=de -cp $BIN_DIR:$JUNIT_JAR:$HAMCREST_JAR org.junit.runner.JUnitCore ${PROJECT}.${test_class} > $TEST_OUTPUT_FILE 2>&1
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Alle Tests für ${PROJECT} bestanden!${NC}"
        else
            echo -e "${RED}Einige Tests für ${PROJECT} sind fehlgeschlagen.${NC}"
            echo "Fehlerausgabe:"
            cat $TEST_OUTPUT_FILE
        fi
    done
    rm -f $TEST_OUTPUT_FILE

    # Lösche das bin Verzeichnis
    rm -rf $BIN_DIR
}

# Funktion zum Bearbeiten der Dateien
edit_files() {
    while true; do
        FILES=($(find $PROJECT_SRC_DIR -name "*.java"))
        FILES=("${FILES[@]##*/}") # Entferne den Pfad und behalte nur die Dateinamen

        if [ ${#FILES[@]} -eq 0 ]; then
            echo -e "${RED}Keine Java-Quellcode-Dateien zum Bearbeiten gefunden!${NC}"
            return
        fi

        echo
        echo -e "${YELLOW}Wähle eine Datei zum Bearbeiten aus:${NC}"
        echo "0) Zurück"
        PS3=$(echo -e "${GREEN}Bitte wähle eine Datei: ${NC}")
        select FILE in "${FILES[@]}"; do
            if [[ $REPLY == 0 ]]; then
                return
            elif [[ -n $FILE ]]; then
                nvim $PROJECT_SRC_DIR/$FILE
                break
            else
                echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
            fi
        done
    done
}

# Hauptmenü Funktion
main_menu() {
    while true; do
        # Liste der verfügbaren Projekte
        PROJECTS=($(ls -d $SRC_DIR/* 2>/dev/null))
        PROJECTS=("${PROJECTS[@]##*/}") # Entferne den Pfad und behalte nur die Verzeichnisnamen

        if [ ${#PROJECTS[@]} -eq 0 ]; then
            echo -e "${RED}Keine Projekte gefunden!${NC}"
            exit 1
        fi

        echo
        echo -e "${YELLOW}Wähle ein Projekt aus:${NC}"
        echo "0) Beenden"
        PS3=$(echo -e "${GREEN}Bitte wähle ein Projekt: ${NC}")
        select PROJECT in "${PROJECTS[@]}"; do
            if [[ $REPLY == 0 ]]; then
                echo -e "${GREEN}Beende das Skript.${NC}"
                exit 0
            elif [[ -n $PROJECT ]]; then
                project_menu
                break
            else
                echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
            fi
        done
    done
}

# Projektmenü Funktion
project_menu() {
    while true; do
        # Verzeichnisse im gewählten Projekt
        PROJECT_SRC_DIR="$SRC_DIR/$PROJECT"
        PROJECT_TEST_DIR="$TEST_DIR/$PROJECT"

        echo
        echo -e "${YELLOW}Was möchtest du tun?${NC}"
        echo "0) Zurück"
        PS3=$(echo -e "${GREEN}Bitte wähle eine Option: ${NC}")
        options=("Programm testen" "Programm bearbeiten")
        select OPTION in "${options[@]}"; do
            if [[ $REPLY == 0 ]]; then
                return
            elif [[ -n $OPTION ]]; then
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
                break
            else
                echo -e "${RED}Ungültige Auswahl. Bitte wähle eine Nummer aus der Liste.${NC}"
            fi
        done
    done
}

# Starte das Hauptmenü
main_menu
