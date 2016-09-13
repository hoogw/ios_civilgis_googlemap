//
//  ZLTestViewController.h
//  CustomNavigationController
//
//  Created by zhaoliang on 15/11/12.
//  Copyright © 2015年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface ZLTestViewController : UIViewController<GMSMapViewDelegate>
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *area;


@end


