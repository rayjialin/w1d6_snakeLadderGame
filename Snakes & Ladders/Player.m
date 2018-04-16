//
//  Player.m
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _gameOver = NO;
        _name = [NSString new];
        _outputString = [NSMutableString new];
        _currentSquare = 0;
        _gameLogic = @{
                       @4: @14,
                       @9: @31,
                       @17: @7,
                       @20: @38,
                       @28: @84,
                       @40: @59,
                       @51: @67,
                       @63: @81,
                       @64: @60,
                       @89: @26,
                       @95: @75,
                       @99: @78,
                       };
    }
    return self;
}
-(void)roll{
    NSInteger diceValue = arc4random_uniform(6)+1;
    _currentSquare += diceValue;
    
    // normal case
    _outputString = [NSMutableString stringWithFormat:@"\nYou rolled a %li\nYou landed on %li", (long)diceValue, _currentSquare];
    
    if (_gameLogic[@(_currentSquare)]){
        // update current square
        
        if ([_gameLogic[@(_currentSquare)] integerValue] > _currentSquare){
        // ladder
            _currentSquare = [[_gameLogic objectForKey:@(_currentSquare)] integerValue];
            _outputString = [NSMutableString stringWithString:[@[_outputString, [NSString stringWithFormat:@"\n\nStairway to heaven!!!\nYou have climbed to %li", _currentSquare]] componentsJoinedByString:@""]];
        }else {
        // snake
            _currentSquare = [[_gameLogic objectForKey:@(_currentSquare)] integerValue];
            _outputString = [NSMutableString stringWithString:[@[_outputString, [NSString stringWithFormat:@"\n\nBummer... You are transported to %li", _currentSquare]] componentsJoinedByString:@""]];
        }
    }
    
    if (_currentSquare  >= 100){
        _gameOver = YES;
    }

}

-(NSString *)scoreBoard{
    return [NSString stringWithFormat:@"%@: %li", _name, _currentSquare];
}
@end
