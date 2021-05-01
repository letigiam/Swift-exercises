class Room{
    var typeOfRoom: String
    var booking: Bool
    var nameRoom: String
    var price: Int
    
    init(typeOfRoom: String, booking: Bool, nameRoom: String, price: Int) {
        self.typeOfRoom = typeOfRoom
        self.booking = booking
        self.nameRoom = nameRoom
        self.price = price
    }
    
}


class SingleRoom: Room{
    var kitchen: Bool
    init(nameRoom: String, kitchen: Bool, typeOfRoom: String, booking: Bool, price: Int) {
        self.kitchen = kitchen
        super.init(typeOfRoom: typeOfRoom, booking: booking, nameRoom: nameRoom, price: price)
    }
}


class DoubleRoom: Room{
    var bed: Int
    init(nameRoom: String, bed: Int, typeOfRoom: String, booking: Bool, price: Int) {
        self.bed = bed
        super.init(typeOfRoom: typeOfRoom, booking: booking, nameRoom: nameRoom, price: price)
    }
}


class Hotel {
    var rooms: [Room]
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    
    func disponibilityRoom() -> Int {
        var roomCount = 0
        for item in rooms{
            if item.booking == false{
                roomCount+=1
                if let itemSingleRoom = item as? SingleRoom{
                    print("Type of room: \(itemSingleRoom.typeOfRoom), room's name: \(itemSingleRoom.nameRoom), kitchen: \(itemSingleRoom.kitchen), booking: \(itemSingleRoom.booking), Price for night: \(itemSingleRoom.price)")
                } else if let itemDoubleRoom = (item as? DoubleRoom){
                    print("Type of room: \(itemDoubleRoom.typeOfRoom), room's name: \(itemDoubleRoom.nameRoom), bed's number \(itemDoubleRoom.bed), booking: \(itemDoubleRoom.booking), Price for night: \(itemDoubleRoom.price)")
                }
            }
        }
        return roomCount
    }
    
    
    func bookingSingle(typeOfRoom: String?, room: [Room], kitchen: Bool, day: Int) -> String {
        
        guard let typeOfRoom = typeOfRoom?.lowercased() else {
            return "valori non validi"
        }
        var choiseRoom:[String] = []
        
        for item in allSingleRooms{
            if item.typeOfRoom == "single" && item.booking == false && item.kitchen == kitchen {
                let result = item.price*day
                item.booking=true
                choiseRoom.append(item.typeOfRoom)
                return "Ok, the \(typeOfRoom) room: \(item.nameRoom) is booking! Price: €\(result)"
            }
        }
        return "Sorry! The room is not avaiable"
    }
    
    
    func bookingDouble(typeOfRoom: String?, room: [Room], bed: Int, day: Int) -> String {
        
        guard let typeOfRoom = typeOfRoom?.lowercased() else {return "valori non validi"}
        var choiseRoom: [String] = []
        
        for item in allDoubleRooms{
            if item.typeOfRoom == "double" && item.booking == false && item.bed == bed{
                let result = item.price*day
                item.booking=true
                choiseRoom.append(item.typeOfRoom)
                return "Ok, the \(typeOfRoom) room: \(item.nameRoom) is booking! Price: €\(result)"
            }
        }
        return "Sorry! The room is not avaiable"
    }
}


var allSingleRooms=[
    SingleRoom.init(nameRoom: "S01", kitchen: false, typeOfRoom: "single", booking: true, price: 30),
    SingleRoom.init(nameRoom: "S02", kitchen: false, typeOfRoom: "single", booking: false, price: 30),
    SingleRoom.init(nameRoom: "S03", kitchen: true, typeOfRoom: "single", booking: false, price: 45),
]

var allDoubleRooms=[
    DoubleRoom.init(nameRoom: "D01", bed: 3, typeOfRoom: "double", booking: false, price: 65),
    DoubleRoom.init(nameRoom: "D02",bed: 2, typeOfRoom: "double", booking: false, price: 50),
    DoubleRoom.init(nameRoom: "D03",bed: 3, typeOfRoom: "double", booking: true, price: 65),
]


var ospite = Hotel.init(rooms: allSingleRooms)
var ospite1 = Hotel.init(rooms: allDoubleRooms)
print("------------------ Disponibility --------------- ")
print("There are: \(ospite.disponibilityRoom()) room/s single, and \(ospite1.disponibilityRoom()) room/s double")
print("--------------------- Booking --------------- ")
print("\(ospite.bookingSingle(typeOfRoom: "SINGLE", room: allSingleRooms , kitchen: false, day: 3))")
print("\(ospite.bookingDouble(typeOfRoom: "double", room: allDoubleRooms, bed: 2, day: 6))")

