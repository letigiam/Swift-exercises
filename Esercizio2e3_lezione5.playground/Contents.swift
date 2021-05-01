
/* Esercizio in classe
 es.1
 abbiamo un team che è composto da developers
 Crea una funzione che calcoli la media dell'età:
 delle ragazze o dei soli ragazzi
 La classe è rappresentata da un dizionario,
 dove
 Key: è il nome dell'alunno,
 value: è una tupla con due valori(sesso:String, età:Int)
*/


let classeDict=[
    "Michele" : (Sesso:"M", eta:28),
    "Sabrina" : (Sesso: "F", eta: 29),
    "Ludovica" : (Sesso: "F", eta: 30),
    "Alessio" : (Sesso: "M", eta: 32),
    "Massimo" : (Sesso: "M", eta: 58),
    "Carlo" : (Sesso:"M", eta:26),
    "Martina" : (Sesso: "F", eta: 38),
    "Flavia" : (Sesso: "F", eta: 35),
    "Mirko" : (Sesso: "M", eta: 27),
    "Gaetano" : (Sesso: "M", eta: 29),
]

func mediaDevelopers(classeDict:Dictionary<String,(String,Int)>)->(mediaMan:Double, mediaDonne:Double){
    var countMan: Double = 0
    var averageMan: Double = 0
    var countWom: Double = 0
    var averageWom: Double = 0
//    for (key, value) in classeDict{
//        print("\(key)", "\(value)")
//    }

    for (key, value) in classeDict{
        if (value.0=="M") {
            averageMan =  averageMan + Double(value.1)
            countMan = countMan + 1
            print("Developer Maschio: \(key), value: \(value.1)")
            
        }else if(value.0=="F"){
            averageWom = averageWom + Double(value.1)
            countWom = countWom + 1
            print("Developer Donne: \(key), value: \(value.1)")
        } else {
            return (mediaMan : 0 , mediaDonne : 0)
        }
    }
    return (mediaMan : averageMan/countMan , mediaDonne : averageWom/countWom)
}
print(mediaDevelopers(classeDict:classeDict))

//Esercizio 3

var comuni:[String: [String] ]=[
    "A": ["Arezzo", "Agrigento","Asti", "Acireale","Ancona", "Avellino"],
    "B": ["Bologna", "Bari","Biella", "Bolzano", "Brindisi"],
    "C": ["Catanzaro", "Catania", "Chieti", "Cuneo", "Caltabellotta"],
]

func listaComuni(chiave: String, lista: [String:[String]]) -> [String] {
    let chiave : String = chiave
    let iniziale = String(chiave.first ?? " ")
    let lista : [String:[String]] = lista
    let dove : [String] = lista[iniziale] ?? [" "]
    var risultato : [String] = []
    for comuni in dove {
        if comuni.hasPrefix(chiave) {
            risultato.append(comuni)
        }
    }
    return(risultato.sorted())
}

print(listaComuni(chiave: "Ca", lista: comuni))
