//
//  ArrayQueue.swift
//  SwiftPlaygournd
//
//  Created by CHENGGUO PIAO on 2024/11/27.
//

let cacheSize = 3

class LruList<T: Comparable> {
   var first: Node<T>?
   var last: Node<T>?
   var size: Int = 0
   func add(data: T) {
      if size == 0 {
         let node = Node(nil, data, nil)
         self.first = node
         self.last = node
         size += 1
      } else {
         let theNode = self.exists(data)
         let node = Node(nil, data, first)
         if theNode == nil {
            // New
            if size >= cacheSize {
               // no space
               last?.prev?.next = nil
               last = last?.prev
               size -= 1
            }
            size += 1
         } else {
            let prev = theNode?.prev
            let next = theNode?.next
            prev?.next = next
            if next == nil {
               last = prev
            }
         }
         // first = node
         first?.prev = node
         first = node
      }
   }

   private func exists(_ obj: T) -> Node<T>? {
      if last == nil {
         return nil
      }
      var curr = last
      repeat {
         if curr!.data == obj {
            return curr
         }
         curr = curr!.prev
      } while curr != nil
      return nil
   }
}
class Node<T: Comparable> {
   var prev: Node<T>?
   var next: Node<T>?
   var data: T
   init(_ prev: Node<T>?, _ data: T, _ next: Node<T>?) {
      self.prev = prev
      self.data = data
      self.next = next
   }
}
