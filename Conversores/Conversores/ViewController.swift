//
//  ViewController.swift
//  Conversores
//
//  Created by Rafael Hartmann on 24/02/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfValue:UITextField!
    
  
    @IBOutlet weak var lbInicial: UILabel!
    @IBOutlet weak var btTwo: UIButton!
    @IBOutlet weak var btOne: UIButton!
    
    @IBOutlet weak var tfResposta: UILabel!
    
    @IBOutlet weak var lbResult: UILabel!
    
    
    
    @IBAction func showNext(_ sender: UIButton) {
        
        switch lbInicial.text!{
            case "Temperatura":
                lbInicial.text = "Peso"
                
                btOne.setTitle("Kilograma", for: .normal);
                
                btTwo.setTitle("Libras", for: .normal);
            
        case "Peso":
            lbInicial.text = "Moeda"
            btOne.setTitle("Real", for: .normal);
            btTwo.setTitle("Dólar", for: .normal);
            
        case "Moeda":
            lbInicial.text = "Distância"
            btOne.setTitle("Metro", for: .normal);
            btTwo.setTitle("Kiloometro", for: .normal);
           
        default:
            lbInicial.text = "Temperatura"
            btOne.setTitle("Celsius", for: .normal)
            btTwo.setTitle("Fahrenheit", for: .normal)
        }
        convert(nil)
    }
        
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btOne {
                btTwo.alpha = 0.5
            }else{
                
                btOne.alpha = 0.5
                
            }
            
            sender.alpha = 1
        }
        switch lbInicial.text!{
        case "Temperatura":
            calculaTemp()
                
        case "Peso":
            calculaPeso()
            
        case "Moeda":
            calculaMoeda()
           
        default:
            calculaDistancia()
        }
        view.endEditing(true)
        let result = Double(tfResposta.text!)!
        tfResposta.text = String(format: "%.2f", result)
        
    }
    
    func calculaDistancia(){
        guard let distance = Double(tfValue.text!) else {return}
        
        if btOne.alpha == 1.0 {
            lbResult.text = "Kilometro"
            tfResposta.text = String(distance / 1000.0)
        }
        else {
            lbResult.text = "Metros"
            tfResposta.text = String(distance * 1000.0)
            
            
        }
        
    }
    
    func calculaMoeda(){
        guard let currency = Double(tfValue.text!) else {return}
        
        if btOne.alpha == 1.0 {
            lbResult.text = "Dólar"
            tfResposta.text = String(currency * 5.3)
        }
        else {
            lbResult.text = "Real"
            tfResposta.text = String(currency / 5.3)
            
            
        }
        
    }
    func calculaPeso(){
        guard let weight = Double(tfValue.text!) else {return}
        
        if btOne.alpha == 1.0 {
            lbResult.text = "Libra"
            tfResposta.text = String(weight / 2.2046)
        }
        else {
            lbResult.text = "Kilograma"
            tfResposta.text = String(weight * 2.2046)
            
            
        }}
    func calculaTemp(){
        
        guard let temperature = Double(tfValue.text!) else {return}
        
        if btOne.alpha == 1.0 {
            lbResult.text = "Fahrenheit"
            tfResposta.text = String(temperature * 1.8 + 32.0)
        }
        else {
            lbResult.text = "Celsius"
            tfResposta.text = String((temperature - 32.0) / 1.8)
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

