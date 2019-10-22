

import UIKit

//method injection

class DBData{
    
    //static let shared = DBData()
    
    var data : [String]{
        return ["Mary","John","Tom","David"]
    }
}

class SkillPool{
    
    enum codeKind {
        case weakCode,StrongCode
    }
    
    init(_ kind : codeKind) {
        self.kind = kind
    }
    
    var kind : codeKind
    
    //func getSkill(_ skill : codeKind) ->String{
    func getSkill() ->String{
        switch self.kind {
        case .weakCode:
            return "Swift"
        case .StrongCode:
            return "Objective-C"
        }
    }
}


class Programmer{
   
    var Name : String = ""
    var Skill : String = ""
       
    
    //Mark: showTheDetail the inject object only lives in the local scope
    func getDetail(pool : SkillPool ,dbData : DBData) -> (String,String){
           
        //let pool = SkillPool()
        //self.Skill = pool.getSkill(.StrongCode)
        
        //decide Name
        self.Name = dbData.data[1]
        
        //decide skill
        self.Skill = pool.getSkill()
        
        return (self.Name,self.Skill)
    }
    
}

let result = Programmer().getDetail(pool: SkillPool(.StrongCode), dbData: DBData())

print(result)


