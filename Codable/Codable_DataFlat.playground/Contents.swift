import UIKit


struct Person_Model : Codable{
    var name : String?
    var number : String?
}


class APIResponse<T : Codable> : Codable{
    var rtnMsg : String = "error"
    var rtnCode : Int = -999
    var rtnTitleString : String?
    var data : T?
    var datas : [T]?


    class func request(jsonString : String){
        let decoder = JSONDecoder()
        let data = try! decoder.decode(APIResponse.self, from: jsonString.data(using: .utf8)!)
        print(data.description)

    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: APIDecodeKey.self)
        let resultContainer = try container.nestedContainer(keyedBy: ResultData.self, forKey: .result)
        rtnMsg = try resultContainer.decode(String.self, forKey: .rtnMsg)
        rtnCode = try resultContainer.decode(Int.self, forKey: .rtnCode)
        rtnTitleString =  try resultContainer.decode(String.self, forKey: .rtnTitleString)
        data = try resultContainer.decode(T.self, forKey: .data)
        datas = try resultContainer.decode([T].self, forKey: .datas)
    }

    var description : String{
        return "rtnMsg : \(rtnMsg) , rtnCode : \(rtnCode) , rtnTitleString : \(rtnTitleString ?? "") , data : \(String(describing: data)) , datas : \(String(describing: datas)) "
    }
}



extension APIResponse{

    enum APIDecodeKey :String, CodingKey{
        case result
    }

    enum ResultData :String, CodingKey{
        case rtnMsg , rtnCode , rtnTitleString , data , datas
    }
}


let jsonObject: [String : Any]  = [

    "result": [
        "data" : [
            "name": "Tom",
            "number": "50"],
        "datas" : [],
        "rtnCode" : 0,
        "rtnMsg" : "Success" ,
        "rtnTitleString" : "TestString"
    ]

]

//Convert to Data
let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)

if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
    APIResponse<Person_Model>.request(jsonString: JSONString)

}

