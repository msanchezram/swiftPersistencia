//
//  ViewListaIsbnController.swift
//  NubeIOSOpenLibraryEx3
//
//  Created by Marcos on 31/12/16.
//  Copyright © 2016 MSR. All rights reserved.
//

import UIKit
import CoreData

class ViewListaIsbnController: UITableViewController {

    //private var libros = Array<String>()
    
    var libros = ListaIsbn()
    
    var contexto : NSManagedObjectContext? = nil // NSManagedObjectContext? = nil
    
    @IBOutlet weak var textIsbn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "Lista Libros IBSN"
        
        //self.libros.append("978-84-376-0494-7")
        //self.libros.append("978-15-897-7025-6")
        //self.libros.append("978-84-376-0494-9")
        //978-84-233-4964-7
        
        //self.contexto = (UIApplication.sharedApplication.delegate as! AppDelegate).managedObjectContext
        self.contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        //print("viewDidAppear")
        
        libros.libros.removeAll()
        
        let librosEntidad = NSEntityDescription.entity(forEntityName: "Libro", in: self.contexto!)
        let getLibros = librosEntidad?.managedObjectModel.fetchRequestTemplate(forName: "getLibros")
        
        do {
            
            
            
            let listaLibrosEntidad = try self.contexto!.fetch(getLibros!) as! [NSObject]
            for libroTmp in listaLibrosEntidad {
                let tmpTitulo = libroTmp.value(forKey: "titulo") as! String
                
                let tmpIsbn =  libroTmp.value(forKey: "isbn") as! String

                
                let tmpLibro = LibroDto(aIsbn: tmpIsbn, aTitulo: tmpTitulo)
                
                //borramos los libros de la BD
                //self.contexto!.delete(libroTmp as! NSManagedObject)
      
                self.libros.libros.append(tmpLibro)
                
                //print(tmpTitulo)
            }
            //confirmamos el borrado de objetos
            //try self.contexto!.save()
            
        } catch {
            print("Hay un error en la carga de libros")
        }

        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  self.libros.libros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)

        // Configure the cell...
        let titulo = self.libros.libros[indexPath.row].titulo
        cell.textLabel?.text = titulo //Libro(self.libros.libros[indexPath.row]).titulo as String
        return cell
    }
    
    @IBAction func pushAdd(_ sender: Any) {
        
        
        //print("pushAdd")

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
  
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        if (indice == nil){
            //si entra es porque ha pulsado en el añadir
            
            let vPutIsbn = segue.destination as! ViewPutIsbnController
                
            //vPutIsbn.searchIsbn = self.textIsbn.text!
            vPutIsbn.libros = self.libros
                
            
            
        }else{
            //si entra es porque ha pulsado en el tableView
            let vDetalleIsbn = segue.destination as! ViewDetalleIsbnController
            
            vDetalleIsbn.isbnSearch = self.libros.libros[indice!].isbn
            vDetalleIsbn.libros = self.libros
        }
        
        
    }
    


}
