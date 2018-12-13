
# PB接口协议

## 接口说明

Adx RTB 总共包含三个步骤。

1. Adx向DSP发送广告询价请求(Bid Request)

2. DSP或者第三方广告平台向Adx返回出价结果及广告代码

3. Adx向获胜的DSP发送竞价获胜通知（可选)

这三个步骤分别对应三个接口。

## 接口注意事项

1. ADX 的 RTB API参考通用OpenRTB规范：[http://code.google.com/p/openrtb](http://code.google.com/p/openrtb/)。大体遵循该规范，但对一些字段有调整.

2. 协议采用 HTTP POST，开启keep-alive，消息格式为ProtoBuf。目前 timeout 设为 200ms。请求头中需要设 Content-Type 为 application/x-protobuf。

3. 不出价可以返回HTTP 状态码204 (No Content)。

4. 竞价获胜通知win-notice、展示通知impression-notice、点击通知click-notice均是GET请求。

5. 字段中所有中文必须使用UTF-8编码。

## 请求信息Request

### 接口信息（BidRequest）

| 字段名称               | 类型   | 默认值 | 必须 | 描述                                                                                                                                              |
| ---------------------- | ------ | ------ | ---- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                     | string |        | 是   | 生成的唯一竞价ID，32个字符组成的字符串，由Zplay ADX生成， 例："57a6a0811829faf34a78ca625c383ec9"                                                  |
| app                    | object |        | 是   | App对象。应用信息，针对移动App广告                                                                                                                |
| device                 | object |        | 是   | Device对象。设备信息                                                                                                                              |
| imp[]                  | object |        | 是   | Imp对象数组，从110（表示当前版本为1.1，110的后两位为子版本号，前面的表示主版本号）版协议以后支持多个Imp对象                                       |
| bcat[]                 | object |        | 否   | 禁用的广告类别，iab详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF)                                   |
| user                   | object |        | 否   | User对象。用户信息                                                                                                                                |
| site                   | object |        | 否   | Site对象。站点信息，用于移动网站广告                                                                                                              |
| test                   | bool   | false  | 否   | true标记本次请求是测试请求。当为测试请求时，DSP需要返回一个带有广告的应答，该应答广告不会被展现给用户，也不会对该次广告展现计费。适用于联调测试。 |

### App信息（BidRequest.App）

| 字段名称  | 类型   | 默认值 | 必须 | 描述                                                                                                   |
| --------- | ------ | ------ | ---- | ------------------------------------------------------------------------------------------------------ |
| id        | string |        | 是   | 应用ID，由Adx生成， 例："z0000001" 或者 “iq3nktkh”                                             |
| name      | string |        | 是   | 应用名称， 例："曙光之战"                                                                              |
| ver       | string |        | 否   | 应用版本                                                                                               |
| bundle    | string |        | 否   | 为应用包名，例："com.qq.demo"                                                                       |
| cat[]     | string |        | 否   | 应用类型，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF) |
| publisher | 对象   |        | 否   | [出品方信息](#出品方信息bidrequestsitepublisher)                                                       |

### 设备信息（BidRequest.Device）

| 字段名称                | 类型   | 默认值 | 必须 | 描述                                                                                                                                                                 |
| ----------------------- | ------ | ------ | ---- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| os                      | string |        | 是   | 只能是"ios"，"android"或"wp"（windows phone）（注意大小写）                                                                                                          |
| dnt                     | bool   | false  | 否   | 禁止跟踪用户的标志，                                                                                                                                                 |
| osv                     | string |        | 是   | 操作系统版本，例："9.0.1"                                                                                                                                            |
| make                    | string |        | 否   | 生产厂商， 例："Samsung"                                                                                                                                             |
| model                   | string |        | 否   | 设备型号， 例："iPhone"                                                                                                                                              |
| ip                      | string |        | 是   | 设备ipv4地址， 例："8.8.8.8"                                                                                                                                         |
| ua                      | string |        | 否   | 设备user agent， 例："Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML，like Gecko) Version/4.0 Mobile/7A341 Safari/528.16" |
| hwv                     | string |        | 否   | 设备硬件版本号， 例："6S"是iPhone 6S的版本号                                                                                                                         |
| w                       | int32  |        | 否   | 设备屏幕宽度，单位：像素， 例：1920                                                                                                                                  |
| h                       | int32  |        | 否   | 设备屏幕高度，单位：像素， 例：1080                                                                                                                                  |
| ppi                     | int32  |        | 否   | 设备屏幕像素密度，单位：每英寸像素个数， 例：400                                                                                                                     |
| pxratio                 | double |        | 否   | 设备屏幕物理像素密度，，例：iPhone 3为1， iPhone 4为2， iPhone 6S plus为3                                                                                            |
| macsha1                 | string |        | 否   | mac地址 SHA1；iOS无此字段， android也只是部分机器能拿到                                                                                                              |
| didsha1                 | string |        | 否   | Android为IMEI SHA1；iOS无此字段，(cdma手机传meid码)                                                                                                                  |
|ifa                      | string |        |否    | 设备id明文, 安卓为明文imei, ios为idfa |
| language                | string |        | 否   | 系统语言                                                                                                                                                             |
| dpidsha1                | string |        | 是   | Android为ANDROID ID SHA1；iOS为ADID(也叫IDFA) SHA1， 例："8a319e9fdf05dd8f571b6e0dc2dc2a8263a6974b"                                                                  |
| didmd5                  | string |        | 否  | md5加密设备码 |
| connectiontype          | 枚举   |        | 否   | 网络连接类型，0：未知，1：以太网，2：wifi， 3：未知蜂窝网络， 4：2G网络，5：3G网络，6：4G网络，详见proto文件                                                         |
| devicetype              | 枚举   |        | 否   | 设备类型，1：移动设备，4：手机，5：平板                                                                                                                              |
| geo                     | 对象   |        | 否   | [Geo对象](#geo对象bidrequestdevicegeo)，请求设备的经纬度                                                                                                             |
#### Geo对象（BidRequest.Device.Geo）

| 字段名称           | 类型   | 默认值 | 必须 | 描述                                                                                                    |
| ------------------ | ------ | ------ | ---- | ------------------------------------------------------------------------------------------------------- |
| lat                | double |        | 否   | 纬度，例：39.9167，是WGS84坐标                                                                          |
| lon                | double |        | 否   | 经度，例：116.3833，是WGS84坐标                                                                         |
| country            | string |        | 否   | 国家代码，请参见[ISO-3166-1 Alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3)                  |
| region             | string |        | 否   | 国内是省名，美国是州的2个字母缩写，其他国家请参见[ISO-3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) |
| city               | string |        | 否   | 城市名称，例："北京"                                                                                    |

### 曝光信息（BidRequest.Imp）

| 字段名称                     | 类型   | 默认值 | 必须 | 描述                                                                                                                                                  |
| ---------------------------- | ------ | ------ | ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                           | string |        | 是   | 曝光ID                                                                                                                                                |
| bidfloor                     | double |        | 是   | 底价，单位是分                                                                                                                                        |
| bidfloorcur                  | string | CNY    | 否   | 报价货币单位，目前只支持人民币："CNY"，美元："USD"                                                                                                    |
| instl                        | bool   | false  | 否   | 是否为全插屏广告，true表示全插屏，false表示不是全插屏                                                                                                 |
| banner                       | 对象   |        | 否   | banner对象                                                                                                                                            |
| video                        | 对象   |        | 否   | video对象                                                                                                                                             |
| pmp                          | 对象   |        | 否   | pmp对象， 只有在pmp交易模式时才存在                                                                                                                   |
| native                       | 对象   |        | 否   | native对象， 下面包含NativeRequest                                                                                                                    |
| tagid                        | string |        | 否   | 广告位id                                                                                                                                             |
| secure                       | integer |       | 否   |是否使用https, 0-不启用，1-启用|

#### 横幅信息（BidRequest.Impression.Banner）

| 字段名称 | 类型  | 默认值 | 必须 | 描述                                                                         |
| -------- | ----- | ------ | ---- | ---------------------------------------------------------------------------- |
| w        | int32 |        | 是   | 广告位宽度                                                                   |
| h        | int32 |        | 是   | 广告位高度                                                                   |
| pos      | 枚举  | 0      | 否   | 广告位位置，0：未知，4：头部，5：底部，6：侧边栏，7：全屏，其他详见proto文件 |

#### 视频（BidRequest.Impression.Video）

| 字段名称    | 类型  | 默认值 | 必须 | 描述                                                                         |
| ----------- | ----- | ------ | ---- | ---------------------------------------------------------------------------- |
| mimes       | array |        | 否   | 支持的视频类型                                                               |
| protocols   | array |        | 否   | 支持的视频响应协议                                                           |
| minduration | int32 |        | 是   | 最短时间，单位：秒                                                           |
| maxduration | int32 |        | 是   | 最长时间，单位：秒                                                           |
| w           | int32 |        | 否   | 广告位宽度                                                                   |
| h           | int32 |        | 否   | 广告位高度                                                                   |
| pos         | 枚举  | 0      | 否   | 广告位位置，0：未知，4：头部，5：底部，6：侧边栏，7：全屏，其他详见proto文件 |

#### 原生广告（BidRequest.Impression.NativeRequest）

| 字段名称 | 类型  | 默认值 | 必须 | 描述                                                                         |
| -------- | ----- | ------ | ---- | ---------------------------------------------------------------------------- |
| layout   | int   |        | 否   | 原生广告布局样式，2：应用墙，3：信息流，5：走马灯，其他请参看IAB openrtb标准 |
| assets   | array |        | 是   | 原生广告元素列表                                                             |

##### 原生广告Asset（NativeRequest.Asset）

| 字段名称 | 类型 | 默认值 | 必须 | 描述                               |
| -------- | ---- | ------ | ---- | ---------------------------------- |
| id       | int  |        | 是   | 元素id                             |
| required | int  | 0      | 否   | 广告元素是否必须，1：必须，0：可选 |
| title    | 对象 |        | 否   | 文字元素                           |
| img      | 对象 |        | 否   | 图片元素                           |
| data     | 对象 |        | 否   | 其他数据元素                       |

###### 原生广告Image（NativeRequest.Asset.Image）

| 字段名称 | 类型 | 默认值 | 必须 | 描述                                               |
| -------- | ---- | ------ | ---- | -------------------------------------------------- |
| type     | int  |        | 否   | image元素的类型，1：Icon，2：LOGO， 3：Large image |
| w        | int  |        | 否   | 宽度                                               |
| h        | int  |        | 否   | 高度                                               |

###### 原生广告Title（NativeRequest.Asset.Title）

| 字段名称 | 类型 | 默认值 | 必须 | 描述                  |
| -------- | ---- | ------ | ---- | --------------------- |
| len      | int  |        | 是   | title元素最大文字长度 |

##### 原生广告Data（NativeRequest.Asset.Data）

| 字段名称 | 类型 | 默认值 | 必须 | 描述                                                                                                                                                                                                                                                |
| -------- | ---- | ------ | ---- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| type     | int  |        | 是   | 数据类型 1： Sponsor 名称，应该包含品牌名称， 2： 描述， 3： 打分， 4：点赞个数，5：下载个数，6：产品价格， 7：销售价格，往往和前者结合，表示折扣价，8：电话， 9：地址， 10：描述2， 11：显示的链接， 12：行动按钮名称，1001：视频url，1002：评论数 |
| len      | int  |        | 是   | data元素最大长度                                                                                                                                                                                                                                    |

#### Pmp对象（BidRequest.Impression.Pmp）

| 字段名称        | 类型  | 默认值 | 必须 | 描述                                                 |
| --------------- | ----- | ------ | ---- | ---------------------------------------------------- |
| private_auction | bool  |        | 否   | 始终为true                                           |
| deals           | array |        | 是   | [Deal对象](#deal对象bidrequestimpressionpmpdeal)数组 |

##### Deal对象（BidRequest.Impression.Pmp.Deal）

| 字段名称    | 类型   | 默认值 | 必须 | 描述                                                             |
| ----------- | ------ | ------ | ---- | ---------------------------------------------------------------- |
| id          | string |        | 是   | deal唯一标识                                                     |
| bidfloor    | double |        | 是   | 双方商定的交易价格                                               |
| bidfloorcur | string | CNY    | 否   | 交易货币单位                                                     |
| at          | int    | 3      | 否   | 交易价格结算方式，1：第一价格，2：第二价格，3：固定价格，默认为3 |

### 用户信息（BidRequest.User）

| 字段名称 | 类型   | 默认值 | 必须 | 描述                                                 |
| -------- | ------ | ------ | ---- | ---------------------------------------------------- |
| id       | string |        | 否   | 用户id                                               |
| yob      | int32  |        | 否   | 生日年份，例：1995                                   |
| gender   | string |        | 否   | 男："M"， 女："F"， 其他："0"                        |
| geo      | 对象   |        | 否   | [Geo对象](#geo对象bidrequestdevicegeo)，用户家庭位置 |
| data[]   | 对象   |        | 否   | Data对象，用户的扩展信息                             |

#### 用户扩展信息（BidRequest.User.Data）

| 字段名称  | 类型 | 默认值 | 必须 | 描述                      |
| --------- | ---- | ------ | ---- | ------------------------- |
| segment[] | 对象 |        | 否   | Segment对象，用户人群属性 |

##### 用户人群属性信息（BidRequest.User.Data.Segment）

| 字段名称 | 类型   | 默认值 | 必须 | 描述   |
| -------- | ------ | ------ | ---- | ------ |
| id       | string |        | 否   | 属性id |
| value    | string |        | 否   | 属性值 |

### Site信息（BidRequest.Site）

| 字段名称   | 类型     | 默认值 | 必须 | 描述                                                                                                       |
| ---------- | -------- | ------ | ---- | ---------------------------------------------------------------------------------------------------------- |
| id         | string   |        | 否   | 网站id                                                                                                     |
| name       | string   |        | 否   | 网站名称                                                                                                   |
| domain     | string   |        | 否   | 网站域名                                                                                                   |
| cat        | string[] |        | 否   | 网站类别，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF)     |
| sectioncat | string[] |        | 否   | 当前频道类别，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF) |
| pagecat    | string[] |        | 否   | 当前页面类别，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF) |
| page       | string   |        | 是   | 当前页面URL地址                                                                                            |
| ref        | string   |        | 否   | 当前页面Referrer URL地址                                                                                   |
| search     | string   |        | 否   | 当前页面的搜索关键词来源                                                                                   |
| mobile     | bool     | true   | 否   | 是否对移动端浏览效果做过优化，false：未做优化；true：做过优化                                              |
| keywords   | string   |        | 否   | 网页关键字，可多个，逗号隔离                                                                               |
| publisher  | 对象     |        | 否   | [出品方信息](#出品方信息bidrequestsitepublisher)                                                           |

#### 出品方信息（BidRequest.Site.Publisher）

| 字段名称 | 类型     | 默认值 | 必须 | 描述                                                                                                     |
| -------- | -------- | ------ | ---- | -------------------------------------------------------------------------------------------------------- |
| id       | string   |        | 否   | 出品方id                                                                                                 |
| name     | string   |        | 否   | 名称                                                                                                     |
| domain   | string   |        | 否   | 出品方顶级网站域名                                                                                       |
| cat      | string[] |        | 否   | 出品方类别，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF) |

## 返回信息Response

### 接口信息（BidResponse）

| 字段名称  | 类型     | 默认值 | 必须 | 描述                                                                                                                                                              |
| --------- | -------- | ------ | ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id        | string   |        | 是   | 在BidRequest中传入的id                                                                                                                                            |
| seatbid[] | 对象数组 |        | 否   | SeatBid对象，若提出竞价则需提供一个，并且只接受一个                                                                                                               |
| nbr       | 枚举     |        | 否   | 未竞价原因，0：未知错误，1：技术错误，2：无效请求，4：可疑的伪造流量，5：数据中心代理服务器ip，6：不支持设备，7：被屏蔽媒体，8：不匹配的用户，其他请参看proto文件 |

#### SeatBid信息（BidResponse.SeatBid）

| 字段名称 | 类型     | 默认值 | 必须 | 描述                                            |
| -------- | -------- | ------ | ---- | ----------------------------------------------- |
| bid[]    | 对象数组 |        | 否   | Bid对象数组，从110版协议以后支持多个Bid对象（） |

##### Bid信息（BidResponse.SeatBid.Bid）

| 字段名称                       | 类型     | 默认值 | 必须 | 描述                                                                                                                                                                                                      |
| ------------------------------ | -------- | ------ | ---- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                             | string   |        | 是   | 由DSP提供的竞价id                                                                                                                                                                                         |
| impid                          | string   |        | 是   | 曝光id                                                                                                                                                                                                    |
| price                          | double   |        | 是   | 出价，单位为分，不能低于曝光最低价格，否则会被当做无效应答。目前只支持人民币                                                                                                                              |
| adid                           | string   |        | 是   | 物料ID，由DSP提供。DSP必须保证如果adid相同，则物料的所有字段相同（除了nurl、clkurl、imptrackers、clktrackers）。如果DSP提供的adid满足以下条件会受到惩罚：1、提交过多不同的adid；2、相同adid的其他字段不同 |
| nurl                           | string   |        | 否   | 竞价获胜通知url，win notice url， GET方法调用。可以使用[宏](supported_macros.md)。不推荐使用独立的win notice url, 建议使用"extensions[imp_trackers][]"来获取获胜通知。                                                                     |
| bundle                         | string   |        | 否   | 为应用包名，例：“com.zplay.demo”                                                                                                                                                                        |
| iurl                           | string   |        | 否   | 广告素材的图片URL。banner广告必填                                                                                                                                                                         |
| w                              | int32    |        | 否   | 素材宽度， 当给出的广告素材尺寸与广告 位尺寸不完全一致时，素材宽高信息必须给出。                                                                                                                          |
| h                              | int32    |        | 否   | 素材高度                                                                                                                                                                                                  |
| cat                            | string[] |        | 否   | 广告类别，详见[IAB §6.1](http://www.iab.net/media/file/OpenRTB_API_Specification_Version2.0_FINAL.PDF)                                                                                                    |
| adm                            | string   |        | 否   | 广告物料，目前只在视频广告时使用。 视频素材必须符合VAST 3.0规范，请参看[VAST 3.0 标准](http://www.iab.com/wp-content/uploads/2015/06/VASTv3_0.pdf)                                                        |
| native                         | 对象     |        | 否   | 原生广告对象                                                                                                                                                                                              |
| dealid                         | string   |        | 否   | deal id，只有在pmp交易时才需要                                                                                                                                                                            |
| extensions[clk_url]             | string   |        | 否   | 广告点击跳转地址，允许使用[宏](supported_macros.md)，例http://www.google.cn/ad/{AUCTION_BID_ID}                                                                                                            |
| extensions[imp_trackers][]      | string[] |        | 否   | 曝光追踪地址，允许有多个追踪地址，允许使用[宏](supported_macros.md)                                                                                                                                       |
| extensions[clk_trackers][]      | string[] |        | 否   | 点击追踪地址，允许有多个追踪地址，允许使用[宏](supported_macros.md)                                                                                                                                       |
| extensions[html_snippet]       | string   |        | 否   | html广告代码                                                                                                                                                                                              |
| extensions[title]              | string   |        | 否   | 图文广告中的标题                                                                                                                                                                                          |
| extensions[desc]               | string   |        | 否   | 图文广告中的描述                                                                                                                                                                                          |

##### 原生广告Native（NativeResponse）

| 字段名称    | 类型  | 默认值 | 必须 | 描述                                                                     |
| ----------- | ----- | ------ | ---- | ------------------------------------------------------------------------ |
| assets      | array |        | 是   | 原生广告元素列表                                                         |
| link        | 对象  |        | 是   | Link对象，目标链接，默认链接对象，当assets中不包括link对象时，使用此对象 |
| imptrackers | array |        | 否   | 曝光追踪地址数组                                                         |

###### 原生广告Asset（NativeResponse.Asset）

| 字段名称 | 类型 | 默认值 | 必须 | 描述               |
| -------- | ---- | ------ | ---- | ------------------ |
| id       | int  |        | 是   | 广告元素ID         |
| title    | 对象 |        | 否   | 文字元素           |
| img      | 对象 |        | 否   | 图片元素           |
| data     | 对象 |        | 否   | 其他数据元素       |
| link     | 对象 |        | 否   | Link对象，点击地址 |

###### 原生广告Title（NativeResponse.Asset.Title）

| 字段名称 | 类型   | 默认值 | 必须 | 描述                |
| -------- | ------ | ------ | ---- | ------------------- |
| text     | string |        | 是   | title元素的内容文字 |

###### 原生广告Image（NativeResponse.Asset.Image）

| 字段名称 | 类型   | 默认值 | 必须 | 描述               |
| -------- | ------ | ------ | ---- | ------------------ |
| url      | string |        | 是   | image元素的URL地址 |
| w        | int    |        | 否   | 宽度，单位像素     |
| h        | int    |        | 否   | 高度，单位像素     |

###### 原生广告Data（NativeResponse.Asset.Data)

| 字段名称 | 类型   | 默认值 | 必须 | 描述           |
| -------- | ------ | ------ | ---- | -------------- |
| label    | string |        | 否   | 数据显示的名称 |
| value    | string |        | 是   | 数据的内容文字 |

###### 原生广告Link（NativeResponse.Asset.Link)

| 字段名称              | 类型   | 默认值 | 必须 | 描述                                                                                                                               |
| --------------------- | ------ | ------ | ---- | ---------------------------------------------------------------------------------------------------------------------------------- |
| url                   | string |        | 是   | 点击URL |
| clicktrackers         | array  |        | 否   | 点击跟踪URL |
| fallback  | string |        | 否   | 应用唤醒失败后的打开地址，允许使用[宏](supported_macros.md)，例http://www.zplay.cn/ad/{AUCTION_BID_ID}|
| extensions[link_type] | int    |        | 是   | 广告动作类型， 1： 在app内webview打开目标链接， 2： 在系统浏览器打开目标链接， 3：打开地图，4： 拨打电话，5：播放视频， 6：App下载，7：应用唤醒 |
| extensions[fallback_url_action]|int| | 否 |fallback_url的动作类型，1：在app内webview打开目标链接，2：在系统浏览器打开目标链接，3：打开地图，4：拨打电话，5：播放视频，6：App下载，7：应用唤醒 |

## 向DSP发送的竞价结果接口(Win Notice)

通过对展示监测链接中特定参数的宏替换，将广告的计费价格发送给赢得竞价的 DSP 平台
