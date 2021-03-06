//
//  ViewController.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    var searchProvider: SearchProviding?

    var geocoderProvider: LocationGeocoding?

    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet var errorMessageLabel: UILabel!

    var mapObjectsArray = [MKPointAnnotation]()
    var places: [PlaceData] = []{
        didSet{
            self.reloadMapObjects()
        }
    }
    var refPosition: CLLocationCoordinate2D? {
        didSet {
            guard let pos = refPosition else { return }
            self.reverseGeocode(pos)
            self.searchPlace(coordinate: pos)
        }
    }
    var categoriesList = CategoriesList() {
        didSet{
            guard let pos = self.refPosition else { return }
            self.cleanMap()
            self.searchPlace(coordinate: pos)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor.black,
                 NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 15)!]

        self.searchProvider = try! ClassFactory.getInstance().resolve(type: SearchProviding.self) as! SearchProviding 
        self.geocoderProvider = try! ClassFactory.getInstance().resolve(type: LocationGeocoding.self) as! LocationGeocoding
        
        initMapView()

        self.searchProvider?.searchCategories { (_ categories: [CategoryData]) in
            self.categoriesList.placeCategory = categories
            if let pos = self.refPosition {
                self.searchPlace(coordinate: pos)
            }
        }

        self.startPositioning()
    }
    deinit {
        self.stopPositioning()
    }
    
    fileprivate func initMapView() {
        self.mapView.isZoomEnabled = true
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
    }
}

