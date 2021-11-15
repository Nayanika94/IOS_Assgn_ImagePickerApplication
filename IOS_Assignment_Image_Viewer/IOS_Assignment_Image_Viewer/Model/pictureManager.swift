//
//  pictureManager.swift
//  IOS_Assignment_Image_Viewer
//
//  Created by user202404 on 11/12/21.
//

import Foundation

class pictureManager
{
    private var picturelist = [picture]()
    
    func addNewPicture(n:picture)
    {
        picturelist.append(n)
    }
    
    func getAllPictures()->[picture]{
        return picturelist
    }
}
