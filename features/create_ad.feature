# encoding: UTF-8
# language: pl

Właściwość: Dodawanie ogłoszenia
	Jako gośc 
	Chcę dodać ogłoszenie

  @ukończone
  Szablon scenariusza: dodawanie ogłoszenia
    Zakładając że jestem na stronie dodawania ogłoszenia
  	Jeżeli podam tytuł "<tytuł>"
  	Oraz podam treść "<treść>"
  	Oraz podam cenę "<cena>"
  	Oraz podam email "<email>"
  	Oraz podam nazwę "<nazwa>"
  	#Oraz wybiorę kategorię
    Jeżeli kliknę przycisk dodaj ogłoszenie
  	Wtedy powinienem zobaczyć "<info>"

  	Przykłady:
	    | tytuł | treść | cena | email | nazwa | info |
			| nerka | do sprzedania | 7.59 | czesio@gmail.com | czesio | Ogłoszenie przekazane do weryfikacji |
			| | do sprzedania | | | | błędy |  
			| nerka | do sprzedania | 9 | | | błędy |  
      | nerka | do sprzedania | 9,54 | d@f.pl | | Ogłoszenie przekazane do weryfikacji |  
      | nerka | do sprzedania | 9 | d@f.pl | 7,5444 | błędy | 


# cucumber --i18n pl help


