
var coseDaComprare:[String:[String]]=[
    "Snack":[
        "patatine",
        "gelati",
        "cracker",
        "snacks"
    ],
    "Primi":[
        "salsa",
        "pasta",
        "tonno",
        "pancetta",
        "uova"
    ],
    "Secondi":[
        "pollo",
        "lattuga",
        "carne",
        "pomodori",
        "piadine"]
]

var comprati:[String:[String]] = [:]

func compraProdotto (lista:[String:[String]]?, prodotto:String?) -> String{
    guard let prodotto = prodotto?.lowercased(), let lista = lista else{return "valori non inseriti"}
    if (lista.isEmpty){return "lista vuota"}
    var carrello:[String]=[]
    for (key, value) in coseDaComprare {
        let arrayDiProdotti = value
        for item in arrayDiProdotti{
            if item == prodotto {
                carrello.append(item)
                // print ("\(String(describing: prodotto)) è stato spostato in acquistati.")
                comprati.updateValue(carrello, forKey: key)
                return "\(prodotto) aggiunto nel carrello della lista comprati"
            }
        }
        
    }
    return "prodotto non trovato"
}

func rimuoviAcquisto (prodotto:String, categoria:String)->String{
    // Controlla che prodotto e categoria esistano -> fatto
    if !coseDaComprare.keys.contains(categoria){
        return "\(categoria) la Categoria non esiste in coseDaComprare"
    }
    if (coseDaComprare[categoria]?.contains(prodotto))! {
        let index: Int = (coseDaComprare[categoria]?.firstIndex(of: prodotto))!
        coseDaComprare[categoria]!.remove(at: index)
        return "\(prodotto) è stato rimosso dalla categoria \(categoria) in coseDaComprare."
    } else {
        return "\(prodotto) il prodotto non è presente in coseDaComprare"
    }
}
//print("Prima coseDaComprare: \(coseDaComprare)")

print(compraProdotto(lista: coseDaComprare, prodotto: "salsa"))
print(compraProdotto(lista: coseDaComprare, prodotto: "patatine"))
print(rimuoviAcquisto(prodotto: "salsa", categoria: "Primi"))
print(rimuoviAcquisto(prodotto: "patatine", categoria: "Snackes"))

print("comprati: \(comprati)")
//print("Dopo coseDaComprare: \(coseDaComprare)")



