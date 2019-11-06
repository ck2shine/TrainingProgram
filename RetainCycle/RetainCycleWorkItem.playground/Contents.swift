
import Foundation

class Iphone11{
    
    func excuteAPP(game : ()->()){
        game()        
    }
    
    deinit {
        print("Iphone11 has released")
    }
}

class Person{
    var myPhone : Iphone11 = Iphone11()
    
    var life : String = "unHappy"
    
    let quere = DispatchQueue(label: "retainCycle")
    
    func playMyPhone(){
        
        let work = DispatchWorkItem {
            self.myPhone.excuteAPP {
                self.life = "very Happy"
                print(self.life)
            }
        }
        quere.async(execute: work)
        
    }
    
    deinit {
        print("Person has released")
    }
}

var person : Person? = Person()
person?.playMyPhone()
person = nil

print(" Code in the End")
