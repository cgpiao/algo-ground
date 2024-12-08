var numbers = [3, 22, 32, 34, 50, 50, 50, 50, 50, 55, 81]
func bsearchInternal(_ numbers: [Int], _ low: Int, _ high: Int, _ value: Int) -> Int {
   if low > high { return -1}
   let mid = low + (high - low) >> 1
   print("low: \(low), high: \(high), mid: \(mid)")
   if numbers[mid] == value { 
      if mid == 0 || numbers[mid - 1] != value {
         return mid
      } else {
         return bsearchInternal(numbers, low, mid - 1, value)
      }
   } else if numbers[mid] < value {
      return bsearchInternal(numbers, mid + 1, high, value)
   } else {
      return bsearchInternal(numbers, low, mid - 1, value)
   }
}
func bsearch(_ numbers: [Int], _ value: Int) -> Int {
   return bsearchInternal(numbers, 0, numbers.count - 1, value)
}
func bsearch2(_ numbers: [Int], _ value: Int) -> Int {
   var low = 0
   var high = numbers.count - 1
   while low <= high {
      let mid = low + (high - low) >> 1
      if numbers[mid] == value { 
         if mid == 0 || numbers[mid - 1] != value {
            return mid
         } else {
            high = mid - 1
         }
      } else if numbers[mid] < value {
         low = mid + 1
      } else {
         high = mid - 1
      }
   }
   return -1
}
print("bsearch: \(bsearch2(numbers, 50))")