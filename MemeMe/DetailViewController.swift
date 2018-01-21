//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Ben Juhn on 7/9/17.
//  Copyright © 2017 Ben Juhn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var meme: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = meme.memedImage
    }
    
}
