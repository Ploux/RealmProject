//
//  ContentView.swift
//  RealmProject
//
//  Created by Peter Loux on 6/24/24.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedResults(Group.self) var groups
    
    var body: some View {
        if let group = groups.first {
            ItemListView(group: group)
        }
        else {
            ProgressView()
                .onAppear {
                    $groups.append(Group())
                }
        }
    }
}

#Preview {
    ContentView()
}
