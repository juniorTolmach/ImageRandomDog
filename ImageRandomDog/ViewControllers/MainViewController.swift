//
//  ViewController.swift
//  ImageRandomDog
//
//  Created by Daniil Oreshenkov on 26.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var model: Model?
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchData(from: Link.url.rawValue) { result in
            switch result {
            case .success(let model):
                self.model = model
                guard let imageData = NetworkManager.shared.fetchImage(from: model.url) else { return }
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

