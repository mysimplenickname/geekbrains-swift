import Foundation

enum CarActions: String
{
    case engineStart = "Engine started.",
         engineStop = "Engine stopped.",
         windowsOpen = "Windows opened.",
         windowsClose = "Windows closed",
         trunkLoad = "Trunk loaded",
         trunkUnload = "Trunk unloaded",
         increaseSpeed = "Speed was increased",
         decreaseSpeed = "Speed was decreased"
}

class Car
{
    let model : String,
        year : Int
    
    var engineState : Bool,
        windowsState : Bool
    
    init(model : String, year : Int)
    {
        self.model = model
        self.year = year
        
        self.engineState = false
        self.windowsState = false
    }
    
    func changeState() { }
    
    func printCarState()
    {
        print("---------------")
        print("model = \(model), year = \(year)")
        print("engine state = \(engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)")
        print("engine state = \(windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)")
        print("---------------")
    }
}

class trunkCar: Car
{
    var trunkState: Bool,
        trunkCapacity: Double,
        trunkValue: Double
    
    init(model: String, year: Int, capacity: Double)
    {
        self.trunkState = false
        self.trunkCapacity = capacity
        self.trunkValue = 0.0
        
        super.init(model: model, year: year)
    }
    
    func changeState(_ action: CarActions, _ value: Double = 0.0)
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
            default:
                print("Trunk car does't have this action.")
        }
    }
    
    override func printCarState()
    {
        print("---------------")
        print("model = \(model), year = \(year)")
        print("engine state = \(engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)")
        print("engine state = \(windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)")
        print("trunk state = \(trunkValue)/\(trunkCapacity)")
        print("---------------")
    }
}

class sportCar: Car
{
    var speedState: Bool,
        maxSpeed: Double,
        actualSpeed: Double
    
    init(model: String, year: Int, maxSpeed: Double)
    {
        self.speedState = false
        self.maxSpeed = maxSpeed
        self.actualSpeed = 0.0
        
        super.init(model: model, year: year)
    }
    
    func changeState(_ action: CarActions, _ value: Double = 0.0)
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
            case .increaseSpeed:
                speedState = true
                print(CarActions.increaseSpeed.rawValue)
                actualSpeed = (actualSpeed + value > maxSpeed ? maxSpeed : actualSpeed + value)
            case .decreaseSpeed:
                speedState = false
                print(CarActions.decreaseSpeed.rawValue)
                actualSpeed = (actualSpeed - value < 0 ? 0 : actualSpeed - value)
            default:
                print("Sport car does't have this action.")
        }
    }
    
    override func printCarState()
    {
        print("---------------")
        print("model = \(model), year = \(year)")
        print("engine state = \(engineState ? CarActions.engineStart.rawValue : CarActions.engineStop.rawValue)")
        print("engine state = \(windowsState ? CarActions.windowsOpen.rawValue : CarActions.windowsClose.rawValue)")
        print("speed state = \(actualSpeed)/\(maxSpeed)")
        print("---------------")
    }
}

var car1: trunkCar = trunkCar(model: "Man", year: 2002, capacity: 3500.0)

car1.printCarState()

car1.changeState(CarActions.windowsOpen)
car1.printCarState()

car1.changeState(CarActions.engineStart)
car1.printCarState()

car1.changeState(CarActions.trunkLoad, 400)
car1.printCarState()

car1.changeState(CarActions.trunkUnload, 550)
car1.printCarState()

print("\n")

var car2: sportCar = sportCar(model: "Tesla", year: 2017, maxSpeed: 200.0)

car2.printCarState()

car2.changeState(CarActions.engineStart)
car2.printCarState()

car2.changeState(CarActions.windowsClose)
car2.printCarState()

car2.changeState(CarActions.engineStop)
car2.printCarState()

car2.changeState(CarActions.trunkLoad, 150)
car2.printCarState()

car2.changeState(CarActions.increaseSpeed, 300)
car2.printCarState()
