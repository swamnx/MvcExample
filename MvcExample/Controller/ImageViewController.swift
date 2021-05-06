//
//  ImageViewController.swift
//  MvcExample
//
//  Created by swamnx on 3.05.21.
//

import Foundation
import UIKit
class ImageViewController: UIViewController {

    @IBOutlet weak var versionImage: UIImageView!

    var imageToShow: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        versionImage.image = imageToShow
    }

}
