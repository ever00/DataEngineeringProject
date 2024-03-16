#!/bin/bash

# Erstelle das Verzeichnis für die ASCII-Ausgaben, falls es noch nicht existiert
mkdir -p MSD_ASCI

# Definiere den Pfad zum Ordner "MillionSongSubset/A/A/A"
folder_path="MillionSongSubset/A/A/A"

# Durchlaufe alle Dateien im Ordner "MillionSongSubset/A/A/A"
for file in MillionSongSubset/*/*/*/*.h5; do
    # Extrahiere den Dateinamen ohne Pfad und Erweiterung
    filename=$(basename -- "$file")
    filename_without_extension="${filename%.*}"

    # Führe h5dump nur für das Mitglied "songs" aus der Gruppe "/analysis" aus und speichere die Ausgabe im ASCII-Format
    h5dump -o "MillionSongSubset_ASCI_analysis_songs/${filename_without_extension}_songs.asci" -y -w 400 -d /analysis/songs "$file"
done
