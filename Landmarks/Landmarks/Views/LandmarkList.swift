//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landMarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landMark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"), displayMode: .large)
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS"].identified(by: \.self)) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
