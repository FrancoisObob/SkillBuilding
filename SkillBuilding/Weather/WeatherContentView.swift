//
//  WeatherContentView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/14/23.
//

import SwiftUI

struct WeatherContentView: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Brooklyn, NY")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 25)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 19)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 25)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.heavyrain.fill", temperature: 19)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", foregroundColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
        .onAppear {
            let button = WeatherButton(title: "Change Day Time", foregroundColor: .blue, backgroundColor: .white)
            print(type(of: button.body))
        }
    }
}

#Preview {
    WeatherContentView()
}

struct BackgroundView: View {

    var isNight: Bool

    var topColor: Color {
        isNight ? .black : .blue
    }

    var bottomColor: Color {
        isNight ? .gray : .lightBlue
    }

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(topColor.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String

    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)

        }
    }
}

struct WeatherButton: View {
    var title: String
    var foregroundColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
