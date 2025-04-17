// Define a class named 'iOS'
class iOS{
    // declare a property of type String to store the OS version
    var version: String
    
    // define an initializer (constructor)
    init(version: String){
        self.version = version
    }
    
    // define a 'convenience initializer' (an alternate way to initialize)
    convenience init(){
        self.init(version: "8.0.0")
    }
}

var os = iOS()
print("OS Version: " + os.version)

class Driver{
    weak var car: Car?
    // we use a weak variable to allow this variable to be nil. We are telling the computer "We dont want it!!". delete one reference object without the other one deleted as well.
    
    deinit{
        print("Driver deinitialized")
    }
}

class Car{
    // Strong reference to driver
    weak var driver: Driver?
    
    deinit{
        print("Car deinitialized")
    }
}
var driver: Driver?
var car: Car?

driver = Driver()
car = Car()
driver!.car = car
car!.driver = driver

driver = nil
car = nil


class Artist{
    var instrument: Instrument? // Strong reference to instrument

}

class Instrument{
    unowned let artist: Artist
    init(artist: Artist){
        self.artist = artist
    }
}

var artist: Artist?
artist = Artist()
artist!.instrument = Instrument(artist: artist!)

artist = nil


//-------------------

// Access control in swift is package-based
//private: can only be accessed from the same source file
// internal: can be accessed anywhere in the target its defined
// public: accessible anywhere in the target and anywhere its module is imported
// defaults to internal if not explicitly declared