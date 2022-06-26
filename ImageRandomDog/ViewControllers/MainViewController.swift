//
//  ViewController.swift
//  ImageRandomDog
//
//  Created by Daniil Oreshenkov on 26.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activiryIndicator: UIActivityIndicatorView!
    
    var model: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activiryIndicator.startAnimating()
        fetchData()
    }
    
    
    @IBAction func showRandomImage() {
        fetchData()
    }
    
    private func fetchData() {
        let url = Link.url.rawValue
        
        NetworkManager.shared.fetchData(from: url) { result in
            switch result {
            case .success(let model):
                self.model = model
                guard let imageData = NetworkManager.shared.fetchImage(from: model.url) else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.activiryIndicator.isHidden = true
                    self.activiryIndicator.stopAnimating()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

