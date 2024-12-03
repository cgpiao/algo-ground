//
//  LinkedStack.swift
//  SwiftPlaygournd
//
//  Created by CHENGGUO PIAO on 2024/12/02.
//

class LinkedStack<T: Comparable>: Sequence, IteratorProtocol {
   private var first: Node<T>?
   private var size: Int = 0
   private var current: Node<T>?
   init() {
      first = nil
      current = nil
   }
   
   func push(_ item: T) {
      size += 1
      if size == 0 {
         let node = Node(item, nil)
         first = node
         return
      }
      let node = Node(item, first)
      first = node
   }
   
   func pop() -> T? {
      if first == nil {
         return nil
      }
      let second = first!.next
      let data = first!.data
      first = second
      return data
   }
   
   func peek() -> T? {
      return first?.data
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

private class Node<T: Comparable> {
   var next: Node<T>?
   var data: T
   init(_ data: T, _ next: Node<T>?) {
      self.data = data
      self.next = next
   }
}

let stack1 = LinkedStack<Int>()
stack1.push(1)
stack1.push(2)
stack1.push(3)
for item in stack1 {
    print("item: \(item)")
}
