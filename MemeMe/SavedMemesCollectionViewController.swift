//
//  SavedMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Ben Juhn on 7/8/17.
//  Copyright © 2017 Ben Juhn. All rights reserved.
//

import UIKit

class SavedMemesCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes = [Meme]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let space = CGFloat(3.0)
        var dimension = (view.frame.size.width - (2 * space)) / 3
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            dimension = (view.frame.size.width - (2 * space)) / 5
        }
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        collectionView?.reloadData()
    }

    @IBAction func addMeme(_ sender: UIBarButtonItem) {
        let editor = storyboard?.instantiateViewController(withIdentifier: "Editor") as! EditorViewController
        present(editor, animated: true, completion: nil)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemesCollectionCell", for: indexPath) as! MemeCollectionViewCell
        
        let meme = memes[indexPath.row]
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.meme = memes[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
     }

}
