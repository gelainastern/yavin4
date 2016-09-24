import Cocoa

let myCities: Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"]
let yourCities: Set = ["Chicago", "San Francisco", "Jacksonville"]

myCities.isSupersetOf(yourCities)





var groceryBag: Set = ["Apples", "Oranges", "Pineapple"]
let friendsGroceryBag: Set = ["Bananas", "Cereal", "Milk", "Oranges"]
let roommatesGroceryBag: Set = ["Apples", "Bananas", "Cereal", "Toothpaste"]

/* **************
 SILVER CHALLENGE
 ************** */

groceryBag.unionInPlace(friendsGroceryBag)
print(groceryBag)
groceryBag.intersectInPlace(roommatesGroceryBag)
print(groceryBag)








for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Bananas")
let commonGroceryBag = groceryBag.union(friendsGroceryBag)
let itemsToReturn = commonGroceryBag.intersect(roommatesGroceryBag)

let yourSecondBag: Set = ["Berries", "Yogurt"]
let roommatesSecondBag: Set = ["Grapes", "Honey"]
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)

