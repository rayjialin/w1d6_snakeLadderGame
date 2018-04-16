//
//  PlayerManager.m
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [NSMutableArray new];
        _currentIndex = 0;
    }
    return self;
}

-(void)createPlayers:(NSInteger)numberOfPlayers{
    for (int i = 1; i <=numberOfPlayers; i++){
        _player = [Player new];
        _player.name = [NSString stringWithFormat:@"player%i", i];
        [_players addObject:_player];
    }
}

-(void)roll{
    [_players[_currentIndex] roll];
}

-(void)output{
    Player *currentPlayer = [_players objectAtIndex:_currentIndex];
    NSLog(@"\n%@\n\n%@",currentPlayer.name,[[_players objectAtIndex:_currentIndex] outputString]);
    
    if (currentPlayer.currentSquare < 100){
    _currentIndex++;
    }
}

-(Player *)currentPlayer{
    _currentIndex %= _players.count;
    return [_players objectAtIndex:_currentIndex];
}
@end
