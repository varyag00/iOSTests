//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var str1:String = "foo"

print("hello \(str1)")
print("hello " + str)

var inte:Int = 2

inte = inte * 6
inte = inte / 4

var anotherint = 9
print("the value of int is \(inte * anotherint)")

var num:Double = 6.0
print(num * Double(inte))

var bool = true

var dub:Double = 3.0
var a:Int = 3

print(a * Int(dub))





// Lecture 24: Arrays and Dictionaries

var array = [5,3,1,2,3,4, "dog"]
array.removeAtIndex(3)  //returns removed element

array.sort


//Dicts

var dict = ["pc": "master race", "coffee": "greatest"]
print(dict["pc"]!)
dict["console"] = "for peasants"

dict.removeValueForKey("coffee")

var menu = ["pizza":23.4, "veggies":22, "ice cream":420]
var totalCost = menu["pizza"]! + menu["ice cream"]! + menu["veggies"]!
print("the total cost is \(totalCost)")


//playing with loops

var arr:[Double] = [8,3,9,11,65,43,54]
//
//for (index, value) in arr.enumerate(){
//    arr[index] = value + 1
//}

for (ind, val) in arr.enumerate(){
    arr[ind] = val / 2
}


//playing with strings

var str2 = "Hello world!"
var str3 = str2 + " :)"

for character in str3.characters{
    print(character)
}

//conver str to type NSString, has more methods
var newTypeString = NSString(string: str3)

newTypeString.substringToIndex(4)
newTypeString.substringFromIndex(6)

if newTypeString.containsString("worl"){
    print("it does!")
}

newTypeString.componentsSeparatedByString(" ")
newTypeString.lowercaseString

