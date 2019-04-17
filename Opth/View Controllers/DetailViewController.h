//
//  DetailViewController.h
//  Opth
//
//  Created by Itzel Hernandez on 4/17/19.
//  Copyright © 2019 Angie Ta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
