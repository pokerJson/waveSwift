//
//  DGWaveView.swift
//  DGWaveViewSwift
//
//  Created by dzc on 2021/5/24.
//

import UIKit

class DGWaveView: UIView {

    private lazy var waveLayer: CAShapeLayer = {
        let result = CAShapeLayer()
        result.fillColor = UIColor.clear.cgColor
        result.strokeStart = 0.0
        result.strokeEnd = 1.0
        return result
    }()
    private lazy var wavesDisplayLink: CADisplayLink = {
        let result = CADisplayLink(target: self, selector: #selector(getCurrentWave(disLink:)))
       return result
    }()
    @objc func getCurrentWave(disLink:CADisplayLink) {
        waveX += waveSpeed
        setCurrentWaveLayerPath()
    }
    private func setCurrentWaveLayerPath() {
        let path = CGMutablePath()
        var y: CGFloat = self.waveC
        path.move(to: CGPoint(x: 0, y: y))
        let width = Int(waveWidth)
        for i in 0...width {
            //正弦函数波浪公式
            y = waveA * sin(waveW * CGFloat(i) + waveX) + waveC
            //连线
            path.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
        }
        waveLayer.path = path
    }
    private var waveA: CGFloat
    private var waveW: CGFloat
    private var waveX: CGFloat
    private var waveC: CGFloat
    private var waveSpeed: CGFloat
    private var waveWidth: CGFloat
    private var waveColor: UIColor
    private var waveOpacity: CGFloat
    private var waveLayerLineWidth: CGFloat //线的宽带
   
    init(frame: CGRect, wavaA: CGFloat = 10, waveW: CGFloat = 0.5/10.0, waveX: CGFloat = 0, waveC: CGFloat,waveSpeed: CGFloat = CGFloat(0.5/Double.pi), waveColor: UIColor = .red, waveOpacity: CGFloat = 1.0, waveLayerLineWidth: CGFloat = 1.0) {
        self.waveA = wavaA
        self.waveW = waveW
        self.waveX = waveX
        self.waveC = waveC
        self.waveSpeed = waveSpeed
        self.waveWidth = frame.size.width
        self.waveColor = waveColor
        self.waveOpacity = waveOpacity
        self.waveLayerLineWidth = waveLayerLineWidth
        
        super.init(frame: frame)

        createWave()
        self.backgroundColor = .clear
        self.layer.masksToBounds = true

    }
    private func createWave() {
        self.waveLayer.lineWidth = waveLayerLineWidth
        layer.addSublayer(waveLayer)

        //边缘线颜色
        waveLayer.strokeColor = waveColor.cgColor
        waveLayer.opacity = Float(waveOpacity)
        
        //定时器加到runloop中
        wavesDisplayLink.add(to: .main, forMode: .common)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        wavesDisplayLink.invalidate()
    }
    

}
