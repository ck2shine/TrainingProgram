import UIKit

//Initializer-based Dependency Injection

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
    var pool : SkillPool
    var dbData : DBData
    var Name : String = ""
    var Skill : String = ""
    
    
    init(pool : SkillPool ,dbData : DBData ) {
        self.pool = pool
        self.dbData = dbData
    }
    
    
    //Mark: showTheDetail
    func getDetail() -> (String,String){
           
        //let pool = SkillPool()
        //self.Skill = pool.getSkill(.StrongCode)
        
        //decide Name
        self.Name = self.dbData.data[1]
        
        //decide skill
        self.Skill = self.pool.getSkill()
        
        return (self.Name,self.Skill)
    }
    
}

let result = Programmer(pool: SkillPool(.StrongCode), dbData: DBData()).getDetail()

print(result)


