//
//  FeaturedLandmarks.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct FeaturedLandmarks : View {
    var landmarks: [Landmark]
    var body: some View {
        landmarks[0].image(forsize: 250).resizable()
    }
}

#if DEBUG
struct FeaturedLandmarks_Previews : PreviewProvider {
    static var previews: some View {
        FeaturedLandmarks(landmarks: landMarkData)
    }
}
#endif
