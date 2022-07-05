//
//  RecoverPasswordViewController.swift
//  CaraLibro
//
//  Created by user191299 on 7/1/22.
//
import UIKit
import Foundation
import Firebase

class RecoverPasswordViewController:UIViewController {

    @IBAction private func tap_Action(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var correoTextField: UITextField!
    @IBAction func CorreoText(_ sender: Any) {
    }
    
    @IBOutlet weak var EnviarBoton: UIButton!
    
    
    @IBAction func RecuperarContrasena(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: correoTextField.text!){
            (error) in if let error = error{
                let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            let alertController = UIAlertController(title: "Éxito", message: "Se le ha enviado un correo de recuperación", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
