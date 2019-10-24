//
//  imageExtension.swift
//  thrive
//
//  Created by Mitch on 24/10/2019.
//  Copyright © 2019 Mitch. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
extension UIImageView{
    func imageFromUrl(url : String){
        if let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let _ = NSURL(string: urlString) {
            Alamofire.request(urlString).responseImage { response in
                if let image = response.result.value {
                    self.image = image.af_imageAspectScaled(toFill: CGSize(width: 72.0, height: 72.0))
                }
            }
        }
    }
}

