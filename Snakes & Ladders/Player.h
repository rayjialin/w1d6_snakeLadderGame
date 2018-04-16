//
//  Player.h
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSInteger currentSquare;
@property NSDictionary *gameLogic;
@property NSMutableString *outputString;
@property BOOL gameOver;
@property NSString *name;

-(void)roll;
-(NSString *)scoreBoard;
@end
