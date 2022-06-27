//
//  RegisterViewController.swift
//  CaraLibro
//
//  Created by user191299 on 6/27/22.
//

import UIKit
import SwiftUI

class RegisterViewController:UIViewController {

    
    @IBOutlet weak var nombreText: UITextField!
    
    @IBOutlet weak var apellidosText: UITextField!
    
    @IBOutlet weak var CorreoText: UITextField!
    
    @IBOutlet weak var contrasenaText: UITextField!
    @IBOutlet weak var IniciarSesion: UIButton!
    
    @IBOutlet weak var enviarButton: UIButton!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        IniciarSesion.setTitleColor(.green, for: .normal)
    }
   
}
	
