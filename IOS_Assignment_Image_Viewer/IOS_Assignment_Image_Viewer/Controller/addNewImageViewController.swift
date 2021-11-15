//
//  addNewImageViewController.swift
//  IOS_Assignment_Image_Viewer
//
//  Created by user202404 on 11/12/21.
//


import UIKit

protocol AddingPictureProtocol {
    func controllerDidFinishWithNewPicture(p:picture)
    func controllerDidCancel()
}

    
class addNewImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var delegate:AddingPictureProtocol?
    @IBOutlet weak var pictureName: UITextField!
    @IBOutlet weak var pictureUrl: UITextField!
    
    
    @IBAction func AddClicked(_ sender: Any) {
        if let name = pictureName.text{
            if let url = pictureUrl.text{
                if !name.isEmpty && !url.isEmpty{
                    let newPicture = picture(a: name, b: url)
                    delegate?.controllerDidFinishWithNewPicture(p: newPicture)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func CancelClicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
}
