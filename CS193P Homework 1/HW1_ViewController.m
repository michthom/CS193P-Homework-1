//
//  HW1_ViewController.m
//  CS193P Homework 1
//
//  Created by Michael Thomson on 17/03/2013.
//  Copyright (c) 2013 Michael Thomson. All rights reserved.
//

#import "HW1_ViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface HW1_ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) NSUInteger flipCount;

@property (weak, nonatomic) IBOutlet UIButton *playingCard;

@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation HW1_ViewController

- (void)setFlipCount:(NSUInteger)flipCount
{
    _flipCount = flipCount;
    // N.B. Using self.flipCount (getter) in the string here rather than ivar _flipCount in case a subclass wants to reuse this setter but provide a different getter. Subtle!
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
    
    PlayingCard *nextCard = [self.deck drawRandomCard];
    if (nextCard) {
        [self.playingCard setTitle:[nextCard contents]
                          forState:UIControlStateSelected];
    }
    
    NSLog(@"Flips updated to %d", self.flipCount);
}

- (void)viewDidLoad
{
    self.deck = [[PlayingCardDeck alloc] init];
}

@end
