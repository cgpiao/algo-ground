var numbers = [22, 34, 3, 32, 82, 55, 50]
var swapCount = 0


for i in 0..<numbers.count {
   var minIndex = i
   for j in i..<numbers.count {
      if numbers[j] < numbers[minIndex] {
         minIndex = j
      }
   }
   numbers.swapAt(minIndex, i)
}
print("swapCount: \(swapCount), numbers: \(numbers)")