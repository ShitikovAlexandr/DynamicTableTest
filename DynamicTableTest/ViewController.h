//
//  ViewController.h
//  DynamicTableTest
//
//  Created by MacUser on 10.04.16.
//  Copyright © 2016 Shitikov.net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

