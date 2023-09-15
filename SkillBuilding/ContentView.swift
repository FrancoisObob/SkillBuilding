//
//  ContentView.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 9/14/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("Brooklyn, NY")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("25°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 19)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 25)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.heavyrain.fill", temperature: 19)
                }
                Spacer()
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 0) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            
        }
    }
}
