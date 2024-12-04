//
//  LinkedQueue.swift
//  SwiftPlaygournd
//
//  Created by CHENGGUO PIAO on 2024/12/03.
//

class LinkedQueue<T>: Sequence, IteratorProtocol {
   var count = 0
   private var first: Node<T>? = nil
   private var last: Node<T>? = nil
   
   private var current: Node<T>? = nil
   func enqueue(item: T) {
      let node = Node(item)
      if let lastNode = last {
         lastNode.next = node
      } else {
         first = node
      }
      last = node
   }
   
   func dequeue() -> T? {
      if first == nil {
         return nil
      }
      let item = first!.data
      first = first!.next
      if first == nil {
         last = nil
      }
      return item
   }
   
   func makeIterator() -> Iterator {
      current = first
      return self
   }
   
   func next() -> T? {
      if current == nil {
         return nil
      }
      let item = self.current!.data
      current = current!.next
      return item
   }
}

private class Node<T> {
   var next: Node<T>?
   var data: T
   init(_ data: T, _ next: Node<T>? = nil) {
      self.data = data
      self.next = next
   }
}
