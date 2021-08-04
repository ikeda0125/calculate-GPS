//
//  ViewController.swift
//  calculate-GPS
//
//  Created by 池田佳弘 on 2021/07/24.
//  https://qiita.com/ymiz/items/b00c4da44070a66c8445

import UIKit
import CoreLocation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //現在地
        let now_latitude: Double = 135.52
        let now_longitude: Double = 34.68
        
        //行先
        let goal_latitude: Double = 138.52
        let goal_longitude: Double = 34.69
        
        let now_location: CLLocation = CLLocation(latitude: now_latitude, longitude: now_longitude)
        let goal_location: CLLocation = CLLocation(latitude: goal_latitude, longitude: goal_longitude)
        
        if goal_latitude == now_latitude, goal_longitude == now_longitude{
            print("You and Your partner are same location now")
        }else{
            // meter単位で地球に沿った円弧の長さを取得。高度の違いは計測しない。
            let dist: CLLocationDistance = goal_location.distance(from: now_location)
            
            // ある一定の距離以上(約230km）離れると距離が0.0になるため、その対策。
            if dist == 0.0{
                print("距離計算エラー")
            }else{
                print(String(format: "The distance to my buddy is %.01fm", dist))
                //print(dist)
            }
        }

    }
}

