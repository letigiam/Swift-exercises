//classe padre
class Frutta{
    //dichiaro le proprietà della frutta
    var nameFruit: String
    var weight: Double
    var price: Double
    var cod: Int
    
    //inizializzo le proprietà della frutta nel costruttore
    init(nameFruit: String, weight: Double, price: Double, cod: Int) {
        self.nameFruit=nameFruit
        self.weight=weight
        self.price=price
        self.cod=cod
    }
}
//classe figlio
class Mele:Frutta{
    var color:String
    init(nameFruit: String, weight: Double, price: Double, cod: Int, color: String) {
        self.color=color
        super.init(nameFruit: nameFruit, weight: weight, price: price, cod: cod)
    }
}
class Pere:Frutta{}
class Banane:Frutta{}

//TypeCasting
var arrayAllFruits = [
    Banane.init(nameFruit: "Cichita", weight: 0.80, price: 0.75, cod: 10),
    Banane.init(nameFruit: "Oreo", weight: 0.56, price: 1.20, cod: 11),
    Pere.init(nameFruit: "Pera Bionda", weight: 0.89, price: 0.90, cod: 12),
    Mele.init(nameFruit: "Imperatore", weight: 0.85, price: 0.50, cod: 13, color:"Yellow"),
    Mele.init(nameFruit: "Gold", weight: 0.90, price: 1.00, cod: 14, color:"Red")
]

class Fruttivendolo{
    var fruits:[Frutta]
    
    init(fruits:[Frutta]) {
        self.fruits=fruits
    }
    
    //Down casting opzionale as?
    func getMagazineItem() {
        for item in fruits{
            if let itemMele = item as? Mele{
                print("Mela nome: \(itemMele.nameFruit)")
            }else if let itemPere = item as? Pere{
                print("Pena nome: \(itemPere.nameFruit)")
            }else if let itemBanana = item as? Banane{
                print("Banana nome: \(itemBanana.nameFruit)")
            }
        }
    }
    
    func countFruit() {
        var meleCount=0;
        var pereCount=0;
        var bananeCount=0;
        
        for item in arrayAllFruits{
            if item is Mele{ //is: verifica se un oggetto appartiene o no ad una classe.
                meleCount+=1
            }
            else if item is Pere{
                pereCount+=1
            } else if item is Banane{
                bananeCount+=1
            }
        }
        print("Ci sono \(meleCount) mele, \(pereCount) pera e \(bananeCount) banane" )
    }
    func sumFruit(fruits: [Frutta])->Double{
        var allPrice=0.0
        for item in fruits{
            allPrice += item.price
        }
        return allPrice
    }
    
    func totalPrice()->Double{
        return sumFruit(fruits: fruits)
    }
    
    /*Vendere un frutto. Dato il codice identificativo del frutto, lo deve
     cercare all’interno dell’array ed eliminare*/
    func sellFruit(id: Int) -> Int? {
        var carrelo:[Int]=[]
        var check = false
        for item in fruits{
            if item.cod==id {
                carrelo.append(item.cod)
                print("il frutto venduto è il \(carrelo)")
                check = true
                return id
            }
        }
        if (!check){
            print("l'id del frutto non esiste")
        }
        return nil
    }
}

var fruit=Frutta.init(nameFruit: "Gold", weight: 0.55, price: 1.34, cod: 102)
print("nome: \(fruit.nameFruit), peso: \(fruit.weight), prezzo: \(fruit.price), codice: \(fruit.cod)")
var frutti = Fruttivendolo.init(fruits: arrayAllFruits)
var mele = Mele.init(nameFruit: "Imperatore", weight: 0.35, price: 1.20, cod: 0121, color: "Red")
print("nome: \(mele.nameFruit), peso: \(mele.weight), prezzo: \(mele.price), codice: \(mele.cod), color: \(mele.color)")
frutti.getMagazineItem()
frutti.countFruit()
print("il totale della mia frutta è di €\(frutti.totalPrice())")
//var idOfBuyedFruit = frutti.sellFruit(id: 130)
//print ("idOfBuyedFruit = \(String(describing: idOfBuyedFruit))")
frutti.sellFruit(id: 130)


