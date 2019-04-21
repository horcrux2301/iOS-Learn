import UIKit

var str = "Hello"

var newString = str + " Harsh!"

for character in newString{
    print(character)
}

let newTypeString = NSString(string: newString)

newTypeString.substring(to: 5)

NSString(string: newTypeString.substring(from: 6)).substring(to: 5)

newTypeString.substring(with: NSRange(location: 6, length: 5))

if newString.contains("Harsh"){
    print("New type string contains Harsh")
}

newString.components(separatedBy: " ")

newString.uppercased()
newString.lowercased()


let myString = NSString(string: "This is a string")
myString.substring(from: 0)
myString.substring(to:2)
