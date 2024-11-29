let cacheSize = 3

class LruList<T: Comparable> {
    var first: Node<T>?
    var last: Node<T>?
    var size: Int = 0
    func add(data: T) {
        if (size == 0) {
            let node = Node(nil, data, nil)
            self.first = node
            self.last = node
            size += 1
        } else {
            let theNode = self.exists(data)
            let node = Node(nil, data, first)
            if (theNode == nil) {
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

    func p() {
        if first == nil {
            print("")
        }
        var curr = first
        var i = 0
        repeat {
            print("\(i): \(curr?.data)")
            i += 1
            curr = curr!.next
        } while curr != nil
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

let lru = LruList<Int>()


lru.add(data: 1)
print("size: \(lru.size), head: \(lru.first?.data), last: \(lru.last?.data)")
lru.add(data: 2)
print("size: \(lru.size), head: \(lru.first?.data), last: \(lru.last?.data)")
lru.add(data: 1)
print("size: \(lru.size), head: \(lru.first?.data), last: \(lru.last?.data)")
lru.add(data: 3)
print("size: \(lru.size), head: \(lru.first?.data), last: \(lru.last?.data)")
// lru.p()