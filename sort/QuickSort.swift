var numbers = [22, 34, 3, 32, 82, 55, 50]
var swapCount = 0

func quickSort(_ arr: [Int]) -> [Int] {
   if arr.count <= 1 { return arr }
   let idxPivot = Int.random(in: 0..<arr.count)
   var arr1 = [Int]()
   var arr2 = [Int]()
   for (idx, num) in arr.enumerated() {
      if idx == idxPivot { continue }
      if num <= arr[idxPivot] {
         arr1.append(num)
      } else {
         arr2.append(num)
      }
   }
   return quickSort(arr1) + [arr[idxPivot]] + quickSort(arr2)
}
print("numbers: \(quickSort(numbers))")