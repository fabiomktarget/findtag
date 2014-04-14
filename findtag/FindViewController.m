//
//  FindViewController.m
//  findtag
//
//  Created by Fabio Luiz Fonseca on 13/04/14.
//  Copyright (c) 2014 Fabio Luiz Fonseca. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FindTableViewController * dest =  [segue destinationViewController];
    
    dest.nss_pesquisa = _txtPesquisa.text;
    
}


@end
