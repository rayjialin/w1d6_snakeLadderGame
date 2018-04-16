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
        NSString *inputAction;
        NSInteger inputNumOfPlayer;
        BOOL exit = NO;
        // ask user to enter correct word to start the game
        NSLog(@"\nWelcome to Snakes & Ladders game, your goal is to reach 100.");
        
        // while loop to keep asking user to roll dice
        while (1 == 1){
            PlayerManager *playerManager = [PlayerManager new];
            NSLog(@"Enter number of players");
            fgets(input, sizeof input, stdin);
            inputNumOfPlayer = [[[NSString alloc] initWithUTF8String:input] integerValue];
            if (inputNumOfPlayer == 0){
                NSLog(@"Please enter only numeric value");
                continue;
            }
            
            [playerManager createPlayers:inputNumOfPlayer];
            
            while ([playerManager currentPlayer].currentSquare < 100 && exit == NO){
                NSLog(@"\nType 'roll' or 'r' to roll the dice");
                fgets(input, sizeof input, stdin);
                inputAction = [[[[NSString alloc] initWithUTF8String:input] lowercaseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                
                // handle user action
                if ([inputAction isEqualToString:@"quit"]){
                    NSLog(@"Thanks for playing!");
                    return 0;
                }else if ([inputAction isEqualToString:@"restart"]){
                    break;
                }else if ([inputAction isEqualToString:@"roll"] || [inputAction isEqualToString:@"r"]){
                    [playerManager roll];
                    NSString *output = [NSString stringWithString:[playerManager output]];
                    NSString *scores = [NSString stringWithString:[playerManager scoreBoard]];
                    NSLog(@"\n%@\n%@", output, scores);
                }else {
                    NSLog(@"Command not recognized, enter another command.");
                }
            }
            
            // announce winner
            if ([playerManager currentPlayer].gameOver == YES){
                NSLog(@"\n\n\nGame Over!!!\n\n%@ won!!!", [playerManager currentPlayer].name);
            }
        }
    }
    return 0;
}
