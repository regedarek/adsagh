# encoding: UTF-8
# language: pl

@w_toku
Właściwość: Edytowanie i usuwanie swojego ogłoszenia
	Jako ogłoszeniodawca
	Chcę edytować i usuwać swoje ogłoszenia

	Scenariusz: edytuj ogłoszenie - usuń
		Zakładając że wszedłem na stronę z linku z emaila
    Jeżeli token z linku jest taki sam jak token ogłoszenia
    Wtedy powinienem zobaczyć stronę edycji ogłoszenia
    Oraz nie powinienem zobaczyć pola edycji email
    Oraz zobaczyć przycisk "usuń ogłoszenie"
    Oraz zobaczyć przycisk "przedłuż ogłoszenie"
    Oraz zobaczyć link "Powrót do ogłoszenia"
		Oraz chcę zobaczyć przycisk "Zapisz ogłoszenie"

	Scenariusz: edytuj ogłoszenie - edycja
		Zakładając że jestem na stronie edycji
		Jeżeli token się zgadza
		Oraz edytuje pole tytuł
		Oraz edytuje pole treść
		Oraz edytuje cenę
		I kliknę przycisk "Zapisz ogłoszenie"
		Wtedy powienienm przejsć na stronę ogłoszenia
		Oraz zobaczyć informację "Ogłoszenie poprawione i przekazane do weryfikacji"
