//
//  TitleTableViewCell.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 10/11/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleTableViewCell"
    
    private let playTitlesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints.false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitlesButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let titlesPosterUIImageViewConstraints = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: model.posterURL) else {
            return
        }
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
