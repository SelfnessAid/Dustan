//
//  CameraViewController.swift
//  Dustan
//
//  Created by Mobile Star on 26/04/17.
//  Copyright © 2017 Mobile Star. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var url: String = ""

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
    }
    
    func loadImage() {
        let imageURL = URL(string: "http://52.56.190.147/" + url)!
        let session = URLSession(configuration: .default)
        let downloadTask = session.dataTask(with: imageURL) { (data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    self.imageView.image = image
                } else {
                    
                }
            } else {
            }
        }
        downloadTask.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backBtn_Click(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
