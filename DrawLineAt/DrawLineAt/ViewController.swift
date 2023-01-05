//
//  ViewController.swift
//  DrawLineAt
//
//  Created by Walter J on 2022/09/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cameraBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cameraBtn.layer.borderColor = UIColor.black.cgColor
        self.cameraBtn.layer.borderWidth = 1.0
        self.cameraBtn.layer.cornerRadius = 10
        self.cameraBtn.layer.masksToBounds = true
        
        //Top
        drawLineAtTopOfTextView()
        
        //Left and Right
        drawLineAtLeftAndRightOfTextField()
        
        //Bottom
        drawLineAtBottomOfLabel()
    }

    func drawLineAtTopOfTextView() {
        self.textView.layer.drawLineAt(
            edges: [.top],
            color: UIColor.red,
            width: 5.0
        )
    }
    
    func drawLineAtLeftAndRightOfTextField() {
        self.textField.layer.drawLineAt(
            edges: [.left, .right],
            color: UIColor.brown,
            width: 5.0
        )
    }
    

    func drawLineAtBottomOfLabel() {
        self.label.layer.drawLineAt(
            edges: [.bottom],
            color: UIColor.black,
            width: 5.0
        )
    }
}

extension CALayer {
    func drawLineAt(edges:[UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in edges {
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(
                    x: 0,
                    y: 0,
                    width: bounds.width,
                    height: width
                )
            case UIRectEdge.bottom:
                border.frame = CGRect.init(
                    x: 0,
                    y: frame.height-width,
                    width: bounds.width,
                    height: width
                )
            case UIRectEdge.left:
                border.frame = CGRect.init(
                    x: 0,
                    y: 0,
                    width: width,
                    height: bounds.height
                )
            case UIRectEdge.right:
                border.frame = CGRect.init(
                    x: frame.width-width,
                    y: 0,
                    width: width,
                    height: bounds.height
                )
            default:
                break
            }
            
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}
