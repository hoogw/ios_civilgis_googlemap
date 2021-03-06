//
//  ZLTableViewController.m
//  CustomNavigationController
//
//  Created by zhaoliang on 15/11/12.
//  Copyright © 2015年 zhao. All rights reserved.
//

#import "ZLTableViewController.h"
#import "ZLTestViewController.h"

@interface ZLTableViewController ()


@end

@implementation ZLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //self.area = @"Palo_Alto";
   // self.content = @[@"Zoning",@"Parcels",@"Address",@"Streets",@"General_land_use",@"Schools",@"Parks",@"Beat",@"District"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// ----- set portrait view orientation

- (BOOL) shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    
    return (UIInterfaceOrientationPortrait|UIInterfaceOrientationPortraitUpsideDown);
    
}

// ----- END  ----set portrait view orientation




#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _content.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_content objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZLTestViewController *testVC = [[ZLTestViewController alloc] init];
    
    testVC.area = self.area;
    testVC.subject = [_content objectAtIndex:indexPath.row];
    [self presentViewController:testVC animated:YES completion:nil];
}



@end
