//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Dusan Orescanin on 36/01/2021.
//

import UIKit

final class QuestionView: UIView {

    // MARK: - Outlets

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!

    // MARK: - Properties

    enum Style {
        case correct, incorrect, standard
    }

    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }

    var title = "" {
        didSet {
            label.text = title
        }
    }

    // MARK: - Privates

    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200.0/255.0, green: 236.0/255.0, blue: 160.0/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Correct")
            icon.isHidden = false
        case .incorrect:
            backgroundColor = UIColor(red: 243.0/255.0, green: 135.0/255.0, blue: 148.0/255.0, alpha: 1)
            icon.image = #imageLiteral(resourceName: "Icon Error")
            icon.isHidden = false
        case .standard:
            backgroundColor = UIColor(red: 191.0/255.0, green: 196.0/255.0, blue: 201.0/255.0, alpha: 1)
            icon.isHidden = true
        }
    }
}
