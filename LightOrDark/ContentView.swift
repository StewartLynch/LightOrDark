//
//  ContentView.swift
//  LightOrDark
//
//  Created by Stewart Lynch on 2022-01-15.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var current
    @State private var showModal = false
    @EnvironmentObject var csManager: ColorSchemeManager
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $csManager.colorScheme) {
                    Text("Light").tag(ColorScheme.light)
                    Text("Dark").tag(ColorScheme.dark)
                    Text("System").tag(ColorScheme.unspecified)
                }
                .pickerStyle(.segmented)
                .padding()
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("Show Modal")
                }
                NavigationLink("Go Next") {
                    Text("Navigation Stack")
                }
                Text("Current ColorScheme:  \(String(describing: current))")
                Spacer()
            }
            .sheet(isPresented: $showModal) {
                Text("Modal Sheet")
            }
            .navigationTitle("ColorScheme")
//            .preferredColorScheme(colorScheme == 0 ? .light : .dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ColorSchemeManager())
    }
}
