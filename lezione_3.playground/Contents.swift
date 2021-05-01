//esercizio in aula 24-02-2021
var dict=["Carlo": 19, "Martina":29, "Fabrizio": 26]

for (key, value) in dict{
    print("\(key)", "\(value)")
}
//dictionary vuoto
var dictEmpity : [Int : String]
//riempio iol dizionario
dictEmpity=[1:"iphone", 2:"samsung", 3:"huawei" ];
//modifico e aggiungo le chiave:valori del dizionario
dictEmpity.updateValue("xiomi", forKey: 1)
dictEmpity.updateValue("nokia", forKey: 4)
print(dictEmpity)

//output 44
//append aggiunge l'ultimo valore alla fine dell'array
//si
