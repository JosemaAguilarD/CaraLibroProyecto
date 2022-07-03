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
    }
    
    override func viewDidLoad() {
             super.viewDidLoad()
         }
  
    
  /*  enum ProviderType: String {
           case basic
       }
       
       @IBOutlet weak var nombreText: UITextField!
       @IBOutlet weak var apellidoText: UITextField!
       @IBOutlet weak var botonLogueo: UIButton!
 
   
   */
         
      //   @IBAction func logearActionButon(_ sender: Any) {
        //     if let apellido = apellidoText.text, let nombre = nombreText.text{
          //       Auth.auth().createUser(withEmail: apellido, password: nombre){
            //         (result, error) in
              //       if let result = result, error == nil{
                //         print("todo bien")
                  //   } else {
                      //   let alertController = UIAlertController(title:"Error", message: "Se ha producido un error", preferredStyle: .alert); alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                       //  self.present(alertController, animated: true, completion: nil)
                //     }
                // }
            // }
             
        // }
       /*  enum AuthenticationSheetView: String, Identifiable{
             case register
             case login
             
             
             var id: String{
                 return rawValue
             }
*/
}
//}

