//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct FeatureCard : View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
        .resizable()
        .aspectRatio(3 / 2, contentMode: .fit)
        .overlay(TextOverlay(landmark: landmark))
    }
}

#if DEBUG
struct FeatureCard_Previews : PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: landMarkData[0])
    }
}
#endif
