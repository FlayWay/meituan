//
//  NSString+SYExtension.m
//  HttpRequset
//
//  Created by efc on 16/5/20.
//  Copyright © 2016年 bcLai. All rights reserved.
//

#import "NSString+SYExtension.h"

static NSString * DX_TOKEN = @"";


@implementation NSString (SYExtension)




- (NSString *)sy_urlEncode
{
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

//计算文件的大小
- (unsigned long long)cq_fileSize{
    //创建文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    //查看文件类型
    NSDictionary *atts = [mgr attributesOfItemAtPath:self error:nil];
    NSString *fileType = atts.fileType;
    
    if ([fileType isEqualToString:NSFileTypeDirectory]) {
        //获取文件夹遍历器
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        
        //总大小
        unsigned long long fileSize = 0;
        
        //遍历所有子路径
        for (NSString *subpath in enumerator) {
            //获取子路径的全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subpath];
            fileSize += [mgr attributesOfItemAtPath:fullPath error:nil].fileSize;
            
        }
        
        return fileSize;
    }
    
    //返回文件大小
    return atts.fileSize;
    
}


//计算字符串的size
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithfont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:font forKey:NSFontAttributeName];
    
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGRect rect = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    return rect.size;
}


/** 通过行数, 返回更新时间*/
- (NSString *)updateTimeForRow:(NSString *)row {
    
    

    // 获取当前时时间戳
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 创建歌曲时间戳  1352170595000/1000
    NSInteger publisthTime = [row integerValue];
    
    NSTimeInterval createTime = publisthTime;
    // 时间差
    NSTimeInterval time = currentTime - createTime;
    //秒转分钟
    NSInteger minturs = time/60;
    if (time<60)
    {
        return [NSString stringWithFormat:@"刚刚"];
    }
    
    if (minturs<60)
    {
        return [NSString stringWithFormat:@"%ld分钟前",minturs];
    }
    
    // 秒转小时
    NSInteger hours = time/3600;
    
    
    if (hours<24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒转天数
    NSInteger days = time/3600/24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    //秒转月
    NSInteger months = time/3600/24/30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    //秒转年
    NSInteger years = time/3600/24/30/12;
    return [NSString stringWithFormat:@"%ld年前",years];
}



@end
