//
//  DOPDropDownMenu.m
//  DOPDropDownMenuDemo
//
//  Created by weizhou on 9/26/14.
//  Modify by tanyang on 20/3/15.
//  Copyright (c) 2014 fengweizhou. All rights reserved.
//

#import "DOPDropDownMenu.h"

@implementation DOPIndexPath
- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row {
    self = [super init];
    if (self) {
        _column = column;
        _row = row;
        _item = -1;
        _subItem = -1;
    }
    return self;
}

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row tem:(NSInteger)item {
    self = [self initWithColumn:column row:row];
    if (self) {
        _item = item;
        _subItem = -1;
    }
    return self;
}

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item subItem:(NSInteger)subItem {
    self = [self initWithColumn:column row:row];
    if (self) {
        _item = item;
        _subItem = subItem;
    }
    return self;
}



+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row {
    DOPIndexPath *indexPath = [[self alloc] initWithColumn:col row:row];
    return indexPath;
}

+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row item:(NSInteger)item
{
    return [[self alloc]initWithColumn:col row:row tem:item];
}

+ (instancetype)indexPathWithCol:(NSInteger)col row:(NSInteger)row item:(NSInteger)item subItem:(NSInteger)subItem
{
    return [[self alloc]initWithColumn:col row:row item:item subItem:subItem];
}

@end

@implementation DOPBackgroundCellView

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    //画一条底部线
    
    CGContextSetRGBStrokeColor(context, 219.0/255, 224.0/255, 228.0/255, 1);//线条颜色
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, rect.size.width,0);
    CGContextMoveToPoint(context, 0, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width,rect.size.height);
    CGContextStrokePath(context);
}

@end

#pragma mark - menu implementation

@interface DOPDropDownMenu (){
    struct {
        unsigned int numberOfRowsInColumn :1;
        unsigned int numberOfItemsInRow :1;
        unsigned int numberOfsubItemsInRowItem :1;//新增
        unsigned int titleForRowAtIndexPath :1;
        unsigned int titleForItemsInRowAtIndexPath :1;
        unsigned int titleForsubItemsInRowItemAtIndexPath :1;//三级新增
        unsigned int imageNameForRowAtIndexPath :1;
        unsigned int imageNameForItemsInRowAtIndexPath :1;
        unsigned int detailTextForRowAtIndexPath: 1;
        unsigned int detailTextForItemsInRowAtIndexPath: 1;
        
    }_dataSourceFlags;
}

@property (nonatomic, assign) NSInteger currentSelectedMenudIndex;  // 当前选中列
@property (nonatomic, assign) BOOL show;
@property (nonatomic, assign) NSInteger numOfMenu;
@property (nonatomic, assign) NSInteger numOfRow;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, strong) UIView *backGroundView;
@property (nonatomic, strong) UITableView *leftTableView;   // 一级列表
@property (nonatomic, strong) UITableView *rightTableView;  // 二级列表
@property (nonatomic, strong) UITableView *thirdTableView;  // 三级列表
@property (nonatomic, strong) UIImageView *buttomImageView; // 底部imageView
@property (nonatomic, weak) UIView *bottomShadow;

//data source
@property (nonatomic, copy) NSArray *array;
//layers array
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, copy) NSArray *indicators;
@property (nonatomic, copy) NSArray *bgLayers;

@end

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define kTableViewCellHeight 43
#define kTableViewHeight 300
#define kButtomImageViewHeight 21

#define kTextColor [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]
#define kDetailTextColor [UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1]
#define kSeparatorColor [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1]
#define kCellBgColor [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1]
#define kTextSelectColor [UIColor colorWithRed:246/255.0 green:79/255.0 blue:0/255.0 alpha:1]

@implementation DOPDropDownMenu {
    CGFloat _tableViewHeight;
    
}

#pragma mark - getter
- (UIColor *)indicatorColor {
    if (!_indicatorColor) {
        _indicatorColor = [UIColor blackColor];
    }
    return _indicatorColor;
}

- (UIColor *)textColor {
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *)separatorColor {
    if (!_separatorColor) {
        _separatorColor = [UIColor blackColor];
    }
    return _separatorColor;
}

- (NSString *)titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    return [self.dataSource menu:self titleForRowAtIndexPath:indexPath];
}

- (void)reloadData
{
    [self animateBackGroundView:_backGroundView show:NO complete:^{
        [self animateTableView:nil show:NO complete:^{
            _show = NO;
            id VC = self.dataSource;
            self.dataSource = nil;
            self.dataSource = VC;
        }];
    }];
    
}

- (void)selectDefalutIndexPath
{
    [self selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0]];
}

- (void)selectIndexPath:(DOPIndexPath *)indexPath triggerDelegate:(BOOL)trigger {
    if (!_dataSource || !_delegate
        || ![_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)] ) {
        return;
    }
    
    if ([_dataSource numberOfColumnsInMenu:self] <= indexPath.column || [_dataSource menu:self numberOfRowsInColumn:indexPath.column] <= indexPath.row) {
        return;
    }
    
    
    CATextLayer *title = (CATextLayer *)_titles[indexPath.column];
    if (indexPath.subItem < 0) {
        if (!_isClickHavesubItemValid && [_dataSource menu:self numberOfsubItemsInRowItem:indexPath.row column:indexPath.column item:indexPath.item] > 0) {
            title.string = [_dataSource menu:self titleForsubItemsInRowItemAtIndexPath:[DOPIndexPath indexPathWithCol:indexPath.column row:self.isRemainMenuTitle ? 0 : indexPath.row item:indexPath.item subItem:indexPath.subItem]];
            if (trigger) {
                [_delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:indexPath.column row:indexPath.row item:indexPath.item subItem:indexPath.subItem]];
            }
            if (_currentSelectRowArray.count > indexPath.column) {
                _currentSelectRowArray[indexPath.column] = @(indexPath.row);
            }
            
            if (_currentSelectItemArray.count > indexPath.row) {
                _currentSelectItemArray[indexPath.row] = @(indexPath.item);
            }
            
            CGSize size = [self calculateTitleSizeWithString:title.string];
            CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
            title.bounds = CGRectMake(0, 0, _custom ? 0 : sizeWidth, size.height);
            
        }
        else {
            if (indexPath.item < 0 ) {
                if (!_isClickHaveItemValid && [_dataSource menu:self numberOfItemsInRow:indexPath.row column:indexPath.column] > 0){
                    title.string = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:indexPath.column row:self.isRemainMenuTitle ? 0 : indexPath.row item:0]];
                    if (trigger) {
                        [_delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:indexPath.column row:indexPath.row item:0]];
                    }
                }else {
                    title.string = [_dataSource menu:self titleForRowAtIndexPath:
                                    [DOPIndexPath indexPathWithCol:indexPath.column row:self.isRemainMenuTitle ? 0 : indexPath.row]];
                    if (trigger) {
                        [_delegate menu:self didSelectRowAtIndexPath:indexPath];
                    }
                }
                if (_currentSelectRowArray.count > indexPath.column) {
                    _currentSelectRowArray[indexPath.column] = @(indexPath.row);
                }
                CGSize size = [self calculateTitleSizeWithString:title.string];
                CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
                title.bounds = CGRectMake(0, 0, _custom ? 0 : sizeWidth, size.height);
            }else if ([_dataSource menu:self numberOfItemsInRow:indexPath.row column:indexPath.column] > indexPath.column) {
                title.string = [_dataSource menu:self titleForItemsInRowAtIndexPath:indexPath];
                if (trigger) {
                    [_delegate menu:self didSelectRowAtIndexPath:indexPath];
                }
                if (_currentSelectRowArray.count > indexPath.column) {
                    _currentSelectRowArray[indexPath.column] = @(indexPath.row);
                }
                CGSize size = [self calculateTitleSizeWithString:title.string];
                CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
                title.bounds = CGRectMake(0, 0, _custom ? 0 : sizeWidth, size.height);
            }
            
        }
    } else if ([_dataSource menu:self numberOfsubItemsInRowItem:indexPath.row column:indexPath.column item:indexPath.item] > indexPath.row) {
        title.string = [_dataSource menu:self titleForsubItemsInRowItemAtIndexPath:indexPath];
        if (trigger) {
            [_delegate menu:self didSelectRowAtIndexPath:indexPath];
        }
        if (_currentSelectRowArray.count > indexPath.column) {
            _currentSelectRowArray[indexPath.column] = @(indexPath.row);
        }
        
        if (_currentSelectItemArray.count > indexPath.row) {
            _currentSelectItemArray[indexPath.row] = @(indexPath.item);
        }
        
        CGSize size = [self calculateTitleSizeWithString:title.string];
        CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
        title.bounds = CGRectMake(0, 0, _custom ? 0 : sizeWidth, size.height);
    }
    
}

- (void)selectIndexPath:(DOPIndexPath *)indexPath {
    [self selectIndexPath:indexPath triggerDelegate:YES];
}

#pragma mark - setter
- (void)setDataSource:(id<DOPDropDownMenuDataSource>)dataSource {
    if (_dataSource == dataSource) {
        return;
    }
    _dataSource = dataSource;
    
    //configure view
    if ([_dataSource respondsToSelector:@selector(numberOfColumnsInMenu:)]) {
        _numOfMenu = [_dataSource numberOfColumnsInMenu:self];
    } else {
        _numOfMenu = 1;
    }
    
    _currentSelectRowArray = [NSMutableArray arrayWithCapacity:_numOfMenu];
    
    for (NSInteger index = 0; index < _numOfMenu; ++index) {
        [_currentSelectRowArray addObject:@(0)];
        //configure view
        if ([_dataSource respondsToSelector:@selector(menu:numberOfRowsInColumn:)]) {
            _numOfRow = [_dataSource menu:self numberOfRowsInColumn:0];
        } else {
            _numOfRow = 0;
        }
        _currentSelectItemArray = [NSMutableArray arrayWithCapacity:_numOfRow];
        for (NSInteger j = 0; j < _numOfRow; ++j) {
            [_currentSelectItemArray addObject:@(0)];
        }
    }
    
    
    
    _dataSourceFlags.numberOfRowsInColumn = [_dataSource respondsToSelector:@selector(menu:numberOfRowsInColumn:)];
    
    _dataSourceFlags.numberOfItemsInRow = [_dataSource respondsToSelector:@selector(menu:numberOfItemsInRow:column:)];
    _dataSourceFlags.titleForRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:titleForRowAtIndexPath:)];
    _dataSourceFlags.titleForItemsInRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:titleForItemsInRowAtIndexPath:)];
    _dataSourceFlags.imageNameForRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:imageNameForRowAtIndexPath:)];
    _dataSourceFlags.imageNameForItemsInRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:imageNameForItemsInRowAtIndexPath:)];
    _dataSourceFlags.detailTextForRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:detailTextForRowAtIndexPath:)];
    _dataSourceFlags.detailTextForItemsInRowAtIndexPath = [_dataSource respondsToSelector:@selector(menu:detailTextForItemsInRowAtIndexPath:)];
    
    //三级菜单新增
    _dataSourceFlags.numberOfsubItemsInRowItem = [_dataSource respondsToSelector:@selector(menu:numberOfsubItemsInRowItem:column:item:)];
    
    _dataSourceFlags.titleForsubItemsInRowItemAtIndexPath = [_dataSource respondsToSelector:@selector(menu:titleForsubItemsInRowItemAtIndexPath:)];
    
    _bottomShadow.hidden = NO;
    CGFloat textLayerInterval = self.frame.size.width / ( _numOfMenu * 2);
    CGFloat separatorLineInterval = self.frame.size.width / _numOfMenu;
    CGFloat bgLayerInterval = self.frame.size.width / _numOfMenu;
    
    NSMutableArray *tempTitles = [[NSMutableArray alloc] initWithCapacity:_numOfMenu];
    NSMutableArray *tempIndicators = [[NSMutableArray alloc] initWithCapacity:_numOfMenu];
    NSMutableArray *tempBgLayers = [[NSMutableArray alloc] initWithCapacity:_numOfMenu];
    
    for (int i = 0; i < _numOfMenu; i++) {
        //bgLayer
        CGPoint bgLayerPosition = CGPointMake((i+0.5)*bgLayerInterval, self.frame.size.height/2);
        CALayer *bgLayer = [self createBgLayerWithColor:[UIColor whiteColor] andPosition:bgLayerPosition];
        [self.layer addSublayer:bgLayer];
        [tempBgLayers addObject:bgLayer];
        //title
        CGPoint titlePosition = CGPointMake( (i * 2 + 1) * textLayerInterval , self.frame.size.height / 2);
        
        NSString *titleString;
        if (!self.isClickHavesubItemValid && _dataSourceFlags.numberOfsubItemsInRowItem && [_dataSource menu:self numberOfsubItemsInRowItem:0 column:i item:0]>0) {
            titleString = [_dataSource menu:self titleForsubItemsInRowItemAtIndexPath:[DOPIndexPath indexPathWithCol:i row:0 item:0 subItem:0]];
        }
        else if (!self.isClickHaveItemValid && _dataSourceFlags.numberOfItemsInRow && [_dataSource menu:self numberOfItemsInRow:0 column:i]>0) {
            titleString = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:i row:0 item:0]];
        }else {
            titleString =[_dataSource menu:self titleForRowAtIndexPath:[DOPIndexPath indexPathWithCol:i row:0]];
        }
        
        CATextLayer *title = [self createTextLayerWithNSString:titleString withColor:self.textColor andPosition:titlePosition];
        [self.layer addSublayer:title];
        [tempTitles addObject:title];
        //indicator
        CAShapeLayer *indicator = [self createIndicatorWithColor:self.indicatorColor andPosition:CGPointMake((i + 1)*separatorLineInterval - 10, self.frame.size.height / 2) andShow:!_custom];
        [self.layer addSublayer:indicator];
        [tempIndicators addObject:indicator];
        
        //separator
        if (i != _numOfMenu - 1) {
            CGPoint separatorPosition = CGPointMake(ceilf((i + 1) * separatorLineInterval-1), self.frame.size.height / 2);
            CAShapeLayer *separator = [self createSeparatorLineWithColor:self.separatorColor andPosition:separatorPosition];
            [self.layer addSublayer:separator];
        }
        
        
    }
    _titles = [tempTitles copy];
    _indicators = [tempIndicators copy];
    _bgLayers = [tempBgLayers copy];
}

#pragma mark - init method
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    self = [self initWithFrame:CGRectMake(origin.x, origin.y, screenSize.width, height)];
    if (self) {
        _custom = NO;
        _origin = origin;
        _currentSelectedMenudIndex = -1;
        _show = NO;
        _fontSize = 14;
        _cellStyle = UITableViewCellStyleValue1;
        _separatorColor = kSeparatorColor;
        _textColor = kTextColor;
        _textSelectedColor = kTextSelectColor;
        _detailTextFont = [UIFont systemFontOfSize:11];
        _detailTextColor = kDetailTextColor;
        _indicatorColor = kTextColor;
        _tableViewHeight = IS_IPHONE_4_OR_LESS ? 200 : kTableViewHeight;
        _isClickHaveItemValid = YES;
        _isClickHavesubItemValid = YES;
        
        //lefttableView init
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0) style:UITableViewStylePlain];
        _leftTableView.rowHeight = kTableViewCellHeight;
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
        _leftTableView.separatorColor = kSeparatorColor;
        _leftTableView.separatorInset = UIEdgeInsetsZero;
        _leftTableView.tableFooterView = [[UIView alloc]init];
        
        //righttableView init
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x + self.frame.size.width/3, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0) style:UITableViewStylePlain];
        _rightTableView.rowHeight = kTableViewCellHeight;
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
        _rightTableView.separatorColor = kSeparatorColor;
        _rightTableView.separatorInset = UIEdgeInsetsZero;
        //_rightTableView.tableFooterView = [[UIView alloc]init];
        
        
        //thirdtableView init
        _thirdTableView = [[UITableView alloc] initWithFrame:CGRectMake(origin.x + (self.frame.size.width/3) * 2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0) style:UITableViewStylePlain];
        _thirdTableView.rowHeight = kTableViewCellHeight;
        _thirdTableView.dataSource = self;
        _thirdTableView.delegate = self;
        _thirdTableView.separatorColor = kSeparatorColor;
        _thirdTableView.separatorInset = UIEdgeInsetsZero;
        
        _buttomImageView = [[UIImageView alloc]initWithFrame:CGRectMake(origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, kButtomImageViewHeight)];
        _buttomImageView.image = [UIImage imageNamed:@"icon_chose_bottom"];
        
        //self tapped
        self.backgroundColor = [UIColor whiteColor];
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuTapped:)];
        [self addGestureRecognizer:tapGesture];
        
        //background init and tapped
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(origin.x, origin.y, screenSize.width, screenSize.height)];
        _backGroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        _backGroundView.opaque = NO;
        UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTapped:)];
        [_backGroundView addGestureRecognizer:gesture];
        
        //add bottom shadow
        UIView *bottomShadow = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, screenSize.width, 0.5)];
        bottomShadow.backgroundColor = kSeparatorColor;
        bottomShadow.hidden = YES;
        [self addSubview:bottomShadow];
        _bottomShadow = bottomShadow;
    }
    return self;
}

#pragma mark - init support
- (CALayer *)createBgLayerWithColor:(UIColor *)color andPosition:(CGPoint)position {
    CALayer *layer = [CALayer layer];
    
    layer.position = position;
    layer.bounds = CGRectMake(0, 0, self.frame.size.width/self.numOfMenu, self.frame.size.height-1);
    layer.backgroundColor = color.CGColor;
    
    return layer;
}

- (CAShapeLayer *)createIndicatorWithColor:(UIColor *)color andPosition:(CGPoint)point andShow:(BOOL)show {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    // MAKE : Test
    if (show == YES) {
    [path addLineToPoint:CGPointMake(8, 0)];
    [path addLineToPoint:CGPointMake(4, 5)];
    }
    [path closePath];
    
    layer.path = path.CGPath;
    layer.lineWidth = 0.8;
    layer.fillColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = point;
    
    return layer;
}

- (CAShapeLayer *)createSeparatorLineWithColor:(UIColor *)color andPosition:(CGPoint)point {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(160,0)];
    [path addLineToPoint:CGPointMake(160, 20)];
    
    layer.path = path.CGPath;
    layer.lineWidth = 1;
    layer.strokeColor = color.CGColor;
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    CGPathRelease(bound);
    layer.position = point;
    return layer;
}

- (CATextLayer *)createTextLayerWithNSString:(NSString *)string withColor:(UIColor *)color andPosition:(CGPoint)point {
    
    CGSize size = [self calculateTitleSizeWithString:string];
    
    CATextLayer *layer = [CATextLayer new];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
    layer.bounds = CGRectMake(0, 0, sizeWidth, size.height);
    layer.string = string;
    layer.fontSize = _fontSize;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.truncationMode = kCATruncationEnd;
    layer.foregroundColor = color.CGColor;
    
    layer.contentsScale = [[UIScreen mainScreen] scale];
    
    layer.position = point;
    
    return layer;
}

- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    //CGFloat fontSize = 14.0;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:_fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return CGSizeMake(ceilf(size.width)+2, size.height);
}

#pragma mark - gesture handle
- (void)menuTapped:(UITapGestureRecognizer *)paramSender {
    if (_dataSource == nil) {
        return;
    }
    
    NSInteger tapIndex = 0;
    if (!_custom) {
    CGPoint touchPoint = [paramSender locationInView:self];
    //calculate index
    tapIndex = touchPoint.x / (self.frame.size.width / _numOfMenu);
    }
    
    for (int i = 0; i < _numOfMenu; i++) {
        if (i != tapIndex) {
            [self animateIndicator:_indicators[i] Forward:NO complete:^{
                [self animateTitle:_titles[i] show:NO complete:^{
                    
                }];
            }];
        }
    }
    
    if (tapIndex == _currentSelectedMenudIndex && _show) {
        [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
            _currentSelectedMenudIndex = tapIndex;
            _show = NO;
        }];
    } else {
        
        //configure view
        if (_currentSelectedMenudIndex != tapIndex) {
            if ([_dataSource respondsToSelector:@selector(menu:numberOfRowsInColumn:)]) {
                _numOfRow = [_dataSource menu:self numberOfRowsInColumn:_currentSelectedMenudIndex];
            } else {
                _numOfRow = 0;
            }
            _currentSelectItemArray = [NSMutableArray arrayWithCapacity:_numOfRow];
            for (NSInteger j = 0; j < _numOfRow; ++j) {
                [_currentSelectItemArray addObject:@(0)];
            }
            
        }
        
        _currentSelectedMenudIndex = tapIndex;
        [_leftTableView reloadData];
        if (_dataSource && _dataSourceFlags.numberOfItemsInRow) {
            [_rightTableView reloadData];
            //三级菜单
            if (_dataSource && _dataSourceFlags.numberOfsubItemsInRowItem) {
                [_thirdTableView reloadData];
            }
        }
        
        [self animateIdicator:_indicators[tapIndex] background:_backGroundView tableView:_leftTableView title:_titles[tapIndex] forward:YES complecte:^{
            _show = YES;
        }];
    }
}

- (void)backgroundTapped:(UITapGestureRecognizer *)paramSender
{
    [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
        _show = NO;
    }];
}

#pragma mark - animation method
- (void)animateIndicator:(CAShapeLayer *)indicator Forward:(BOOL)forward complete:(void(^)())complete {
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.25];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anim.values = forward ? @[ @0, @(M_PI) ] : @[ @(M_PI), @0 ];
    
    if (!anim.removedOnCompletion) {
        [indicator addAnimation:anim forKey:anim.keyPath];
    } else {
        [indicator addAnimation:anim forKey:anim.keyPath];
        [indicator setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    
    [CATransaction commit];
    
    if (forward) {
        // 展开
        indicator.fillColor = _textSelectedColor.CGColor;
    } else {
        // 收缩
        indicator.fillColor = _textColor.CGColor;
    }
    
    complete();
}

- (void)animateBackGroundView:(UIView *)view show:(BOOL)show complete:(void(^)())complete {
    if (show) {
        [self.superview addSubview:view];
        [view.superview addSubview:self];
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
    }
    complete();
}

- (void)animateTableView:(UITableView *)tableView show:(BOOL)show complete:(void(^)())complete {
    
    BOOL haveItems = NO;
    BOOL haveSubItems = NO;
    
    if (_dataSource) {
        NSInteger num = [_leftTableView numberOfRowsInSection:0];
        
        for (NSInteger i = 0; i<num;++i) {
            if (_dataSourceFlags.numberOfItemsInRow
                &&  [_dataSource menu:self numberOfItemsInRow:i column:_currentSelectedMenudIndex] > 0) {
                haveItems = YES;
                break;
            }
        }
        
        for (NSInteger i = 0; i<num;++i) {
            NSInteger numberOfItemsInRowInColumn = [_dataSource menu:self numberOfItemsInRow:i column:_currentSelectedMenudIndex];
            if (_dataSourceFlags.numberOfItemsInRow
                &&  numberOfItemsInRowInColumn > 0) {
                for ( NSInteger j = 0; j < numberOfItemsInRowInColumn; ++j) {
                    if (_dataSourceFlags.numberOfsubItemsInRowItem
                        &&  [_dataSource menu:self numberOfsubItemsInRowItem:i column:_currentSelectedMenudIndex item:j] > 0) {
                        haveSubItems = YES;
                        break;
                    }
                }
                break;
            }
        }
        
        
    }
    
    
    if (show) {
        if (haveItems && !haveSubItems) {
            _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, 0);
            _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, 0);
            [self.superview addSubview:_leftTableView];
            [self.superview addSubview:_rightTableView];
        } else if (haveItems && haveSubItems) {
            _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
            _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
            _thirdTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3 * 2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
            [self.superview addSubview:_leftTableView];
            [self.superview addSubview:_rightTableView];
            [self.superview addSubview:_thirdTableView];
        } else {
            _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 0);
            _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
            _thirdTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3 * 2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
            [self.superview addSubview:_leftTableView];
            
        }
        _buttomImageView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, kButtomImageViewHeight);
        [self.superview addSubview:_buttomImageView];
        
        NSInteger num = [_leftTableView numberOfRowsInSection:0];
        CGFloat tableViewHeight = num * kTableViewCellHeight > _tableViewHeight+1 ? _tableViewHeight:num*kTableViewCellHeight+1;
        
        [UIView animateWithDuration:0.2 animations:^{
            if (haveItems && !haveSubItems) {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, tableViewHeight);
                
                _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, tableViewHeight);
            } else if (haveItems && haveSubItems) {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, tableViewHeight);
                
                _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, tableViewHeight);
                _thirdTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3 * 2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, tableViewHeight);
                
            } else {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, tableViewHeight);
            }
            _buttomImageView.frame = CGRectMake(self.origin.x, CGRectGetMaxY(_leftTableView.frame)-2, self.frame.size.width, kButtomImageViewHeight);
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            if (haveItems && !haveSubItems) {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, 0);
                
                _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/2, 0);
            } else if (haveItems && haveSubItems) {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
                
                _rightTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
                _thirdTableView.frame = CGRectMake(self.origin.x + self.frame.size.width/3 * 2, self.frame.origin.y + self.frame.size.height, self.frame.size.width/3, 0);
                
            } else {
                _leftTableView.frame = CGRectMake(self.origin.x, self.frame.origin.y + self.frame.size.height, self.frame.size.width, 0);
            }
            _buttomImageView.frame = CGRectMake(self.origin.x, CGRectGetMaxY(_leftTableView.frame)-2, self.frame.size.width, kButtomImageViewHeight);
        } completion:^(BOOL finished) {
            if (_thirdTableView.superview) {
                [_thirdTableView removeFromSuperview];
            }
            
            if (_rightTableView.superview) {
                [_rightTableView removeFromSuperview];
            }
            [_leftTableView removeFromSuperview];
            [_buttomImageView removeFromSuperview];
        }];
    }
    complete();
}

- (void)animateTitle:(CATextLayer *)title show:(BOOL)show complete:(void(^)())complete {
    CGSize size = [self calculateTitleSizeWithString:title.string];
    CGFloat sizeWidth = (size.width < (self.frame.size.width / _numOfMenu) - 25) ? size.width : self.frame.size.width / _numOfMenu - 25;
    title.bounds = CGRectMake(0, 0, _custom ? 0 : sizeWidth, size.height);
    if (!show) {
        title.foregroundColor = _textColor.CGColor;
    } else {
        title.foregroundColor = _textSelectedColor.CGColor;
    }
    complete();
}

- (void)animateIdicator:(CAShapeLayer *)indicator background:(UIView *)background tableView:(UITableView *)tableView title:(CATextLayer *)title forward:(BOOL)forward complecte:(void(^)())complete{
    
    [self animateIndicator:indicator Forward:forward complete:^{
        [self animateTitle:title show:forward complete:^{
            [self animateBackGroundView:background show:forward complete:^{
                [self animateTableView:tableView show:forward complete:^{
                }];
            }];
        }];
    }];
    
    complete();
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSAssert(_dataSource != nil, @"menu's dataSource shouldn't be nil");
    if (_leftTableView == tableView) {
        if (_dataSourceFlags.numberOfRowsInColumn) {
            return [_dataSource menu:self
                numberOfRowsInColumn:_currentSelectedMenudIndex];;
        } else {
            //NSAssert(0 == 1, @"required method of dataSource protocol should be implemented");
            return 0;
        }
    } else if (_rightTableView == tableView) {
        if (_dataSourceFlags.numberOfItemsInRow) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            return [_dataSource menu:self
                  numberOfItemsInRow:currentSelectedMenudRow column:_currentSelectedMenudIndex];
        } else {
            //NSAssert(0 == 1, @"required method of dataSource protocol should be implemented");
            return 0;
        }
    }
    else {
        if (_dataSourceFlags.numberOfsubItemsInRowItem) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            NSInteger currentSelectedMenudRowItem = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];//获取item number xiaoyin
            return [_dataSource menu:self numberOfsubItemsInRowItem:currentSelectedMenudRow column:_currentSelectedMenudIndex item:currentSelectedMenudRowItem];
        } else {
            //NSAssert(0 == 1, @"required method of dataSource protocol should be implemented");
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"DropDownMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:_cellStyle reuseIdentifier:identifier];
        //cell.separatorInset = UIEdgeInsetsZero;
        DOPBackgroundCellView *bg = [[DOPBackgroundCellView alloc]init];
        bg.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = bg;
        cell.textLabel.highlightedTextColor = _textSelectedColor;
        cell.textLabel.textColor = _textColor;
        cell.textLabel.font = [UIFont systemFontOfSize:_fontSize];
        if (_dataSourceFlags.detailTextForRowAtIndexPath || _dataSourceFlags.detailTextForItemsInRowAtIndexPath) {
            cell.detailTextLabel.textColor = _detailTextColor;
            cell.detailTextLabel.font = _detailTextFont;
        }
    }
    //NSAssert(_dataSource != nil, @"menu's datasource shouldn't be nil");
    if (tableView == _leftTableView) {
        if (_dataSourceFlags.titleForRowAtIndexPath) {
            cell.textLabel.text = [_dataSource menu:self titleForRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row]];
            if (_dataSourceFlags.imageNameForRowAtIndexPath) {
                NSString *imageName = [_dataSource menu:self imageNameForRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row]];
                if (imageName && imageName.length > 0) {
                    cell.imageView.image = [UIImage imageNamed:imageName];
                }else {
                    cell.imageView.image = nil;
                }
                
            }else {
                cell.imageView.image = nil;
            }
            
            if (_dataSourceFlags.detailTextForRowAtIndexPath) {
                NSString *detailText = [_dataSource menu:self detailTextForRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row]];
                cell.detailTextLabel.text = detailText;
            }else {
                cell.detailTextLabel.text = nil;
            }
            
        } else {
            //NSAssert(0 == 1, @"dataSource method needs to be implemented");
        }
        
        NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
        if (indexPath.row == currentSelectedMenudRow)
        {
            [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
        
        if (_dataSourceFlags.numberOfItemsInRow && [_dataSource menu:self numberOfItemsInRow:indexPath.row column:_currentSelectedMenudIndex]> 0){
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_chose_arrow_nor"] highlightedImage:[UIImage imageNamed:@"icon_chose_arrow_sel"]];
        } else {
            cell.accessoryView = nil;
        }
        
        cell.backgroundColor = kCellBgColor;
        
    } else if  (tableView == _rightTableView){
        if (_dataSourceFlags.titleForItemsInRowAtIndexPath) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            cell.textLabel.text = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:indexPath.row]];
            
            if (_dataSourceFlags.imageNameForItemsInRowAtIndexPath) {
                NSString *imageName = [_dataSource menu:self imageNameForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:indexPath.row]];
                
                if (imageName && imageName.length > 0) {
                    cell.imageView.image = [UIImage imageNamed:imageName];
                }else {
                    cell.imageView.image = nil;
                }
            }else {
                cell.imageView.image = nil;
            }
            
            if (_dataSourceFlags.detailTextForItemsInRowAtIndexPath) {
                NSString *detailText = [_dataSource menu:self detailTextForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:indexPath.row]];
                cell.detailTextLabel.text = detailText;
            }else {
                cell.detailTextLabel.text = nil;
            }
            
        } else {
            //NSAssert(0 == 1, @"dataSource method needs to be implemented");
        }
        
        if ([cell.textLabel.text isEqualToString:[(CATextLayer *)[_titles objectAtIndex:_currentSelectedMenudIndex] string]]) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentSelectedMenudRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            [_rightTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
        
        NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
        NSInteger currentSelectedItemMenudRow = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];
        if (indexPath.row == currentSelectedItemMenudRow)
        {
            [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        }
        
        if (_dataSourceFlags.numberOfsubItemsInRowItem && [_dataSource menu:self numberOfsubItemsInRowItem:indexPath.row column:_currentSelectedMenudIndex item:indexPath.row]> 0){
            cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_chose_arrow_nor"] highlightedImage:[UIImage imageNamed:@"icon_chose_arrow_sel"]];
        } else {
            cell.accessoryView = nil;
        }
        
        cell.backgroundColor = kCellBgColor;
    }
    else {
        if (_dataSourceFlags.titleForsubItemsInRowItemAtIndexPath) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            NSInteger currentSelectedItemMenudRow = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];
            cell.textLabel.text = [_dataSource menu:self titleForsubItemsInRowItemAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:currentSelectedItemMenudRow subItem:indexPath.row]];
            cell.imageView.image = nil;
            cell.detailTextLabel.text = nil;
            
            
        }
 
        if([cell.textLabel.text isEqualToString:[(CATextLayer *)[_titles objectAtIndex:_currentSelectedMenudIndex] string]]) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            NSInteger currentSelectedItemMenudRow = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];//xiaoyin
            [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentSelectedMenudRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            [_rightTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:currentSelectedItemMenudRow inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            [_thirdTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
        cell.backgroundColor = [UIColor whiteColor];
        cell.accessoryView = nil;
    }
    
    return cell;
    
}

#pragma mark - tableview delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [_delegate respondsToSelector:@selector(menu:willSelectRowAtIndexPath:)]) {
        if (tableView == _rightTableView ){
            return [self.delegate menu:self willSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row]];
        }
        else {
            return [self.delegate menu:self willSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row item: 0]];
        }
    } else {
        //TODO: delegate is nil
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (_leftTableView == tableView) {
        BOOL haveItem = [self confiMenuWithSelectRow:indexPath.row];
        BOOL isClickHaveItemValid = self.isClickHaveItemValid ? YES : haveItem;
        
        if (isClickHaveItemValid && _delegate && [_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
            [self.delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:indexPath.row]];
        } else {
            //TODO: delegate is nil
        }
    } else if (_rightTableView == tableView)  {
        
        BOOL haveSubItem = [self confiMenuWithSelectItem:indexPath.row];
        BOOL isClickHavesubItemValid = self.isClickHavesubItemValid ? YES : haveSubItem;
        
        if (isClickHavesubItemValid && _delegate && [_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            [self.delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:indexPath.row]];
        } else {
            //TODO: delegate is nil
        }
    }
    else {
        [self confiMenuWithSelectSubItem:indexPath.item];
        if (self.delegate && [_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:)]) {
            NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
            NSInteger currentSelectedItem = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];//xiaoyin
            [self.delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:currentSelectedItem subItem:indexPath.row]];
        } else {
            //TODO: delegate is nil
            
        }
    }
    
}

- (BOOL )confiMenuWithSelectRow:(NSInteger)row {
    
    _currentSelectRowArray[_currentSelectedMenudIndex] = @(row);
    
    
    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedMenudIndex];
    
    if (_dataSourceFlags.numberOfItemsInRow && [_dataSource menu:self numberOfItemsInRow:row column:_currentSelectedMenudIndex]> 0) {
        
        // 有双列表 有item数据
        if (self.isClickHaveItemValid) {
            title.string = [_dataSource menu:self titleForRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:row]];
            [self animateTitle:title show:YES complete:^{
                [_rightTableView reloadData];
            }];
            
            if (self.isClickHaveItemValid) {
                NSString* string = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:row item:0]] ;
                if (string != nil) {
                    title.string = string;
                    [self animateTitle:title show:YES complete:^{
                        [_thirdTableView reloadData];
                    }];
                } else {
                    [_thirdTableView reloadData];
                }
            }
            else {
                [_thirdTableView reloadData];
            }
        } else {
            [_rightTableView reloadData];
        }
        return NO;
        
    } else {
        
        title.string = [_dataSource menu:self titleForRowAtIndexPath:
                        [DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:self.isRemainMenuTitle ? 0 : row]];
        [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
            _show = NO;
        }];
        if ([_delegate respondsToSelector:@selector(menu:didSelectRowAtIndexPath:isNoHaveItem:)]) {
            [self.delegate menu:self didSelectRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:row ] isNoHaveItem:YES];
        }
        
        return YES;
    }
}

- (BOOL)confiMenuWithSelectItem:(NSInteger)item {
    
    NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
    _currentSelectItemArray[currentSelectedMenudRow] = @(item);
    
    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedMenudIndex];
    
    if (_dataSourceFlags.numberOfsubItemsInRowItem && [_dataSource menu:self numberOfsubItemsInRowItem:currentSelectedMenudRow column:_currentSelectedMenudIndex item:item]> 0) {
        
        // 有三级列表 有subitem数据
        if (self.isClickHavesubItemValid) {
            title.string = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:item]];
            [self animateTitle:title show:YES complete:^{
                [_thirdTableView reloadData];
            }];
        } else {
            [_thirdTableView reloadData];
        }
        return NO;
        
    } else {
        
        title.string = [_dataSource menu:self titleForItemsInRowAtIndexPath:
                        [DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:item]];
        [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
            _show = NO;
        }];
        return YES;
    }
    
    
    //    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedMenudIndex];
    //    NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
    //    title.string = [_dataSource menu:self titleForItemsInRowAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:item]];
    //    [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
    //        _show = NO;
    //    }];
    
}

- (void)confiMenuWithSelectSubItem:(NSInteger)subItem {
    
    CATextLayer *title = (CATextLayer *)_titles[_currentSelectedMenudIndex];
    NSInteger currentSelectedMenudRow = [_currentSelectRowArray[_currentSelectedMenudIndex] integerValue];
    NSInteger currentSelectedItem = [_currentSelectItemArray[currentSelectedMenudRow] integerValue];//xiaoyin
    title.string = [_dataSource menu:self titleForsubItemsInRowItemAtIndexPath:[DOPIndexPath indexPathWithCol:_currentSelectedMenudIndex row:currentSelectedMenudRow item:currentSelectedItem subItem:subItem]];
    [self animateIdicator:_indicators[_currentSelectedMenudIndex] background:_backGroundView tableView:_leftTableView title:_titles[_currentSelectedMenudIndex] forward:NO complecte:^{
        _show = NO;
    }];
    
}

@end

