//
//  JobCityWorker.swift
//  RecruitManner
//
//  Created by xiaohui on 16/11/24.
//  Copyright (c) 2016年 Jiang Duan. All rights reserved.
//
//

import UIKit
import CoreLocation

// ============================================================================= //
// MARK: - JobCityWorker Class Definition
// ============================================================================= //

class JobCityWorker: NSObject {
    // MARK: Business Logic
    
    var locationManager = CLLocationManager()
    var cityName:String?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func doSomeWork() {
        // NOTE: Do the work
    
        self.loadLocation()
    }
    
}

extension JobCityWorker: CLLocationManagerDelegate {
    
    func loadLocation() {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.startUpdatingLocation()
        } else {
            
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocation = locations.last!
        self.lonLatToCity(location: currentLocation)
        manager.stopUpdatingLocation()
    }
    
    func lonLatToCity(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location){(placemarks, error) -> Void in
            if (error == nil) {
                let array = placemarks! as [CLPlacemark]
                
                if (array.count > 0){
                    
                    let pm = array[0]
                    var subThoroughtare:String = ""
                    var thoroughfare:String = ""
                    var subLocality:String = ""
                    var locality:String = ""
                    
                    if pm.subThoroughfare != nil {subThoroughtare = pm.subThoroughfare!}
                    if pm.thoroughfare != nil {thoroughfare = pm.thoroughfare!}
                    if pm.subLocality != nil {subLocality = pm.subLocality!}
                    if pm.locality != nil {locality = pm.locality!}
                    locality = locality.replacingOccurrences(of: "市", with: "")
//                    self.navigationItemView.cityTitle = locality
                    let userDefaults = UserDefaults.standard
                    userDefaults.setValue(locality, forKey: "City")
                    print("\(subThoroughtare) \(thoroughfare) \n \(subLocality) \n \(locality) \n ")
                }else{
                    print("No Placemarks!")
                }
            } else {
                print(error.debugDescription)
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        print(error?.localizedDescription ?? "")
    }
}

