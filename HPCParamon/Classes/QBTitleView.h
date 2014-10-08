#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class QBTitleView;

@protocol QBTitleViewDelegate <NSObject>
@optional
- (void)titleViewDidTouchDown:(QBTitleView *)titleView;
- (void)titleViewDidTouchUpInside:(QBTitleView *)titleView;
- (void)titleViewDidTouchUpOutside:(QBTitleView *)titleView;
@required
-(void) SwitchView;
@end

@interface QBTitleView : UIView

@property (nonatomic, assign) id<QBTitleViewDelegate> delegate;
@property (nonatomic, assign) BOOL highlighted;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *highlightedImage;

@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGSize imageViewSize;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *titleLabel;

- (void)update;

@end
