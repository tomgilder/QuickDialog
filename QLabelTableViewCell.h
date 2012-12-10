//
//  QLabelTableViewCell.h
//  QuickDialog
//
//  Created by Tom on 02/12/2012.
//
//

#import "QTableViewCell.h"

@interface QLabelTableViewCell : QTableViewCell

+ (NSString *)reuseIdentifier;

@property (nonatomic, strong) UILabel *valueLabel;

@end
