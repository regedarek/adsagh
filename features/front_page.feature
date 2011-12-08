# encoding: UTF-8
# language: pl

@ukończone
Właściwość: Wyświetlanie strony głównej
	Jako gośc 
	Chcę zobaczyć na stronie listę ogłoszeń

	Scenariusz: brak ogłoszeń
		Zakładając brak ogłoszeń w bazie danych
    Jeżeli wejdę na stronę główną
    Wtedy zobaczę brak ogłoszeń w bazie
		Oraz chcę zobaczyć przycisk "Dodaj ogłoszenie"

	Scenariusz: kilka ogłoszeń
		Zakładając istnienie ogłoszeń w bazie danych
		Jeżeli wejdę na stronę główną
		Wtedy zobaczę listę ogłoszeń
    Oraz chcę zobaczyć przycisk "Dodaj ogłoszenie"


# cucumber --i18n pl help
