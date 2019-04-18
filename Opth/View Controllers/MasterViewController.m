//
//  MasterViewController.m
//  treeTableView
//
//  Created by Himanshu Khatri on 3/17/16.
//  Copyright © 2016 bdAppManiac. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController (){
    
}

@property NSMutableArray *objects;
@end
NSString *const keyIndent = @"indent";
NSString *const keyTitle = @"title";
NSString *const keyChildren = @"children";

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    NSArray * dataArray = @[
                            @{
                                keyIndent:@0,
                                keyTitle:@"title 0",
                                keyChildren:@[
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 01",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 011",
                                                        keyChildren:@[
                                                                @{
                                                                    keyIndent:@3,
                                                                    keyTitle:@"title 0111",
                                                                    keyChildren:@[
                                                                            @{
                                                                                keyIndent:@4,
                                                                                keyTitle:@"title 01111",
                                                                                keyChildren:@[]
                                                                                },
                                                                            @{
                                                                                keyIndent:@4,
                                                                                keyTitle:@"title 01112",
                                                                                keyChildren:@[]
                                                                                },
                                                                            ]                                                          },
                                                                @{
                                                                    keyIndent:@3,
                                                                    keyTitle:@"title 0112",
                                                                    keyChildren:@[]
                                                                    },
                                                                ]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 012",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 02",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 021",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 022",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 03",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 031",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 032",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 04",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 041",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 042",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        ]
                                },
                            @{
                                keyIndent:@0,
                                keyTitle:@"title 1",
                                keyChildren:@[
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 11",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 111",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 112",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 12",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 121",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 122",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        ]
                                },
                            @{
                                keyIndent:@0,
                                keyTitle:@"title 2",
                                keyChildren:@[
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 21",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 211",
                                                        keyChildren:@[
                                                                @{
                                                                    keyIndent:@3,
                                                                    keyTitle:@"title 2111",
                                                                    keyChildren:@[
                                                                            @{
                                                                                keyIndent:@4,
                                                                                keyTitle:@"title 21111",
                                                                                keyChildren:@[]
                                                                                },
                                                                            @{
                                                                                keyIndent:@4,
                                                                                keyTitle:@"title 21112",
                                                                                keyChildren:@[]
                                                                                },
                                                                            ]                                                          },
                                                                @{
                                                                    keyIndent:@3,
                                                                    keyTitle:@"title 2112",
                                                                    keyChildren:@[]
                                                                    },
                                                                ]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 212",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 22",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 221",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 222",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 23",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 231",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 232",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 24",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 241",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 242",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        ]
                                },
                            @{
                                keyIndent:@0,
                                keyTitle:@"title 3",
                                keyChildren:@[
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 31",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 311",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 312",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        @{
                                            keyIndent:@1,
                                            keyTitle:@"title 32",
                                            keyChildren:@[
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 321",
                                                        keyChildren:@[]
                                                        },
                                                    @{
                                                        keyIndent:@2,
                                                        keyTitle:@"title 322",
                                                        keyChildren:@[]
                                                        },
                                                    ]
                                            },
                                        ]
                                },
                            ];
    
    _objects = dataArray.mutableCopy;
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = _objects[indexPath.row][keyTitle];
    
    cell.indentationWidth = 20;
    cell.indentationLevel = [_objects[indexPath.row][keyIndent] integerValue];
    
    
    cell.contentView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:(CGFloat)(cell.indentationLevel)/50.0];
    
    
    
    return cell;
}
#pragma mark - Table View Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = _objects[indexPath.row];
    
    NSInteger indentLevel = [_objects[indexPath.row][keyIndent] integerValue]; //indentLevel of the selected cell
    NSArray *indentArray = [_objects valueForKey:keyIndent]; //array of indents which are currently show on table
    
    BOOL indentChek = [indentArray containsObject:[NSNumber numberWithInteger:indentLevel]]; // check if  selected
    BOOL isChildrenAlreadyInserted = [_objects containsObject:dic[keyChildren]]; //checking contains children
    
    
    for(NSDictionary *dicChildren in dic[keyChildren]){
        
        NSInteger index=[_objects indexOfObjectIdenticalTo:dicChildren];
        
        isChildrenAlreadyInserted=(index>0 && index!=NSIntegerMax); //checking contains children
        
        if(isChildrenAlreadyInserted) break;
        
    }
    
    
    if ( indentChek &&  isChildrenAlreadyInserted) {
        
        //all children from this category will be deleted
        [self miniMizeThisRows:_objects[indexPath.row][keyChildren] forTable:tableView withIndexpath:indexPath];
        
    }
    else if ([dic[keyChildren] count]) { //insert the children if contains
        
        NSMutableArray *ipsArray = [NSMutableArray new];
        NSArray *childArray = dic[keyChildren];
        
        NSInteger count = indexPath.row + 1;
        
        for (int i = 0; i < [dic[keyChildren] count]; i++,count++) {
            
            NSIndexPath *ip = [NSIndexPath indexPathForRow:count inSection:indexPath.section];
            [ipsArray addObject:ip];
            [_objects insertObject:childArray[i] atIndex:count];
            
        }
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:ipsArray withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView endUpdates];
        
        
    }else{ //the junior most children will navigate
        
        [self performSegueWithIdentifier:@"showDetail" sender:indexPath];
    }
    
    
}

/*this method will check the category with its children, sub children and so on till the last indent occurs*/
//method to minimize all the child rows of that particular category
-(void)miniMizeThisRows:(NSArray*)ar forTable:(UITableView *)tableView withIndexpath:(NSIndexPath *)indexPath{
    
    for(NSDictionary *dicChildren in ar ) {
        
        NSUInteger indexToRemove=[_objects indexOfObjectIdenticalTo:dicChildren];
        
        NSArray *arrayChildren=[dicChildren valueForKey:keyChildren];
        
        if(arrayChildren && [arrayChildren count]>0){
            [self miniMizeThisRows:arrayChildren forTable:tableView withIndexpath:indexPath];//calling self method to remove  the childrens
        }
        
        if([_objects indexOfObjectIdenticalTo:dicChildren]!=NSNotFound) {
            
            //updating array
            [_objects removeObjectIdenticalTo:dicChildren];
            
            //deleting the row
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexToRemove inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationRight];
        }
    }
}

@end
