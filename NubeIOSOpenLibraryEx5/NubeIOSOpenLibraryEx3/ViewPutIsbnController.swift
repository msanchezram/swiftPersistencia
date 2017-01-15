//
//  ViewPutIsbnController.swift
//  NubeIOSOpenLibraryEx3
//
//  Created by Marcos on 1/1/17.
//  Copyright © 2017 MSR. All rights reserved.
//

import UIKit

class ViewPutIsbnController: UIViewController {

    //var searchIsbn=""
    var libros : ListaIsbn?
    
    @IBOutlet weak var textIsbn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let tmpIsbnVacio =  self.textIsbn.text?.isEmpty
        
        //let tmpIsbnExist = self.existsISBN(isbnToFind: textIsbn.text!)
        //let tmpIsbnExist = existeIsbnInList(isbnToFind: textIsbn.text!, aListaLibros: (self.libros?.libros)!)
        
        if (tmpIsbnVacio )! { ///|| tmpIsbnExist  {
            var msg = ""//textIsbn.text!
            
            //if (tmpIsbnVacio!) {
                msg = "Es necesario informar un ISBN"
           // } else {
            //    msg = "El codigo ISBN \(msg) ya existe en la lista.\nPor favor introduzca otro"
            //}
            
            let alertController = UIAlertController(title: "Error", message:
                msg, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            
            //self.libros?.libros.append(self.textIsbn.text!)
            //self.tableView.reloadData()
            
            let vDetalleIsbn = segue.destination as! ViewDetalleIsbnController
            
            vDetalleIsbn.isbnSearch = self.textIsbn.text!
            vDetalleIsbn.libros = self.libros
            //vDetalleIsbn.libros = self.libros
            
            
        }
        
        
    }
 /*
    func existsISBN( isbnToFind : String) -> Bool {
        let tam = (self.libros?.libros.count)!
        if (tam > 0){
            for i in 1...tam {
                
                if (self.libros?.libros[i-1].isbn == isbnToFind){
                    return true
                }
            }
        }
        return false
    }
 */
}
