//
//  WeatherView.swift
//  TimDevo Weather
//
//  Created by Timur Gabdurashitov on 16/05/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 10) {
                            let mainWeather = weather.weather[0].main
                            if (mainWeather == "Clear") {
                                Image(systemName: "sun.max")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Clouds") {
                                Image(systemName: "cloud")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Atmosphere") {
                                Image(systemName: "cloud.fog")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Snow") {
                                Image(systemName: "snowflake")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Rain") {
                                Image(systemName: "cloud.rain")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Drizzle") {
                                Image(systemName: "cloud.drizzle")
                                    .font(.system(size: 40))
                            } else if (mainWeather == "Thunderstorm") {
                                Image(systemName: "cloud.bolt.rain")
                                    .font(.system(size: 40))
                            }
                            
                            Text(weather.weather[0].description)
                        }
                        .frame(width: 200, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 75))
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Image("weather-background").resizable().aspectRatio(CGSize(width: 45, height: 25), contentMode: .fit)
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer",
                                   name: "Min temp",
                                   value: (weather.main.temp_min.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer",
                                   name: "Max temp",
                                   value: (weather.main.temp_max.roundDouble() + "°"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind",
                                   name: "Wind speed",
                                   value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity",
                                   name: "Humidity",
                                   value: (weather.main.humidity.roundDouble() + "%"))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
        .cornerRadius(30, corners: [.topLeft, .topRight])
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
