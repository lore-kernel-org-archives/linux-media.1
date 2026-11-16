Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816329;
	b=vrVqHUZJoFPb1k9krMJ7kGoulXcTcKMgtCxtt9UR8MventvDquwtRvewOixGA6QhB9Mg
	 6fnnqrwk/kqtKrDkTcmrJuKJvj3cVnWBVvkJ/XenzFzEYxwIV1RpjNIHKB/wMfPllnoLY
	 ZbCz4birSpZ4myJLwjeMj+PXFYfhvH8ZW+i807+yxcyPDnxy58FZQegBxHJ+fa2C2tzMz
	 VqbzcT9vYtS0QX/d9EDgLkS9Cci/nbqJLeYY/9a1C4ChuXLgaAJsmR3/0aKMrbbuxuPYP
	 vqLJTq6Zh+Z1gvBP+7Lnc0SuAlB4Rrc8NqjMUxc/8j7cCYn/a44oxsnuIZ7dg04Z2Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
	b=cBkeoLVMsNNX4aqn9zMQfiu52c6qbPnIq0pp/3KqAsS4OtE+zGmNzckKgn1HuRhGVyEz
	 24DwMMhqmZewL3ygvipi1mFJ5otpwobVmluqUnF+R/c4OGmCrkx2qLsJ1nOmbW3SToL/K
	 qNXmMaNQFUiQqbhrATro5ibWQhRLjGbdQoAq35RIK3WDM18VzoJQo4V39p8kFMgmjr0uM
	 f1W8fru/5FoIDIkyK2V7ZJPioMI7OWGNpT7tCTe3dk9HW35LkKxWgM+Hr4OoqUS+CUcCB
	 Kb0xheA4e/LiU/khBjoO8kHK9d2N2VaUX5NWLV6J2G7upKH/Sn3qqHy5oVlbRttYczA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWs12k+x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWCpUx5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D14606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D14606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWs12k+x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXWCpUx5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fAwS3192649
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=; b=MWs12k+xdUeW7raB
	CVJo6RMai7ewpBdgv/jMet087UbbyYTot/c/J7xfEPhRWxz3cAYMnEUsyrdWgl8O
	/LFOBBB96M2CfIPWM98R7IKkWzp1I/j+5PPVnJb1Mwf7bAnzMXjfidGsnjkmwEmz
	DlfgcYD3GH5BMJq8H+pdcQUQbnqFlF5jpHkkm6j0Z9AqPdcAytF5AjqPth+XaxZ5
	wT97p67cU265amV8C/m5LuIpoufE/G3YnwZviu4n7UqYKfdt8Q+eSlcFsCvR6ynb
	ILGtQXTO000c9F5p1EI9FVIR1x5E9Ksk3i+DLc1FbWTH+UjJxXf8/GqmNgnpuois
	d5Rgbw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj45gje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:05:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso1088801241.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 00:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794816327; x=1795421127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
        b=SXWCpUx5o+laRSbzd2svgln2riTFNRf/b8S8MLXSQlfX78QXi83fkeg50Upi2Na9De
         wEmbGKWeNb9OY+46FnWSca0ATbzd6ky2e2GdVw3ZI1FPS/hZX7SmB8QS9c2kND4vf0TF
         nfEtmsgkc8+mFoCyWr7EdB0LSL4boHvESKyN96kHvjC7c4KvwrfkG3TgGizpgVZWXhvj
         gkQ4ZcRtSWaBMBA96UaN43NKKvxaufk7/Up4FxGNHUvah233ZDF6w8Xs+6IbRJb1he04
         g+Ds7yWuX8pfELYhK6Nmzs7+o1e61K43eUMZoN6zr0N/7tPHk4l7xE+CBaOv1y+elPFV
         c8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816327; x=1795421127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVFz9C+2CptBLlpcJnnRg89qTX6lg0FjVcFiDt+w7ME=;
        b=E3WdbnhxTWt8ePeHl66yICfHtyZMDuBdvGs9MpT+zCvm5UvySjvcs2x29DmkkOBlBn
         7EoQ3pCjDTAi0M2xPBYR4ucI1azLsSE+N4f7TJbAYvkyTerVesFIE195E+CRE8IDRLe6
         I5gNKqQT480mJS+uG8if0rl2HQ6ddLkbNC2TWw17mPnkDscd0ZXR/gCRwGDHEPoKq0WF
         TQJ+WhkViYAjvgUSvkyskNA86rTF9NuopFuW4Ow1S1SWj4pi03cdbjRRLvkXOsFNSkE7
         MJFyNZk5Elg6L3xiA97NavC/imva36IWStmAMH8TcLXFzEhICBATY0Y/xraP3l7s7TKf
         LQvQ==
X-Gm-Message-State: APuU4Z8DaUhd/xw7/IF0vD8gE41qmZv8ce/nIRSrP9tkvewCNzRiKs+c
	6pc3zcdvirESEpiy8zz7EYTWFJcjvktEzAARsBQ20bK0jijaRx4+Ifp+lmNv0bvdkLedB+Gs7yX
	UgHAQRyeJXBMKRJSqet6pT7XsnAfBat5KsY8/W3GPj5O4RREwPXdYe4z484oP7j7ypw==
X-Gm-Gg: AYBFou2k11w9cBHycrH148UI80QkUGCd43KKfSEvfo/rQcgfWt9tX2nrbKJTUWXi5Od
	4Tl87xILoHeKp5s27yD4lMMwYmBP8bTvvscXsxdSxHaTDHn6elObzkh4MY55YgRUj9RD9eI0O5V
	N/dwBkuLvg8Dto1py8aUWS9iVox3CQxQfMf79eiNGuqMvy3PXcp/OzIwGuKK03O5Aedsw9z+D5Z
	jOcZZJ2xOq5QU3A7BF9KsvIYAXu0qoaLEKzy2VHAAWvF9mgUwxXoLleyLVJY4ccwkj4Q1DtYYYd
	cLKxzJO1qgO0GMn5zBMRJObyhtFjNkJpv+oHNKf/NPEX3ZWuC01/NXKzFjJLClEhfgbdg/LwATK
	z/nyH7lNhNk060F8ehqUgOA39qwCNYxtLzA1UhHsbAKJP5oNKHu6v5FLuov20jrPUpxCFvh9+t/
	TcNr6UWPUj+/A0xA==
X-Received: by 2002:a05:6102:54a3:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d64d12f547mr2599470137.0.1794816327010;
        Mon, 16 Nov 2026 00:05:27 -0800 (PST)
X-Received: by 2002:a05:6102:54a3:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d64d12f547mr2599460137.0.1794816326493;
        Mon, 16 Nov 2026 00:05:26 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm136597195e9.4.2026.11.16.00.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:05:25 -0800 (PST)
Message-ID: <04db2c7c-b9ad-4c10-a7c5-117e1a2db414@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:05:25 +0200
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
Subject: Re: [PATCH v6 0/4] media: qcom: camss: rebase fixes and SC7280
 enablement for the streams API
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ravi@ebytelogic.com
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
 <20261116054402.234004-1-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261116054402.234004-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX2IIkrTRYi8SW
 BqBexj6HXynPHBXPD5iOH8o51NfLHLuaVlvMGa/HSojYMVFHSY+2TVIF1suYFi8xqoLt7ZzbqZn
 0fuMOGC/9ACYivGefxCbbcvvb2hYEFAi1kNjdvbhwj35DVET4v+bcDzrMUxny1jMztmuR5Vm1xx
 2SfeiQzW5zmc7CZNseEnvSfKAPM+BkU2PHmhc0ld+hkAoO8kef/saDDTWoe2ek+1xzQamW3Nz2R
 v1x1+OW2yqpUXsrKYW0Dou/6YLTTxoGVlJxSZycUoHSFE6mrBrgt4KA/nREtWAnbZBB6ShKiMVs
 tpaaJHLRMmjO+8ib7ju1e11GCgSYPR2uR2F/p3o2CTzb8hgYx4YNSNpS60Ar+oSTJlflGPeVOtq
 pCxQVF7SbvakP7uPFAPqTFXRlGIKjf0tSYLEw7HK464QuD8t2UdimuL6p7VH9rpVWcREZVwDh9I
 U5fbUFSRodJ3s8jCH+A==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afab947 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GYxySZPKsXQMR3QF6vMA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RKTBZ8InAaMYe1H5relgdxQhbKOXEDzU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMSBTYWx0ZWRfX+ejIbOOjCQFd
 XTIzZX3wFValv2xrKTQCR8bX56Z5Lyik0WWuvsiUkqC9exnE+B5NH2fmKKBCUaswScryxtPXstm
 qFUoEGFbHaD0GeFviL7PWoF+unHoP9M=
X-Proofpoint-ORIG-GUID: RKTBZ8InAaMYe1H5relgdxQhbKOXEDzU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160031

Hi Hitesh,

On 11/16/2026 7:44 AM, Hitesh Patel wrote:
> Hi Gjorgji,
> 
> Just back from the Diwali break and catching up on everything that
> went quiet while I was away, so apologies for the gap on this one.
> 
> Back in October you said you would try to include these four patches in
> your next series:
> 
>   > Thanks i will try to include your changes in my next series,
>   > it will need verification from your side as well.
> 
> Is a v2 of
> 
>   [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
>   https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> 
> still on your list? No pressure either way - I am asking because I have
> been assuming these four would reach the tree through it, and that has
> left them sitting where nobody can build them.

I am working on v2 sorry for the delay. I am almost done and this week
latest they will be posted, i hope this will remove the need of posting
re-based series. Note that the patches will based on top of Bryan changes
for the SOF event support.

~Gjorgji

> 
> The practical problem is that my series cannot be applied by anyone but
> me. The CI gets six of your eight patches from the list by
> patch-id and then stops, because my copy of
> 
>   [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
>   [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID interface
> 
> carries the CSIPHY rebase we discussed, so its patch-id no longer
> matches what was posted and prerequisite-patch-id cannot find it. The
> result is an apply failure in camss-csiphy.c that looks like my bug but
> is really just a missing dependency.
> 
> Three ways out, whichever suits you:
> 
> 1. You post v2 with these folded in. Still my preference - it is your
>    series, and I will test and send Tested-by as before.
> 
> 2. If you would rather not carry it, I can post the whole thing as one
>    series, your eight patches with your authorship and Signed-off-by
>    intact plus my four, so that it is self-contained and the CI can
>    build it. I would not do that without your agreement.
> 
> 3. I post my four alone against media-committers next with the CSIPHY
>    amendment included explicitly. That unblocks the CI but leaves 1/8
>    amended in my series rather than fixed in yours, which seems wrong.
> 
> For what it is worth I have your eight rebased onto media-committers
> next and they apply cleanly there, so whichever route you pick the
> rebase work is already done and I am happy to hand it over.
> 
> One thing worth watching: camss has had a lot of traffic in the last few
> weeks, including Vladimir's CSIPHY device-name change, so the longer
> this sits the more rebasing it will need.
> 
> Thanks,
> Hitesh

