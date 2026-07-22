Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66029352019
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707386; cv=none; b=fmdnXl/+Fy14T9u26kr5Y6EsfzpEb1HDazfAB4PmIgCgGR8AlWrBuQlXUPbSp3DR+Q1gaag/IRzbpXmHCAR3CSZqVnkD0EgBLBDJCn2f6pI8OnRybltlpqIpT5K58saXDkVMMRGKcS0f0qg+40A+4vGZgvc+ZfGp9AXLSdmdYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707386; c=relaxed/simple;
	bh=/+NiZi1tJEysQiVg+Xfh5dwTNRNU6FgC1Dr+pXjstsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDUsH0TJ4XCpJSDRPWql7sRpFaNEqRizpjXqMxNqcd6oxjTHkil6Xd/+vuDx9tJ+YtTylLbggs3zMxVVJlVOhcKx0/spInqssG+LBYJdtA3UyrFM52S29MAavgHsRNGo5OooMJlo+VJs0CFEZ/0l01Y3b4wlO2F2QF63okYOtek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVwZCkgO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jkb19FNw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVwZCkgO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jkb19FNw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53vSe3996205
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 08:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=; b=VVwZCkgOwPI73iOZ
	ZbPgmLIwFIVHWIXa/2KJp7Iqw+SFOKxZuVnj/pj+BW61orvH2LQ5kTzZcseDxsRO
	bLIhflkxG9josLydQtbYv6M3cjJw/5NhjGTCXaVEwXPYciBMb52pbtL5XCrDVyQD
	U+AauV8gNp5s6f5PbA84eU3i7YjmFTbnP3F5njFgMgjifH0xrlO1teSjAg4LlQVF
	O1m35X2jM76qk2/hv+xcQlBPqdZUd9po68TjF0P2e3LTqwkqwkfL7S03DbwManOU
	wILyfcsU0PDJ5zTSoPoroRIgztNKV0zyLigmx79fs2SvvfXtD0Syr883WLbrzAuY
	5QQ6Lw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2y2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 08:03:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7621655eso5459743a91.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784707382; x=1785312182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=;
        b=Jkb19FNwDz3zMeUqxG6tKN53gVFh1N+okB4ZvkwMWIvq8rTm01diosF2b8kHVKq0on
         qGnydzEdCH375Sw/Jx+NRRk0K9F4vJEnJEK0i0xnitpZ4knsY27BicKBiEZn82ht3Pw9
         Y7pd//ltTuEwJ0Rdzw+KYhLic+wubQLO6OrBymzA5ZEdz8BBaTQ51RX53e1pxqs/XmWD
         KRJhkEP4lJjk2J9HWhDzI4v2zs5nQwa/bbMXuQW+7CRAAojCz6UOQBlg4F2ou4BBHv5r
         UIhk4fZrjxzXHEn4UIzl564XrQll+xGBpHSPAdmfMmNTvEzQ/PuhgMFp6yFhaQHXf80m
         qLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707382; x=1785312182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3YLza+Mco6SqiShSL430kfFXyShTCFaucpwzk2WswoE=;
        b=V0sEDI0rYGTKQP5iddwqE1D9W5AN9PpUXZpjOHkNEbulJGGshBa6CT7r+QCxr1ndKt
         ikA07XZBZq25vEJZ+XPHakqN892ch5nAExPpAebgvtjrXQeXoTuP3Hpjs7+NQ0ePfUgV
         7Ru276moueqVgM3vS4Mar+RfoYHg8ZjPTXDERvL0sml/hDYEcXECO5py1lieVL2zaQoN
         uqzLTGB84tznff7vnpV/uRPa5D4A507rl11ckFSD9O9sdkAaDvlCr/HnLAKkbTkzesRJ
         xbXNPIpODfhrnc+Ei3JgD4kzThw2zRy9ANJsZhLrKGPFXPfall9Q5R1gDPRTbVbSvPzn
         LA+g==
X-Forwarded-Encrypted: i=1; AHgh+RrXW0MYo6X3lKQ3YWIHczdjzFUmWVvnDH8p/Vg850u/bkNXxv+W0ooh9WjHWM1sQiK+4PQ0yTQZdZUnnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgVl0tlhooXx+u4cig3ahpP0KTGN7uYT5Rd85f97y/XpwHuFN
	/CqZgwrUtTInxwLuSXaE6HjJGWi8EQpnlo/a6G30246CcWHcvMbT/XdVwxZZ5eYVF+wYxs+DMyc
	lXIIp48aN4v1nXFt80IWgzyECmUFORPazSbxPYU+i+wmTfiXGx+D5Y5U1SAm+gXanXw==
X-Gm-Gg: AR+sD13PiqW+Kh79atYstSy6pDLHpEMhB1gsTs16bMf+Otmlf/i9Tft9bhr/4ZqIBG2
	kze7PN2DzKDEenYVL/dTL6ipNTYP3fUoSsWW+nmwCnyz1JLosJj14R8Hh/3pw4g7xRsAtVU00K7
	B9Ej95bXznlU6Ib2fyMpE9hTgGrMe8emPCJnPcmAQ7DbZj8EUzJRd3PZnFgzH9IDdVnxGDrOiLE
	+m8JL9Xxbw7KW+V30ZJk7zaayJJbw5cvUVh6iI/zMxexfPqtL5THtmHXlbsdtORK+f14e8hvQbb
	xIjcavnvFstrIJ8jAWEFJdQ7TWSMSCl4cyfaiDQGsx0gplJzK05p1cP/HSZMWr1XHHlwPHtq2Hn
	Wh2nXZI0eN7QfMnEbM6hRfukjSFM=
X-Received: by 2002:a17:90b:3f86:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38e7297ab8bmr14046139a91.43.1784707381218;
        Wed, 22 Jul 2026 01:03:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3f86:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38e7297ab8bmr14046084a91.43.1784707380728;
        Wed, 22 Jul 2026 01:03:00 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea7aa85c3sm611869a91.12.2026.07.22.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:03:00 -0700 (PDT)
Message-ID: <515b04a2-b595-4fb7-a72b-2885121e0066@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:02:53 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] media: qcom: camss: Add SM8750 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <quic_vtumati@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260722-real-diligent-pig-c97d3a@quoll>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260722-real-diligent-pig-c97d3a@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6_pBn8E9FtJccMBXvGPrKNBPlxcPsFDK
X-Proofpoint-ORIG-GUID: 6_pBn8E9FtJccMBXvGPrKNBPlxcPsFDK
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a607936 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eB01bHF-wB_RgGLiRNkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfX6xqY63M/v1ca
 6+74sJSgMw6ReAXikLD8AZ95ZSQM0QoQvzldoSNJbypQUTQyYP/D1K7ZGK1x09PmDSz0QsPEkUz
 uDoYKAVLwRXNn6uuA65pcOQuZttInfQ3/l3j6pwmmOMYdvyei8TmCZlOi/Bu7YkzZmZgzxcBeTT
 tnHiANb2P16xTqfyRPrXBrjynx/c3ifIRf1BjHV5EJJaYrL4raWkzDTptxg9Fwwu0NcX+SUDdp8
 dIGjDjga4+/wfXdCwf15/D7NKcl7o8Uo2G7Owj9aUMdVckhoeEUVP4iDgOPwl/YfkzrwVfIDKAo
 EQz+SSJJh6oFtkYypBu5+Cwr4yWko8183fM4wfeQSfZStQ5hU+O/CT0bEwmOQAGb5kRXMX9B95U
 S0kQ8K3sYlYm7Sntd0qvPpkl63il8S1eUwQTyLxSiSb3Bksbj3VMc5eAt/GkV+fyjXGY2Qbb/fj
 Gwu2YaxSvoLrlBsj4sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3NCBTYWx0ZWRfXw4CSj0QyI8x4
 gHAaAGaMEVSL/c+5xEsDm4gaEEe3l3ZfE9wSptSMQKDdZuEaICcUH1T8CoLr483M3nU8/AfEL7m
 OquCrdO7eXq6eL98m9/h4BhM3nA1fmI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220074

On 7/22/2026 3:00 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 21, 2026 at 05:45:59AM -0700, Hangxiang Ma wrote:
>> Add support for the RDI only CAMSS camera driver on SM8750. Enabling
>> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
>> modules, with each TFE having multiple RDI ports. This hardware
>> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
>>
>> SM8750 camera subsystem provides:
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 3 x TPG (Test Pattern Generator)
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>
>> This series has been tested using the following commands with S5KJN5 sensor.
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
>>
>> Dependencies:
>> - https://lore.kernel.org/all/20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org/
>> - https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/
>> - https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com/
> 
> None of these were cleared for merging. IOW, all received comments yet
> you send work which depends on it.
> 
> This is exactly something Bjorn said a week ago or so. And then a few
> other maintainers re-iterated. Exactly the same, nothing learnt.
> 
> Best regards,
> Krzysztof
> 
I understand the concern and agree that posting dependent work before 
the prerequisite series has been fully reviewed and cleared for merging 
is not ideal. The reason these series were posted at this stage was due 
to internal planning requirements and the need to keep work on other 
dependent platforms moving in parallel. The early review is aim to 
avoiding blocking them too much. That's a dilemma that I was asked to 
handle it in this way.

However, I understand that this can create additional review overhead 
and confusion regarding the status of the prerequisite work. Will 
transfer your concern internally to try to avoid other colleagues 
posting more series that has much long chain dependencies.

Apologies for the inconvenience, and thanks for the feedback.

Best regards,
Hangxiang
