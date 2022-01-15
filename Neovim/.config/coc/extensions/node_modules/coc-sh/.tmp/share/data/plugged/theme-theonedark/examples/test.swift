import Foundation

class Friend : Comparable {
    let name : String
    let age : Int
    
    init(name : String, age: Int) {
        self.name = name
        self.age = age
    }
}
func < (lhs: Friend, rhs: Friend) -> Bool {
    return lhs.age < rhs.age }; func > (lhs: Friend, rhs: Friend) -> Bool {
    return lhs.age > rhs.age
}
func == (lhs: Friend, rhs: Friend) -> Bool {
    var returnValue = false
    if (lhs.name == rhs.name) && (lhs.age == rhs.age)
    {
        returnValue = true
    }
    return returnValue
}
////////////////////////////////////////////////////////////////////////////////
// ^ Screenshot (23 lines)


// MARK: - test



// Declare a function that can take variadic parameters
func printOutFriendNames(names: String...)  {
  
    for name in names {
 
        print(name)
        
        var c = "f"
    }
 
}
// Call the printOutFriendNames with two parameters
printOutFriendNames("Sergey", "Bill")
// Call the function with more parameters
printOutFriendNames("Sergey", "Bill", "Max")
