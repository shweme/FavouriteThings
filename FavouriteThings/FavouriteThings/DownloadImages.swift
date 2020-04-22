//
//  DownloadImages.swift
//  FavouriteThings
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import Foundation
import SwiftUI

/*takes the image URL as a String and tries to convert it into an Image
* If it fails at any stage, the Default image is displayed (need to work on
* returning user-legible error messages
*/

func imgDownload(_ img: String) -> Image {
    
    //convert String to a URL
    guard let imgUrl = URL(string: img) else {
        print("Invalid URL, try another one.")
        return (Image("Default"))
    }
    
    //download URL data
    guard let imgData = try? Data(contentsOf: imgUrl) else {
        print("Faulty image, try again.")
        return (Image("Default"))
    }
    
    //convert data into a UIImage
    guard let uiImg = UIImage(data: imgData) else {
        print("Could not convert, check URL and try again.")
        return (Image("Default"))
    }
    
    //convert the UIImage into an Image
    let downloadedImg = Image(uiImage: uiImg)
    return downloadedImg
}

