//
//  ViewController.swift
//  swift3FotoPicker
//
//  Created by Spot Matic SL on 26/10/16.
//  Copyright © 2016 Spot Matic SL. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imagenFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagenButtonClicked(_ sender: UIBarButtonItem) {
        NSLog("Abrir selector de Fotos")
        
        //llamar controlador de ImagenPicker
        let vc = UIImagePickerController()
        vc.modalPresentationStyle = .formSheet  //estilo modal
        vc.delegate = self                      //delegado nuestro ViewController
        
        //presentar controlador
        navigationController?.present(vc, animated: true, completion: nil)
   
    }
    
    
    @IBAction func saveButtonClicked(_ sender: UIBarButtonItem) {
        NSLog("Guardar Imagen")
    }
    
    
    
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagen = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.imagenFoto.image = imagen
        }
        
        //cerrar controlador
        picker.dismiss(animated: true, completion: nil)
    }

}
