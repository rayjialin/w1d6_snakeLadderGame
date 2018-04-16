//
//  PlayerManager.h
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property NSMutableArray *players;

@property (nonatomic) Player *player;
@property NSInteger currentIndex;

-(void)createPlayers:(NSInteger)numberOfPlayers;
-(void)roll;
-(NSString *)output;
-(Player *)currentPlayer;
-(NSString *)scoreBoard;
@end
