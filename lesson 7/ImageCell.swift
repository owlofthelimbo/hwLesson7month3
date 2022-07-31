import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        
        backgroundColor = .gray
        layer.borderWidth = 1
        layer.cornerRadius = 15
        
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        image.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        image.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 5).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }
    
    @objc func addBusket() {

        

    }
}
