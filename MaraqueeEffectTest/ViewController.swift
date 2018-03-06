//
//  ViewController.swift
//  MaraqueeEffectTest
//
//  Created by Moon on 2018/3/6.
//  Copyright © 2018年 Moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let string = "臣亮言：先帝創業未半，而中道崩殂，今天下三分，益州疲敝，此誠危急存亡之秋也。然侍衞之臣不懈於內，忠志之士忘身於外者，蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣，不宜妄自菲薄，引喻失義，以塞忠諫之路也。"
        
        let  marquee = MarqueeView(frame: CGRect(x: 10, y: 64, width: self.view.bounds.size.width-20, height: 44), title: string)
        
        self.view.addSubview(marquee)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

