import UIKit

private let reuseIdentifier = "Cell"

class ACellViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
}

class TCellScroll: UIScrollView {
    @IBOutlet weak var image: UIImageView!
}


class AViewController: UICollectionViewController {
    
    var albums : [Album] = [A20190531]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return albums.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ACell", for: indexPath) as! ACellViewCell
        
        cell.label.text = String(albums[indexPath.item].year) + "/" + String(albums[indexPath.item].month) + "/" + String(albums[indexPath.item].day)
        /*if type(of:albums[indexPath.item].photo[0]) == String.self {
         cell.cellImage.image = UIImage(named: albums[indexPath.item].photo[0] as! String)
         }
         else {
         cell.cellImage.image = albums[indexPath.item].photo[0] as? UIImage
         }*/
        
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    
    // Uncomment this method to specify if the specified item should be selected
    /*override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }*/
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

