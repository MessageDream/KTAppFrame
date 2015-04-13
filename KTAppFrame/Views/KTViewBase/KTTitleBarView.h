//
//  KTTitleBarView.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTBaseView.h"
#import "KTCustomTitleBar.h"


@interface KTTitleBarView : KTBaseView
{
@protected
    KTCustomTitleBar *_customTitleBar;
}
@property(nonatomic,readonly)KTCustomTitleBar *customTitleBar;
@property (nonatomic,weak)id<KTCustomTitleBar_ButtonDelegate>delegate_soon;

@end
