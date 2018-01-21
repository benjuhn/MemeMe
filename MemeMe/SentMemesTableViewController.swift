//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Ben Juhn on 7/8/17.
//  Copyright © 2017 Ben Juhn. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController {
    
    var memes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
    }

    @IBAction func addMeme(_ sender: UIBarButtonItem) {
        let editor = storyboard?.instantiateViewController(withIdentifier: "Editor") as! EditorViewController
        present(editor, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemesTableCell", for: indexPath)
        
        let meme = memes[indexPath.row]
        cell.textLabel?.text = meme.topText + " ... " + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.meme = memes[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
     }
 
}
