//
//  ViewController.swift
//  KFImageViewer
//
//  Created by faisalazeez on 08/09/2018.
//  Copyright (c) 2018 faisalazeez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     * sample url as kingfisher Input source
     */
    let photo:[InputSource] = [KingfisherSource(urlString: "https://eoimages.gsfc.nasa.gov/images/imagerecords/84000/84214/bluemarble_2014090_xlrg.jpg")!,KingfisherSource(urlString: "https://picsum.photos/1024/1000")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callLIb()
    {
        let fullScreenController = FullScreenSlideshowViewController()
        fullScreenController.inputs = photo
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
        
        /*
        if let cell = tableView.cellForRow(at: indexPath), let imageView = cell.imageView {
            slideshowTransitioningDelegate = ZoomAnimatedTransitioningDelegate(imageView: imageView, slideshowController: fullScreenController)
            fullScreenController.transitioningDelegate = slideshowTransitioningDelegate
        }

        fullScreenController.slideshow.currentPageChanged = { [weak self] page in
            if let cell = tableView.cellForRow(at: IndexPath(row: page, section: 0)), let imageView = cell.imageView {
                self?.slideshowTransitioningDelegate?.referenceImageView = imageView
            }
        }
        */
        present(fullScreenController, animated: true, completion: nil)
    }
    @IBAction func action(_ sender: Any)
    {
        callLIb()
    }
}

