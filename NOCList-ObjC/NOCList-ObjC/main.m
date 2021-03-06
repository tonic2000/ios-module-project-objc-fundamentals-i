//
//  main.m
//  NOCList-ObjC
//
//  Created by Nick Nguyen on 4/13/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIAgent.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       // Step 2 
        LSIAgent * agent1 = [LSIAgent.new initWithCoverName:@"Ethan Hunt" RealName:@"Tom Cruise" AccessLevel:8 Compromised:NO]; // new way 
        LSIAgent * agent2 = [[LSIAgent alloc] initWithCoverName:@"Jim Phelps" RealName:@"Jon Voight" AccessLevel:9 Compromised:YES];
        LSIAgent * agent3 = [[LSIAgent alloc] initWithCoverName:@"Claire Phelps" RealName:@"Emmanuelle Beart" AccessLevel:5 Compromised:NO];
        LSIAgent * agent4 = [[LSIAgent alloc] initWithCoverName:@"Eugene Kittridge" RealName:@"Henry Czerny" AccessLevel:10 Compromised:YES];
        LSIAgent * agent5 = [[LSIAgent alloc] initWithCoverName:@"Franz Krieger" RealName:@"Jean Reno" AccessLevel:4 Compromised:NO];
        LSIAgent * agent6 = [[LSIAgent alloc] initWithCoverName:@"Luther Stickell" RealName:@"Ving Rhames" AccessLevel:4 Compromised:NO];
        LSIAgent * agent7 = [[LSIAgent alloc] initWithCoverName:@"Sarah Davies" RealName:@"Kristin Scott Thomas" AccessLevel:5 Compromised:YES];
        LSIAgent * agent8 = [[LSIAgent alloc] initWithCoverName:@"Max RotGrab" RealName:@"Vanessa Redgrave" AccessLevel:4 Compromised:NO];
        LSIAgent * agent9 = [[LSIAgent alloc] initWithCoverName:@"Hannah Williams" RealName:@"Ingeborga Dapkūnaitė" AccessLevel:5 Compromised:YES];
        LSIAgent * agent10 = [[LSIAgent alloc] initWithCoverName:@"Jack Harmon" RealName:@"Emilio Estevez" AccessLevel:6 Compromised:YES];
        LSIAgent * agent11 = [[LSIAgent alloc] initWithCoverName:@"Frank Barnes" RealName:@"Dale Dye" AccessLevel:9 Compromised:NO];
        
        NSArray * agents = @[agent1,agent2,agent3,agent4,agent5,agent6,agent7,agent8,agent9,agent10,agent11];
        
        // Step 3
        int compromisedAgents = 0;
        for(LSIAgent *agent in agents) {
            if ([agent compromised] == [NSNumber numberWithBool:YES]) {
                compromisedAgents += 1;
            }
        }
        NSLog(@"%i agents have been compromised!", compromisedAgents);
        
        
        // Step 4
        int cleanAgents = 0 ;
        for (LSIAgent * agent in agents) {
            if ([agent compromised] == [NSNumber numberWithBool:NO]) {
                cleanAgents += 1;
                NSLog(@"Agent %@ is clean",agent.coverName);
            }
        }
        NSLog(@"%i clean agents",cleanAgents);
        
        
       // Step 5
        for (LSIAgent * agent in agents) {
            BOOL  isAccessLevelGreaterThanEight = [[agent accessLevel] isGreaterThanOrEqualTo:[NSNumber numberWithInt:8]];
            BOOL  isCompromised = [agent compromised] == [NSNumber numberWithBool:YES];
            
            if (isAccessLevelGreaterThanEight && isCompromised ) {
                NSLog(@"Agent %@, level %@,**WARNING** **COMPROMISED**",[agent realName],[agent accessLevel]);
                
            } else if  (isAccessLevelGreaterThanEight) {
                NSLog(@"Agent %@ is high risk,level %@",[agent realName],[agent accessLevel]);
            }
        }
        // Step 6
        int lowLevel = 0;
        int midLevel = 0;
        int highLevel = 0;
        
        for (LSIAgent *agent in agents) {
            int level = agent.accessLevel.intValue;
            switch (level) {
                case 1 ... 4:
                    lowLevel +=1;
                    break;
                case 5 ... 7:
                    midLevel +=1 ;
                    break;
                default:
                    highLevel += 1;
                    break;
            }
        }
        
        NSLog(@"%d low level agents, %d mid level agents, and %d high level agents.", lowLevel, midLevel, highLevel);
        
        // Stretch
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"accessLevel" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedAgents =  [agents sortedArrayUsingDescriptors:sortDescriptors];
        for (LSIAgent * agent in sortedAgents) {
            NSString * name = agent.realName; {
                NSLog(@"Agent %@,Access level: %i",name,agent.accessLevel.intValue );
            }
        }
        
    return 0;
}
}
