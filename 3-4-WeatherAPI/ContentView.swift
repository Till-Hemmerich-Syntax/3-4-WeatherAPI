//
//  ContentView.swift
//  3-4-WeatherAPI
//
//  Created by Till Hemmerich on 21.11.24.
//

import SwiftUI

struct ContentView: View {
    @State var weatherData: WeatherResponse?
    var body: some View {
        VStack {
            Text(weatherData?.name ?? "")
            Text("DESC: \(weatherData?.weather.first?.description)" ?? "")
        }
        .task {
            do{
                self.weatherData = try await fetchWeather()
                print(weatherData)
            }catch{
                
            }
        }
    }
    
    private func fetchWeather() async throws -> WeatherResponse{
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=52.5&lon=13.4&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = REQUESTHEADERS
        
        let (data,_) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
        
    }
}

#Preview {
    ContentView()
}
