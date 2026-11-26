Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706665;
	b=0afFdzUQ58tSsDsCjwLme+ikvOR3cF3B7uv825fGQ1orFNXo4pBDZJRFtRq0tHWF/y37
	 Uk9CtMghae8OC+OIJ42eX+iTWkbqvpSi9DbP37ecWOhZzkFyXc9SvvCwHJ4TpTtPIIt/w
	 lNEKtsrtkpBHmmNyr5yHrA1BQcBt2DyrQeKx5Te+rwsRmkeANQMEqem/v4DAq5u8OdK20
	 HYKLMeiFehC0ec+9nB9DW05Wwjp6Ad673JjJYggSS5uVVZAimUThcEyKs9u7437Q6hhir
	 FG4OWJ8RlkZN/64cRffjbvyrMomg/SWgsulisv8n8vk9UKdNA7UYZvuueyMyDhEU6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
	b=yytxj8AtKJqw7QHFoxyDAaS8xpSYBbFjeTcIPd74uhgli1GpGDQZVem4KAeGKIenzwyx
	 7I4oB9cgD8g3EyZje2D9VoyLKMUYC8wDsM1/3+BgtG4n2IEQTARR6Bv87N2pg4qdfF/jv
	 Gdr+buknV5hsTuVr9gNINoPGtk7J3G3tfQdMgyy+GKiLpekcButsd9oI96fyxKBjJvhNs
	 NhuiDkNUveiuJE9bQTFBVFYBJCN9YGD5HNqMdFXp8/hQMEttolTwQGZQvkQ4rEUICVxVo
	 z3PfYh69Dj6huwKuxjsZ1rTm3UFJGF+iwRDBjyiKoHsFxttcGF4bo6iIt80WofY/vQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE83606A33A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE83606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMZn3wmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECnW0BvP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUsYb088352
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=; b=HMZn3wmA0wZXV+co
	kEEjut5SBIKnG2l8a3tc0xXzgztLSWul/gruZ4XlZRK9pF03iIRt5qCK7iXnp3mp
	gHm6XD/2vGq035joUC5QBAxbk3OgBsUB15/pZ838ic+KFyATqel+3QbmsAiXy2K2
	i+jersnRlrp8NLjGlNIl7RE87mNML1FUUPWu5qU6YwonLKxE0riJTRFM8G2rcMST
	u4axiocEu6OxJujgj1+i59w4egJPevhilAgCGF9KzN+nvu9txF1xvzo9HKlV/Fra
	cwDpPa8qceF185j2aXZQAtFqbh670YVVb5ChPQGGhzMRddpqHjBFS4PKj9ccWeWv
	19r/Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81cpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:24:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495f7e03b9so72698785a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706662; x=1796311462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=ECnW0BvPj2WJs8CFhKhE8CLSVmm+PMeOpBNHgOLbSLvhO6Y2Pk5ycmEXxAitFOtGgI
         2QASRdQKskkfQzPEQqTRy4qaBYs4m2iEofsMy1BzY7z1LjPgflkG5ijgkNwyJvSPE2mq
         +g9VJevZzDWSsWyXA/7iuufzhVhIISqS+VTEKzk55IbIYwddwdQeeDqgYOMYZkyceAzB
         gIw2Ewt+LIhfzhrOgLjLdpSLhkrixvGk9wMAwxRHqwCOJlAGQolyCNaGULaFYmmjalZY
         mS6Mbjqx1gRyZE2msmiugVcTNxIXrutQOZJqfmj1hjSwJzSANikCl1A3jzzINnq67VOR
         Iz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706662; x=1796311462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddeSWRJiwf5WvSlmpCixetWSsoiQ/GzJgm/q8yfJVbk=;
        b=Zq27uPd/0/kSa3DeV4sHNG1o4YjX8ozyjEX0G7XgFkuvuAjDad6xKxCtKzkZ0YO5Om
         e8MXj7XN8kk9YuKw7WJjqyG+0aP418wZur9zHxefKsSQ5lh/fBbKv5wrw2HpjxrUpjl1
         aRdbN6fIunHvwmHW9r8hjCG5anMUpiJnXuGa+FSxLg+dQX2sC+wKm9qYgQWby9A6GqFy
         DwUFnXQWmY35rOwRW633vTsk28uXpltRhozDktX5RrMugHUq7vfCmcIn7yx+AgREyN3T
         /4WHS5tlzs7v/NOpA2tlDwiC9UPibzL8Nbzy5F/6gd+jLcVvuBLZbC3Hw82JLwuQprRr
         VDWg==
X-Forwarded-Encrypted: i=1; AL+hErGWKPA4GJNIwIs9RI2auMVNgO/dWzg2zWQ61G4711yBJVEbLou41PLx0KuxwFJ2/L8jXon7rWodAL+DNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OJvs2ucNYl58wKgw6UyYXcHGQKHylMsxCti7YwYNaqPnwGNXD
	XOioNfj6WjpqoV9MQVtAaH79OQCQQMzsTe19G1/eseaf0LUd5mdF9SrD6/06fB6NViwugi4Wa9d
	dcpMvoD/sKwtJm5zJwTbfxD+MEguH9jxB1HFLpxoksPZg6gdk8FL1swPJC5D8lBMGNA==
X-Gm-Gg: AZFdTZfIQj3g3RUoJNbl4f4VSWtAl6M59+IZwapWxNRk+kS8y9GU4nWwBqslHrNo4vf
	ji23jUdwm7GrCOyk2a2G0Af5xJ5Mb9OjmUGFxHK4h22LkCZUVDTVhI7mya+IjmptVfZ8/lxxbkC
	SqEhpA0x+7VU/DzneDZMZfG/xARnxF4cYafJIwygEJKMYrGWfWeey4sa2yTES66hgRU/18oB7qN
	BJcfXcQY/yaIuFa7eREoyfPpBAgWw0UVmaU2VMSJmV0QQtzyp0FemCLXVHJTj1ghCbvdHxM9F29
	XB/R/TKExpJ0qlOAli1gNTKY9bKr4nZeuDdozG8Dnk1frT+DccxaQWqzVaiki2B8ee4cHoS517z
	143g2MXOSRMKjSJIr8uj0q94GdE5HJcBJAQUBKSkZYpsu2T3SGLc842XLU2WoeAdDY1f/yI8=
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540534285a.1.1795706661793;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
X-Received: by 2002:a05:620a:6f82:10b0:93f:1eb0:88bc with SMTP id af79cd13be357-949ba7fc843mr3540530785a.1.1795706661313;
        Thu, 26 Nov 2026 07:24:21 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6872asm744107866b.13.2026.11.26.07.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:24:20 -0800 (PST)
Message-ID: <9bc0e617-6840-4be8-93c9-3a4429bfa3a2@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:24:18 +0100
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
Subject: Re: [PATCH 1/2] media: iris: check the packet size after reading from
 shared memory
To: Hungyu Lin <dennylin0707@gmail.com>, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117204946.21359-1-dennylin0707@gmail.com>
 <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117204946.21359-2-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kb4u9hlsVAnUDtNJxyWiyDibuEIqYI6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfXzpiZ8Me7KxID
 MtMJqZScienZgSBMb09ArdxMac6geDDKQVLKad9FEg9pfM3lpQwCeN543irzzbj8z7q108nfEQQ
 9J8iZmYEQYm90QLGNVMVN/Betzu7+4g=
X-Proofpoint-GUID: Kb4u9hlsVAnUDtNJxyWiyDibuEIqYI6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX+spBFXM+0P+a
 S/hRkS41WijBzhtyiHmQkTyJAYaBTruFexxp0b7s4RlqWgnfHm6zuRuSDkSTlQ374MUAqi+BsdQ
 pc0nXZ19XY3MXXaKktCnrXl1LYu4MoRANiY5CrqUJQZdZFyDWBnfDz7ho93QvmrCHoSLRzseoyd
 dUTN5ZSr6C9Lc3SvaEHgMAeLeyKtYwEWFqzbzuzjqXI66c+AMQrqxXtyeAIa8etwSPGf8cEwh3b
 pWPELXYhieYMpdIalWrxlsatQfALZQpRLxq5ywXGlaGOZaxI/3LsUjqcMXm/OsbJXRJAB3ldLX7
 E/Pqt1FuRRZyMbtQI7oD1E5sRBsoqpRoMQR1ltWzN5q9pWZF1iU+TNvMwsWDyV0VfKzIY1ddUCi
 e2mNudy3hm+p1G+4Lcm0MUrnadq3Ba7H3SuHvdiycrJFWXqkv/P3yqBruZmWKSp2NHI3jURgnrS
 y5HuMEzZvjotO+hAurg==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b084f27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=s5JhuylEIwHktN9E_WEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/17/26 9:49 PM, Hungyu Lin wrote:
> iris_hfi_queue_read() takes the size of a packet from the first word of
> the packet in the shared queue and then copies that many bytes, including
> that word, out of the queue. The firmware can change the word in between,
> so the size field of the copy can be larger than what was copied. The
> gen1 response handlers use that field as the length of the packet, for
> example to walk the buffer requirements in
> iris_hfi_gen1_session_property_info().
> 
> venus got the same check in commit 49befc830daa ("media: venus: Add a
> check for packet size after reading from shared memory"). Compare the
> size field of the copy with the size that was used for the copy and fail
> the read if they differ.
> 
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> index bf6db23b53e2..5d3315f71623 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
> @@ -95,6 +95,8 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
>  			       qinfo->kernel_vaddr, residue);
>  			new_read_idx = residue;
>  		}
> +		if (*(u32 *)packet != packet_size)
> +			return -EINVAL;

Sashiko has a concern

Konrad
