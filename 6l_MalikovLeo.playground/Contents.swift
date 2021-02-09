import Foundation

protocol Car {
    var brand: String { get set }
    var priority: UInt { get set }
}

class SportCar: Car, CustomStringConvertible {
    var brand: String,
        priority: UInt
    
    var maxSpeed: Double
    
    var description: String {
        var tmp = "------------------------------\n"
        tmp += "model = \(self.brand), priority = \(self.priority)\n"
        tmp += "------------------------------"
        return tmp
    }
    
    init(brand: String, priority: UInt, maxSpeed: Double) {
        self.brand = brand
        self.priority = priority
        
        self.maxSpeed = maxSpeed
    }
}

class TrunkCar: Car, CustomStringConvertible {
    var brand: String,
        priority: UInt
    
    var trunkCapacity: Double
    
    var description: String {
        var tmp = "------------------------------\n"
        tmp += "model = \(self.brand), priority = \(self.priority)\n"
        tmp += "------------------------------"
        return tmp
    }
    
    init(brand: String, priority: UInt, trunkCapacity: Double) {
        self.brand = brand
        self.priority = priority
        
        self.trunkCapacity = trunkCapacity
    }
}

struct Queue<T: Car> {
    private var array: [T] = []
    
    mutating func push(_ elem: T) {
        array.append(elem)
    }
    
    mutating func pop() -> T? {
        guard array.count > 0 else {return nil}
        return array.removeFirst()
    }
    
    mutating func sortByPriority() {
        array.sort { $0.priority > $1.priority }
    }
    
//    mutating func printIt() {
//        array.forEach() { print($0) }
//    }
    
    subscript (index: UInt) -> T? {
        guard index >= 0 && index < array.count else { return nil }
        return array[Int(index)]
    }
}

var sportCarsQueue = Queue<SportCar>()

sportCarsQueue.push(SportCar(brand: "Ferrari", priority: 100, maxSpeed: 350))
sportCarsQueue.push(SportCar(brand: "Maseratti", priority: 55, maxSpeed: 390))
sportCarsQueue.push(SportCar(brand: "Bugatti", priority: 70, maxSpeed: 400))

//sportCarsQueue.printIt()

print(sportCarsQueue[0]!)
print(sportCarsQueue[1]!)
print(sportCarsQueue[2]!)
print(sportCarsQueue[3]!)

print("\n")

sportCarsQueue.sortByPriority()

print(sportCarsQueue[0]!)
print(sportCarsQueue[1]!)
print(sportCarsQueue[2]!)

print("\n")

print(sportCarsQueue.pop()!.description)
print(sportCarsQueue.pop()!.description)
print(sportCarsQueue.pop()!.description)
