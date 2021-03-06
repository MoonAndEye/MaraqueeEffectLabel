//
//  MaraqueeEffect.swift
//  MaraqueeEffectTest
//
//  Created by Moon on 2018/3/6.
//  Copyright © 2018年 Moon. All rights reserved.
//

import UIKit

class MarqueeView: UIView {
    
    private var marqueeTitle:String?
    private var mark1:CGRect!
    private var mark2:CGRect!
    //    var bgColor: UIColor?
    //    var textColor: UIColor?
    private var labArr = [UILabel]()
    private var isStop = false
    private var timeInterval1: TimeInterval!
    
    convenience init(frame: CGRect, title: String) {
        
        self.init(frame: frame)
        marqueeTitle = " \(title) "
        self.backgroundColor = UIColor.black
        self.clipsToBounds = true
        timeInterval1 = TimeInterval(marqueeTitle!.count/5)
        
        let lab = UILabel()
        lab.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        lab.textColor = UIColor.red
        lab.font = UIFont.boldSystemFont(ofSize: 14.0)
        lab.text = marqueeTitle
        
        //计算textLab的大小
        let sizeOfText = lab.sizeThatFits(CGSize(width: 0, height: 0))
        mark1 = CGRect(x: 0, y: 0, width: sizeOfText.width, height: self.bounds.size.height)
        mark2 = CGRect(x: mark1.origin.x+mark1.size.width, y: 0, width: sizeOfText.width, height: self.bounds.size.height)
        lab.frame = mark1
        self.addSubview(lab)
        labArr.append(lab)
        
        let useReserve = sizeOfText.width > frame.size.width ? true : false
        
        if useReserve == true {
            
            let reserveTextLb = UILabel(frame: mark2)
            reserveTextLb.textColor = UIColor.red
            reserveTextLb.font = UIFont.boldSystemFont(ofSize: 14.0)
            reserveTextLb.text = marqueeTitle;
            self.addSubview(reserveTextLb)
            
            labArr.append(reserveTextLb)
            
            self.labAnimation()
        }
        
        
    }
    
    //跑马灯动画
    func labAnimation() {
        if (!isStop) {
            let lbindex0 = labArr[0]
            let lbindex1 = labArr[1]
            
            UIView.transition(with: self, duration: timeInterval1, options: UIViewAnimationOptions.curveLinear, animations: {
                
                lbindex0.frame = CGRect(x: -self.mark1.size.width, y: 0, width: self.mark1.size.width, height: self.mark1.size.height)
                lbindex1.frame = CGRect(x: lbindex0.frame.origin.x+lbindex0.frame.size.width, y: 0, width: lbindex1.frame.size.width, height: lbindex1.frame.size.height)
                
            }, completion: { finished in
                lbindex0.frame = self.mark2
                lbindex1.frame = self.mark1
                self.labArr[0] = lbindex1
                self.labArr[1] = lbindex0
                self.labAnimation()
            })
            
        } else {
            
            self.layer.removeAllAnimations()
        }
        
    }
    
    func start() {
        isStop = false
        let lbindex0 = labArr[0]
        let lbindex1 = labArr[1]
        
        lbindex0.frame = mark2;
        lbindex1.frame = mark1;
        self.labArr[0] = lbindex1
        self.labArr[1] = lbindex0
        self.labAnimation()
        
    }
    
    func stop() {
        isStop = true
        self.labAnimation()
    }
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    
}
