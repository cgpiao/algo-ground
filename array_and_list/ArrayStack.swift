struct ArrayStack<T> {
   var items: [T?] = []
   var count = 0
   var size = 0
   init(size: Int = 10) {
      items = Array(repeating: nil, count: size)
      self.size = size
   }

   mutating func push(_ item: T) {
      if self.count == self.size {
         let newSize = 2 * self.size
         var temp: [T?] = Array(repeating: nil, count: newSize)
         for (i, item) in items.enumerated() {
            temp[i] = item
         }
         items = temp
         self.size = newSize
      }
      items[count] = item
      count += 1
   }

   mutating func pop() -> T? {
      if count == 0 { return nil }
      count -= 1
      let item = items[count]
      items[count] = nil
      return item
   }

   func peek() -> T? {
      if count == 0 { return nil }
      return items[count - 1]
   }
}

var stack1: ArrayStack<Int> = ArrayStack()
stack1.push(1)
stack1.push(2)
stack1.push(3)
stack1.push(4)
print(stack1.peek() ?? "nil")
print(stack1.peek() ?? "nil")
print(stack1.pop() ?? "nil")
print(stack1.peek() ?? "nil")
