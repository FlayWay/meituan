//
//  NSString+SYExtension.h
//  HttpRequset
//
//  Created by efc on 16/5/20.
//  Copyright © 2016年 bcLai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SYExtension)


/*计算文件的大小*/
- (unsigned long long)cq_fileSize;
/*计算字符串的size*/
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
//计算字符串尺寸
- (CGSize)sizeWithfont:(UIFont *)font;
//计算字符串尺寸（限宽）
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;


/** 通过行数, 返回更新时间*/
- (NSString *)updateTimeForRow:(NSString *)row;
@end
