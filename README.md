# Progetto del laboratorio di Architetture Software e Sicurezza Informatica

### Versione
    0.1.0

### Descrizione del ProgettoDescrizione del Progetto

**Quante volte ci si ritrova in situazioni nelle quali si è indecisi sul da farsi?** Con gli amici, con i colleghi, con la propria fidanzata o fidanzato, moglie o marito, **decidere dove andare o cosa fare può rivelarsi un vero e proprio problema**. Non è raro perdere anche molto tempo per cercare di trovare una soluzione che possa accontentare tutti quanti, senza considerare quanto possa essere difficile e noioso arrivare a tale soluzione.

L’idea dietro questo progetto nasce quindi da **un problema reale della vita di tutti i giorni** e si propone di risolverlo in maniera tale che questi, da problema, diventi un divertimento.

**La nostra applicazione si propone di rendere facile e indolore la risposta alla domanda: “_Che cosa facciamo?_”**.

Più nel dettaglio, a partire dalla posizione dell’utente, la nostra applicazione andrà a indicare una lista di punti di interesse nelle vicinanze. In generale, esistono già molte applicazioni che offrono questa possibiltà, primi tra i quali Google Maps e TripAdvisor; come si differenzia allora la nostra applicazione?

Immaginiamo di usare un qualsiasi motore di ricerca come i già citati Google Maps e TripAdvisor per cercare i punti di interesse nelle nostre vicinanze: sarà presentata una lunga lista che per città come Roma, fitte di punti di interesse, potrà essere composta anche da decine e decine di risultati. Si ripresenta allora il problema iniziale, poiché l’utente dovrà visionare una a una tutte le possibili opzioni, generando confusione e portando un’inutile perdita di tempo…

La nostra applicazione, invece di presentare immediatamente tutti i possibili punti di interesse all’utente, **selezionerà in modo intelligente dalla lista i risultati in base alle preferenze dell'utente**. La maniera nella quale la nostra applicazione filtrerà i risultati dalla lista iniziale non farà altro che ricalcare il procedimento naturale, ma spesso confusionario e disorganizzato, che solitamente una persona segue per compiere una scelta, ovvero porsi delle semplici domande.

Immaginiamo questa volta una discussione tra due persone, Alice e Bob:

>_**Alice**:	 “Ti va di andare a mangiare fuori per pranzo?”_    
_**Bob**: 	“Certo! L’altra volta siamo andati a un ristorante italiano, vogliamo provare un ristorante giapponese?”_    
_**Alice**:	 “Ora vedo se ci sono ristoranti giapponesi nella mia zona…”_   
_( Alice controlla se su Google Maps ci sono ristoranti giapponesi nella sua zona, ma non ne trova nessuno... )_     
_**Alice**:	 “Purtroppo non ce ne sono… Vogliamo provare un ristorante cinese?”_    
_**Bob**:	 “Va bene!”_  
_( Alice cerca di nuovo su Google ristoranti cinesi nella sua zona )_  
_**Alice**: 	“Ne ho trovati 5. Ti andrebbe bene questo?”_  
_**Bob**: 	“E’ molto lontano?”_ 
_( Alice cerca ancora su Google quanto dista il ristorante )_  
_**Alice**: 	“E’ circa un chilometro a piedi…”_  
_**Bob**: 	“Non ce n’è uno più vicino?”_  
_( Alice cerca per un’altra volta su Google tra gli altri risultati un ristorante cinese più vicino )_  
_**Alice**:	 “Sì, come ti sembra questo?”_  
_**Bob**: 	“Sembra costoso…”_  
_( Alice cerca per l’ennesima volta su Google se ci sono informazioni sul prezzo medio del ristorante )_
_**Alice**: 	“Tra le recensioni, dicono che non costi molto!”_  
_**Bob**: 	“Ok, allora andiamo!”_

In questa situazione, Alice è costretta a fare numerose ricerche nonostante avesse già una lista di risultati ottenuta tramite Google Maps. **Un procedimento lungo e noioso che non sempre porta al miglior risultato**. E se Alice e Bob, una volta visto che non c’erano ristoranti giapponesi nella zona, avessero scoperto che, nascosto tra le decine di ristoranti nella zona, ci fosse stato un ottimo ristorante indiano proprio a due passi? Forse lo avrebbero preferito al ristorante cinese e sarebbero andati a mangiare là.

La nostra applicazione, prima di presentare i risultati all’utente, gli **porrà una serie di domande volte a filtrare i risultati in maniera intelligente**. Infatti, nel caso di Alice e Bob, non chiederà se vogliono andare a un ristorante giapponese, perché non ce ne sono nella loro zona. Ponendo domande sulla distanza e sul prezzo, non presenterà risultati che non interesseranno all’utente e così via. Nel caso di Alice e Bob, conoscendo l’esistenza di un ristorante indiano nelle vicinanze, potrebbe fare una domanda apposita sul tipo di cucina, presentando tra le opzioni “cinese”, “indiano”, “italiano”, e altro, sempre in base all’analisi dei punti di interesse nelle vicinanze.

La nostra applicazione non sarebbe confinata alla ricerca di ristoranti, ma come anticipato sopra, si estenderebbe alla ricerca di generali punti di interesse nelle vicinanze, come musei, parchi, bar, pub, biblioteche, teatri o altro, poi filtrati in base alle risposte dell’utente, rendendola adatta alle più svariate situazioni.


### Tecnologie

Questa applicazione web fa uso delle seguenti tecnologie:

* Ruby
* Rails
* Heroku
* Google Material Design Lite (MDL)