import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    //    let arrowLabel = UILabel()
    let arrowImage = UIImageView()
    let arrowImage2 = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        // Content View
        contentView.backgroundColor = UIColor.blue
        
        let marginGuide = contentView.layoutMarginsGuide
        
        
        //arrowImage
        contentView.addSubview(arrowImage)
        arrowImage.frame = CGRect(x: 54, y: 11, width: 30, height: 03)
        arrowImage.image = UIImage(named: "arrow")
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        arrowImage.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        arrowImage.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        arrowImage.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        
        //arrowImage2
        contentView.addSubview(arrowImage2)
        arrowImage2.frame = CGRect(x: 54, y: 11, width: 30, height: 03)
        arrowImage2.image = UIImage(named: "arrowDown")
        arrowImage2.translatesAutoresizingMaskIntoConstraints = false
        arrowImage2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        arrowImage2.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        arrowImage2.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        arrowImage2.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        
        //        // Arrow label
        //        contentView.addSubview(arrowLabel)
        //        arrowLabel.textColor = UIColor.white
        //        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        //        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        //        arrowLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        //        arrowLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        //        arrowLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        // Title label
        contentView.addSubview(titleLabel)
        titleLabel.textColor = UIColor.white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        //
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        if !collapsed {
            //            arrowImage2.rotate(collapsed ? 0.0 : .pi / 2)
            arrowImage2.isHidden = true
            arrowImage.isHidden = false
        } else {
            arrowImage2.isHidden = false
            arrowImage.isHidden = true
        }
    }
    
}
