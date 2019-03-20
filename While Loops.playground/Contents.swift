import UIKit
//
//var i = 1
//
//while i<=10 {
//    print(i)
//    i+=1
//}
//
//var index = 1
//while index<=20{
//    print(index*7)
//    index+=1
//}
//
//var array = [7, 23, 44, 1, 0, 63]
//
//var ind = 0
//while ind<array.count {
//    array[ind]+=1
//    ind+=1
//}

//print(array)

//var array = [8,4,8,1]
//
//for number in array {
//    print(number)
//}
//
//var names = ["Harsh", "Anshu", "Asanshay", "Rohit"]
//
//for name in names{
//    print("Hi there " + name + "!")
//}
//
//for (index,value) in array.enumerated(){
//    array[index]+=1
//}
//
//print(array)
//
//var challenge = [Double]()
//
//challenge = [8,7,19,28]
//
//for (index,value) in challenge.enumerated(){
//    challenge[index] = value/2
//}
//
//print(challenge)

class Ghost {
    
    var isAlive = true
    var strength = 9
    
    func kill(){
        isAlive = false
    }
    
    func isStrong() -> Bool {
        return strength>10
    }
    
}

var ghost = Ghost()
print(ghost.isAlive)
ghost.kill()
print(ghost.isAlive)

print(ghost.isStrong())

ghost.strength=20

print(ghost.isStrong())
