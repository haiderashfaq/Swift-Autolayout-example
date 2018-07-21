//
//  ViewController.swift
//  Swift autolayout example
//
//  Created by Haider Ashfaq on 21/07/2018.
//  Copyright © 2018 Haider Ashfaq. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

class ViewController: UIViewController {
    
    // MARK: - UI (created programatically)
    
    let containingView: UIView = {
        let view = UIView.newAutoLayout()
        view.backgroundColor = UIColor.black
        return view
    }()

    let imageView1: UIImageView = {
        let imageView = UIImageView(image:  UIImage(named:"test-image")?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let imageView2: UIImageView = {
        let imageView = UIImageView(image:  UIImage(named:"test-image2")?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = UIColor.white
        label.text = "Hello I am a label"
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let body: UILabel = {
        let label = UILabel.newAutoLayout()
        label.textColor = UIColor.white
        label.text = "Lorem ipsum dolor sit amet, ad dicit verear inciderint vis, ut sit ignota probatus. Te munere tamquam accumsan vel. Probo nullam has cu. Mollis complectitur ei pro. An pro sint utamur voluptatibus, ex semper laoreet cum, aeque doctus accusam eu vel. Tacimates suavitate ut vim, ei dolores epicurei sed. Has facilis detraxit ne, ea mel simul dictas definiebas."
        label.font = UIFont.boldSystemFont(ofSize: 15.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(containingView)
        containingView.autoPinEdgesToSuperviewEdges() // pin containing view to top, left, bottom and right of VC view
        
        // Add subviews to containing view
        containingView.addSubview(imageView1)
        containingView.addSubview(imageView2)
        containingView.addSubview(label)
        containingView.addSubview(body)
        
        // Position subviews using autolayout via the purelayout helper functions created in 'UIView+AppUIBuilder.swift'
        imageView1.autoPinEdge(toSuperviewEdge: .top, withInset: 20.0)
        imageView1.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        
        imageView2.autoAlignAxis(.horizontal, toSameAxisOf: imageView1)
        imageView2.autoPinEdge(.left, to: .right, of: imageView1, withOffset: 0.0)
        imageView2.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
        
        label.appPinBelowLast(imageView1, inset: 40.0)
        label.autoAlignAxis(toSuperviewAxis: .vertical)
        
        body.appPinBelowLast(label, inset: 20.0)
        body.autoAlignAxis(toSuperviewAxis: .vertical)
        body.autoPinEdge(toSuperviewEdge: .left, withInset: 10.0)
        body.autoPinEdge(toSuperviewEdge: .right, withInset: 10.0)
    }
}

