Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374197;
	b=1yVc0Oyt2psi3eBdEpLEJ0HaG/FmKzhn9jVCa8AwtWNdyVPTPcpeTIUkWjxk7jM4z4GM
	 F+L5499kWFJU282ti0v2oJSUpF8rNurYACOnUBB8qbj7tBvRG98zoLY1WIMTrRSEPMfNt
	 804t4u13hU21yKotcY0C0Eo4wplBQEI/T5zF5cIFUoxplqVaBRm9dpCPZECWv20oNjXfK
	 mBhO6Jpztmo2S9mIU41DNz5lHtQYh0M1/1VKDf08MbF2Oq8H14Q3qjaC0TLPq5w2Ai1f5
	 xytxSBlveUfChIQItkAJGW+9ul/i7jw1fTtAC8rJmiva3jNP4eI8TqJCDCVjvv5nbFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
	b=GJM4I3oO4Kv7z9pPwm3CgvE9afbiR3UrzI7Zw8m2t+/WEL3ctd8zUt5Nh9Hfe06z7nQm
	 T9AWlU3TE0vV2jd4aESU7mG9juNZTZ/5NxeGZoUhgtmE8E6BWLK3HpPY3lMrhH0WoFzGs
	 Gt5IpMxp/b8HtYdtCOsO/yon5KUPds3puh0n1ioDD8nSPIPEfx8EpgZSPNpBEwUcw4NLi
	 w+fOqJ9X73F8UPeUCyx3CkX1zbdl5SORe9O9kMSktn5vhjwl7MjkQa7gIqKyHBGqWUs/j
	 x5HNfZ6P0CKpC1Ho+r1rnOM1Z5nyaZvsJd2jMIhxW3a6G21KA2X4ZljnzGDq7Z1rkEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kflYew/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfwRm7Pp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D7606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kflYew/k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MfwRm7Pp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUw233476759
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=; b=kflYew/kyJZDMFSX
	DhVKouEskDccLqfoHH6ubTw5C7r/atRkc4tkcTKsAqr8NwvkRh0TKmro0ihGil+f
	0uTqdZoL+6hXYCaJF/mQEJjc+6wOwSX5jxyn4tyLT2TXBPm6CVqqxSLUEGBIqFy4
	zYufGWBmykxmV9NM6z211c4mCBjFbE4/zZ52SytxnPqGSfM2hEb8MpWbdzJW+Va9
	ujwTKtD4GXKSgeVpQ0SRtSncw96/Lrrpf5b5fWVtZPsiKxaWZp/C8Lu+kpvX98iT
	ymp4AzDEjkUQW62bkZ4+o1JNKjRxWX0XR4XMPK6HiFS9s3mUlSImKiDPMicj1Fag
	2o6C/Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gkxyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:03:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so706890e0c.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 11:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795374195; x=1795978995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=MfwRm7Pp63sXAQMQobDOI6n5BENUFuDlJo7hEFMw8A+9OypIXzq/sE50+PdJNqrSX6
         8PVCoellAQxwflT78Yo7/i6Djobzon1CLP7iKtXCUeEZgnQuSbRI09mjvSycO3gGeN0D
         zRilCBk7glf1KD9iQHxbxd/ebEdARzwngS8+9itTIiO2MXm1/XVsQLpw3fL4G1Tp3obz
         ltkHwHQslPgT24P7awgx+cKVMUkAHFQLxhoaxjQ2nYu0HQFL3nzrN4jX+49BDxXJ0+nZ
         nh72xqpfY/T+Af8F2KsfyBEWmtC1+drLUEwlMlbfjQ3PxUF/c4tRw4XExY5tCQvzRfoO
         YDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374195; x=1795978995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmoFusvyzW8rHvZc8KpW7XguvidS7PpWapoBiQhCE/E=;
        b=BWSJ+QLfX+sldOLSm39CbFSuWugo/U6nFMG0L7GX75W5TVuZfSMM1Gp638KD9qAJEi
         7nI1z1SWQ3wmOInHoWVeWOcaRhm9693Xlp0iFqLg/pQPMHLLAeAvKNdWZzl4GhaeEOma
         3PPCsZzgGgWoVRZJVGUTpZRx7cXXkwLrfyLFe+w5lhKTatO5IqSna6LomJMW2aEdzOW+
         rvCUEu1OttUpPfpI4g8N99gAQ/s5hmXhhXj8JEdVPYxA4huNIL2RLNkbfI0pPqJ9M92h
         ki6bO1mT7u3tw6qBnT/v7MHbL8hSN0Qf7jcI5IXbwrhRS1gzUe7P+CvmKWg3EQb17zYg
         utZQ==
X-Gm-Message-State: APuU4Z/CksDNry5Lq8wj4kENA5C3m5xUhuSnYA450OmPneOv3zFDgrfu
	FkOZ4Y4OVgYwpC1EYGgDGqKXUf3/zEPW81rsCQ0zwyuWoQwI3ampjlwY8y55bsodNpBvq7fiYrL
	PXU0Wk/VVzopRiF8t1qRBuriipxcKwcoXWVukJ4qJjyHQ/bTfkxwwpJHN35w71yxWog0UqOV9aA
	==
X-Gm-Gg: AZFdTZfZgn1rg5T9E52VODeaJWSHqP7tGvg0SOdNq6cDW5Xj/SiYZSQI48+dJRBVQwY
	5tJkcOlvOeleTa95pq1k/wHXSllxznCy5+UJcEY0it8DUUbj13Fx90PrcZLF1p7iWHLdcgz4oGR
	1+oUeF9pISsPzXLEf5pFILOQ/Wcx6H6kiBvP9BGg1CcO3Uj3HAah74CMKpW5/r8ZYM4+sbeTy8Y
	sAqoyv+N1/axsZlpIl2qjra+NvR4Yo83038rhax5dF02Cujj/lUOPqralYh9UBu421+poMoT4XE
	MrUGEfzg4V4m4qmbwRLQIJiD50LCG4jvKGMVf+lwtUbtVX5LPZ02rtYE9mCCFyWTuAqWceZMUyu
	3itQUvVFAaKhKhGvxVpPfaworgIQZV0bs+dcyIHiir/sIxzL3hVHg2UkbOiq/MZnjvwszkOA1ni
	JiOkOayLURcKUs
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520936e0c.16.1795374194606;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr4520912e0c.16.1795374194058;
        Sun, 22 Nov 2026 11:03:14 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm530661575e9.4.2026.11.22.11.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 11:03:13 -0800 (PST)
Message-ID: <c2c2ca30-a1a1-4ac1-af52-0999e7fa8122@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:03:12 +0200
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
Subject: Re: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b033c73 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=1TreyUIoxbpaR6lyi_gA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OwV_eOVEL6OmSAc5qtdFXb90TB9eixRX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfXxRPBG3nnMJsx
 Q6A7auxw0MLNqID4gDEMoWt33h0qPuSvo8rKzbjOdWvH9DUVlaSoaJjWWvW4HP2xPPFml7Wt2ek
 MOUvJsrHQ1daS3AheujAwnDER1XH89w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NSBTYWx0ZWRfX8sfRdsrO8Ccs
 YBNkHBJ+N91dakAsTBDotCD4TjFha0dSk2kPCgF1R5sI9berdMDYcRfLneDhRp200kRRnQIsQME
 MwX74an2GMQ4cji8yzFjlWYraQTywOJShEdeqPQdaLoL0idUw9q7KQxadUr8IIgRQlun5yg2KqW
 x7I+6yKgpHbD3GFHmGuVgPJz6dn/uGqVJ4bf7da83ImJED87nBpItN1Zrqt5FQkHgKFlzrR+z13
 qj9J/CiTsqAxw2oBF2eXF2xXNDVsmAylQQFnS9w/IMZc9Ap9TpFW2ZZ7F6w+vV3mCr0aIJKR1Uv
 dB1Q9+6e30VNt9I/sK9UFCHe2MqUk8bvsq+D4BjBN/riT8C0+sK1zrZJJXWcj82ldhhvaJIvLWW
 5fNhxPyjO1RaiwsLbDCbXuFGOXQoFoTi2Jm6pxfC7OZTBg3zwUhl6AvrBVCOeO271iqWG7XVmLt
 H8+e/0w79DYu7esB6Xg==
X-Proofpoint-GUID: OwV_eOVEL6OmSAc5qtdFXb90TB9eixRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220075

Hi Bryan,

Thanks for the fixes.

For the whole series:

Reviewed-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

On 11/22/2026 4:10 AM, bryan.odonoghue@linaro.org wrote:
> This series lands late-enough in the kernel cycle and applies against the
> camss-next branch staging to linux-media/next.
> 
> Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next
> 
> First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
> CSID doesn't have a corresponding VFE it is entirely useless and violates
> our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
> reason to keep it around.
> 
> Second is a fix for a longstanding error in CAMSS which as stemmed from
> the original development of post ISPIF devices. These devices have a 1:1
> mapping between CSID and VFE so the mapping we have given to user-space
> which declares each CSID as connecting to each VFE is just plain wrong on
> these devices and has always been.
> 
> So the second patch addresses that longstanding issue but, I've been
> holding off on fixing this for a while since I believed it might require
> extensive surgery, but in the end its quite simple to do.
> 
> Finally the third patch is a tidy-up patch which inverts our current logic
> of continuously adding new elements to the src_pad_code switch for new SoCs
> filtering those SoCs down to a default: statement. In fact is is the old
> SoCs which are the exceptional case so, just do the switch for the old and
> the default for the new.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (3):
>       media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
>       media: qcom: camss: Fix CSID to VFE routing for non ISPIF platforms
>       media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +--------
>  drivers/media/platform/qcom/camss/camss.c     | 59 ++++++++++-----------------
>  2 files changed, 23 insertions(+), 56 deletions(-)
> ---
> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
> change-id: 20261122-camss-routing-fixes-b178bdb84f20
> 
> Best regards,
> --  
> ---
> bod

