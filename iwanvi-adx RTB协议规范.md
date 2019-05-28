
# PB接口协议

## 接口说明

Adx RTB 总共包含三个步骤。

1. Adx向DSP发送广告询价请求(Bid Request)

2. DSP或者第三方广告平台向Adx返回出价结果及广告代码


这三个步骤分别对应三个接口。

## 接口注意事项

1. ADX 的 RTB API参考通用OpenRTB规范：[iab techlab openrtb-spec](https://iabtechlab.com/wp-content/uploads/2016/07/OpenRTB-API-Specification-Version-2-5-FINAL.pdf)。大体遵循该规范，但对一些字段有调整.

2. 协议采用 HTTP POST，开启keep-alive，消息格式为ProtoBuf。目前 timeout 设为 250ms。请求头中需要设 Content-Type 为 application/x-protobuf。

3. 不出价可以返回HTTP 状态码204 (No Content)。

4. 展示通知impression-notice、点击通知click-notice均是GET请求。

5. 字段中所有中文必须使用UTF-8编码。

## 协议描述

参考：[中文万维rtb协议规范](rtb.proto)

