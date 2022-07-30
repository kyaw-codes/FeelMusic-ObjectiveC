//
//  StartVC.m
//  FeelMusicFB
//
//  Created by Kyaw Zay Ya Lin Tun on 30/07/2022.
//

#import "StartVC.h"

@interface StartVC ()

@property (nonatomic, strong, nullable) UILabel *lblTitle;
@property (nonatomic, strong, nullable) UILabel *lblSubtitle;
@property (nonatomic, strong, nullable) UIImageView *imgBackground;
@property (nonatomic, strong, nullable) UIButton *btnCta;

- (void)setup;
- (void)setupView;
- (void)setupLayout;
- (void)setupGradientForCTABtn;

@end

@implementation StartVC

// MARK: - Lifecycle
- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self setupLayout];
    [self setupGradientForCTABtn];
}

// MARK: - View set up
- (void)setup {
    // Title
    self.lblTitle = [UILabel new];
    
    // Subtitle
    self.lblSubtitle = [[UILabel alloc] init];
    
    // Background image
    self.imgBackground = [UIImageView new];
    
    // Let's go button
    self.btnCta = [UIButton new];
}

- (void)setupView {
    // Title
    self.lblTitle.text = @"Feelmusic";
    self.lblTitle.font = [UIFont systemFontOfSize:32 weight:UIFontWeightBold];
    
    // Subtitle
    self.lblSubtitle.text = @"\"A great song should lift your heart, warm the soul and make you feel good.\"";
    self.lblSubtitle.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.lblSubtitle.textColor = [UIColor colorWithWhite:0.7 alpha:1];
    self.lblSubtitle.numberOfLines = 0;
    self.lblSubtitle.textAlignment = NSTextAlignmentCenter;
    
    // Image
    self.imgBackground.image = [UIImage imageNamed:@"bg"];
    self.imgBackground.contentMode = UIViewContentModeScaleAspectFill;
    
    // Let's go button
    [self.btnCta setTitle:@"Let's get started" forState:UIControlStateNormal];
    
    self.btnCta.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    
    UIImageSymbolConfiguration *iconConfig = [UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:18]];
    UIImage *arrowImage = [UIImage systemImageNamed:@"arrow.right" withConfiguration:iconConfig];
    self.btnCta.imageView.tintColor = UIColor.whiteColor;

    [self.btnCta setImage:arrowImage forState:UIControlStateNormal];
    self.btnCta.titleEdgeInsets = UIEdgeInsetsMake(0, -170, 0, 0);
    self.btnCta.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -380);
}

- (void)setupLayout {
    // Title
    [self.view addSubview:self.lblTitle];
    self.lblTitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.lblTitle.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:42].active = YES;
    [self.lblTitle.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    
    // Subtitle
    [self.view addSubview:self.lblSubtitle];
    self.lblSubtitle.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.lblSubtitle.topAnchor constraintEqualToAnchor:self.lblTitle.bottomAnchor constant:18].active = YES;
    [self.lblSubtitle.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:30].active = YES;
    [self.lblSubtitle.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-30].active = YES;
    
    // Image
    [self.view addSubview:self.imgBackground];
    self.imgBackground.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.imgBackground.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.imgBackground.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.imgBackground.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    // Let's go button
    [self.view addSubview:self.btnCta];
    self.btnCta.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.btnCta.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20].active = YES;
    [self.btnCta.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20].active = YES;
    [self.btnCta.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-30].active = YES;
    [self.btnCta.heightAnchor constraintEqualToConstant:60].active = YES;
}

- (void)setupGradientForCTABtn {
    // Set up gradient for cta button
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.btnCta.bounds;
    
    gradientLayer.colors = [NSArray arrayWithObjects:(id)UIColor.systemPinkColor.CGColor,
                            (id)UIColor.systemPurpleColor.CGColor,
                            nil];
    
    gradientLayer.locations = [NSArray arrayWithObjects:@0.0f, @1.0f, nil];
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    gradientLayer.cornerRadius = 10;
    
    [self.btnCta.layer insertSublayer:gradientLayer atIndex:0];
}

@end
