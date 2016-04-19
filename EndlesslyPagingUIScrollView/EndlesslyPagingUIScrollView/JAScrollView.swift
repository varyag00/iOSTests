//
//  JAScrollView.swift
//  EndlesslyPagingUIScrollView
//
//  Created by Dan Gonzalez on 2016-03-30.
//  Copyright © 2016 varyag00. All rights reserved.
//

//code used from: http://blog.jtribe.com.au/how-to-write-an-endless-uiscrollview-swift/


import Foundation
import UIKit

class JAScrollView : UIScrollView, UIScrollViewDelegate {
    
    // 1 variables used in entire class
    var viewObjects: [UIView]?
    var numPages: Int = 0
    
    // 2 initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        pagingEnabled = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        scrollsToTop = false
        delegate = self
    }
    
    // 3 adds views connected to the scrollview, sets contentSize
    func setup() {
        guard let parent = superview else { return }
        
        contentSize = CGSize(width: (frame.size.width * (CGFloat(numPages) + 2)), height: frame.size.height)
        
        loadScrollViewWithPage(0)
        loadScrollViewWithPage(1)
        loadScrollViewWithPage(2)
        
        var newFrame = frame
        newFrame.origin.x = newFrame.size.width
        newFrame.origin.y = 0
        scrollRectToVisible(newFrame, animated: false)
        
        layoutIfNeeded()
    }
    
    // 4 adds required pages to the scrollview
    private func loadScrollViewWithPage(page: Int) {
        if page < 0 { return }
        if page >= numPages + 2 { return }
        
        var index = 0
        
        if page == 0 {
            index = numPages - 1
        } else if page == numPages + 1 {
            index = 0
        } else {
            index = page - 1
        }
        
        let view = viewObjects?[index]
        
        var newFrame = frame
        newFrame.origin.x = frame.size.width * CGFloat(page)
        newFrame.origin.y = 0
        view?.frame = newFrame
        
        if view?.superview == nil {
            addSubview(view!)
        }
        
        layoutIfNeeded()
    }
    
    // 5 updates scrollview as it is moved
    @objc internal func scrollViewDidScroll(scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page = floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1
        
        loadScrollViewWithPage(Int(page - 1))
        loadScrollViewWithPage(Int(page))
        loadScrollViewWithPage(Int(page + 1))
    }
    
    // 6 called when scrollview stops moving, updates content to next page if offset is at end of a page
    @objc internal func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageWidth = frame.size.width
        let page : Int = Int(floor((contentOffset.x - (pageWidth/2)) / pageWidth) + 1)
        
        if page == 0 {
            contentOffset = CGPoint(x: pageWidth*(CGFloat(numPages)), y: 0)
        } else if page == numPages+1 {
            contentOffset = CGPoint(x: pageWidth, y: 0)
        }
    }
    
}