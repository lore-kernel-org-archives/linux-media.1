Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671991;
	b=UPeKTh20evbKsy354qPf66rPx6sJIOBuGXVm8saIwlaxRioMwoZopbka73FpJseKKUn+
	 XjjCcsYo40NoZugn0TfA6QBwvo/nRN3j4TiA04aeIAUto4BN5VZYzrRq6qJFzGByUeczX
	 JmtjHPUKlsqdyWB/fT7/iHWuiitCQqUgLplnaX4zcb2awt+K0eu4cDHQRE2y3ZmMM/Ysb
	 VcO13CRrSfr34G9g6Gvw6+xrsaLs8DurqoKBY9VGUsnu/AqXB5u0WL6HxviQe4UYBLQIh
	 Oyc5mmE0psziQ9XI2/VTfB4njcTmRAtvIDj80aMjRdNaclC774iMUIa4Vrx9o6EqONw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
	b=fkXx4popZDzOcJ3V7YTwCF5dcrkihM484s3TrLsTzt0lb74czmyoWYpt5qurl8LUXR05
	 IDKNJM9q51ykz0QdLeS7WuP87nJ7lWF33UceN/GQ49qL8k4ex6TxCHJ6CsfFCgJ1i4eK1
	 /ciN8ozTchV/YXYYnB825c1KHkbmDM4aOayMlpqiz/cYrZRh9Vn66f9XOg72zUW83cPYe
	 tqRcqXv7D6yoeO5pnXDHiLYEO7sXQCRKyWNINkg2Syn/+PYMWY2TTCuBp87UkxQWS0LQb
	 f1r3gAhnjy45rD20vZ0oOHXSjhTRP37XEisqCj6j86mItxwOEvpuz7ustZQb6knJNiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70641606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70641606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dGHclHLz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AjpCtBWf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36TD63023720
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=; b=dGHclHLzI850Hspu
	1TdBchJmfOIflHZu+5SrcJsVIVYPz9AnWcG3D+8fRkIWirdwJTGU5ubCHOoYoPtR
	aP7u79LlcIt50h2MmsOKRyL+nh8X6/6fZbWRAHN6IlH8nJBr+Biw8Vp/CQ/jo4zy
	o/YJHzH4qwMJVaUK7TKJ7QIfuf9DzOC84Ib3jq4JDruGmHvMh2jafk5Gf0q0G1MT
	dnJN9ERCaWHF6RF2bU1PzQp/SxXdmdLhQkfwSKss8xalYI6ETtbdcUa0zxpb1UnF
	DTMPOKPvjUMJMb2hMawQ6z6glpq1SkaA91ujqtTrarXnxUvPl2jvGQcyECr4xc7i
	1wteqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatew4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:46:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so7902816a91.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 21:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671990; x=1796276790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=AjpCtBWfymD+Au6hBB8IABhVfdoXtApE17sZ1SIVBOfiFVHCPS/1QqtuOzgpQWBaC+
         7tvFCBfE6E546QKCDnshXQwUDtKR3CQXSBsKlJjgiht3n+c+DVwEAWFSE2zC1Tzc4D/v
         bUoA7Fjnm7J7hcZrsbyLzDLjRtb9KEhiBiDtmUj6Pl0GUds9ebAZ0i8U8Vp1Dhb/7xV8
         E1zXCFO0Imj4SJ1dlC9rl/4R1AzLAQAPsTqC6j6GFZVyvP4rQfTeeyPZg2OeuISA6Mg0
         kuv4gFeTDtPMszOz3GrzW12hA9YdvtFNLiIHMcdZCfpBzAxB80PO2pyxhUbneqZfBJjs
         dZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671990; x=1796276790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzRkfbSnGE4AsgzW9OkzdK1iO6kjsbcDrybh+qxoCCE=;
        b=F1mFnBfcYRw1ITJIDpN+Tcb7Nf4XH2is7+IejyHKfDTf059eK/U2V4fMmqlpMmls4q
         wk3Jm5kNZfP2sG4uiSNru37yvsFl8PjDWIY3d98MkcBOCbRVpm+LRe5g1Xb1p5jB9HTp
         wXWUJG78XgP7h37EhPxhh0ZuyDjbGldYk9frT84zb4U4P1v794Ex4vIu3IfOCvD3djKd
         rFIGhSG0j7d/p8e03t6gFQBsfD6il3lYjBKIH5JtlX/gzXDoXK/S+O123ZcaCwijzyKJ
         bhHpanwNhFecAbJh1pugIixejZiGS5aHVIWO+kwcB2Da/bsSTrATDjQtKteKW8r4Q3Hy
         XWbg==
X-Forwarded-Encrypted: i=1; AL+hErGMHLqznFleTc0jrIm0a/Efc59rxLPNVxytteI/4cgtwv2w9apxS+SEpmS/GWGBWooaUD7B/g/RjFKimg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KeY5on57kDrDp+iPcRm6H+gcz/dIN1JhBJO+NOTElXsM7iWFZ
	Y8N+2jG1MkdwQHvfXhSBP0xC9RcCVsyTKcX+xo8P/SDM/WCwGCnxV1r7qeG+/fj6bQMBw6SjHS1
	dVjhuWydohIe5xQMogQPKmgfcEN8kRsDrGXnu36pX5UZtQDuVp9jmdSWY93lcUPMhmw==
X-Gm-Gg: AZFdTZeHE3OW+tzxSesovgAplwHsEq/TbE38ofrYP/HrlYled7RBIcNdyWh0PXBOlfZ
	ds6X4fsVq5ZXQzoWdvb1glXwZYuZpW9FdppuGS6UbJ7qZR1pF43Ad0o4728bBVFSJ/UY1onH8LP
	feWzFnEP27rVZh7i22ycGh2yPsd9Px8B3MVZCXspbw8MxKVarrmVBQUn7VSrBGtInFtBSxPZIrY
	KIyZayBYPYWE8CWojoOh+a+DTf8cjcY1yLidr3ne/AlZtY3YiyHUPYf+XaiZaVnh32Z5HQ1QIU5
	QgIDjXtn96azDJg/KAI37Idh8Wa++6A/4/MJvmi3+oxQA08xXapRv16/hL8JxLAMQs1+h7uMA5W
	3Rvm7jA91d76E4Ke7gVf1Q7oFklzbeFh2B+Merf4S1HZpUpF+EwmUaDbstqQkCHd4wbSgpgchVv
	yqeokhBTaP5h22em5fJ+Ho6jM+Vr6hWrWEMyLeYmyS8+U=
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837133a91.47.1795671989903;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr20837104a91.47.1795671989445;
        Wed, 25 Nov 2026 21:46:29 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm31772158a91.12.2026.11.25.21.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:46:28 -0800 (PST)
Message-ID: <61b5252d-151b-4a6a-8ab8-28bb94583ffb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:46:22 +0800
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
Cc: wangao.wang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: media: qcom,hawi-iris: Add Hawi video
 codec
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
 <20261118-add_iris_for_hawi-v3-3-51786f6d4057@oss.qualcomm.com>
 <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <40185500-441e-3706-b68f-188a55b88014@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX5ykKkK8nko43
 luRu7uF99VnOcwgpEnmwJJC+1T23dPpC9G7RUjugvGJEY+2TKUbbqY5GsTLw/XI/pUZ8PaDF8jf
 qPTZ2Ry6j6qq4UsdhGFJdsufNyHyOTo=
X-Proofpoint-ORIG-GUID: MJNveST7LFGZpGp3WWNJu1PLsBamcUcq
X-Proofpoint-GUID: MJNveST7LFGZpGp3WWNJu1PLsBamcUcq
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07c7b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=h9KLfewQyvMvtfKxVGoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX2nyNzYjoNfUe
 KCt2swVyBoUH+6oU8gEGhDPtk66g39GsI9lb04CNTpXGHBU96a8PX6TbHWJTL/v/0n7J3lSSb6m
 eQQdBVRZDZYO8wEX0xoK0zFyO9q0Q/aRxuLyWBqVhaRA8rVoS9NAfsJnF+9glshbGywUvcChQV/
 h+jG6G2ZP4MQe0r6nubZGTigkFdwFkDDvyflU13X7hP7uxFeWrM6jF31n4AxwzJrfh9B1oRsyBh
 wMZmlDYEzZcPYiYDqlQni6E+plCptWeXunHbLzzrbtrH1c3ExSdpZcz6Vy8/ej69TmElVhU7QF7
 f2JVv8Vsa4aCyVW/Kj9/0tWQm7CDjgBNK5aam9dZrpO2xXRZ0TxkUe9P2j3xQJb8KUnARr0/CHp
 2tM2aynV7FZcyjcL6T6KyMcM/cppnmFLiSOW2+L5xvLMGVRlz/ap0phR6LlGot0+m8uQ9cmM+hD
 XIQp4rBN4RMoHWlfqrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021



On 2026/11/26 13:43, Vishnu Reddy wrote:
>> +
>> +  reset-names:
>> +    items:
>> +      - const: bus0
>> +      - const: core
>> +
>> +  iommus:
> 
> Since iommus has been moved to the child nodes, it is no longer required in
> the iris node.
> 

Thanks for the review. I will fix this issue in v4.

-- 
Best Regards,
Wangao

