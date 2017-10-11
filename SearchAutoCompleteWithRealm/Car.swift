import Foundation
import RealmSwift

class Car: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    
    func initCar(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
