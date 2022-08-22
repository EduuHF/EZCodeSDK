//
//  ExUIImageView.swift
//  iPokemon
//
//  Created by Edu on 03/08/22.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {

    private func buildNukeOp() -> ImageLoadingOptions {
        return ImageLoadingOptions(placeholder: UIImage(named: "PokeEgg_IC"),
                                   transition: .fadeIn(duration: 0.50),
                                   failureImage: UIImage(named: "PokeEgg_IC"),
                                   failureImageTransition: .fadeIn(duration: 0.50))
    }

    func loadIMG(url: String?) {

        guard let urlString = url else {
            self.setDefaultPlaceholder()
            return
        }
        guard let imgURL = URL.init(string: urlString) else {
            self.setDefaultPlaceholder()
            return
        }

        Nuke.loadImage(with: imgURL,
                       options: self.buildNukeOp(),
                       into: self)
    }

    func setDefaultPlaceholder() {
        self.image = UIImage(named: "PokeEgg_IC")
    }
}
