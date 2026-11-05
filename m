Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865985;
	b=XHTFzO2kW58GYL5SyEbrwRteanYK8ke6nQKMbX/lkDtGL3FO823lslFD2jLLc19vM+Zl
	 VFBmlRvWLxsPFJSa8vOgN9ceUPqcWK0wo6jX7pZgobJ4Gp6Xhm3Yi5GS0skV3U7v4a9A6
	 Q0QyG7gB+tSnfdYxCb8NCquuKrMOG3PF5eINPm5FQ7dw6InWgfqePQ7MA7vFW6PXtALV7
	 g1G6e6wSuydgbPLSjdntIADgq5Wd/MbVODLSsBv8HYGU91Jd3FIY/KLof2EF/0DJBjtFC
	 ekpp0TjQR9J3EsQ5roT0IA4FmChSFGpNUabR0eHBdn+6ldONHlQX53YMr5MnX75m94Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
	b=cbpeKT/GV1XjrSV9KyIE2jReVtZ5TLNZqr3o4j8cXe4yFuzG9jrZhq36dH9KQXZvbVrL
	 sP9v/UL6KfLKnkIA+Kk2Z2iGLJfRXFernZYYjCiC0U7RTv1kSjPKkSrjRB66Pjad7vI9X
	 dAdMpNaX3s7KX2uKnRZ/Hu5QeL7tUumJz5zJ/YhFmkAQvbEaipIgP1b+XGuWwZ/v5pRvG
	 Sj67VbFg2J9u97hgEYh8CmhZbWso0IZ1XBfbxO6Qc+poBDlAlK/1OYOgLsQvdww8lFsOG
	 COJPupTwNGIzRFFHi5OdBLp5XvznxAC360IMv1ubRii8jlcRBTyLtck0/JCrE+kVcDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566DA606A32C
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 08:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566DA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hyCcL2bP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSifANim
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56ToOP3223025
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 08:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=; b=hyCcL2bPYYDkie56
	xQ0ldzANVWAVN/WJmuSz0YvmE0YcO5OMBVmebfyZ/DtDdmY8P/5rSqGHwL9rrMwm
	vJBbdkS34hwQhsloWQSJbEZ7SpSlgl3ipOskQZjimZcTZcsUulE6YGYuy/HlgRTO
	8/F9fOiC6yTzUpOuMwLfkFkIih7HhxJzL43xRp7KHxvhQaasvDazgVDectHPO+Gn
	jFCVRX3zAXgx+45ZsUW7WLR2Z2J/xzA5mu2moiv5W327u9DJoY9z7gD0LsVQRfBX
	My7BaSCzdAWVr4yWeQphklmafcRjyN7/LQh/mrnXdfsYyaMUhqRHZGcFSK9mMZau
	avNsNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43gyn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 08:06:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53630cded29so3488631cf.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793865983; x=1794470783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=RSifANimv0yEnp8K/iJ29ge6aNg8x4hP5I3RkFj2BpMAGzRjerLyBx0fj+QyoCOZuz
         gSijooXQNO+1X9oQfT5EH04mHW82yfz94Wjbw0XtqoPnl8oOI0uib6phUCkFRenYC7NQ
         xpQecf0sncWeGM716A2n7eFXNAql05e2hmZ8d6k3SXr03eDMoUDKgMvF4aHNgrgUTWpm
         V93rkK0OipJz1OHR2aC0Ur11Qwg7oL+k25QDmN721cPz39JwzrEdmGq58HnbnvOVpwps
         RdGRxuR3x63f0LAsAa+luLPGpl1NFATv06d79MwqYkpL5URMNeRaYrN4jtgfUewIj3Jt
         c70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865983; x=1794470783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngT2Zr1w4uRruIUqboDeGJXzhifvmqARymXgf1oU38U=;
        b=lhRgTyf1Pyby8+PmKPu5O4lP2y7OqYBEt/SdGcpwSNI2rt/nS2tVFimKc7g7bhHRub
         8rMSpVFYgcVw7tNnCbpeWrK++hyPN02aojpBowc7P380+awbyNxZcZ8VDBOVHEDtGRMf
         gN9wkGGwdwI+x1qEoIFA3W7rYb/OapHPD6BdDuXSBj/3vGYOGfutQGS00G6LcvSnJE1T
         VSKBszgHPwV4R1/TdB2htJ/nVX1HRZWClF3V6lG8Xxp8iwyL/y6BJMaCJfPf1BYKYuzd
         9Dn8L6j3HpkYSPCuvY3zDZ2W4nvr6youd1w5inneYDINIEawwAD5h6wi+weigztRLrvC
         AJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6xgFiWsZb7Vj6AUr11wr3N0D8HqyVTCNtoMmkWlwX2e6DgatBar81+kGVDeeGrFgKCGDAjgTZ6+UC1w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fMbrL9NA4b0uMC5++/+ZbV2I8o9SbQI5suzaRCJfIwwV2hl0n
	4fs4EkIuRTxQ//M2hfbOvgfqTlomFBc78D7pMf7Yiq0WubXQSU0mKdAifehBAibPguIRk2a3ObU
	WEP5EOU8M7aHRqMV1GI6uFzbsihHpEIK83CZueTjLPhx0X5Jm8+1h9E6yWX6wt65fH24+QT8D9Q
	==
X-Gm-Gg: AYBFou0Nwqp7A+yVfytE8Ml8KiSp4pSROx+zZDvtHBGc65AdqBo1vOAFSXgYqAoQJIt
	F164N8ssHxQ56chFwGPLnZKgdz2G3uNp1RKWBzDD0RpIVw3LIuUXdyJurOxf5KqaMZyTAY/F0Vx
	ass8fg2kQ0ExRCT6+qsYjDlOd+Pd1FVBjWyU08+W0qg2f4s2yeNnGWmoQ2W/kDQBMFSAohZEu7/
	/sADCAVQNyn5D+KSmFAvMbak5tasSAz1IRDh5zPXXIfK8PD8jKVpocXqWrcxcl1WROrGgnPR0hM
	BkLFaaqyjuq0Z20HefGC1dhnyYFC5C8cdJY3UJAy9t3kGQHJDAJwzFs/ea2aOsKUhtAPf016/mN
	Rs88O4Ml2fJmxG0oMFlCbPkXllPkpf3bIFQ3l1RvVRmKF77Snwi1pWSwZHRQ47rTAQNLR
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400521cf.3.1793865983099;
        Thu, 05 Nov 2026 00:06:23 -0800 (PST)
X-Received: by 2002:a05:622a:e2c5:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-54aa0ae7fd0mr101400251cf.3.1793865982586;
        Thu, 05 Nov 2026 00:06:22 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4a771bsm145751966b.85.2026.11.05.00.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:06:21 -0800 (PST)
Message-ID: <2c31e18b-18a6-48f5-b892-b343f47907a7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:06:20 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: fixes for SoCs without IOMMU, RDI
 and CSID1 streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104202313.72494-1-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gwzOHwivdA7QIVgAfH4iltfpewXY5IwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX2slOtDapH/Lh
 LHeoaYOPhJUs4pjd9JGome0TqY3ukgFaJr39qU1FbGxHhD1cjx5HRJ41T3Hrfy3aJTd4RS64kzf
 +NijRcm43qb22gu0tYXC0o2WmGbMUK1dLkL09l2oR8TwgW4eNQ0vqpxgp7fTZZYG4QmNJX50QVR
 QdGfz2bBIdymYFVWFVYYTGL8/Jzg/yM/cBXH12Fwvrsxdi2WVzWRKZ1dXm9cn3T28H5oB85GDEK
 82BTNgGSJpa+r4/XYCxzxwHjPpbaYWHCoIN3ag2j4ODuoJUZn1JOPK3BRsbTl4405M2LXy+4DXE
 6EN1YdzVCDkNGFPz8paUSLE9dbXIA6RRct8vGc4LFtemFMPckHRq5sO3Gr4IuXTfUu7+pbFfscF
 CJdGi16Imw06t1qtFXbr3wjaAZb38GkpUIFyqkQXvepflkWI42h6+q4us8JNKfnopVKGlRWrtcI
 67DevpCP9vrNlyhvh3g==
X-Proofpoint-GUID: gwzOHwivdA7QIVgAfH4iltfpewXY5IwS
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aec3900 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sv9X2YDxvq9Wc_PriaYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX+nL1pJ13h+3A
 mwNmMdZaXEdbdBDGK7TxiteJoO3IDBWdbLvpL675VIan90t3HZBqTB4lffuBfvNwmzOX/Nvy30I
 yt9kINcgODUsth5cFHd26EGAdb65MT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 9:23 PM, Allan Siriani wrote:
> These fixes came out of bringing up the CAMSS on MSM8226 (Moto G 2013,
> "falcon", MT9M114 front camera on RDI), where the CAMSS is not behind an
> IOMMU. The MSM8226 support itself will be sent separately; the problems
> fixed here are generic.

I believe that there is indeed a IOMMU in front of this, at the very
least in front of the VFE and JPEG. I suppose this is "just" because
upstream doesn't support iommu on that SoC?

You may want to take a look at

https://lore.kernel.org/linux-arm-msm/20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com/

+Cc Dmitry who poked at that topic

Konrad
