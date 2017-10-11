import Foundation
import RealmSwift

struct Service: ServiceType {
    init() {
        do {
            let realm = try Realm()
            if realm.objects(Car.self).count == 0 {
                try realm.write {
                    realm.add(createNewCar(id: "1", name: "BMW"))
                    realm.add(createNewCar(id: "2", name: "Audi"))
                    realm.add(createNewCar(id: "3", name: "Bentley"))
                    realm.add(createNewCar(id: "4", name: "Chevrolet"))
                    realm.add(createNewCar(id: "5", name: "Ferrari"))
                    realm.add(createNewCar(id: "6", name: "Jaguar"))
                    realm.add(createNewCar(id: "7", name: "Hyundai"))
                    realm.add(createNewCar(id: "8", name: "Lamborghini"))
                    realm.add(createNewCar(id: "9", name: "Mercedes - Benz"))
                    realm.add(createNewCar(id: "10", name: "Suzuki"))
                    realm.add(createNewCar(id: "11", name: "TOYOTA"))
                }
            } else {
                print("Cars is aleady.")
                print(realm.objects(Car.self))
            }
        } catch _ {}
    }
    
    // Function
    func searchCars(char: String) {
        do {
            let realm = try Realm()
            let result = realm.objects(Car.self).filter("name contains[c] '\(char)'")
            print(result)
        } catch _ {}
    }
    
    // Private Function
    fileprivate func createNewCar(id: String, name: String) -> Car {
        let car = Car()
        car.id = id
        car.name = name
        
        return car
    }
}
