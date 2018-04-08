//
//  DetailViewController.swift
//  Assignment2
//
//  Created by Upananda Saha on 2018-04-07.
//  Copyright © 2018 Upananda Saha. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var webView: UIWebView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail["url"].stringValue
                if let url = URL(string: detail["url"].stringValue)
                {
                    let request = URLRequest(url: url)
                    webView.loadRequest(request)
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: JSON? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

