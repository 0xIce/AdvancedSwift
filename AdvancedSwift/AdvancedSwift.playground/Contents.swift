//: Playground - noun: a place where people can play

import Cocoa

// 生成fibs
func createFibs(length: Int, first: Int, second: Int) -> [Int] {
  var result: [Int] = [first, second]
  if length <= 2 {
    return result
  }
  for _ in 2..<length {
    result.append(result[result.count - 2] + result[result.count - 1])
  }
  return result
}

let fibs = createFibs(length: 6, first: 0, second: 1)
let twoDimFibs = [fibs, createFibs(length: 6, first: 1, second: 1)]
fibs.dropFirst()


var tempTable: [Int] = []
let fibsTable = fibs.map { (item) -> [Int] in
  tempTable.append(item)
  return tempTable
}

let fibSum = fibs.reduce(10) { (result, item) -> Int in
  return result + item
}

let fibSeq = Array(sequence(state: (0, 1)) { (state: inout (Int, Int)) -> Int? in
  let upcomingNumber = state.0
  state = (state.1, state.0 + state.1)
  return upcomingNumber
}.prefix(10))
















// Traverse
for (_, _) in fibs.enumerated() {
  //  print(i, elem)
}

fibs.forEach { (item) in
  
}


// Extension
extension Array {
  func map<T>(_ transform: (Element) -> T) -> [T] {
    var result: [T] = []
    result.reserveCapacity(count)
    for item in self {
      result.append(transform(item))
    }
    return result
  }
  
  func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
    var result: [Element] = []
    for item in self where isIncluded(item) {
      result.append(item)
    }
    return result
  }
  
  func accumulate<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) -> Result) -> [Result] {
    var running = initialResult
    return map { next in
      running = nextPartialResult(running, next)
      return running
    }
  }
}

// List
enum List<Element> {
  case end
  indirect case node(Element, next: List<Element>)
}

extension List {
  func cons(_ x: Element) -> List {
    return .node(x, next: self)
  }
}

extension List: ExpressibleByArrayLiteral {
  init(arrayLiteral elements: Element...) {
    self = elements.reversed().reduce(.end) { (partialList, element) in
      partialList.cons(element)
    }
  }
}

let list = List<Int>.end.cons(1).cons(2).cons(3)
let list1: List = [1, 2, 3]
print(list, list1)



