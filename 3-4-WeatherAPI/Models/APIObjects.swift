//
//  APIObjects.swift
//  3-4-WeatherAPI
//
//  Created by Till Hemmerich on 21.11.24.
//

import Foundation

enum HTTPError : Error{
    case invalidURL,fetchFailed
    
    var message: String {
        switch self{
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Das Laden ist fehlgeschagen"
        }
    }
}

struct WeatherResponse: Codable{
    let weather: [Weather]
    let wind : Wind
    let main: Main
    let name: String
}

struct Weather: Codable{
    var description : String
}
struct Main: Codable{
    let temp: Double
    let humidity: Double
}
struct Wind: Codable{
    let speed : Double
}



/**
 ```{
"coord": {
"lon": 7.367,
"lat": 45.133
},
"weather": [
{
"id": 501,
"main": "Rain",
"description": "moderate rain",
"icon": "10d"
}
],
"base": "stations",
"main": {
"temp": 284.2,
"feels_like": 282.93,
"temp_min": 283.06,
"temp_max": 286.82,
"pressure": 1021,
"humidity": 60,
"sea_level": 1021,
"grnd_level": 910
},
"visibility": 10000,
"wind": {
"speed": 4.09,
"deg": 121,
"gust": 3.47
},
"rain": {
"1h": 2.73
},
"clouds": {
"all": 83
},
"dt": 1726660758,
"sys": {
"type": 1,
"id": 6736,
"country": "IT",
"sunrise": 1726636384,
"sunset": 1726680975
},
"timezone": 7200,
"id": 3165523,
"name": "Province of Turin",
"cod": 200
}
```
**/
