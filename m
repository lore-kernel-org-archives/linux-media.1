Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373951;
	b=ZkrWgD0sdjH/sD4aYaalgXJnGriGF2HNbNeDfpEbwrmnPtW/MBRkThk/heyodvzroKJE
	 SOWsTyeJkloSpoY6V5vy23mcrhRGWgrn+2hjrNgl+5Slt4fGr4OzqSVrb83k4deElqvvr
	 UiCfgLQGNcwFMkimhisfqyX2FGRtvAo1arq+nEHxCeyGyXlzdz4ooHrGAZiWYglCvCKWN
	 wn+GQHlxzAlxFkyeFmSWtV8PDjhDb8diSlPV7CjWfk/n7asej0OibJinU5CTjmVU6GEhJ
	 g1Zrd12I3YayurWo26EFWwu+qWsMsenFJg+EK/4Ou0n/ZZFp512qz82SOuKRCrMKIbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
	b=djhGaIZiMYhp99kODficx3TaOXTtDH0OoPZ+pALeo7K7TbFATGetUgt7tTI0rCdmatjF
	 +IHhchHEjRvrMH+QngSiRW/iiMTf3HVAlR7NZ8CUO4cRasxqThzwKRzWcZ/ruVqhlIcPQ
	 O4UQ3Hc73E0czkoHPSAwkiryxdgT2iaPg4H2O/QkhBi1uStVRotMf1br90WD8rzKKFNmO
	 yR+nJO909j7cxczm4u+GJhcFDSTRI7Cns4lrgguWzMSqx8BVoYLPnKlT0Qe6I2fIO1c7q
	 /5fi1etf1eyfLTcvU1D36bXYKLDkelQAoK0/vpReJPYere07ny9fH+ojY8eu1Eqp3Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUJw8K/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ECE606A31E
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18ECE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUJw8K/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERKLP4141733
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=; b=LtUJw8K/jVPibXL7
	Nm6X6MfGfw+jsqw0QHvh2SPqp7FITBDyU6dhveHHRWv4sDrLCiMXu7elwTdgxcv6
	Q3v8AS060Pha/MLTvN/d27jg8OzlGalrMTvDiPa6nz7k1ay8ai2sTBgzM4gQT5Ln
	P58OwN8NvpRQjWM4defAPMQ4BkxF/aWafIxZTjLzBXw21cqPCfsl4dNYSyun1uCg
	FcsITEjBEJGGtVM4bH4yu56IqmfgJB7U4LNJ2aO5u52hh6bPk1YqAP6/UTf06yWr
	aZWscMPIY5o0ShNuCabk/YQkhXFls5MXy89QqX4jA8/yoUx3lfFZFSjl9nYoT27x
	xp6Smw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qupqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 15:25:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so780630b3a.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373949; x=1793978749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=YxKyyf5mwMosBl9MsKEIUJrBY/Lys6qbKF32l6aV6L2rInMpSLYYvLIauDL7z3tfIJ
         vc66hK5TS6Z2m69HUNfr/t3hmJg+PRVFWH7WBg7U7J5Muf/qvUWdeRtob2dz98N8VPKI
         C8MmW1I9VKP6JQ5BjQRHsy/dqiFPmWIbYBqBzA+N+PMs0jsM93cLUJbyvVcN1XCIRA82
         DM9W+P99WFUgAlkw7tC/O5wSB5K45/Wx56YgZOeND7952LvlYW0Da53a0r5k2d01o6k2
         516tsdFxfXgYvwgMdOSKhZSW8nOZsKDNMF7qNilFdRDmq+WKhJndJuXZX+5GHRbcPs0G
         UkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373949; x=1793978749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=OG5X//Mr6cHkC1x/6yDxNt2M8p/ilpRAa0jlPGo9vunKXk9wFo8GVT59ufC+1359Qi
         7OdOXeQB221zbTA+icbSLXMsroZM5jPLaI36kiBgc4VboxlgOGwCEHCyt3TCyxFJsBmw
         2lO+Jpm8NzcYXHsMfoWjQrcsPI9idqjGa0J60pCTbrK1MR99C1i/c7Yf9FfSaxvbcunU
         0cZwLFgNdf7qMZ1hnGbWYCuiWx7wyNA73vlu0v8YcHIC7fcWBYkQpo3ZzoTdHUH4q8+w
         I4sblp7XkZmdpNEEgWKBTS+wxz1Yx4CGijwcdaImyqYYG6dI8a6b+FubTEQyU/fBtz4R
         fliA==
X-Forwarded-Encrypted: i=1; AKwUvBzRIYdhchU2J+ihXpZ9L10teGCcCwS5INGpGh572v2Ay0wSthsAKXbPY0Inkgw7V2i5kDHI1sFlZ5hAPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPW5IwKiD4fuUmuVR2hMvJUyjWEq+Rf9NYLgJklcA5/qYs0RUG
	OnmjcumS+YfgIat40zfgxC5PoZSuApo4xpigYpGe0zWmDPYwC8tJwSwTBJaWvKCgIPYxO5QJbtd
	7XnpxX6UiDCfJOYgOHP8u8QdHjOXJ5pDq0op5vbVaWyZk87RHPlxY58d7ygn60SG/pA==
X-Gm-Gg: AYBFou2TuW65OTZ9EmMYi+iJ81oKtAozjI8TeM+ZOjAeVQ8pl3dc2wPFpplB22pP1mC
	R1HR2pOa5JFYf4VN5MReV2RGQtbv/zQ9Ml1ElmH53udFbhju/qn3Nud51FktZ6MhAdLGUtHBAk7
	a1Smssc1PQxQEw0ZFXe2LOZNxkMHZLFLe1mR0DCnk9QSZXzsUf1tahMzYYnOJA7Eq+ZwAFUdpZ+
	S4m/UMTWclhSeodDEc6/PQoHjzOIS8+NVRhX924YUQBvwtJLRQKTHyAxiGAAhLY7l9UKoTEzIcV
	uczfP2KRgh5xaY75kHT3me15G7oh06wnHPWdSCBsWQx4b4WZ0r7ww94ClvynYmHitlwt/X7FuMy
	DG/DJZnzNmlvX39PlbDC9REpGeKtSdVkG2Sy6u+nb+mTaXy05xxE/DR0b5JyodtuKFTUJM566YM
	jGsEc8pZ93oFr0Ue3mgl4K29Z8b0VG1oL9LDST
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301169b3a.59.1793373948955;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301134b3a.59.1793373948472;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm141926b3a.36.2026.10.30.08.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:25:47 -0700 (PDT)
Message-ID: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:25:41 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: T04hsabEGVW2nG2XsVLZAEWw9pj5v0tW
X-Proofpoint-ORIG-GUID: T04hsabEGVW2nG2XsVLZAEWw9pj5v0tW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX/aY5NcTdAve2
 aUARmBiiXUD8co8mMEZunMIg/6wLuNUFcOVGHf4gfuT7YQrc8gKaEGuP6g0zbPGfLWq0hTv79Rc
 ytvyFxs3rZer82tW2Lhx2NgNcYj10HjbE4QNyt+OVHtJ37TrknaFGCYadVzk4Fut3XzevRu3xNT
 loTd/9Jl6Lb807XktLpkiygHqqXGkldwJsX8cc1jC6ReN1hoSDVG7QSFP32KPwjloqbDPuyEdCT
 V6vK/a34vmUnoJ8BkmQJR1beGxUfshU9s7k6nKT3b6wvGgFb92ESogaCXHeUtFr2S3jeazB4M+w
 bnRRl9ic6yoxE0JxZtc5c31ltOE0Rc6m7ZZi9J4yCjWcE9MHq+mf8/eWpeuBF5nFV9L3YTp+9gp
 Rh2uuWda7WAGabN66T5vr0fVUpoWOz1+Qe2trodFKxgpC6Yrgdxf9D4xKBtxT6caeKfxW7uE0tJ
 1mrrtehm5imPapudbZg==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4b6fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=oDwHtdCdAfthrX0yCOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX7NAl519zp9PI
 q/EhWoOrRhS5hYGM1Kh5BFwNMbVr0u5EBF1CwERxcIO3+fOXZLraAitOkBDy3x64NUrwzFtkmrM
 eWrPvNz2LF9bQZGjhF96QrhBFqY0WHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:04 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>> +    /* CSID0 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 480000000 },
>> +                { 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1190,
>> +            .formats = &csid_formats_gen2
>> +        }
> 
> This looks strange, why is there only one clock rate ?
> 
> ---
> bod
Hi Bryan, the current CAMSS CSID code always selects the first frequency 
listed for each clock in the CAMSS resource table.

In camss-csid.c:

[...]
} else if (clock->nfreqs) {
         clk_set_rate(clock->clk, clock->freq[0]);
}
[...]

For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
so we need to use the highest rate, 480 MHz, to meet the bandwidth 
requirement. Thanks a lot.

---
Best Regards,
Hangxiang
