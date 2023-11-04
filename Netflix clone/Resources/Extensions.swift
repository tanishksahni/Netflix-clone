//
//  Extensions.swift
//  Netflix clone
//
//  Created by Tanishk Sahni on 05/11/23.
//

import Foundation
import UIKit


extension String  {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}



// this extension is for the Netflix logo in the navigataion bar
extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}
