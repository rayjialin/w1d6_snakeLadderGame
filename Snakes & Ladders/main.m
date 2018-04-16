//
//  main.m
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Player.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char input[255];
        //        Player *player = [Player new];
        PlayerManager *playerManager = [PlayerManager new];
        NSString *inputRoll;
        NSInteger inputNumOfPlayer;
        
        // ask user to enter correct word to start the game
        NSLog(@"\nWelcome to Snakes & Ladders game, your goal is to reach 100.");
        
        // while loop to keep asking user to roll dice
        while (1 == 1){
            NSLog(@"Enter number of players");
            fgets(input, sizeof input, stdin);
            inputNumOfPlayer = [[[NSString alloc] initWithUTF8String:input] integerValue];
            if (inputNumOfPlayer == 0){
                NSLog(@"Please enter only numeric value");
                continue;
            }
            
            [playerManager createPlayers:inputNumOfPlayer];
            
            while ([playerManager currentPlayer].currentSquare < 100){
                NSLog(@"\nType 'roll' or 'r' to roll the dice");
                fgets(input, sizeof input, stdin);
                inputRoll = [[NSString alloc] initWithUTF8String:input];
                [playerManager roll];
                [playerManager output];
            }
            
            
            if ([playerManager currentPlayer].gameOver == YES){
                NSLog(@"\n\n\nGame Over!!!\n\n%@ won!!!", [playerManager currentPlayer].name);
                break;
            }
        }
    }
    return 0;
}
