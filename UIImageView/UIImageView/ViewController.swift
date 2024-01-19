//
//  ViewController.swift
//  UIImageView
//
//  Created by Jefferson Alves on 16/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLoginLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var titleLogin: UILabel!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Config Labels
        titleLoginLabel.textColor = .black
        userLabel.textColor = .black
        passwordLabel.textColor = .black
        titleLoginLabel.resignFirstResponder()
        
        // Config Button
        loginButton.tintColor = .systemGreen
        view.backgroundColor = .white
        loginButton.isEnabled = false
        
        // Config ImageView
        logoImageView.image = UIImage(named: "cefTest")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.resignFirstResponder()
        
        //Config TextField
        userTextField.keyboardType = .default
        passwordTextField.keyboardType = .decimalPad
        passwordTextField.isSecureTextEntry = true
        
        //UITextFieldDelegate
        userTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    func validarTextField() {
        
        if userTextField.text != "" && passwordTextField.text != "" {
            
            loginButton.isEnabled = true
            print("Login realizado!")
        }else{
            
            loginButton.isEnabled = false
            print("Opa! algo de errado não está certo!")

        }
    }
        
    @IBAction func tappedLoginButton(_ sender: Any) {
        self.validarTextField()
        print(userTextField.text ?? "")
        print(passwordTextField.text ?? "")
        print("Dados coletados!======================")
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        self.validarTextField()
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        
        if textField.text != ""{
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.borderWidth = 0
            
        }else{
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 2
            
        }
        self.validarTextField()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        
        return true
    }
}
