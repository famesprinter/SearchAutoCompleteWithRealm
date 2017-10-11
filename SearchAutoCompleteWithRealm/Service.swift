import Foundation
import RealmSwift

struct Service: ServiceType {
    let realm = try! Realm()
    
    func createNewCar(car: Car) {
        try! realm.write {
            realm.add(car)
        }
    }
}
