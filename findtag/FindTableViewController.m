//
//  FindTableViewController.m
//  findtag
//
//  Created by Fabio Luiz Fonseca on 13/04/14.
//  Copyright (c) 2014 Fabio Luiz Fonseca. All rights reserved.
//

#import "FindTableViewController.h"

@interface FindTableViewController ()

@end

@implementation FindTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString * nss_url = [NSString stringWithFormat:@"http://fonsecanet.com.br/app/findtag/?q=%@",_nss_pesquisa];
        NSURL * url=[NSURL URLWithString:nss_url];
        NSData * data=[NSData dataWithContentsOfURL:url];
        
        _nsma_valores = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_nsma_valores count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSLog(@"%@",[_nsma_valores objectAtIndex:indexPath.row]);
    
    cell.textLabel.text = [[_nsma_valores objectAtIndex:indexPath.row] objectForKey:@"text"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",[[_nsma_valores objectAtIndex:indexPath.row] objectForKey:@"screen_name"],[[_nsma_valores objectAtIndex:indexPath.row] objectForKey:@"created_at"]];
    
    
    NSURL *imgUrl=[[NSURL alloc] initWithString:[[_nsma_valores objectAtIndex:indexPath.row] objectForKey:@"profile_image_url"]];
    NSData *imgData = [NSData dataWithContentsOfURL:imgUrl];
    UIImage *img = [UIImage imageWithData:imgData];

    [cell.imageView setImage:img];
    
    return cell;
}


@end






















