Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660335;
	b=ooMq1lyrLf3Zq5uJj+eFZjYwRU3wmSmXDhfEO0ZwqJUMlobemcMNRb7nVlsd/YfZ1OmS
	 YgIHzZW798SUgZLzl94yNA/nSJ4TpnPg2dpxVEF++9Rp8U38wjm33oKgfP7DV3jsJqtG7
	 GtZZXmSSUHtSvGwxViJP8s6H3wxtgvKPibV0mDpqb0XuZuKg6GrAHzyZNMPb3wWOvxQ2Y
	 1ca7XAfNngCkE1Z3M9Mxo6keb+BBERkMWe+iRtvYgk9E0LyEl+LoeccoJQl1OexRI5/kt
	 GI59pe9zrDvhorVYqb1GJMP82coNa0Wb2mLLCHgUHKmYZvYY/4X/ibvxhWv36snY41A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
	b=AF+jpKMaP3h9w8th8Kt/2Jw+hBCfmrf1BZVjdgLTXXblFzEp7VWUN045/VYse6jSLDCr
	 pXHFTSVwKznWvwRm1hF2D8XW91qJEpD/12x/53ytG5jsJmMFni+5ZSugRJe4pIZ+e5XNJ
	 hgDcTqVkTiuJNPFEAirnb4COWwSJzWd2sBjTSLbn1IWcqEPziyqWUsdepZ8CrMkbJX3M9
	 GxRweHif9WRCjp3JZrmhL32jg2MfHCQkElKzYmZHa8zaZqXlhkw1GKAtnhX/fMDHieLr8
	 lwbUIVlbOO/yPQ1lqk7Pszxqt9VrWgvhdXQDKRMaVkVxrG1bWlgoWrI5yY3nJbWNFKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4326606A32D
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4326606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJB8BH1794613
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=; b=WfoWGa1Sw1GOI+hC
	/OSurM9Nx3Asa/NFMQzIld1qGMqXtwTO1Ie+/LNl+oZKTZhW4crNOLM36shmCzP4
	U2yiq+itKTY5YG6Dt7FlWA4hZ6exYClmrloeqCgyDqOj58iiIHhP5rCIyPXrWo1X
	3o9T0PfABWUNnSp9pfEfM1l++97bsrCRBXw5jNvqjXGCXZPVAIf9sQdLN/oLMe4j
	VoZx0QR3YTcwBOfk54I6FjQ0LiiK+M759XFcARvzGa/mF7xcoHhI8wB/h8Ul+Lkr
	E+MZ4/9jfFi6SJ8gwJWCB3pzTkNpOvwd7iVXDazcPskXpULhD41CAp0uxaVsBvWN
	BXDbAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnuhkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210ad74fdeso111832546d6.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795660332; x=1796265132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=fmpriTNGu7wJbjqw+78BabtcKRmoMeNKNh8AiMDD/1DlB3xHs1ZvM3ImKtWly+3aW5
         BJ6i/IEpiI6nCVcuG37Ay7/naMqeFF9H+Lq733I+qlHfHTTYkTAeDrILlvvClZiEsSTP
         EFQNVyfCGjSeK7YxAxQLQBzhzj/5WeLC6KcnitnM9Qd0gIqIk+ucTCLiLR9vM4MMBdgK
         mg1z4c9Dsq9r+IEbdCBTnPUCg1/RXGK0FtZOHkKqcL2hHDB2PqztXHt6gAm9f4JbJymd
         ajcIpTgGekXgKjdri97lecbb7O37qjyXXoE5UNY2cmha635jtpfzMT3Z5/TsxXWpMJyl
         2jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660332; x=1796265132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=tFkH4o4QY6J/0xSpsjoFn//tL0tsTb2Knb2KDOs1JdcCCxo6hxT3vnz3bLfp8tivuU
         VMMDFO9Qb1xmTfTBDdvzKHnb89yOU+RleYO7baCNBqSSVD3VF2GQFKSNgvlY4BVa9z4g
         /+2bmCxY6o2BO8P708+5amc04i5AuC9AxKYBZEsDdB1AtQ57+F+JlDha67cuF950efS7
         HcC9RNuYOfoX7A9iuzzXWyVb9+S1/glmdG4ASbhbFmhiVuJDiMRVdJJEkiysLnJg19uB
         SySKVejt/o/Bb1icyeXy9FAf1Hg6M7k8lEAHzREgTSoY9ByLDR05+4l2XTA713tYSLY+
         yPXQ==
X-Forwarded-Encrypted: i=1; AL+hErGelNScLoKyzQtcGA+f0daCemyBNqGGjeXF+/IU9OlFm/vA3tobk685Sy9Xd3djbdqrkcJ1CtNo7z3KEg==@vger.kernel.org
X-Gm-Message-State: APuU4Z86+CRgeGkYOJow761OTKBvXkcoOT7r+KO7MxWhSpMrMBMOekTM
	j5WlLZzqLIRtWIlOlEQViismVE9Lbdr/o5pzYEo47K0L+mGpEHK1JPBy+/zVp4GXI82DhOb/rTx
	j3kxvICWsjvCmrmd2B6HIiHJ/7QkFIlSObzAypdhYkVPnG26E+iA+kvasS7M4JJyjww==
X-Gm-Gg: AZFdTZdqRLiT8g/DaP/5tqrMv8josDb5CnyIdfs8dqbSn+z8UqPZHs7OeG285zCTUqj
	rTu3gLyLnoxBDc4Qu66WQKK826jhEiB1ei8SfuBxF9VrDNUHhRBMBgywVrUxCtCcEOHz0wwtTPj
	peFIZnmW6FGDBGqupEPK3Nn/opXWQPO03A0DOu7PCC95HFIdeBGyVp/toNQ8y7x8ZFwSkI00yCi
	dO0o+CXiyqSo57AOsqye8p8S5RbqfPwlfwW4FirpA6HnH5nLOl3K7ZLJMh0JJ/+VC0EcYdhdm9v
	62WsT+X/ZomAlLUqhhSakML9Mg00vYs5E/9fCvaOMgaEfD85o7clurQHXP4ohmORDSV7y3U7W+y
	/8znMMVN0B2Rb/mr0vcqMwc6UQD6kiCxIvbcFdVczDzyD5RC8Q9u/pZyplbLbsCIG2Ui4aGYWpq
	1ZuK/qIAvu1TjtLG28RwlGlp51lIZ9VosTFlg=
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332066346d6.15.1795660331838;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332065816d6.15.1795660331250;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
Received: from [10.38.247.193] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm178017406d6.4.2026.11.25.18.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 18:32:10 -0800 (PST)
Message-ID: <86390ae2-8c33-443b-9730-ebaf4db1b968@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:32:02 +0800
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/23] arm64: dts: qcom: eliza-evk-imx577-camera: Add
 DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-23-8ff2a11835f6@oss.qualcomm.com>
 <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX1SD1pmiK7KR/
 nJXVfLqOotNR/GgRVR/4JBZ85N9NHF3vpai8mGmi9O5eUEVCHWjykfWIGaTq4xjVpTsC/K05bkR
 /wuykM9UW4JrmAhNyhqxrWlOL+9f2Cb1JnjR98JwmNEjUl0usHtBPQCTqq7Bgoagf5pByWZLbhy
 MAOU5ZcuQ/ZmO6xqK8NP6otQd83b3m9vEVLKSfzepM0QA8sLytLDLBylYvgecVM39Ngwg+oy+tH
 vQ0vfEUbUFdc/pp8Ekn4cas0Xd0y4XFhthXt233o8ohlK4HJYa7YQYZqxd0CecKPTX7d4rSrLlI
 ZgbJmBmDwBg1aifU1zaJhNCODydBQHtBPjqA7JQuvz1R2grDxwiSldCDwMpNy45cFkRY84ELHPB
 F216uWp7YESt4gFje2h/dgjb3+V6hHhyEumhBdhSO609JbcfBsTKolzZ4EDdl0ntFwE7OlV9+sQ
 5TizaapmqbfHiA/8Ciw==
X-Proofpoint-ORIG-GUID: 3pFK2YAbzfmhDHfo95vdFPYFxl7z7KAH
X-Proofpoint-GUID: 3pFK2YAbzfmhDHfo95vdFPYFxl7z7KAH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX7V/KzGP46zh9
 hpFLsBixz/RZCltBfbWxZnA6CipCYovYHQpTqLcfrF9FAG6wPcoFyCrftFTcb4LlcKrnq9RZSkc
 mYe09/L+Ru463I/CPVto1PuC31LkuOY=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b079a2d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cvRs29UJe7UXO2q9YXUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260008



On 11/25/2026 9:25 PM, Vladimir Zapolskiy wrote:
> On 11/14/26 13:29, Wenmeng Liu wrote:
>> Add an overlay for optional IMX577 integration on the Eliza CQS EVK,
>> shared by the eMMC and UFS variants. The sensor is on CCI0 I2C bus 0,
>> uses MCLK0 with its reset on GPIO8 and connects to CSIPHY0 over CSI-2.
>> The overlay enables CAMSS, CSIPHY0 and CCI0.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  4 +
>>   .../boot/dts/qcom/eliza-evk-imx577-camera.dtso     | 85 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 89 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 64d2cfdb89c89f1c6eb0085e2bf5877ff980dbc4..a9374c54dd514f53b7aa97f5581c99cb6e75697d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -16,6 +16,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += apq8096sg-db820c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += apq8096-ifc6640.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs.dtb
>> +eliza-cqs-evk-emmc-imx577-camera-dtbs := eliza-cqs-evk-emmc.dtb 
>> eliza-evk-imx577-camera.dtbo
>> +eliza-cqs-evk-ufs-imx577-camera-dtbs := eliza-cqs-evk-ufs.dtb eliza- 
>> evk-imx577-camera.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc-imx577-camera.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs-imx577-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a14-ux3407na.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a16-ux3607oa.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso b/ 
>> arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..08f2e3c62dbdaf23a2f6ca69a5c392054cb1c225
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/media/video-interfaces.h>
>> +
>> +&camss {
>> +    status = "okay";
>> +};
>> +
>> +&camss_csiphy0_in_port {
>> +    camss_csiphy0_inep: endpoint {
>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&csiphy0_out_ep>;
>> +    };
>> +};
>> +
>> +&cci0 {
>> +    status = "okay";
>> +};
>> +
>> +&cci0_i2c0 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam_mclk0_default &cam0_reset_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply = <&vreg_l7b>;
>> +
>> +        port {
>> +            imx577_out_ep: endpoint {
>> +                data-lanes = <1 2 3 4>;
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                remote-endpoint = <&csiphy0_in_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&csiphy0 {
>> +    vdda-0p9-supply = <&vreg_l2b>;
>> +    vdda-1p2-supply = <&vreg_l4b>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&csiphy0_in_port {
>> +    csiphy0_in_ep: endpoint {
>> +        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +        clock-lanes = <0>;
> 
> Here 'clock-lanes' should be dropped, it shall be implied, and I belive
> it is.
> 

You're right, I'll drop it in next version.

Thanks,
Wenmeng

>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&imx577_out_ep>;
>> +    };
>> +};
>> +
>> +&csiphy0_out_port {
>> +    csiphy0_out_ep: endpoint {
>> +        remote-endpoint = <&camss_csiphy0_inep>;
>> +    };
>> +};
>> +
>> +&tlmm {
>> +    cam0_reset_default: cam0-reset-default-state {
>> +        pins = "gpio8";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

