//
//  main.m
//  Snakes & Ladders
//
//  Created by ruijia lin on 4/14/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char input[3];
        
        Player *player = [Player new];
        NSString *inputString;
        
        // ask user to enter correct word to start the game
            NSLog(@"\nWelcome to Snakes & Ladders game, your goal is to reach 100.  Type 'roll' or 'r' to start the game.");
        
        // while loop to keep asking user to roll dice
        while (player.currentSquare < 100){
//            fgets(input, 4, stdin);
//            inputString = [[NSString alloc] initWithUTF8String:input];
            NSLog(@"%@",[player roll]);
            if (player.gameOver == YES){
                NSLog(@"\n\n\nGame Over!!!");
                break;
            }
            
            
        }
    }
    return 0;
}
