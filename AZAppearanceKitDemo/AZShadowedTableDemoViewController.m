//
//  AZShadowedTableDemoViewController.m
//  AZAppearanceKitDemo
//
//  Created by Zachary Waldowski on 6/27/12.
//  Copyright (c) 2012 Alexsander Akers & Zachary Waldowski. All rights reserved.
//

#import "AZShadowedTableDemoViewController.h"

@interface AZShadowedTableDemoViewController ()

@end

@implementation AZShadowedTableDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = NSLocalizedString(@"Table Shadow", @"Table Shadow");
		self.tabBarItem.image = [UIImage imageNamed:@"AZShadowedTableDemoViewController"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

	UIView *view = [UIView new];
	view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
	self.tableView.backgroundView = view;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
		cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
	
	cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %i", indexPath.row];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}

@end
