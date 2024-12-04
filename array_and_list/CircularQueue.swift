//
//  CircularQueue.swift
//  SwiftPlaygournd
//
//  Created by CHENGGUO PIAO on 2024/12/04.
//

class CircularQueue<T>: Sequence, IteratorProtocol {
   private var items: [T?] = []
   private var head: Int = 0
   private var tail: Int = 0
   private var capacity = 0
   
   private var current = -1
   
   var isEmpty: Bool {
      get {
         return head == tail
      }
   }
   
   init(capacity: Int = 10) {
      self.capacity = capacity
      items = Array.init(repeating: nil, count: capacity)
   }
   
   func enqueue(item: T) -> Bool {
      if (tail + 1) % capacity == head {
         print("no capacity!! \(item)")
         return false
      }
      
      items[tail] = item
      
      tail = (tail + 1) % capacity
      
      return true
   }
   
   func dequeue() -> T? {
      if isEmpty {
         return nil
      }
      let item = items[head]!
      head = (head + 1) % capacity
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
      current = (current + 1) % capacity
      return item
   }
}
