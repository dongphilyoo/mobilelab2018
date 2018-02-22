//
//  ViewController.swift
//  dragdrop
//
//  Created by Dongphil Yoo on 2/6/18.
//  Copyright © 2018 dongphilyoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        reorderCollectionView.addGestureRecognizer(longPressGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



fileprivate var longPressGesture: UILongPressGestureRecognizer!


func handleLongGesture(gesture: UILongPressGestureRecognizer) {
    switch(gesture.state) {
        
    case .began:
        guard let selectedIndexPath = reorderCollectionView.indexPathForItem(at: gesture.location(in: reorderCollectionView)) else {
            break
        }
        reorderCollectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
    case .changed:
        reorderCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
    case .ended:
        reorderCollectionView.endInteractiveMovement()
    default:
        reorderCollectionView.cancelInteractiveMovement()
    }
}
