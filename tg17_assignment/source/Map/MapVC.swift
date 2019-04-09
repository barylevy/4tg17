//
//  ViewController.swift
//  tg17_assignment
//
//  Created by Bary Levy on 08/04/2019.
//  Copyright © 2019 Bary Levy. All rights reserved.
//

import UIKit
import MapKit
import NMAKit

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet var errorMessageLabel: UILabel!

    var mapObjectsArray = [MKPointAnnotation]()
    var resultsArray: [NMALink] = []{
        didSet{
            self.reloadMapObjects()
        }
    }
    var refPosition: CLLocationCoordinate2D? {
        didSet {
            guard let pos = refPosition else { return }
            self.reverseGeocode(pos)
            self.triggerSearchRequest(coordinate: pos)
        }
    }
    var categoriesList = CategoriesList() {
        didSet{
            guard let pos = self.refPosition else { return }
            self.cleanMap()
            self.triggerSearchRequest(coordinate: pos)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor.black,
                 NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 15)!]

        initMapView()

        initCategories()

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

