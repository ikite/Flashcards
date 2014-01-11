//
//  FCGameHistoryViewController.m
//  FlashCards
//
//  Created by Ravi Shanker on 9/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCGameHistoryViewController.h"
#import "FCAppDelegate.h"
#import "GameResult.h"
#import "FCCardHistoryViewController.h"

@interface FCGameHistoryViewController ()

@end

@implementation FCGameHistoryViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"GameHistory";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneWithHistory:)];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doneWithHistory:(id)sender
{
    [self.navigationController.view removeFromSuperview];
    FCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate popView];
}

#pragma mark - FetchedResultsControllerDelegate

- (NSFetchRequest *)requestForGameResults:(NSManagedObjectContext *)context
{
    NSEntityDescription *gameResultDesc = [NSEntityDescription entityForName:@"GameResult" inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    [request setEntity:gameResultDesc];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"gameDate" ascending:NO];
    
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    return request;
}

- (void)loadData
{
    // Get app delegate
    FCAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context = delegate.dataContext;
    
    NSFetchRequest *request = [self requestForGameResults:context];
    
    // Make fetched-results controller
    self.resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:@"GameResults"];
    
    // Set its delegate
    self.resultsController.delegate = self;
    
    // Handle errors
    NSError *error;
    if ([self.resultsController performFetch:&error]) {
        NSLog(@"Fetch failed: %@", [error localizedDescription]);
    }
}

- (void)fillCell:(UITableViewCell *)cell withResultsAtIndex:(NSIndexPath *)indexPath
{
    GameResult * gr = [self.resultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Game played on %@", [NSDateFormatter localizedStringFromDate:gr.gameDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d seconds long", [gr.gameLength intValue]];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.resultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self.resultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [self fillCell:cell withResultsAtIndex:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FCCardHistoryViewController *chvc = [storyboard instantiateViewControllerWithIdentifier:@"CardHistoryScene"];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"cardName" ascending:YES];
    GameResult *gr = [self.resultsController objectAtIndexPath:indexPath];
    chvc.results = [gr.cardResults sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    
    [[self navigationController] pushViewController:chvc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
