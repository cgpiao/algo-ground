//
//  ArrayQueue.swift
//  SwiftPlaygournd
//
//  Created by CHENGGUO PIAO on 2024/12/03.
//

class ArrayQueue<T>: Sequence, IteratorProtocol{
   var items: [T?] = []
   var head: Int = 0
   var tail: Int = 0
   var capacity = 0
   
   var current = -1
   var isEmpty: Bool {
      get {
         return head == tail
      }
   }
   
   var count: Int {
      get {
         return tail - head
      }
   }
   
   init(capacity: Int = 10) {
      self.capacity = capacity
      items = Array.init(repeating: nil, count: capacity)
   }
   
   func enqueue(item: T) -> Bool {
      if count == capacity {
         print("no capacity!! \(item)")
         return false
      }
      if tail == capacity {
         print("re-arrange data")
         for i in head..<tail {
            items[i - head] = items[i]
         }
         tail = count
         head = 0
      }
      items[tail] = item
      
      tail += 1
      
      return true
   }
   
   func dequeue() -> T? {
      if isEmpty {
         return nil
      }
      let item = items[head]!
      head += 1
      return item
   }
   
   func makeIterator() -> Iterator {
      current = head
      return self
   }
   
   func next() -> T? {
      if tail == current {
         return nil
      }
      let item = items[current]
      current += 1
      return item
   }
}
