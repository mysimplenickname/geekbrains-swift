import Foundation

enum CarActions: String
{
    case engineStart = "Engine started",
         engineStop = "Engine stopped",
         windowsOpen = "Windows opened",
         windowsClose = "Windows closed",
         trunkLoad = "Trunk loaded",
         trunkUnload = "Trunk unloaded",
         speedIncrease = "Speed was increased",
         speedDecrease = "Speed was decreased"
}

protocol Car {
    var model: String { get }
    var year: UInt { get }
    var engineState: Bool { get set }
    var windowsState: Bool { get set }
    
    func changeState(_ action: CarActions, _ value: Double)
}

extension Car {
    func startEngine() -> Bool {
        print(CarActions.engineStart.rawValue)
        return true
    }
    
    func stopEngine() -> Bool {
        print(CarActions.engineStop.rawValue)
        return false
    }
    
    func openWindows() -> Bool {
        print(CarActions.windowsOpen.rawValue)
        return true
    }
    
    func closeWindows() -> Bool {
        print(CarActions.windowsClose.rawValue)
        return false
    }
}

class Counter {
    static var counter: UInt = 0
    init() {
        Counter.counter += 1
    }
    deinit {
        Counter.counter -= 1
    }
}

class trunkCar: Counter, Car {
    var model: String,
        year: UInt
    
    var engineState: Bool,
        windowsState: Bool
    
    var trunkState: Bool,
        trunkCapacity: Double,
        trunkValue: Double
    
    func loadTrunk(_ value: Double) -> Bool {
        print(CarActions.trunkLoad.rawValue)
        self.trunkValue = (self.trunkValue + value > self.trunkCapacity ? self.trunkCapacity : self.trunkValue + value)
        return true
    }
    
    func unloadTrunk(_ value: Double) -> Bool {
        print(CarActions.trunkUnload.rawValue)
        self.trunkValue = (self.trunkValue - value < 0 ? 0.0 : self.trunkValue - value)
        return false
    }
    
    func changeState(_ action: CarActions, _ value: Double = 0.0) {
        switch action {
        case .engineStart:
            self.engineState = startEngine()
        case .engineStop:
            self.engineState = stopEngine()
        case .windowsOpen:
            self.windowsState = openWindows()
        case .windowsClose:
            self.windowsState = closeWindows()
        case .trunkLoad:
            self.trunkState = loadTrunk(value)
        case .trunkUnload:
            self.trunkState = unloadTrunk(value)
        default:
            print("Trunk car does not have this action.")
        }
    }
    
    init(model: String, year: UInt, capacity: Double) {
        self.model = model
        self.year = year
        
        self.engineState = false
        self.windowsState = false
        
        self.trunkState = false
        self.trunkCapacity = capacity
        self.trunkValue = 0.0
        
        super.init()
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        var tmp = "---------------\n"
        tmp += "model = \(self.model), year = \(self.year)\n"
        tmp += "engine state = \(self.engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)\n"
        tmp += "windows state = \(self.windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)\n"
        tmp += "trunk state = \(self.trunkValue)/\(self.trunkCapacity)\n"
        tmp += "---------------"
        return tmp
    }
}

class sportCar: Counter, Car {
    var model: String,
        year: UInt
    
    var engineState: Bool,
        windowsState: Bool
    
    var speedState: Bool,
        maxSpeed: Double,
        actualSpeed: Double
    
    func increaseSpeed(_ value: Double) -> Bool {
        print(CarActions.speedIncrease.rawValue)
        self.actualSpeed = (self.actualSpeed + value > self.maxSpeed ? self.maxSpeed : self.actualSpeed + value)
        return true
    }
    
    func decreaseSpeed(_ value: Double) -> Bool {
        print(CarActions.speedDecrease.rawValue)
        self.actualSpeed = (self.actualSpeed - value < 0 ? 0 : self.actualSpeed - value)
        return false
    }
    
    func changeState(_ action: CarActions, _ value: Double = 0.0) {
        switch action {
        case .engineStart:
            self.engineState = startEngine()
        case .engineStop:
            self.engineState = stopEngine()
        case .windowsOpen:
            self.windowsState = openWindows()
        case .windowsClose:
            self.windowsState = closeWindows()
        case .speedIncrease:
            self.speedState = increaseSpeed(value)
        case .trunkUnload:
            self.speedState = decreaseSpeed(value)
        default:
            print("Sport car does not have this action.")
        }
    }
    
    init(model: String, year: UInt, speed: Double) {
        self.model = model
        self.year = year
        
        self.engineState = false
        self.windowsState = false
        
        self.speedState = false
        self.maxSpeed = speed
        self.actualSpeed = 0.0
        
        super.init()
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        var tmp = "---------------\n"
        tmp += "model = \(self.model), year = \(self.year)\n"
        tmp += "engine state = \(self.engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)\n"
        tmp += "windows state = \(self.windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)\n"
        tmp += "speed state = \(self.actualSpeed) km/h\n"
        tmp += "---------------"
        return tmp
    }
}


var car1: trunkCar = trunkCar(model: "Man", year: 2002, capacity: 3500)
print(car1)

car1.changeState(CarActions.windowsOpen)
print(car1)

car1.changeState(CarActions.engineStart)
print(car1)

car1.changeState(CarActions.trunkLoad, 400)
print(car1)

car1.changeState(CarActions.trunkUnload, 550)
print(car1)

print("\n")

var car2: sportCar = sportCar(model: "Tesla", year: 2017, speed: 200)
print(car2)

car2.changeState(CarActions.engineStart)
print(car2)

car2.changeState(CarActions.windowsClose)
print(car2)

car2.changeState(CarActions.engineStop)
print(car2)

car2.changeState(CarActions.trunkLoad, 150)
print(car2)

car2.changeState(CarActions.speedIncrease, 300)
print(car2)
