//
//  ViewController.swift
//  IOS_Assignment_Image_Viewer
//
//  Created by user202404 on 11/12/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, AddingPictureProtocol{

    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var pictureName: UIPickerView!
    
    var manager:pictureManager = pictureManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllPictures().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllPictures()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let data = try? Data(contentsOf: URL(string: self.manager.getAllPictures()[row].url)!)
            DispatchQueue.main.async {
                self.pictureView.image = UIImage(data: data!)
            }
        }
    }
    
    func controllerDidFinishWithNewPicture(p: picture) {
        manager.addNewPicture(n: p)
        pictureName.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let apvc = segue.destination as!addNewImageViewController
        apvc.delegate = self
    }
    
}

