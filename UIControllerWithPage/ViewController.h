//
//  ViewController.h
//  UIControllerWithPage
//
//  Created by Rik Tsai on 2016/1/28.
//  Copyright © 2016年 GOLiFE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *m_scrollView;
    __weak IBOutlet UIPageControl *m_pageControl;
    
    NSMutableArray *controllerArray;
    NSInteger numberOfPages;
}

@end

