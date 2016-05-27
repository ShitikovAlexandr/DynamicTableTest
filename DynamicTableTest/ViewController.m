//
//  ViewController.m
//  DynamicTableTest
//
//  Created by MacUser on 10.04.16.
//  Copyright © 2016 Shitikov.net. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    return [[UIFont familyNames] count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection %d", section);
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    NSArray* fontNames   = [UIFont fontNamesForFamilyName:familyName];

    return [fontNames count];
    
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath: {%d, %d}", indexPath.section, indexPath.row);
    
    static NSString* identifire = @"Cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifire];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifire];
        NSLog(@"cell created");

    } else {
        
        NSLog(@"cell reused");

    }
    
    NSArray* familyNames = [UIFont familyNames];
    NSString* familyName = [familyNames objectAtIndex:indexPath.section];
    NSArray* fontNames   = [UIFont fontNamesForFamilyName:familyName];
    NSString* fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    UIFont* font = [UIFont fontWithName:fontName size:16];
    cell.textLabel.font = font;
    
    return cell;
    
}




@end
