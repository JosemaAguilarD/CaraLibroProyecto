//
//  RegisterViewController.swift
//  CaraLibro
//
//  Created by user191299 on 6/27/22.
//

import UIKit
import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController:UIViewController {

    @IBAction private func tap_Action(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var nombreText: UITextField!
    
    @IBOutlet weak var apellidosText: UITextField!
    
    @IBOutlet weak var CorreoText: UITextField!
    
    @IBOutlet weak var contrasenaText: UITextField!
    @IBOutlet weak var IniciarSesion: UIButton!
    
    @IBOutlet weak var enviarButton: UIButton!
    
    private let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        
      
    }
   
    @IBAction func RegistrarUsuario(_ sender: Any) {
        view.endEditing(true)
        
        db.collection("usuarios").document(CorreoText.text ?? "").setData(["email":CorreoText.text ?? "","nombre":nombreText.text ?? "", "apellido":apellidosText.text ?? "", "contraseña":contrasenaText.text ?? "", "imagenPerfil": "" ])
        
        if let email = CorreoText.text, let contrasena = contrasenaText.text{
            Auth.auth().createUser(withEmail: email, password: contrasena) { (result, error) in
                
                if let result = result, error == nil{
                
                    let alertController = UIAlertController(title: "Éxito", message: "Se ha registrado correctamente", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                    
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        nombreText.text = ""
        apellidosText.text = ""
        CorreoText.text = ""
        contrasenaText.text = ""
        
    }
}
	
