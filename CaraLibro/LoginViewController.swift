//
//  LoginViewController.swift
//  CaraLibro
//
//  Created by user19129
import UIKit
import FirebaseAnalytics
import FirebaseAuth
enum ProviderType: String{
    case basic
}
class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contrasenaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBAction private func tap_Action(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    

    @IBAction func LoginButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let contrasena = contrasenaTextField.text{
            Auth.auth().signIn(withEmail: email, password: contrasena) { (result, error) in
                
                if let result = result, error == nil{
                
                    let alertController = UIAlertController(title: "Logueado", message: "Se ha logueado correctamente", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        emailTextField.text = ""
        contrasenaTextField.text = ""
    }
    
    override func viewDidLoad() {
             super.viewDidLoad()
         }
  
  
}

