//
//  MpView.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        return uiView.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MpView_Previews : PreviewProvider {
    static var previews: some View {
        MapView(coordinate: landMarkData[0].locationCoordinate)
    }
}
#endif
