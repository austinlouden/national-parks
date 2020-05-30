//
//  ContentView.swift
//  Parks
//
//  Created by Austin Louden on 5/28/20.
//  Copyright © 2020 Austin Louden. All rights reserved.
//

import Combine
import SwiftUI
import TinyNetworking

let loadParks = Endpoint<ParksResponse>(json: .get, url: URL(string: "https://developer.nps.gov/api/v1/parks?parkCode=acad&api_key=")!)

struct ParkList: View {
    var parks: Array<Park>
    init(parks: Array<Park>) {
        self.parks = parks
        
    }

    var body: some View {
        List(self.parks) { park in
            VStack(alignment: .leading) {
                Text(park.fullName)
                    .font(.headline)
                Text(park.description)
                    .font(.body)
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var resource = Resource(endpoint: loadParks)
    var body: some View {
        Group {
            if resource.value == nil {
                VStack {
                    Text("Loading")
                    ActivityIndicatorView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                NavigationView {
                    ParkList(parks: resource.value!.data)
                        .navigationBarTitle("Parks", displayMode: .large)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
