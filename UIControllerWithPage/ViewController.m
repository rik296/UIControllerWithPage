//
//  ViewController.m
//  UIControllerWithPage
//
//  Created by Rik Tsai on 2016/1/28.
//  Copyright © 2016年 GOLiFE. All rights reserved.
//

#import "ViewController.h"
#import "ContentViewController.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] nativeScale] > 2.5f)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    controllerArray = [[NSMutableArray alloc] init];
    CGFloat offset = IS_IPHONE_6_PLUS ? 8.0 : 0.0;
    for (int i = 0; i < 5; i++)
    {
        ContentViewController *vc = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
        [controllerArray addObject:vc];
        
        CGRect frame = m_scrollView.frame;
        frame.origin.x = ([UIScreen mainScreen].bounds.size.width - offset) * i;
        vc.view.frame = frame;
        [m_scrollView addSubview:vc.view];
        [vc.labelContent setText:[NSString stringWithFormat:@"This is page %ld", (long)i]];
    }
    
    numberOfPages = [controllerArray count];
    m_scrollView.pagingEnabled = YES;
    m_scrollView.contentSize = CGSizeMake(([UIScreen mainScreen].bounds.size.width - offset) * numberOfPages, [UIScreen mainScreen].bounds.size.height);
    m_scrollView.showsHorizontalScrollIndicator = NO;
    m_scrollView.showsVerticalScrollIndicator = NO;
    m_scrollView.scrollsToTop = NO;
    m_scrollView.delegate = self;
    
    m_pageControl.numberOfPages = numberOfPages;
    m_pageControl.currentPage = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger page = floor((m_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    m_pageControl.currentPage = page;
}

@end
