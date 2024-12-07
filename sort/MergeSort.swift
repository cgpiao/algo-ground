var numbers = [22, 34, 3, 32, 82, 55, 50]

/**
 22, 34, 3, 32, == 82, 55, 50
 22, 34 == 3, 32, == 82,  == 55, 50
 22 == 34 == 3 == 32, == 82 == 55 == 50
 */
func merge(_ arr: inout [Int], _ begin: Int, _ middle: Int, _ end: Int) {
   let leftSize = middle - begin + 1
   let rightSize = end - middle
   
   var leftArr = Array(repeating: -1, count: leftSize)
   var rightArr = Array(repeating: -1, count: rightSize)
   for i in 0..<leftSize {
      leftArr[i] = arr[begin + i]
   }
   for i in 0..<rightSize {
      rightArr[i] = arr[middle + i + 1]
   }
   var i = 0, j = 0
   var k = begin
   while i < leftSize && j < rightSize {
      if leftArr[i] <= rightArr[j] {
         arr[k] = leftArr[i]
         i += 1
      } else {
         arr[k] = rightArr[j]
         j += 1
      }
      k += 1
   }
   
   while i < leftSize {
      arr[k] = leftArr[i];
      i += 1
      k += 1
   }
   
   while j < rightSize {
      arr[k] = rightArr[j];
      j += 1
      k += 1
   }
}
func split(_ arr: inout [Int], _ begin: Int, _ end: Int) {
   if begin >= end { return }
   let middle = begin + (end - begin)/2
   split(&arr, begin, middle)
   split(&arr, middle + 1, end)
   merge(&arr, begin, middle, end)
}

split(&numbers, 0, numbers.count - 1)
print("numbers: \(numbers)")