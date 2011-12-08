# encoding: UTF-8
# language: pl

@do_zrobienia
Właściwość: Administracja tablicą
	Jako administrator chcę mieć możliwość weryfikacji ogłoszeń
	Jako gość powinienem mieć zablokowany dostęp do tej strony

	Scenariusz: brak dostępu dla gościa
		Zakładając że jestem gościem
    Jeżeli odwiedzam stronę administracji
    Wtedy zobaczę "Dostęp zabroniony"
		Oraz zostanę przekierowany na stronę główną

	Scenariusz: administrator
		Zakładając że jestem zalogowany
    Jeżeli odwiedzam stronę administracji
		Wtedy zobaczę ostatnich ogłoszeń
		Oraz zobaczę listę ogłoszeń do weryfikacji



# cucumber --i18n pl help
