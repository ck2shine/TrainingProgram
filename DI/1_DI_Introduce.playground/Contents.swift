import Foundation

class DBData{
    
    static let shared = DBData()
    
    var data : [String]{
        return ["Mary","John","Tom","David"]
    }
}

class SkillPool{
    
    enum codeKind {
        case weakCode,StrongCode
    }
    
    func getSkill(_ skill : codeKind) ->String{
        switch skill {
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
    
    //Mark: showTheDetail
    func getDetail() -> (String,String){
           
        //decide Name
        self.Name = DBData.shared.data[1]
        
        //decide skill
        let pool = SkillPool()
        self.Skill = pool.getSkill(.StrongCode)
        
        return (self.Name,self.Skill)
    }
    
}

print(Programmer().getDetail())

