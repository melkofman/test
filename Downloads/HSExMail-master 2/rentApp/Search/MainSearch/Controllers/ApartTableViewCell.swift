//
//  ApartTableViewCell.swift
//  TestAirbnb
//
//  Created by Тагир Ракипов on 10.11.2020.
//

import UIKit

class ApartTableViewCell: UITableViewCell {
    
    var apartImageView = UIImageView()
    var descriptionLabel = UILabel()
    let imageMultiplier: Float = 16/9
    let defaultImageName = "house"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(apartImageView)
        addSubview(descriptionLabel)
        
        configureApartImageView()
        setImageConstraints()
        
        configureDescriptionLabel()
        setDescriptionLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(apartment: ApartmentModel) {
        apartImageView.image = apartment.image ?? UIImage(named: defaultImageName)
        descriptionLabel.text = "City: \(apartment.city)\nAddress:  \(apartment.address)"
    }
}

//Configuring Image view and adding constraints to it
extension ApartTableViewCell {
    
    func configureApartImageView() {
        apartImageView.layer.cornerRadius = 10
        apartImageView.clipsToBounds = true
    }
    
    func setImageConstraints() {
        apartImageView.translatesAutoresizingMaskIntoConstraints = false
        apartImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        apartImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        apartImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        apartImageView.widthAnchor.constraint(equalTo: apartImageView.heightAnchor, multiplier: CGFloat(imageMultiplier)).isActive = true
    }
}

//Configuring City label and adding constraints to it
extension ApartTableViewCell {
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: apartImageView.trailingAnchor, constant: 20).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
