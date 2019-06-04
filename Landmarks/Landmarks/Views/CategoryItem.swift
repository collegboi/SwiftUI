//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct CategoryItem : View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark
                .image(forsize: 155)
                .renderingMode(.original)
                .cornerRadius(5)
            Text(landmark.name)
                .color(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#if DEBUG
struct CategoryItem_Previews : PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: landMarkData[0])
    }
}
#endif
