//
//  QLabelTableViewCell.m
//  QuickDialog
//
//  Created by Tom on 02/12/2012.
//
//

#import "QLabelTableViewCell.h"

@implementation QLabelTableViewCell

+ (NSString *)reuseIdentifier
{
    return @"QuickformLabelElement";
}

- (id)init
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.reuseIdentifier];
    
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        _valueLabel = [[UILabel alloc] init];
        _valueLabel.textColor = [UIColor colorWithRed:0.22 green:0.33 blue:0.53 alpha:1];
        _valueLabel.font = [UIFont systemFontOfSize:17];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.highlightedTextColor = [UIColor whiteColor];
        _valueLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:_valueLabel];
    }
    
    return self;
}

- (void)prepareForReuse
{
    _valueLabel.text = @"";
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int cellWidth = self.frame.size.width;

    CGSize mainLabelSize = [self.textLabel.text sizeWithFont:self.textLabel.font];
    int mainLabelWidth = mainLabelSize.width;
    
    int labelWidth = self.valueLabel.frame.size.width;
    int rightPadding = 40;
    int leftPadding = self.textLabel.frame.origin.x;
    
    int labelX = (cellWidth - labelWidth - rightPadding);
    int labelY = (self.frame.size.height - self.valueLabel.font.lineHeight) / 2;

    int labelMaxWidth = (cellWidth - rightPadding - leftPadding - mainLabelWidth - 20);
    
    CGRect rect = _valueLabel.frame;
    rect.size.width = labelMaxWidth;
    rect.size.height = _valueLabel.font.lineHeight;
    rect.origin.x = labelX;
    rect.origin.y = labelY;
    _valueLabel.frame = rect;
}

@end
