#!/bin/bash

make_directory(){
	./gdrive-linux-386 mkdir -p 1xKkevshK7r4Q1cJIaOxP1PAgaED0kaQ5 $1
}

upload(){
	./gdrive-linux-386 upload -r -p 1xKkevshK7r4Q1cJIaOxP1PAgaED0kaQ5 $1
}

download(){
	./gdrive-linux-386 download --recursive $1
}

echo "dodałem jeszcze jakies inne"
echo "dodałem napis jecha"
echo "Witaj w Google Drive"
echo "Co chcesz zrobić ?"
echo ""
var1="1. Pobrać plik"
var2="2. Zapisać plik"
var3="3. Utworzenie folderu"
var4="4. Wyjść"
var5="5. Lista"

lista=$(./gdrive-linux-386 list --query " '1xKkevshK7r4Q1cJIaOxP1PAgaED0kaQ5' in parents")



select wybor in "$var1" "$var2" "$var3" "$var4" "$var5"
do
	case $wybor in
		"$var1") 
			echo "$lista"
			echo "Podaj id folderu do pobrania z katalogu Licencjat"
			read sciezka_download
			download $sciezka_download 
			break
			;;
		"$var2") 
			echo "Możesz tylko uploadować cały folder do katalogu Licencjat. Za kazdym razem utworzy sie nowy folder o tej samej nazwie"
			echo "Podaj sciezke folderu do uploadu" 
			read sciezka_upload
			upload $sciezka_download
			;;
		"$var3")
			 echo "Podaj nazwe folderu"
			 read nazwa_folderu
			 make_directory $nazwa_folderu 
			 break
			 ;;
		"$var4")
			 echo "Do zobaczenia"
			 break
			  ;;
		"$var5")
			echo "$lista"
	esac
done



