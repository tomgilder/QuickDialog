//
// Copyright 2011 ESCOZ Inc  - http://escoz.com
// Created by hivehicks on 5/23/12.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

@implementation QTextField

@synthesize prefix = _prefix;
@synthesize suffix = _suffix;
@synthesize highlighted = _highlighted;
@synthesize highlightedTextColor = _highlightedTextColor;

- (id)init
{
    self = [super init];
    
    if (self) {
        self.textColor = [UIColor colorWithRed:0.22 green:0.33 blue:0.53 alpha:1.0];
        self.highlightedTextColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:17];
    }
    
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    if (_prefix || _suffix) {
        NSString *textWithSuffix = [NSString stringWithFormat:@"%@%@%@", _prefix ? _prefix : @"", self.text, _suffix ? _suffix : @""];
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), self.textColor.CGColor);
        [textWithSuffix drawInRect:rect withFont:self.font lineBreakMode:UILineBreakModeTailTruncation alignment:self.textAlignment];
    } else {
        [super drawTextInRect:rect];
    }
}

- (void)setHighlighted:(BOOL)highlighted
{
    // if label is not highlighted, and

    if (highlighted)
    {
        if (!_highlighted)
        {
            _defaultTextColor = self.textColor;
        }
        
        self.textColor = self.highlightedTextColor;
    }
    else if (_defaultTextColor != nil)
    {
        self.textColor = _defaultTextColor;
    }
    
    _highlighted = highlighted;
}

@end