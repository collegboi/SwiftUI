//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct CategoryHome : View {
    var categories: [String: [Landmark]] {
        .init(grouping: landMarkData, by: { $0.category.rawValue })
    }
    
    var feautured: [Landmark] {
        landMarkData.filter { $0.isFeatured }
    }
    
    var body: some View {
        NavigationView {
            List {
                FeaturedLandmarks(landmarks: feautured)
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(categories.keys.sorted().identified(by: \.self)) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationButton(destination: LandmarkList()) {
                    Text(verbatim: "See All")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: PresentationButton(
                Image(systemName: "person.crop.circle")
                    .imageScale(.large)
                    .accessibility(label: Text(verbatim: "User Profile"))
                    .padding(),
                destination: ProfileHost()
            ))
        }
    }
}

#if DEBUG
struct CategoryHome_Previews : PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
#endif
