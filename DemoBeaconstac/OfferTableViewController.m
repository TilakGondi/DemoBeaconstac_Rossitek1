//
//  OfferTableViewController.m
//  BeaconstacDemo
//
//  Created by Rossitek_Tilak on 08/11/14.
//  Copyright (c) 2014 Mobstac. All rights reserved.
//

#import "OfferTableViewController.h"

@interface OfferTableViewController ()
{
    NSArray *dataArry;
    UIView *popUpBg;
}

@end

@implementation OfferTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[[UIAlertView alloc] initWithTitle:@"" message:@"Tap on the offer to know more." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil] show];
    
    NSArray *DominosOffers=[[NSArray alloc] initWithObjects:@"Dominos Offer1",@"Dominos Offer2",@"Dominos Offer3",@"Dominos Offer4", nil];
    
    NSArray *KFCOffers=[[NSArray alloc] initWithObjects:@"KFC Offer1",@"KFC Offer2",@"KFC Offer3",@"KFC Offer4", nil];
    
    if ([self.nearBeacon isEqualToString:@"TBeacon"]) {
        self.title=@"Dominos";
        dataArry=[NSArray arrayWithArray:DominosOffers];
    }else if ([self.nearBeacon isEqualToString:@"Beacon2"]) {
         self.title=@"KFC";
        dataArry=[NSArray arrayWithArray:KFCOffers];
    }
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return dataArry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[dataArry objectAtIndex:indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    popUpBg=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    popUpBg.backgroundColor=[UIColor colorWithWhite:0.0/255.0 alpha:0.5];
    [self.view addSubview:popUpBg];
    
    UIView *popUP=[[UIView alloc] initWithFrame:CGRectMake(20, ((self.view.frame.size.height-150)/2)-60, 280, 150)];
    popUP.backgroundColor=[UIColor whiteColor];
    popUP.layer.cornerRadius=20;
    [popUpBg addSubview:popUP];
    
    
    UILabel *lblTitle=[[UILabel alloc] initWithFrame:CGRectMake(10, 10, 260, 40)];
    lblTitle.text=[dataArry objectAtIndex:indexPath.row];
    lblTitle.font=[UIFont boldSystemFontOfSize:20];
    lblTitle.textAlignment=NSTextAlignmentCenter;
    [popUP addSubview:lblTitle];
    
    UILabel *lblDetails=[[UILabel alloc] initWithFrame:CGRectMake(20, 60, 240, 50)];
    lblDetails.numberOfLines=0;
    lblDetails.lineBreakMode=NSLineBreakByWordWrapping;
    lblDetails.text=[NSString stringWithFormat:@"Enjoy %ld0%% Off on minimum Bill of %ld50 Rs.",indexPath.row+1,indexPath.row+3];
    [popUP addSubview:lblDetails];
    
    UIButton *okButton=[UIButton buttonWithType:UIButtonTypeCustom];
    okButton.frame=CGRectMake((280-40)/2, popUP.frame.size.height-40, 40, 30);
    okButton.backgroundColor=[UIColor grayColor];
    okButton.layer.borderWidth=2.0f;
    okButton.layer.borderColor=[UIColor blackColor].CGColor;
    okButton.layer.cornerRadius=5.0f;
    [okButton setTitle:@"OK" forState:UIControlStateNormal];
    [okButton addTarget:self action:@selector(okBtnActn) forControlEvents:UIControlEventTouchUpInside];
    [popUP addSubview:okButton];
    
}

-(void)okBtnActn
{
    [popUpBg removeFromSuperview];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
