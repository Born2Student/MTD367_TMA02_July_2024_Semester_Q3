//
//  CameraPhootsViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 13/9/24.
//

import UIKit

class CameraPhotosViewController: UIViewController {
    
    @IBOutlet weak var imageFrame: UIImageView!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var photoGalleryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        imageFrame.backgroundColor = .secondarySystemBackground
        
        cameraButton.backgroundColor = .systemBlue
        
        cameraButton.setTitle("Camera", for: .normal)
        
        cameraButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTapButton () 
    {
        let picker = UIImagePickerController()
        
        picker.sourceType = .camera
        
        picker.allowsEditing = true
        
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    
    @IBAction func photoGalleryDidTapButton ()
    {
        let vc = UIImagePickerController()
        
        vc.sourceType = .photoLibrary
        
        vc.delegate = self
        
        vc.allowsEditing = true
        
        present(vc, animated: true)
    }
    
}


extension CameraPhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) 
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) 
    {
//        print("\(info)")
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        imageFrame.image = image
        
        if let image_2 = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageFrame.image = image_2
        }
    }
    
    
}




