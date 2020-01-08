//
//  ViewController.swift
//  Algorithms
//
//  Created by Igor Korshunov on 03/01/2020.
//  Copyright © 2020 Igor Korshunov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let res = subarrayGivenSum(arr: [1, -4, 20, -2 , 10, 5], sum: 14)
//        if let res = res {
//            print("start: \(res.startIndex), end: \(res.endIndex)")
//        }else{
//            print("no subarray with given sum")
//        }
  
//        if let res = res {
//            print(res)
//        }
        
//        let arr = [1, 2, 3, 4, 5, 6, 100]
//        print(find3Nums(arr: arr, sum: 103))
        
//        print(countLeaders(arr: [16]))
        
//        let x = 123
//        let x1 = String(x.description)
//        print(x1 + "1234")
        
//        let arr = [1, 34, 3, 98, 9, 76, 45, 4]
//        let res = maxNumberSort(arr: arr)
//        print(res)
        
//        countDistinctNumsInWindow(arr: [1, 1, 1, 1, 1, 1, 1], k: 4)
        
        print(longestConsecutiveSubsequence1(arr: [1, 2, 3, 4]))
    }
    
    func longestConsecutiveSubsequence1(arr: [Int]) -> Int{
        var res = 1
        var set = Set<Int>(arr)
        
        for i in 0..<arr.count{
            if set.isEmpty {
                return res
            }
            print("index = \(i)")
            var start = arr[i]
            var end = arr[i]

            
            while set.contains(start - 1) {
                set.remove(start - 1)
                start = start - 1
                
            }
            
            while set.contains(end + 1) {
                end = end + 1
                set.remove(end)
            }
            
            res = max(res, end - start + 1)
        }
        return res
    }
    
    func longestConsecutiveSubsequence(arr: [Int]) -> Int{
        var res = 1
        
        let set = Set<Int>(arr)
        
        for i in 0..<arr.count {
            if set.contains(arr[i] - 1) == false{
                var x = arr[i]
                while set.contains(x) {
                    x += 1
                }
                res = max(res, x - arr[i])
            }
        }
        
        return res
    }
    
    func countDistinctNumsInWindow(arr: [Int], k: Int){
        var hash = [Int: Int]()
        for i in 0..<k {
            if let count = hash[arr[i]] {
                hash[arr[i]] = count + 1
            }else{
                hash[arr[i]] = 1
            }
        }
        print(hash.count)
        
        for i in k..<arr.count {
            if var count = hash[arr[i - k]] {
                count -= 1
                if count == 0 {
                    hash.removeValue(forKey: arr[i - k])
                }else{
                    hash[arr[i - k]] = count
                }
            }
            
            if let count = hash[arr[i]] {
                hash[arr[i]] = count + 1
            }else{
                hash[arr[i]] = 1
            }
            
            print(hash.count)
        }
    }
    
    func maxNumberSort(arr: [Int]) -> [Int]{
        var res = arr
        res.sort { (a: Int, b: Int) -> Bool in
            let ab = Int(a.description + b.description)!
            let ba = Int(b.description + a.description)!
            return ab > ba
        }
        return res
    }
    
    func countLeaders(arr: [Int]) -> Int {
        if arr.count <= 1 {
            return arr.count
        }
        var maxSoFar = arr[arr.count - 1]
        var count = 1
        
        for i in (0...arr.count - 2).reversed() {
            print(i)
            if arr[i] > maxSoFar {
                maxSoFar = arr[i]
                count += 1
            }
        }
        return count
    }
    
    func find3Nums(arr: [Int], sum: Int) -> Bool{
         
        for i in 0..<arr.count - 2 {
            var set = Set<Int>()
            let currSum = sum - arr[i]
            
            for j in i+1..<arr.count {
                if set.contains(currSum - arr[j]){
                    return true
                }
                set.insert(arr[j])
            }
        }
        
        return false
    }
    
//    func find3Nums(arr: inout [Int], sum: Int) -> Bool{
//        arr.sort()
//
//        for i in 0..<arr.count - 2 {
//            var l = i + 1
//            var r = arr.count - 1
//
//            while l < r {
//                let tmp = arr[i] + arr[l] + arr[r]
//                if tmp == sum {
//                    print("i: \(i) j: \(l) k: \(r)")
//                    return true
//                }else if tmp < sum {
//                    l += 1
//                }else{
//                    r -= 1
//                }
//            }
//        }
//
//        return false
//    }
    
//    func subarrayGivenSum(arr: [Int], sum: Int) -> (startIndex: Int, endIndex: Int)?{
//        var hash = [Int: Int]()
//        var currSum = 0
//        for (index, element) in arr.enumerated() {
//            currSum += element
//
//            if currSum == sum {
//                return (0, index)
//            }
//
//            if let start = hash[currSum - sum] {
//                return (start + 1, index)
//            }
//
//            hash[currSum] = index
//        }
//        return nil
//    }
    
    func subarrayGivenSum(arr: [Int], sum: Int) -> [Int]?{
        var hash = [Int: Int]()
        var currSum = 0
        for (index, element) in arr.enumerated() {
            currSum += element
            
            if currSum == sum {
                return Array(arr[0...index])
            }
            
            if let start = hash[currSum - sum] {
                return Array(arr[start + 1...index])
            }
            
            hash[currSum] = index
        }
        return nil
    }


}

