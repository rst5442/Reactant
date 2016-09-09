//
//  ScrollControllerBase.swift
//  Reactant
//
//  Created by Tadeáš Kříž on 09/09/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import SwiftKit
import Lipstick
import RxSwift

class ScrollControllerBase<MODEL, ROOT: UIView>: ControllerBase<MODEL, ROOT> {
    let scrollView = UIScrollView()

    override init(title: String = "", root: ROOT = ROOT()) {
        super.init(title: title, root: root)
    }

    override func loadView() {
        view = ControllerRootView().styled(using: ReactantConfiguration.global.controllerRootStyle)

        view.children(
            scrollView.children(
                rootView
            )
        )
    }

    override func updateRootViewConstraints() {
        scrollView.snp_updateConstraints { make in
            make.edges.equalTo(view)
        }

        rootView.snp_updateConstraints { make in
            make.leading.equalTo(view)
            make.top.equalTo(scrollView)
            make.trailing.equalTo(view)
            make.bottom.equalTo(scrollView)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        scrollView.contentSize = rootView.bounds.size

        super.viewDidLayoutSubviews()
    }
}

extension ScrollControllerBase: Scrollable {
    func scrollToTop(animated: Bool) {
        scrollView.scrollToTop(animated)
    }
}