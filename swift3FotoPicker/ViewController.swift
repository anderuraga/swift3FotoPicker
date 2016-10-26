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
    @IBOutlet var laberText: UILabel!
    
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
        
        let nombreImagen = "image-\(Date().timeIntervalSince1970).jpg"
        
        do {
           let imagenPath = getDocumnetsDirectory().appendingPathComponent(nombreImagen)
            
            //Las imagenes no se pueden guardar de forma directa, hay que trabajar a nivel de bytes con UIImageJPEGRepresentation
            if let jpegData = UIImageJPEGRepresentation(self.imagenFoto.image!, 0.8){
                try jpegData.write(to: imagenPath, options: [.atomicWrite])
            }
            laberText.text = "😁 Imagen guardada con exito"
            
            NSLog("Save Imagen \(nombreImagen) in path \(imagenPath)")
            
        }catch let error as NSError {
            NSLog("Error \(error): \(error.userInfo) ")
        }
        

        
    }
    
    
    //Retornamos la URL primera carpeta del usuario que encontremos
    func getDocumnetsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
