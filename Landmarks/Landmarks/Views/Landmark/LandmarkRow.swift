//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    var landMark: Landmark
    
    var body: some View {
        HStack {
            landMark.image(forsize: 50)
            Text(landMark.name)
            Spacer()
            
            if landMark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landMark: landMarkData[0])
            LandmarkRow(landMark: landMarkData[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
