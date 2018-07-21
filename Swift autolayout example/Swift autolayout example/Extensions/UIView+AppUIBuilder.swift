//
//  UIView+AppUIBuilder.swift
//  Swift autolayout example
//
//  Created by Haider Ashfaq on 21/07/2018.
//  Copyright © 2018 Haider Ashfaq. All rights reserved.
//

import Foundation
import UIKit
import PureLayout

extension UIView {
    
    @discardableResult func appTextFieldAutolayout (
        _ height:CGFloat = CGFloat(K.UI.HEIGHT.TEXTFIELD)
        ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoSetDimension(.height, toSize: height))
        constraints.append(contentsOf: self.appFullWidthAutolayout())
        return constraints
    }
    
    @discardableResult func appTextFieldExtraInsetAutolayout (
        _ height:CGFloat = CGFloat(K.UI.HEIGHT.TEXTFIELD)
        ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoSetDimension(.height, toSize: height))
        constraints.append(contentsOf: self.appFullWidthAutolayout(K.UI.INSET.LARGE_SIDE_BORDER))
        return constraints
    }
    
    @discardableResult func appButtonAutolayout (
        _ height:CGFloat = CGFloat(K.UI.HEIGHT.BUTTON)
        ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoSetDimension(.height, toSize: height))
        constraints.append(contentsOf: self.appFullWidthAutolayout())
        return constraints
    }
    
    @discardableResult func appButtonExtraInsetAutolayout (
        _ height:CGFloat = CGFloat(K.UI.HEIGHT.BUTTON)
        ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoSetDimension(.height, toSize: height))
        constraints.append(contentsOf: self.appFullWidthAutolayout(K.UI.INSET.LARGE_SIDE_BORDER))
        return constraints
    }
    
    @discardableResult func appFullHeightAutolayout (
        _ inset:CGFloat = CGFloat(K.UI.INSET.SIDE_BORDER)
        ) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoPinEdge(toSuperviewEdge: .top, withInset: inset))
        constraints.append(self.autoPinEdge(toSuperviewEdge: .bottom, withInset: inset))
        return constraints
    }
    
    @discardableResult func appFullWidthAutolayout (
        _ inset:CGFloat = CGFloat(K.UI.INSET.SIDE_BORDER), relation: NSLayoutRelation = .equal) -> [NSLayoutConstraint] {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(self.autoPinEdge(toSuperviewEdge: .left, withInset: inset, relation: relation))
        constraints.append(self.autoPinEdge(toSuperviewEdge: .right, withInset: inset, relation: relation))
        return constraints
    }
    
    @discardableResult func appPinBelowLast (
        _ lastAddedView:(UIView)?,
        inset:CGFloat = CGFloat(K.UI.INSET.SIDE_BORDER),
        relation: NSLayoutRelation = .equal
        ) -> NSLayoutConstraint? {
        
        if ((lastAddedView) != nil) {
            return self.autoPinEdge(.top,
                                    to: .bottom,
                                    of: lastAddedView!,
                                    withOffset: inset,
                                    relation:relation)
            
        } else {
            return self.autoPinEdge(toSuperviewEdge: .top,
                                    withInset: inset,
                                    relation:relation)
        }
    }
    
    @discardableResult func appPinBelowLastExtraInset (
        _ lastAddedView:(UIView)?,
        inset:CGFloat = CGFloat(K.UI.INSET.LARGE_SIDE_BORDER),
        relation: NSLayoutRelation = .equal
        ) -> NSLayoutConstraint? {
        
        if ((lastAddedView) != nil) {
            return self.autoPinEdge(.top,
                                    to: .bottom,
                                    of: lastAddedView!,
                                    withOffset: inset,
                                    relation:relation)
            
        } else {
            return self.autoPinEdge(toSuperviewEdge: .top,
                                    withInset: inset,
                                    relation:relation)
        }
    }
    
    @discardableResult func appPinBelowLastSmallInset (
        _ lastAddedView:(UIView)?,
        inset:CGFloat = CGFloat(K.UI.INSET.SMALL_SIDE_BORDER),
        relation: NSLayoutRelation = .equal
        ) -> NSLayoutConstraint? {
        
        if ((lastAddedView) != nil) {
            return self.autoPinEdge(.top,
                                    to: .bottom,
                                    of: lastAddedView!,
                                    withOffset: inset,
                                    relation:relation)
            
        } else {
            return self.autoPinEdge(toSuperviewEdge: .top,
                                    withInset: inset,
                                    relation:relation)
        }
    }
    
    @discardableResult func appCloseLastView (
        _ inset:CGFloat = CGFloat(K.UI.INSET.SIDE_BORDER),
        relation: NSLayoutRelation = .equal
        ) -> NSLayoutConstraint? {
        
        let lastAddedView = self.subviews.last
        if let lastAddedView = lastAddedView {
            return lastAddedView.autoPinEdge(toSuperviewEdge: .bottom, withInset: inset, relation:relation)
            
        } else {
            return nil
        }
    }
    
    // MARK: - Percentage Axis Positioning
    
    func getProportionalOriginConstraint(_ ofView:UIView, percentage:CGFloat, axis:ALAxis) -> NSLayoutConstraint?
    {
        var constraint:NSLayoutConstraint?
        if (axis == .horizontal) {
            // constrain left as percent of superview
            if (percentage > 0)
            {
                constraint = NSLayoutConstraint(item: self,
                                                attribute: .centerX,
                                                relatedBy: .equal,
                                                toItem: ofView,
                                                attribute: .right,
                                                multiplier: percentage,
                                                constant: 0);
            }
            else
            {
                // since a multipler of 0 is illegal for .Right instead make .Left equal
                constraint = NSLayoutConstraint(item: self,
                                                attribute: .centerX,
                                                relatedBy: .equal,
                                                toItem: ofView,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0);
            }
            
        } else if (axis == .vertical) {
            // constrain top as percent of superview
            if (percentage > 0 )
            {
                constraint = NSLayoutConstraint(item: self,
                                                attribute: .centerY,
                                                relatedBy: .equal,
                                                toItem: ofView,
                                                attribute: .bottom,
                                                multiplier: percentage,
                                                constant: 0);
            }
            else
            {
                // since a multipler of 0 is illegal for .Bottom we instead make .Top equal
                constraint = NSLayoutConstraint(item: self,
                                                attribute: .centerY,
                                                relatedBy: .equal,
                                                toItem: superview,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: 0);
            }
        }
        
        return constraint
    }
    
    // MARK: - Autolayout
    
    func updateContentHuggingPriorty(for axis: UILayoutConstraintAxis, toValue:UILayoutPriority) {
        var priorty = self.contentHuggingPriority(for: axis)
        priorty = toValue
        self.setContentHuggingPriority(priorty, for: axis)
    }
    
    func updateContentCompressionResistancePriority(for axis: UILayoutConstraintAxis, toValue:UILayoutPriority) {
        var priorty = self.contentCompressionResistancePriority(for: axis)
        priorty = toValue
        self.setContentCompressionResistancePriority(priorty, for: axis)
    }
    
}
