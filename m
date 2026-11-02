Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616745;
	b=J2nlTi4ToUgGJ1UfD9zz5V8kmwdjYZDv4mCYHJAl3rS53PkI6di57IVgZsHL+ghgrA6l
	 o9/yXEPXTjtf7v2GPbG7XBjz7HEHHehkX/LvTpwQ+FU6HjQH/UP52eefP6ZuC27Ei9r++
	 fgrJRSBXdhdfKByYvxolbSA4FU4QoGNyrR1qMfWyRpBs+71zaZHTUygr28lkkxjDJ5l3E
	 OG9eOvJzzui1+9g2TiLPmusatKo8H+a0vuqwepaPtYWAFHB/TpTz4XHwXuSA+EKgBH4PC
	 vYrBUyZgSBpYvtNBsnHoVWeO4B0cPIqHu9+NPN4WGH8zeudI5VxvCkuo8bpEB8qHGqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
	b=FBzD+Fnpyz1b7ImdovaupkzpmtOU/o6WD2XZB7GBxoB2LJYLmKpTfXXlHzhMX7WDogzb
	 XJ6JFkXME9HgGO+9VAQzrXlMngv/ZY1MwL6KUnhWcYPaTP3pMJZ8d7SsNIZH58hG8xcSQ
	 wAP3uIN+DRda0PtaIjpqc8+0wxF8LG/kSxJCf/7l9T2V6FRKsKhC5JS+gL09/XHf6haHy
	 Hiu4l+0Ndd3oWUOuCPgKG3KTwRK831EiXkjUSDl1PWQxiJYtobAaF/bVKZwlcPCKNJkBc
	 RzorPtjuPGICMBMd74ySMZ6NpADvMpPJgnkI/5epivDMqkghZ89cThYmeurAOId5ixg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdAlc8IC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQlGD44u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BACE606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BACE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdAlc8IC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQlGD44u
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMtC2880852
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=; b=fdAlc8ICM5cJKU24
	MEyeQiZ+Ko0T6Euviv1nufX/eAZJCEpNNXX6/iPFBHQp2YeaBdyo0wDL9nxcdqEb
	KiAPVbKSxlXjOTIYMqA7M8ipYH6KsN+mAFINrBJ5DnUJYM3fJNgBd1iIaY1AsIvh
	w8X3mSVK0wI93WCwx2SSIBV5TyFioLSzce6Mm630ql6KoplC0ugiZSHPOVe0LL/e
	gFuEss3KDTEMziSmQELQ8ngrTDPlpjGz38N8FDCCSgepsjdGmqlUGP62KW2DxKVh
	5KJLw2DbOwc8P5JU4iqpKCfkhIB67ttFbvE/XQr2ijYTF3KINVmn/ogcIarmmFpg
	aLcq4g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgf0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:52:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so3998098a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616744; x=1794221544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
        b=kQlGD44uZmeJQcp+eNg5t3k6wqC4gOjuSVp5gY3CenSneoS/bWuSPTdbQoIL12kCtQ
         yrIYvjCbjkO6o4m9eNyAIuM40rfL8gyNV0MHfuv7Cik0mqaIMFAn19u46gIaAPT6Bqnl
         zhGUXy7g2u+r0WPbhuYi90hRs3L916bA+XqAxQLus82EHpu2G+CHnUHT2Abmmglvbwqu
         ThKK0vfRdXeiOD8WGc2pu8ooMKzSYHCJUHQxNWp6bzsndB0U6hIvqNJclbX3KSphcSMa
         TbwPoBAhiRadZ0mc80NYWfWZC9IcqbcITQHcYEeWSK4iVOvzB5zyquBcBGssIUVTChP9
         meDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616744; x=1794221544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xppyrRxkA2Uo3mrTIkoi7ocXriSCH5ZyUXb5WmyTlKU=;
        b=J2UuYuaeqO0mkUVFAb4hso+5S4kIvbCAInA/BMlZaKeFY+7epINxUjVWoYvzoxaIcu
         m93rLJjDZFkA4OOtuI9NTyKv4OfnQfR3bRpCe7+TQmBc/5H/7zcCACuRNsbpsSwASpyu
         70Dwoyj83/t7XhRM6jcrH9PjVKXj4zeUZL6ZKmU4CuZkeESF55KJo0EXv1ONrviaEQ0h
         SPlnZsa/EzVZ+DBwTKPjGWenSr4d64o59VYa3UJOaf13+Iby/CUn60LX/sElMP8TiZb0
         P8Iwo0fYYxJ9g2x4+sIMTJ295E4OQq2Nv2ZBeK5/Mc13yy0b06NnWdQdtekaNKvwU+xL
         wK3g==
X-Forwarded-Encrypted: i=1; AKwUvBy774RJ+VZFHT7G3ptT7AcyZNwrjyQOQEbKAeIkTiyIqNlHsXmu7+LzKqjaZK3Fp/8I4+lUy6jNSjsWVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8DeztJO9qdU9wzlQyqI84Y3UFMT33Gk2MGt0o1gFz7at2Sj9ql
	yMWKAOIRt+ux9MePoSydQbAikyPO1jCWxKGqTz5u+rflEbk60oHGUKUSA8VhFm2iJAKvkz8EzFr
	SuMn9djYGh5ZMgg1WnG16od9jHyv2X9CpjTs006VbFPJA0xxgnnjZ6W/N+lCzGNJe9w==
X-Gm-Gg: AYBFou2+iuLdmj/iSajuBPDe7qhqCiAt94xsIcQum2AP4x5naVXe5qktz6QfqpeL4gm
	DJqvjy+pJ3YL8/aw5h8cYzaKFzaLfeZ/HSh68tEvhjgg2ELXWbmnO3ANVnYP6UEpBolGhwW5xbS
	hRkV1CO17kXV6AKTRfbnkPLzim2Sm8DEYO/NkyBKTGyfUq1b9ywovcUW0mYV5aO1o2cWQr8nOJe
	9fH96eRJqpvqP/7Y8XgCW/zvBRK7SELKDsOiCT6WbbouJaoR2Ugxl+SKmDT+nzaMKKNshm2KUwH
	VDCHALPb6ML+JQ0kD+du+gbviiuAtdP3VIp9fuQsxlj6hGJsF8lgY78sH/nL4tYJMdWePrk9D+x
	FfvpO3dR129Q8dOm9X5WKG+wABaFSFHkv7+N/2RwyMVahDisyFT6Ktbc9cs4wQcNYXnn2UedDKk
	tkZQ==
X-Received: by 2002:a17:90b:5623:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ae89866277mr8172376a91.67.1793616743919;
        Mon, 02 Nov 2026 02:52:23 -0800 (PST)
X-Received: by 2002:a17:90b:5623:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ae89866277mr8172345a91.67.1793616743488;
        Mon, 02 Nov 2026 02:52:23 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc8942e0sm4951335a91.7.2026.11.02.02.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:52:22 -0800 (PST)
Message-ID: <c8375e63-e358-469f-9e9e-8a174137f914@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:22:11 +0530
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
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <a97fb0b0-e4e1-4b25-a5ac-60777941c574@kernel.org>
 <26ca5c66-a2ff-4aaf-9c9d-724ac66480eb@oss.qualcomm.com>
 <da2b5192-a081-4469-92f4-2ecfcf502e4a@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <da2b5192-a081-4469-92f4-2ecfcf502e4a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae86b68 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oPeKDEZYKiJIZNr3YAsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Ma_4tfHyCsQyHYJM_bn4aWTVM4G6t46z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX6ItqhkmJSLPQ
 ka3Rel/LctZT69TPWW95Rr+aOAqdNUi8i/ginGTjS8wg8/ESkAVq1mt4idHKuiz/WAfO/46NjzE
 NOdsrpRa5kIRP0Na5kNoVyRMqp9W5oE=
X-Proofpoint-ORIG-GUID: Ma_4tfHyCsQyHYJM_bn4aWTVM4G6t46z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MyBTYWx0ZWRfX0tAjGA3hPiZL
 R+/GtnpLP2H4+eUwRrvZEpG0M+QiDcMm0EVxERNHH8qCCCrOOWbLmUAQPAQhX3VGpoPo/CZR4z4
 VfjRNiD7VdWt/YgwGX9OFo0oioTQk816Vt1N6MvIIztryFQ/3P8r2okBMMzcZCnbZfiDGDaVl49
 ih5cpMpCDlQW9uGzQUL63DpUir0ej1J8GBhZ7PHNoKxC/moPhasXOsz3NhaJIsTMcBquKQ63H8A
 kXiflZ7FLnRRLM+hrxf2iC2+D/6tpESWkfSpwIr/On1mu8gykzIk3yj6vPn/gNRdgvb3yJX9QS1
 0DJt8gom5e17WmEt6RgIhVMZJ/oypUWY1i/BbWP534XHBOMgmrsIqH/5LVUn6Dyai3QoHwL9/Bt
 JnK9xjh5Xr6j/g9u4v2KgcVi3r6djuE9ejZDvnCkHR/JDzI8J48mTTHEpj6HC70axTOEvn0hedS
 xdgzMvZ+jze2Gd8AJiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020043

On 02-11-2026 15:42, Krzysztof Kozlowski wrote:
> On 02/11/2026 11:08, Ekansh Gupta wrote:
>> On 02-11-2026 14:23, Krzysztof Kozlowski wrote:
>>> On 01/11/2026 23:21, Ekansh Gupta wrote:
>>>>  drivers/accel/qda/qda_soc.c            |   66 ++
>>>>  drivers/accel/qda/qda_soc.h            |   61 ++
>>>>  drivers/misc/Kconfig                   |    1 +
>>>>  include/uapi/drm/qda_accel.h           |  282 +++++++
>>>>  33 files changed, 5877 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
>>>> change-id: 20261102-v4-e8feb321263f
>>>
>>> What is happening here? How are we supposed to work with this?
>>>
>>> v1: 20260223-qda-firstpost-4ab05249e2cc
>>> v2: 20260519-qda-series-78c2bf0ed78b
>>> v2 again: 20260817-qda-v2-78e2d1f10529
>>>
>>> And now completely different one?
>>>
>>> This makes the change id completely unusable. b4 diff obviously does not
>>> work. Any tracking of this does not work.
>>>
>>> NAK, really, I already complained internally months ago about such
>>> practice, so apparently not enough.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Sorry about this. I lost the original b4 branch and re-enrolled the
> 
> You lost original branch four times. It's not a coincidence, it's not
> random data loss because then after first loss you would solve the
> problem. It's a broken workflow.
> 
> 
> Best regards,
> Krzysztof

You are right, and I'm not going to call it data loss again. I started
each posting from a new tree and re-enrolled the series every time,
which is what produced a new change-id for every revision. I've changed
how I work so this cannot happen again:
- one long-lived tree and one b4 branch for this series, used for all
future revisions;
- before every b4 send, a check that the change-id is still
20260817-qda-v2-78e2d1f10529.

v5 will continue from that change-id, with the v3 and v4 postings
recorded in its history.
