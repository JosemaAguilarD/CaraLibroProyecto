//
//  LoginViewController.swift
//  CaraLibro
//
//  Created by user191299 on 6/23/22.
//
import SwiftUI
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController{
    @IBAction private func tap_Action(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    enum ProviderType: String {
           case basic
       }
       
       @IBOutlet weak var nombreText: UITextField!
       @IBOutlet weak var apellidoText: UITextField!
       @IBOutlet weak var botonLogueo: UIButton!
 
    override func viewDidLoad() {
             super.viewDidLoad()
         }
         
         @IBAction func logearActionButon(_ sender: Any) {
             if let apellido = apellidoText.text, let nombre = nombreText.text{
                 Auth.auth().createUser(withEmail: apellido, password: nombre){
                     (result, error) in
                     if let result = result, error == nil{
                         print("todo bien")
                     } else {
                         let alertController = UIAlertController(title:"Error", message: "Se ha producido un error", preferredStyle: .alert); alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                         self.present(alertController, animated: true, completion: nil)
                     }
                 }
             }
             
         }
         enum AuthenticationSheetView: String, Identifiable{
             case register
             case login
             
             
             var id: String{
                 return rawValue
             }

}
}
