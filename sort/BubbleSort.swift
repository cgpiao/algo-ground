var numbers = [22, 34, 3, 32, 82, 55, 50]

var swapCount = 0
for _ in 0..<numbers.count {
   var arrayOrdered = true
   for j in 0..<numbers.count - 1 {
      if numbers[j] > numbers[j + 1] {
         numbers.swapAt(j + 1, j)
         arrayOrdered = false
         swapCount += 1
      }
   }
   if arrayOrdered {
      break
   }
}
print("swapCount: \(swapCount), numbers: \(numbers)")
