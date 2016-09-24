import Cocoa

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current Rating: \(currentRating)")
}

movieRatings["The Cabinet of Dr. Caligari"] = 5
movieRatings.removeValueForKey("Dark City")
movieRatings["Donnie Darko"] = nil
for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}
for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

let watchedMovies = Array(movieRatings.keys)

/* *******
 CHALLENGE
 ******** */

let utah = ["Utah": [84003, 84042, 84606, 84604, 84602], "Salt Lake": [84115, 84101, 84047, 84101, 84102], "Summit": [84068, 84033, 84036, 84017, 84055]]

let utahZipCodes = Array(utah.values)
let flattenedUtahZipCodes = utahZipCodes.flatMap { $0 }
let result = "Utah has the following zip codes: \(flattenedUtahZipCodes)"
print(result)
