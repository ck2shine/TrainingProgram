import Foundation

var str = "Hello, playground"

class Iphone11{
    var owner : Person?
    
    deinit {
        print("Iphone11 has released")
    }
}

class Person{
    var myPhone : Iphone11?
    
    deinit {
        print("Person has released")
    }
}

var person : Person? = Person()
var myPhone : Iphone11? = Iphone11()
person?.myPhone = myPhone
myPhone?.owner = person
person = nil
myPhone = nil
print(" Code in the End")
