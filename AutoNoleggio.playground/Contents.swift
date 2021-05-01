class Car{
    var code: String
    private var prenotation: Bool
    
    var _prenotation:Bool{
        //get.only
        get{
            return self.prenotation
        }
        set(newValue){
            self.prenotation=newValue
        }
    }
    init(code:String, prenotation:Bool) {
        self.code=code
        self.prenotation=prenotation
    }
}

var garageCar=[
    "car1":(code:"Ab011", prenotation:false),
    "car2":(code:"Ab012", prenotation:false),
    "car3":(code:"Ab013", prenotation:false),
    "car4":(code:"Ab014", prenotation:true),
    "car5":(code:"Ab015", prenotation:true),
]


class Rental{
    var garage:Dictionary<String,(String, Bool)>
    var code: String
    var booking:[String:(String, Bool)] = [:]

    init(code:String, garage:Dictionary<String,(String, Bool)>) {
        self.code=code
        self.garage=garage
    }
    
    func disponibilityCar(){
        for (key, value) in garageCar {
            if(value.1==true){
                print ("le auto occupate sono: \(key), \(value)")
            } else if(value.1==false){
                print ("le auto libere sono: \(key), \(value)")
            }
        }
    }
    
    //funzione conteggio auto disponibili
    func countCar() -> Int{
        var count = 0
        for item in garageCar {
            if(item.value.prenotation == false){
                count+=1
            }
        }
        return count
    }
    
    func rentalCar(car:String, day:Int)->String{
        //prenota per quanti giorni
        var garageEmpity: [String] = [];
        //var car:[String]=[]
        for item in garageCar {
            //print("Auto item: \(item.key)")
            
            if(item.key == car && item.value.prenotation == false){
                garageEmpity.append(item.key)
                garageCar.updateValue((item.key, true), forKey: item.key)
                booking.updateValue(item.value, forKey: item.key)
                return "Auto1: \(car) è stata prenotata, per \(day) giorni"
            }
            else if(item.key == car){
                return "Auto2: \(item.key) è già prenotata, scegli un'altra auto "
            }
        }
        return car
    }
    
}
print("<------ Elenco automobili in garage ------>")
var rental = Rental.init(code: "Ab011", garage: garageCar)
//rental.disponibilityCar()
print("<------ Disponibilità auto ------>")
print("Auto disponibili: \(rental.countCar())")
print (rental.rentalCar(car: "car1", day: 3))
//print(rental.booking)
print (rental.rentalCar(car: "car1", day: 6))

