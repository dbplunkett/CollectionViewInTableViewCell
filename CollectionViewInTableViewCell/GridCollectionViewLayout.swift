import UIKit

class GridCollectionViewLayout: UICollectionViewLayout {
    
    let sideLength = 50
    let spacing = 8
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let row = indexPath.section
        let col = indexPath.item
        let attrs = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let x = spacing + ((sideLength + spacing) * col)
        let y = spacing + ((sideLength + spacing) * row)
        attrs.frame = CGRect(x: x, y: y, width:  sideLength, height: sideLength)
        return attrs
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attrsArray = [UICollectionViewLayoutAttributes]()
        
        for row in 0 ..< (collectionView?.numberOfSections ?? 0) {
            for col in 0 ..< (collectionView?.numberOfItems(inSection: row) ?? 0) {
                guard let attrs = layoutAttributesForItem(at: IndexPath(item: col, section: row)) else { continue }
                attrsArray.append(attrs)
            }
        }
        
        return attrsArray
    }
    
    override var collectionViewContentSize: CGSize {
        
        let rowCount = collectionView?.numberOfSections ?? 0
        var colCountMax = 0
        for row in 0..<rowCount {
            let colCount = collectionView?.numberOfItems(inSection: row) ?? 0
            if colCount > colCountMax {
                colCountMax = colCount
            }
        }
        
        return CGSize(
            width:  spacing + ((sideLength + spacing) * colCountMax),
            height: spacing + ((sideLength + spacing) * rowCount)
        )
    }
}
