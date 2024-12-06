var numbers = [22, 34, 3, 32, 82, 55, 50]

var swapCount = 0
for i in 1..<numbers.count {
   let value = numbers[i]
   var j = i - 1
   print(j)
   while j >= 0 {
      if value < numbers[j] {
         numbers[j + 1] = numbers[j]
         j -= 1
         swapCount += 1
      } else {
         break
      }
   }
   numbers[j + 1] = value
}
print("swapCount: \(swapCount), numbers: \(numbers)")