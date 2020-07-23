import UIKit

var str = "Hello, playground"
//1480. Running Sum of 1d Array
func runningSum(_ nums: [Int]) -> [Int] {
    /* my Code
      var sumAry = [Int]()
        for idx in 0..<nums.count{

            let lastGroupSum =  idx-1 >= 0 ? sumAry[idx-1] : 0
            sumAry.append(lastGroupSum + nums[idx])
        }
        return sumAry*/
    //use map to transfer
     var sum = 0
    return nums.map { number in
        let result = (sum+=number , sum)
        return result.1
    }
}

//print(runningSum([1,5,3]))


//1512. Number of Good Pairs
func numIdenticalPairs(_ nums: [Int]) -> Int {
    var indexDict = [Int:Int]()
    var count = 0
    for num in nums{
        if let element = indexDict[num]{
            count+=element
        }
        indexDict[num, default:0 ] += 1
    }

    return count
}


//print(numIdenticalPairs([1,1,1]))

//1476. Subrectangle Queries
/**
* Your SubrectangleQueries object will be instantiated and called as such:
* let obj = SubrectangleQueries(rectangle)
* obj.updateSubrectangle(row1, col1, row2, col2, newValue)
* let ret_2: Int = obj.getValue(row, col)
*/

class SubrectangleQueries {

    private var rectangle : [[Int]]

    private var updateInfos : [UpdateInfo] = []

    private struct UpdateInfo {
        var row1 : Int
        var row2 : Int
        var col1 : Int
        var col2 : Int
        var newValue : Int
    }

    init(_ rectangle: [[Int]]) {
        self.rectangle = rectangle
    }

    func updateSubrectangle(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int, _ newValue: Int) {
        updateInfos.append(UpdateInfo(row1: row1, row2: row2, col1: col1, col2: col2, newValue: newValue))
    }

    func getValue(_ row: Int, _ col: Int) -> Int {

        let N = self.updateInfos.count

        //start from the newest
        for i in stride(from: N-1, through: 0, by: -1){
            if row >= updateInfos[i].row1 && row <= updateInfos[i].row2 && col >= updateInfos[i].col1 && col <= updateInfos[i].col2{
                return updateInfos[i].newValue
            }
        }
        return self.rectangle[row][col]
    }
}

// 1 2 1
// 4 3 4
// 3 2 1
// 1 1 1
let obj = SubrectangleQueries([[1,2,1],[4,3,4],[3,2,1],[1,1,1]])

//0,1 , 2,1
obj.updateSubrectangle(1, 1, 2, 2, 5)

// 1 2 1
// 4 5 5
// 3 5 5
// 1 1 1

//get (2,0)
print(obj.getValue(2, 1))

