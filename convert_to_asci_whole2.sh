# Erstelle das Verzeichnis für die ASCII-Ausgaben, falls es noch nicht existiert
mkdir -p MSD_ASCI_A_A

# Durchlaufe alle Dateien im Ordner "MillionSongSubset"
for folder_path in MillionSongSubset/A/A/*; do
    # Durchlaufe alle Dateien im aktuellen Unterordner
    for file in "$folder_path"/*.h5; do
        # Extrahiere den Dateinamen ohne Pfad und Erweiterung
        filename=$(basename -- "$file")
        filename_without_extension="${filename%.*}"

        # Führe h5dump für jede Datei aus und speichere die Ausgabe im ASCII-Format
        h5dump -o "MSD_ASCI/${filename_without_extension}.asci" -y -w 400 -d /analysis/songs "$file"
    done
done

