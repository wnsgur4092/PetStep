# PetStep
PetStep is aiming at encouraging unmotivated young adults to go for a walk to support their mental health.

## Timeline
30/01/2023 - 10/02/2023: 2 weeks Design phase 

13/02/2023 - 24/02/2023: 2 weeks Develop phase 

# The Group - Apple Baddies
Shuvam Sherestha, Min Yen (Kevin), Mohamed Ali Bahsoun, Haleema Farooq, Jitian Liang (Bruce)

# Brief Description
Based on our research, there are 25% young adults in Australian are suffering mental problem, and walking (especially with pets) is proven to be one of the best way to support mental health. However, there are many reasons leading people to not have an actual pet.

Therefore, we came up with the idea to use a lovely virtual pet to encourage people to go for a walk. We planned to have a number of walking modes:

* Focused Mode: lock your phone while you are walking (option to enable music)
* Guided Meditation Mode: put your headphone on and follow the guidance to meditation
* Interactive Mode: your pet will interact with you through mini games like I spy

However, the time limit is really tight and all of us do not have any iOS development experience. The current version is shown below.

We are planning to take some time to work on our uni work and swift fundamentals then come back to this project.

# GIF showcase
<img src="PetStepShowCase.gif" width="300" height="648"/>

## Challenge
1. JSON Database
- Most members of Apple Baddies had primarily worked in web development, where JSON is frequently used for data storage and management. This familiarity led the team to prefer JSON as the data format for our app, PetStep. JSON allowed us to store structured data in a lightweight and readable format, which made it easier for the team to transition their existing knowledge to an iOS environment. I guided the team through the process of saving, retrieving, and managing data in JSON format within the app, ensuring that they could implement familiar data management techniques.

- In PetStep, we utilized a Storage class to handle reading from and writing to JSON files. This class provides methods for saving (`store`) and retrieving (`retrieve`) data, offering a straightforward approach to manage user data locally. By specifying a directory (such as Documents or Caches), we control where the files are saved on the device. The following code demonstrates the key functions for working with JSON data:

```Swift
public class Storage {
    
    private init() { }
    
    enum Directory {
        case documents
        case caches
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            case .caches:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
    
    static func store<T: Encodable>(_ obj: T, to directory: Directory, as fileName: String) {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        print("---> save to here: \(url)")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(obj)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch let error {
            print("---> Failed to store msg: \(error.localizedDescription)")
        }
    }

    
    static func retrive<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T? {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(type, from: data)
            return model
        } catch let error {
            print("---> Failed to decode msg: \(error.localizedDescription)")
            return nil
        }
    }
}
```

By using JSON in this way, we ensured that PetStep could manage data in a familiar format while leveraging iOS file management capabilities. This approach allowed the team to maintain a consistent data structure across both web and mobile platforms.
