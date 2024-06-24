//
//  ItemResultView.swift
//  RealmProject
//
//  Created by Peter Loux on 6/24/24.
//

import SwiftUI
import RealmSwift

struct ItemResultView: View {
    
    @ObservedResults(Item.self) var items
    // filter
    @ObservedResults(Item.self, filter: NSPredicate(format: "name CONTAINS[c] %@", "y")) var filteredItems
                            
    @ObservedResults(Item.self, sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: true)) var sortedItems
    
    @State private var searchText: String = ""
    @State private var isAToZ: Bool = true
    
    var body: some View {
        List {
            
            Toggle("sort order a to z", isOn: $isAToZ)
            
            ItemSectionView(title: "all")
            
            ItemSectionView(title:
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    
    return NavigationView {
        ItemResultView()
    }
    .environment(\.realm, RealmHelper.realmWithItems())
    .previewLayout(.fixed(width: 400, height: 1500))
}

struct ItemSectionView: View {
    
    @ObservedResults(Item.self) var items
    let title: String
    
    init(title: String, searchText: String = "", isAToZ: Bool = true) {
        self.title = title
        if searchText.isEmpty {
            self._items = ObservedResults(Item.self, sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: isAToZ))
        }
        else {
            self._items = ObservedResults(Item.self, filter: NSPredicate(format: "name CONTAINS[c] %@", searchText), sortDescriptor: SortDescriptor.init(keyPath: "name", ascending: isAToZ))
        }
    }
    
    var body: some View {
        Section(title) {
            ForEach(items) { item in
                ItemRow(item: item)
            }
            .onDelete { indexSet in
                // delete
            }
        }
    }
}
