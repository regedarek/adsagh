# encoding: UTF-8
# language: pl

@do_zrobienia
Właściwość: Logowanie
	Jako administrator chcę mieć możliwość weryfikacji ogłoszeń
	Jako gość powinienem mieć zablokowany dostęp do tej części strony

	Scenariusz: brak dostępu dla gościa
		Zakładając że jestem gościem
		Jeżeli odwiedzam stronę logowania
		I źle wypełniam hasło
		Wtedy zostanę przekierowany na stronę główną
    Oraz zobaczę "Dostęp zabroniony"

# cucumber --i18n pl help
