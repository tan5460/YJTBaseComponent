//
//  YJTCoverTestViewController.swift
//  YJTBaseComponent
//
//  Created by YJ-T on 2022/1/17.
//

import UIKit

class YJTCoverTestViewController: YJTBaseViewController {
    
    class override func description() -> String {
        return "YJCover"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = YJTCoverTestViewController.description()
        
        let coverView = Bundle.main.loadNibNamed("YJTCoverAlertView", owner: self, options: nil)?.first as? YJTCoverAlertView
        view.addSubview(coverView!)
        coverView?.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.width.equalTo(300)
            make.height.equalTo(300)
        }
    }

}

class YJTCoverAlertView: UIView {
    
    @IBOutlet weak var maskSegment: UISegmentedControl!
    
    @IBOutlet weak var positionSegment: UISegmentedControl!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        var maskType = YJTCoverMaskStyle.none
        switch maskSegment.selectedSegmentIndex {
        case 1:
            maskType = .color(.init(white: 0, alpha: 0.2))
        case 2:
            maskType = .blur
        default:
            break
        }
        
        var position = YJTCoverPosition.center
        var frame = CGRect.zero
        switch positionSegment.selectedSegmentIndex {
        case 0:
            position = .top
            frame = CGRect(x: 0, y: 20, width: kScreenWidth, height: 300)
        case 1:
            position = .left
            frame = CGRect(x: 0, y: 100, width: kScreenWidth*0.5, height: 300)
        case 2:
            position = .center
            frame = CGRect(x: 50, y: kScreenHeight*0.5 - 150, width: kScreenWidth - 100, height: 300)
        case 3:
            position = .right
            frame = CGRect(x: kScreenWidth*0.5, y: 200, width: kScreenWidth*0.5, height: 300)
        case 4:
            position = .bottom
            frame = CGRect(x: 0, y: kScreenHeight - 320, width: kScreenWidth, height: 300)
        default:
            break
        }
        
        if let coverView = Bundle.main.loadNibNamed("YJTCoverAlertView", owner: self, options: nil)?.first as? YJTCoverAlertView {
            coverView.frame = frame
            YJTCover.showCover(coverView, position: position, maskStyle: maskType)
        }
        
        
    }
}



