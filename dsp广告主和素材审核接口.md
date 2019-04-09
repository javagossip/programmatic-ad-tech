# 总体说明
本文档作为 DSP 与程序化交易平台进行对接的指引文档。主要包括2个部分：

1. **接入步骤** 
   
   阅读对象为 DSP 的商务人员。该部分说明了 DSP 与 Ad Exchange 对接的流程和步骤。
2. **Buyer API** 

   阅读对象为 DSP 的产品和开发人员。该部分详细描述了DSP向ADX上传/修改广告主/广告信息以及查询广告主/广告审核状态的接口。
   
   
# 接入步骤
# Buyer API
本章节将详细介绍 DSP 如何使用 Buyer API 与 Ad Exchange 进行交互，提交/修改广告主/广告信息，查询广告主/广告审核状态。为确保广告内容的有效性与合法性，所有参与Ad Exchange竞价的 DSP平台必须将广告主和广告信息提前上传到 Ad Exchange 进行审核，审核通过后方可正常投放，如果DSP返回未经审核通过的广告，将直接被过滤不会被展现。

## 权限认证
API 通过用户授权令牌(token)来做权限验证，授权信息需要包含在 API 请求数据头中。

## 编码方式
参数编码使用 UTF-8编码

## URL定义
API URL格式定义如下：  
http://api.xcar.com/adx/${api_version}/${resource_name}/${resource_action}

其中api_version是版本(目前是v1)，resource_name表示要操作的资源，resource_action表示对资源的操作方法。

resource_name目前包括两种资源：  

|操作资源|说明|  
|-----|-----|
|advertiser|广告主|
|creative|广告|

resource_action目前包含的基本的操作方法有：  

|操作|说明|
|------|----------------|
|add   | 新增            |
|update| 修改            |
|audit_status|获取审核状态|

## API请求
API 使用 JSON消息格式，通过 RESTFUL 的HTTP协议进行数据交换。  
所有请求，使用POST方式，同时在Http header中需要设置Content_Type和鉴权信息，如下例：  

	Content-Type: application/json
	Authorization: /* auth token here */
	
所有请求，参数均以JSON格式设置在 HTTP 请求的Body内，如下例：  

```
{
"data": request_data
}
```

## API响应

HTTP 返回码为200则请求成功，否则可能客户端或服务端产生了异常，可根据 HTTP 状态码判断错误的类型。  

HTTP响应中包含了头部信息：`Content-Type: application/json`。  
响应信息包含在返回的JSON 数据中，包含本次操作的返回码和具体错误信息。响应信息分三部分内容，分别为状态码、说明和数据区。  

对非数组形式的API请求，返回数据如下所示：  

|字段名称|类型|说明|
|-------------|----------|--------|
|code|int|错误码，非0为错误发生      |
|message|string|错误信息，若没有错，此字段返回success |
|data|json array或json object|返回信息|

## 广告主

### 广告主创建
URL: http://api.xcar.com/adx/v1/advertiser

请求字段：  

|类型   |是否数组类型 |说明|
|-------|:-----------:|---------|
|Advertiser |否| 广告主信息|

请求类型Advertiser:  

|字段名称|类型|是否必填|      说明|
|-------|-------|:------:|------|
|advertiserId|string|是|dsp平台广告主唯一id|
|name|string|是|广告主名称|
|businessLicense|string|是|广告主营业执照|
|qualification|string|否|其他资质文件，多个资质文件需打包成压缩文件|
|industryType |int   |是|广告主行业类型，行业类型定义参见：[行业定义](#industry_dic)|

应答字段：  

|字段名称|类型|是否必填|      说明|
|-------|-------|:------:|------|
|code|int|是|响应码，0为操作成功，非0操作异常|
|message|string|否|响应说明，如果code非0返回错误原因|
|data|object|否|批量操作响应信息|

### 广告主更新

URL: http://api.xcar.com/adx/v1/advertiser/update  

请求字段：  

|类型  |是否数组类型 |说明 |
|-------|:----:|--------|
|Advertiser |否|广告主信息|

请求类型Advertiser:  

|字段名称|类型|是否必填|      说明|
|-------|-------|:------:|-------------|
|advertiserId|string|是|dsp平台广告主唯一id|
|name|string|否|广告主名称|
|businessLicense|string|否|广告主营业执照|
|qualification|string|否|其他资质文件，多个资质文件需打包成压缩文件|
|industryType |int   |否|广告主行业类型,行业类型定义参见：[行业定义](#industry_dic)|

### 广告主审核状态获取

URL: http://api.xcar.com/adx/v1/advertiser/audit_status  

请求字段：  

|类型  |是否数组类型 |说明 |
|-------|:----:|------- |
|string |是|dsp广告主id  |

## 广告

### 广告创建

URL: http://api.xcar.com/adx/v1/creative  

请求字段：

|类型|是否数组类型|说明|
|---|:------:|------|
|Creative|否|广告信息|

请求类型Creative: 

|字段名称|类型|   是否必填   | 说明    |
|-------|-------|:------:|----------------------|
|creativeId|string|是|素材id, dsp平台唯一|
|advertiserId|string|是|dsp平台广告主id, dsp平台唯一|
|name|string|是|广告名称|
|creativeType|int|是|广告类型, 广告类型定义参见: [广告类型字典](#creative_type_dic)|
|creativeUrl|string|否|素材url,非原生广告必填|
|clickUrl|string|是|                  广告点击url  |
|landingPage|string|是|               广告落地页地址|
|nativeAd|object|否|原生广告对象，广告类型为原生广告必填|

### 广告更新

URL: http://api.xcar.com/adx/v1/creative/update  

请求字段：

|类型|是否数组类型|说明|
|---|:------:|------|
|Creative|否|广告信息|

请求类型Creative:  

|字段名称|类型|   是否必填   | 说明    |
|-------|-------|:------:|----------------------|
|creativeId|string|是|素材id, dsp平台唯一|
|advertiserId|string|是|dsp平台广告主id, dsp平台唯一|
|name|string|否|广告名称|
|creativeType|int|否|广告类型, 广告类型定义参见: [广告类型字典](#creative_type_dic)|
|creativeUrl|string|否|素材url,非原生广告必填|
|clickUrl|string|否|                  广告点击url  |
|landingPage|string|否|               广告落地页地址|
|nativeAd|object|否|原生广告对象，广告类型为原生广告必填|

### 广告审核状态获取

URL: http://api.xcar.com/adx/v1/creative/audit_status

请求字段：  

|类型  |是否数组类型 |说明 |
|-------|:----:|------- |
|string |是|dsp广告主id  |

# 字典值定义
## <span id="industry_dic">行业类型</span>  

|行业类型|类型id|
|:----------:|----|
|电商 |27|
|房地产|28|
|医疗|29|
|珠宝|30|
|汽车|31|


## <span id="creative_type_dic">广告类型</span>

|广告类型名称|类型id|
|:----------:|----|
|视频 |4|
|贴片|5|
|信息流|7|

# API请求/响应样例
## 广告主请求响应
### 广告主创建

```
{
  "advertiserId":"105",
  "name":"乐元素12",
  "businessLicense":"http://image.google.com/x.jpg",
  "qualification": "http://qulification.url",
  "industryType": 5
}
```


```
{
    "code":1,
    "msg":"广告主名称不能为空"
}
```

### 广告主更新

```
{
  "advertiserId":"105",
  "name":"完美世界"
}
```


```
{
    "code":1,
    "msg":"广告主名称不能为空"
}
```

### 广告主审核状态获取
```javascript
[
  "105",
  "103",
  "1110"
]
```

```javascript
{
"code":0,
"data":
[
    {"103":{"autidStatus":3}},
    {"105":{"autidStatus":3}}
],
"msg":"success"
}
```












