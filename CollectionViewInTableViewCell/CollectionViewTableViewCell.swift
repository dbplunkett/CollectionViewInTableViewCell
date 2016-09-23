import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDataSource {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BlueCell")
        prepareForReuse()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.reloadData()
        collectionViewHeightConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionView.setNeedsLayout()
        contentView.setNeedsLayout()
        setNeedsLayout()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
}
