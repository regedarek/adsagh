# encoding: UTF-8
# language: pl

@ukończone
Właściwość: Wyświetlanie ogłoszenia
	Jako gośc 
	Chcę zobaczyć ogłoszenie

	Scenariusz: wejdz na ogłoszenie na stronie głównej
    Zakładając że jestem na stronie głównej
    Jeżeli kliknę link ogłoszenia
    Wtedy zobaczę tytuł, treść oraz email ogłoszeniodawcy
    Oraz zobaczę ukryty numer telefonu
    Oraz zobaczę link "inne ogłoszenia tego ogłoszeniodawcy"
    # Oraz zobaczę 3 zdjęcia
    # Oraz zobaczę drzewko kategorii
    # Oraz podobne ogłoszenia
    Oraz licznik obejrzeń ogłoszenia zwiększy się o jeden

    # cucumber --i18n pl help
