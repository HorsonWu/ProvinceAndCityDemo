//
//  ViewController.m
//  RetrievalOfTableView
//
//  Created by Horson Wu on 15/7/11.
//  Copyright (c) 2015年 Horson Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIView *_headView;
    UITableView *_bigTableView;
    UITableView *_smallTableView;
    UILabel *_cityLabel;
    UILabel *_remarkLabel;
    UIButton *_clearButton;
    
    //省份的索引字母
    NSArray *_titleOfProvince;
    
    //以各字母开头的省份字典
    NSDictionary *_dictionary_A;
    NSDictionary *_dictionary_B;
    NSDictionary *_dictionary_C;
    NSDictionary *_dictionary_F;
    NSDictionary *_dictionary_G;
    NSDictionary *_dictionary_H;
    NSDictionary *_dictionary_J;
    NSDictionary *_dictionary_L;
    NSDictionary *_dictionary_N;
    NSDictionary *_dictionary_Q;
    NSDictionary *_dictionary_S;
    NSDictionary *_dictionary_T;
    NSDictionary *_dictionary_X;
    NSDictionary *_dictionary_Y;
    NSDictionary *_dictionary_Z;
    
    //单个省份的城市数组
    NSArray *_cityArrayOfSimpleProvince;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self initView];
}

-(void)initData{
    _titleOfProvince = @[@"A",@"B",@"C",@"F",@"G",@"H",@"J",@"L",@"N",@"Q",@"S",@"T",@"X",@"Y",@"Z"];
    _dictionary_A=@{
                   @"安徽":@[@"合肥",@"芜湖",@"蚌埠",@"淮南",@"马鞍山",@"淮北",@"铜陵",@"安庆",@"黄山",@"滁州",@"阜阳",@"宿州",@"巢湖",@"六安",@"毫州",@"池州",@"宣城"]
                   };
    _dictionary_B=@{
                   @"北京":@[@"北京"]
                   };
    _dictionary_C=@{
                   @"重庆":@[@"重庆"]
                   };
    _dictionary_F=@{
                   @"福建":@[@"福州",@"厦门",@"莆田",@"三明",@"泉州",@"漳州",@"南平",@"龙岩",@"宁德"]
                   };
    _dictionary_G=@{
                   @"广东":@[@"广州",@"珠海",@"佛山",@"韶关",@"汕头",@"江门",@"湛江",@"茂名",@"肇庆",@"惠州",@"梅州",@"汕尾",@"河源",@"阳江",@"清远",@"东莞",@"中山",@"潮州",@"揭阳",@"云浮"],
                   @"广西":@[@"南宁",@"柳州",@"桂林",@"梧州",@"北海",@"防城港",@"钦州",@"贵港",@"玉林",@"百色",@"贺州",@"河池",@"来宾",@"崇左"],
                   @"贵州":@[@"贵阳",@"六盘水",@"遵义",@"安顺",@"铜仁",@"黔西南",@"毕节",@"黔东南",@"黔南"],
                   @"甘肃":@[@"兰州",@"嘉峪关",@"金昌",@"白银",@"天水",@"武威",@"张掖",@"平凉",@"酒泉",@"庆阳",@"定西",@"陇南",@"临夏",@"甘南"]
                   };
    
    _dictionary_H=@{
                   @"海南":@[@"海口",@"三亚",@"五指山",@"琼海",@"儋州",@"文昌",@"万宁",@"东方",@"定安",@"屯昌",@"澄迈",@"临高",@"白沙",@"昌江",@"乐东",@"陵水",@"保亭",@"琼中"],
                   @"河南":@[@"郑州",@"开封",@"洛阳",@"平顶山",@"安阳",@"鹤壁",@"新乡",@"焦作",@"濮阳",@"许昌",@"漯河",@"三门峡",@"南阳",@"商丘",@"信阳",@"周口",@"驻马店",@"济源"],
                   @"河北":@[@"石家庄",@"唐山",@"秦皇岛",@"邯郸",@"邢台",@"保定",@"张家口",@"承德",@"沧州",@"廊坊",@"衡水"],
                   @"湖南":@[@"长沙",@"株洲",@"湘潭",@"衡阳",@"邵阳",@"岳阳",@"常德",@"张家界",@"益阳",@"郴州",@"永州",@"怀化",@"娄底",@"湘西"],
                   @"湖北":@[@"武汉",@"黄石",@"十堰",@"宜昌",@"襄阳",@"鄂州",@"荆门",@"孝感",@"荆州",@"黄冈",@"咸宁",@"随州",@"恩施",@"仙桃",@"潜江",@"天门",@"神农架"],
                   @"黑龙江":@[@"哈尔滨",@"齐齐哈尔",@"鸡西",@"鹤岗",@"双鸭山",@"大庆",@"伊春",@"佳木斯",@"七台河",@"牡丹江",@"黑河",@"绥化",@"大兴安岭"]
                   };
    _dictionary_J=@{
                   @"江苏":@[@"南京",@"无锡",@"徐州",@"常州",@"苏州",@"南通",@"连云港",@"淮安",@"盐城",@"扬州",@"镇江",@"泰州",@"宿迁"],
                   @"江西":@[@"南昌",@"景德镇",@"萍乡",@"九江",@"新余",@"鹰潭",@"赣州",@"吉安",@"宜春",@"抚州",@"上饶"],
                   @"吉林":@[@"长春",@"吉林",@"四平",@"辽源",@"通化",@"白山",@"松原",@"白城",@"延边"],
                   };
    _dictionary_L=@{
                   @"辽宁":@[@"沈阳",@"大连",@"鞍山",@"抚顺",@"本溪",@"丹东",@"锦州",@"营口",@"阜新",@"辽阳",@"盘锦",@"铁岭",@"朝阳",@"葫芦岛"],
                   };
    _dictionary_N=@{
                   @"内蒙古":@[@"呼和浩特",@"包头",@"乌海",@"赤峰",@"通辽",@"鄂尔多斯",@"呼伦贝尔",@"巴彦淖尔",@"乌兰察布",@"兴安盟",@"锡林郭勒盟",@"阿拉善盟"],
                   @"宁夏":@[@"银川",@"石嘴山",@"吴忠",@"固原",@"中卫"],
                   };
    _dictionary_Q=@{
                    @"青海":@[@"西宁",@"海东",@"海北",@"黄南",@"海南",@"果洛",@"玉树",@"海西"],
                    };
    _dictionary_S=@{
                    @"上海":@[@"上海"],
                    @"陕西":@[@"西安",@"铜川",@"宝鸡",@"咸阳",@"渭南",@"延安",@"汉中",@"榆林",@"安康",@"商洛"],
                    @"四川":@[@"自贡",@"攀枝花",@"泸州",@"德阳",@"绵阳",@"广元",@"遂宁",@"内江",@"乐山",@"南充",@"眉山",@"宜宾",@"广安",@"达州",@"雅安",@"巴中",@"资阳",@"阿坝",@"甘孜",@"凉山"],
                    @"山西":@[@"太原",@"大同",@"阳泉",@"长治",@"晋城",@"朔州",@"晋中",@"运城",@"忻州",@"临汾",@"吕梁"],
                    @"山东":@[@"济南",@"青岛",@"淄博",@"枣庄",@"东营",@"烟台",@"潍坊",@"济宁",@"泰安",@"威海",@"日照",@"莱芜",@"临沂",@"德州",@"聊城",@"滨州",@"菏泽"],
                    };
    _dictionary_T=@{
                    @"天津":@[@"天津"],
                    };
    _dictionary_X=@{
                    @"新疆":@[@"乌鲁木齐",@"克拉玛依",@"吐鲁番",@"哈密",@"昌吉",@"博尔塔拉",@"巴音郭楞",@"阿克苏",@"克孜勒苏",@"喀什",@"和田",@"伊犁",@"塔城",@"阿勒泰",@"奎屯",@"石河子"],
                    @"西藏":@[@"拉萨",@"昌都",@"山南",@"日喀则",@"那曲",@"阿里",@"林芝"],
                    };
    _dictionary_Y=@{
                    @"云南":@[@"昆明",@"曲靖",@"玉溪",@"保山",@"昭通",@"丽江",@"普洱",@"临沧",@"楚雄",@"红河",@"文山",@"西双版纳",@"大理",@"德宏",@"怒江",@"迪庆"],
                    };
    _dictionary_Z=@{
                    @"浙江":@[@"杭州",@"宁波",@"温州",@"嘉兴",@"湖州",@"绍兴",@"金华",@"衢州",@"舟山",@"台州",@"丽水"],
                    };
    
    
}

-(void)initView{
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0,22,CGRectGetWidth(self.view.frame), 100)];
    _headView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_headView];
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 20)];
    titleLabel.text = @"已选城市";
    _headView.layer.borderColor = [UIColor grayColor].CGColor;
    _headView.layer.borderWidth = 0.5;
    [_headView addSubview:titleLabel];
    
    UIScrollView *subView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+10, CGRectGetWidth(self.view.frame), 100-40)];
    subView.backgroundColor = [UIColor yellowColor];
    [_headView addSubview:subView];
    
    _cityLabel = [[UILabel alloc] init];
    _cityLabel.text = @"广州";
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    _cityLabel.frame = CGRectMake(20, 15, 80, 30);
    _cityLabel.layer.cornerRadius = 1.0;
    _cityLabel.layer.borderWidth = 1;
    _cityLabel.layer.borderColor = [UIColor grayColor].CGColor;
    _cityLabel.hidden = YES;
    [subView addSubview:_cityLabel];
    
    _clearButton = [[UIButton alloc] init];
    _clearButton.frame = CGRectMake(CGRectGetMaxX(_cityLabel.frame)-9.0, CGRectGetMinY(_cityLabel.frame)-9.0, 18, 18);
    _clearButton.titleLabel.text = @"X";
    _clearButton.backgroundColor = [UIColor whiteColor];
    _clearButton.layer.borderWidth = 1.0;
    _clearButton.layer.borderColor = [UIColor grayColor].CGColor;
    _clearButton.layer.cornerRadius = 9;
    [_clearButton addTarget:self action:@selector(clearTheCityLabel) forControlEvents:UIControlEventTouchUpInside];
    _clearButton.hidden = YES;
    [subView addSubview:_clearButton];
    
    _remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 250, 30)];
    _remarkLabel.text = @"请选择一个城市进行查询";
    [subView addSubview:_remarkLabel];
    
    _bigTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_headView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetMaxY(_headView.frame)) style:UITableViewStylePlain];

    _bigTableView.delegate = self;
    _bigTableView.dataSource = self;
    _bigTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_bigTableView];
    
    
    _smallTableView = [[UITableView alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(_headView.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetMaxY(_headView.frame)) style:UITableViewStylePlain];
    _smallTableView.delegate = self;
    _smallTableView.dataSource = self;
    _smallTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _smallTableView.hidden = YES;
    _smallTableView.layer.borderWidth = 0.5;
    _smallTableView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:_smallTableView];
    
    UIView *footView = [[UIView alloc] init];
    _smallTableView.tableFooterView = footView;
}

-(void)clearTheCityLabel{
    _clearButton.hidden = YES;
    _cityLabel.hidden = YES;
    _remarkLabel.hidden = NO;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _bigTableView) {
        return 50.0;
    }else{
        return 50.0;
    }
    
}
#if 1
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == _bigTableView) {
//        tableView.tableHeaderView.backgroundColor = [UIColor lightGrayColor];
        return 20.0;
    }else{
        return 0.0;
    }
}
#endif


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == _bigTableView) {
        
        switch (indexPath.section) {
            case 0:
                _cityArrayOfSimpleProvince = [_dictionary_A objectForKey:[[_dictionary_A allKeys] objectAtIndex:indexPath.row]];
                break;
            case 1:
                NSLog(@"%@",[_dictionary_B objectForKey:[[_dictionary_B allKeys] objectAtIndex:indexPath.row]]);
                
                _cityArrayOfSimpleProvince = [_dictionary_B objectForKey:[[_dictionary_B allKeys] objectAtIndex:indexPath.row]];
                break;
            case 2:
                _cityArrayOfSimpleProvince = [_dictionary_C objectForKey:[[_dictionary_C allKeys] objectAtIndex:indexPath.row]];
                break;
            case 3:
                _cityArrayOfSimpleProvince = [_dictionary_F objectForKey:[[_dictionary_F allKeys] objectAtIndex:indexPath.row]];
                break;
            case 4:
                _cityArrayOfSimpleProvince = [_dictionary_G objectForKey:[[_dictionary_G allKeys] objectAtIndex:indexPath.row]];
                break;
            case 5:
                _cityArrayOfSimpleProvince = [_dictionary_H objectForKey:[[_dictionary_H allKeys] objectAtIndex:indexPath.row]];
                break;
            case 6:
                _cityArrayOfSimpleProvince = [_dictionary_J objectForKey:[[_dictionary_J allKeys] objectAtIndex:indexPath.row]];
                break;
            case 7:
                _cityArrayOfSimpleProvince = [_dictionary_L objectForKey:[[_dictionary_L allKeys] objectAtIndex:indexPath.row]];
                break;
            case 8:
                _cityArrayOfSimpleProvince = [_dictionary_N objectForKey:[[_dictionary_N allKeys] objectAtIndex:indexPath.row]];
                break;
            case 9:
                _cityArrayOfSimpleProvince = [_dictionary_Q objectForKey:[[_dictionary_Q allKeys] objectAtIndex:indexPath.row]];
                break;
            case 10:
                _cityArrayOfSimpleProvince = [_dictionary_S objectForKey:[[_dictionary_S allKeys] objectAtIndex:indexPath.row]];
                break;
            case 11:
                _cityArrayOfSimpleProvince = [_dictionary_T objectForKey:[[_dictionary_T allKeys] objectAtIndex:indexPath.row]];
                break;
            case 12:
                _cityArrayOfSimpleProvince = [_dictionary_X objectForKey:[[_dictionary_X allKeys] objectAtIndex:indexPath.row]];
                break;
            case 13:
                _cityArrayOfSimpleProvince = [_dictionary_Y objectForKey:[[_dictionary_Y allKeys] objectAtIndex:indexPath.row]];
                break;
            case 14:
                _cityArrayOfSimpleProvince = [_dictionary_Z objectForKey:[[_dictionary_Z allKeys] objectAtIndex:indexPath.row]];
                break;
                
            default:
                break;
        }
        [_smallTableView reloadData];
        _smallTableView.hidden = NO;
        
    }else{
        
        _remarkLabel.hidden = YES;
        NSLog(@"%@",[_cityArrayOfSimpleProvince objectAtIndex:indexPath.row]);
        
        _cityLabel.text = [_cityArrayOfSimpleProvince objectAtIndex:indexPath.row];
        _cityLabel.hidden = NO;
        _clearButton.hidden = NO;
        _smallTableView.hidden = YES;
    }
    
}

#pragma mark -- UITableViewDataSource
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView;{
    if (tableView == _bigTableView) {
        return _titleOfProvince;
    }else{
        return nil;
    }
    
}
#if 0
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    if (tableView == _bigTableView) {
        NSInteger count = 0;
        
        NSLog(@"%@-%ld",title,index);
        
        for(NSString *character in _titleOfProvince)
        {
            if([character isEqualToString:title])
            {
                return count;
            }
            count ++;
        }
        
        
    }else{
        
    }
    return 0;
}
#endif
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (tableView == _bigTableView) {
        return _titleOfProvince.count;
    }else{
        return 1;
    }
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == _bigTableView) {
        NSString *key = [_titleOfProvince objectAtIndex:section];
        return key;
    }else{
        return @"";
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _bigTableView) {
        switch (section) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 11:
            case 13:
            case 14:
            {
                return 1;
            }
                break;
            case 4:
            {
                return 4;
            }
                break;
            case 5:
            {
                return 6;
            }
                break;
            case 6:
            {
                return 3;
            }
                break;
                
            case 8:
            case 12:
            {
                return 2;
            }
                break;
                
            case 10:
            {
                return 5;
            }
                break;
            default:
                break;
        }

    }else{
        return _cityArrayOfSimpleProvince.count;
    }
    return 0;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (tableView  == _bigTableView) {
        
        switch (indexPath.section) {
            case 0:
                cell.textLabel.text = [[_dictionary_A allKeys] objectAtIndex:indexPath.row];
                break;
            case 1:
                cell.textLabel.text = [[_dictionary_B allKeys] objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text = [[_dictionary_C allKeys] objectAtIndex:indexPath.row];
                break;
            case 3:
                cell.textLabel.text = [[_dictionary_F allKeys] objectAtIndex:indexPath.row];
                break;
            case 4:
                cell.textLabel.text = [[_dictionary_G allKeys] objectAtIndex:indexPath.row];
                break;
            case 5:
                cell.textLabel.text = [[_dictionary_H allKeys] objectAtIndex:indexPath.row];
                break;
            case 6:
                cell.textLabel.text = [[_dictionary_J allKeys] objectAtIndex:indexPath.row];
                break;
            case 7:
                cell.textLabel.text = [[_dictionary_L allKeys] objectAtIndex:indexPath.row];
                break;
            case 8:
                cell.textLabel.text = [[_dictionary_N allKeys] objectAtIndex:indexPath.row];
                break;
            case 9:
                cell.textLabel.text = [[_dictionary_Q allKeys] objectAtIndex:indexPath.row];
                break;
            case 10:
                cell.textLabel.text = [[_dictionary_S allKeys] objectAtIndex:indexPath.row];
                break;
            case 11:
                cell.textLabel.text = [[_dictionary_T allKeys] objectAtIndex:indexPath.row];
                break;
            case 12:
                cell.textLabel.text = [[_dictionary_X allKeys] objectAtIndex:indexPath.row];
                break;
            case 13:
                cell.textLabel.text = [[_dictionary_Y allKeys] objectAtIndex:indexPath.row];
                break;
            case 14:
                cell.textLabel.text = [[_dictionary_Z allKeys] objectAtIndex:indexPath.row];
                break;
                
            default:
                break;
        }
    }
    if (tableView == _smallTableView) {
        
        cell.textLabel.text = [_cityArrayOfSimpleProvince objectAtIndex:indexPath.row];

    }
    
    
    return  cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
