//
//  ViewController.swift
//  DGWaveViewSwift
//
//  Created by dzc on 2021/5/24.
//

import UIKit

class ViewController: UIViewController {


    
    lazy var backV: UIView = {
        let result = UIView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 200))
        result.backgroundColor = .yellow
        return result
    }()
    lazy var firstWave: DGWaveView = {
        let result = DGWaveView(frame:  CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200), wavaA: 10, waveX: 0, waveC: backV.frame.size.height/2, waveSpeed: CGFloat(0.2/Double.pi), waveColor: UIColor.red, waveOpacity: 0.6, waveLayerLineWidth: 2)
        return result
    }()
    lazy var secondWave: DGWaveView = {
        let result = DGWaveView(frame:  CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200), wavaA: 40, waveW: 0.5/15, waveX: 25,waveC: backV.frame.size.height/2, waveSpeed: CGFloat(0.15/Double.pi), waveColor: UIColor.green, waveOpacity: 0.4, waveLayerLineWidth: 1)
        return result
    }()
    lazy var thirdWave: DGWaveView = {
        let result = DGWaveView(frame:  CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200), wavaA: 16, waveX: 35, waveC: backV.frame.size.height/2, waveSpeed: CGFloat(0.15/Double.pi), waveColor: UIColor.purple, waveOpacity: 0.3, waveLayerLineWidth: 1)
        return result
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backV)
        backV.addSubview(firstWave)
        backV.addSubview(secondWave)
        backV.addSubview(thirdWave)
        
        

    }


}

