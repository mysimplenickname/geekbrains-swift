import Foundation

enum CarType
{
    case sportCar, trunkCar
}

enum CarActions: String
{
    case engineStart = "Engine started.",
         engineStop = "Engine stopped.",
         windowsOpen = "Windows opened.",
         windowsClose = "Windows closed",
         trunkLoad = "Trunk loaded",
         trunkUnload = "Trunk unloaded"
}

struct Car
{
    let type : CarType,
        model : String,
        year : Int,
        trunkCapacity: Double
    
    var engineState : Bool,
        windowsState : Bool,
        trunkState : Bool,
        trunkValue : Double
    
    init(type : CarType,
         model : String,
         year : Int,
         capacity : Double)
    {
        self.type = type
        self.model = model
        self.year = year
        self.trunkCapacity = capacity
        
        self.engineState = false
        self.windowsState = false
        self.trunkState = false
        
        self.trunkValue = 0.0
    }
    
    mutating func changeState(_ action: CarActions, _ value: Double = 0.0)
    {
        switch action
        {
            case .engineStart:
                engineState = true
                print(CarActions.engineStart.rawValue)
            case .engineStop:
                engineState = false
                print(CarActions.engineStop.rawValue)
            case .windowsOpen:
                windowsState = true
                print(CarActions.windowsOpen.rawValue)
            case .windowsClose:
                windowsState = false
                print(CarActions.windowsClose.rawValue)
            case .trunkLoad:
                trunkState = true
                print(CarActions.trunkLoad.rawValue)
                trunkValue = (trunkValue + value > trunkCapacity ? trunkCapacity : trunkValue + value)
            case .trunkUnload:
                trunkState = false
                print(CarActions.trunkUnload.rawValue)
                trunkValue = (trunkValue - value < 0 ? 0.0 : trunkValue - value)
        }
    }
    
    func printCarState()
    {
        print("---------------")
        print("type = \(type), model = \(model), year = \(year)")
        print("engine state = \(engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)")
        print("engine state = \(windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)")
        print("trunk state = \(trunkValue)/\(trunkCapacity)")
        print("---------------")
    }
}

var car1 = Car(type: CarType.sportCar, model: "Tesla", year: 2017, capacity: 200)

car1.printCarState()

car1.changeState(CarActions.engineStart)
car1.printCarState()

car1.changeState(CarActions.windowsClose)
car1.printCarState()

car1.changeState(CarActions.engineStop)
car1.printCarState()

car1.changeState(CarActions.trunkLoad, 150)
car1.printCarState()

print("\n")


var car2 = Car(type: CarType.trunkCar, model: "Man", year: 2002, capacity: 3500)

car2.printCarState()

car2.changeState(CarActions.windowsOpen)
car2.printCarState()

car2.changeState(CarActions.engineStart)
car2.printCarState()

car2.changeState(CarActions.trunkLoad, 400)
car2.printCarState()

car2.changeState(CarActions.trunkUnload, 550)
car2.printCarState()
