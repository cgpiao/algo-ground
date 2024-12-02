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

class Browser {
   var backStack = ArrayStack<String>()
   var forwardStack = ArrayStack<String>()
   func navigate(url: String) {
      backStack.push(url)
   }

   func back() -> String? {
      if backStack.count == 0 { return nil }
      let url = backStack.pop()
      forwardStack.push(url!)
      return url
   }

   func forward() -> String? {
      if forwardStack.count == 0 { return nil }
      let url = forwardStack.pop()
      backStack.push(url!)
      return url
   }
}

let myBrowser = Browser()
myBrowser.navigate(url: "google.com")

print("back: \(myBrowser.back() ?? "nil")")
print("back: \(myBrowser.forward() ?? "nil")")
print("back: \(myBrowser.back() ?? "nil")")