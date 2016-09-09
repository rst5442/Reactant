//
//  RxCollectionViewHeader.swift
//
//  Created by Maros Seleng on 10/05/16.
//

import SwiftKit

public final class RxCollectionReusableView<CONTENT: UIView>: UICollectionReusableView {
    private var content: CONTENT?
    
    public func cachedContentOrCreated(factory: () -> CONTENT) -> CONTENT {
        if let content = content {
            return content
        } else {
            let content = factory()
            self.content = content
            content >> self
            setNeedsUpdateConstraints()
            return content
        }
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        
        content?.snp_updateConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    public override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}