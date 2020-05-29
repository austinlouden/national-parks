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

struct Park: Decodable, Equatable, Identifiable {
    let id: String
    let fullName: String
}

struct Parks: Decodable, Equatable {
    let total: String
    let limit: String
    let start: String
    let data: Array<Park>
}

let loadParks = Endpoint<Parks>(json: .get, url: URL(string: "https://developer.nps.gov/api/v1/parks?parkCode=acad,dena&api_key=")!)

final class Resource<A>: ObservableObject {
    let endpoint: Endpoint<A>
    @Published var value: A?
    init(endpoint: Endpoint<A>) {
        self.endpoint = endpoint
        load()
    }

    func load() {
        URLSession.shared.load(endpoint) { (result) in
            DispatchQueue.main.async {
                self.value = try? result.get()
            }
        }
    }
}

struct ParkList: View {
    var parks: Array<Park>
    init(parks: Array<Park>) {
        self.parks = parks
        
    }

    var body: some View {
        ForEach(self.parks) { park in
            Text(park.fullName)
        }
    }
}

struct ContentView: View {
    @ObservedObject var resource = Resource(endpoint: loadParks)
    var body: some View {
        Group {
            if resource.value == nil {
                Text("Loading")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ParkList(parks: resource.value!.data)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
