Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ED63B3BE7
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399827; cv=none; b=bUZ3xgLbiWchWo/e7KBW5g0b+iQ5MiW2KmhmVpdF9QiM2wRr0BnJM2J8Mp4W0Jq699P06OLJYWpekEmKa472mil8ylmHbMptacjW1YJLX6oX4QOXrl+JKmohpP9ZfTbHnnRXg+hBCiaGX0SgmDRWzLjRUqsKoOx7Wv0MC3y+8Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399827; c=relaxed/simple;
	bh=d4FYZkePqUH4yHxIV/fulMtnelopKYAQMOtmGZJZRko=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=RL1BWPqCtiKFO/UYEqY4CbchruUjiFj1rnxYlF+oyF5uQl1BwAMwBzcFDNVA5MOcX14/tFmoY4ArUsnNv9eWO7tGM2LhTwonn/3YA7Eu4sjqQ4OR7p0ZTzc2eK3PD9EAZi5D7GUipMleMQAw8pEP3Wc2Eaq0fswFKxES9D8caww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4vQwoBQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjHaaOP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4vQwoBQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjHaaOP4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8I1TS263013
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SJfy4BkadsmNbU3kKNMOfiut/uzoGgF3YvQj08k9tA=; b=G4vQwoBQJZyvfEGH
	jdbMtN1jt1O3DCx/UzOV6y0m9FPtAVF69v37WbOPfVxrvufsjOm5zx8TblTUoAzn
	ZjHbOypwsdeMPWXaEZYfONYEEWU6xVeWKbNfZet8yZ9nBE44mdYTWjQh+6XEQMHJ
	PXCzfmUGhfjjUrEnzS9dvWSBL9XnlYAQ5QnaW1j3V9NpA+8dRAbjIrCefCYWUzhw
	MpJX7G6Ql2syCpt/2niAes/s/rQXGHXQPYCEjf+B0+8R6cdYxTOTLyVbrat4pHjS
	kpLCWiizQKqVt+72+VCRquG/Eww4azce1I++OZZ5SAzCCON7C38zqRpbosS7S6h1
	THJlig==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2yvg0qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:23:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so24434465ad.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785399822; x=1786004622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7SJfy4BkadsmNbU3kKNMOfiut/uzoGgF3YvQj08k9tA=;
        b=kjHaaOP44R4Vy+qsJzse8qu8YEIQVsSUqNZidapdxPpCKzlZSm7/7XoqPHrhNtXhKn
         WP5dATiToCopDoLleUHKN/E2/sqtWet0Jph7gqiKwy4sqU6gUSy4DfrnGy1H9xBtajid
         6LehbmOjszlBi58a/EX5xy/hjkE66A/DL/aAA8QvgT/8wjHJUtnj8aECh+cm++nm3vx9
         fyUWhPxW6wJ+WqjM+dHw8Cgwe9CvRYFuTa+lWJOWmtrVD1ZX8ypDxqaaFywEuAFrmqr5
         1YiG8qzgd/+AKyfRl88EeipSYPHzYvdjrAmE35Sjs6r4Ggc3mxKUSeTHNW4VHSFYb2X2
         j/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399822; x=1786004622;
        h=content-transfer-encoding:content-type:in-reply-to:cc:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SJfy4BkadsmNbU3kKNMOfiut/uzoGgF3YvQj08k9tA=;
        b=PaKPnaSrDglJ0byAa0DERpELSC8AegRaILTIR0Oku3ndyVeQfmF8TulVTPkKEr5XCs
         5k1RByo2SWWlaaeL716pnRS7K9U/nPBCIWSxUf5/ufRDlB/yE9GdvGodc6V/fsGCU6ZB
         Oim7avaNPK6M2OFn1KXuT4QVmh0Oc6UkIEMF9hU6GFhhEzLxTRi6aPbi6qIIdOg0jZzG
         8MckR79u0PoJDc0BmGCNqDzHmip4tQla75LHnDRKB5oEj2/XNPm7zGhAetaUSgYEzbEm
         6pHsNqrlQWCp4iZm7lKPi0AmR1oUDggKAx57TuluexjlQcC9UnhOtRCJYYmIAlraBfUH
         vH+g==
X-Forwarded-Encrypted: i=1; AHgh+RoVRNQJDjIwt6c1qrNHhKFS6zPZfMEcvuaFjnUPCOkYXlcb55wHdeFmu1yqmsIt2V7YcTKX1DrBxRM2bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/g/qLcHLq1lSVxTp2lUa+ytniCaiV4T+sbFSAvgE+w9ndMBd
	IDJkmxugpzjmp2k7W9uajnfdIyDCWOaz3TrdXx/H1OgkDIRBuXskzqD4iItUt/ElpfE2Tr5/TtF
	mCrJNc8uaKrWyWTAs0yaLWPzsrBjqr3DkuS8sSBGWnvm91s4icAZmnWkGErIlpZwpvw==
X-Gm-Gg: AR+sD12mTL5QGfo0/MAfD5juwyDkbCwaKZ9/abwFjxsFfNFH1W1Bf2f0QcCxQGGgjNY
	rhfRoendODaAgWxANNj9k5JNRJslD5YEc4m8nrMF6x17edB0A7SUH7f7lLxINmBpnZwa0iG/rbl
	6uvm0nnX8MX0Bd6XcuUkBYLWXe4mWQW+aMGsyL3n+YdX24BpB2tgWsJMtCuAiuUqz5JaebT9s6R
	nS9/p0xquC+VjELYvQe9F/Okd89FpqjBBJ/NYDRHbEoaL56Mi1lLwJ/dJdqAiSDxFlvLW6RKx5W
	MtXDnFePP8+eKFIbzfW0fbg330uemFETWJqH1zlU5IrT2TO88kriqFPRxvcwAV8Hr4boApHVFI4
	aaZhToRBMgFSXVDuw5Qm4mVaG6hlWKW9cgx5dcNEUG5gysPBhaMqMCr454PquVYJFYq7g
X-Received: by 2002:a17:903:1aa7:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d035ca538bmr18536815ad.25.1785399821885;
        Thu, 30 Jul 2026 01:23:41 -0700 (PDT)
X-Received: by 2002:a17:903:1aa7:b0:2ca:281:27fd with SMTP id d9443c01a7336-2d035ca538bmr18536515ad.25.1785399821378;
        Thu, 30 Jul 2026 01:23:41 -0700 (PDT)
Received: from [10.249.29.7] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c4090fsm22575785ad.80.2026.07.30.01.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 01:23:40 -0700 (PDT)
Message-ID: <1ee6949a-1b4f-4c10-bc93-59abe88218d6@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:23:35 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org
References: <20260716113254.570-1-jianping.li@oss.qualcomm.com>
 <889c46b2-6c6e-4119-b748-a1d5706c276b@oss.qualcomm.com>
Content-Language: en-US
From: Jianping <jianping.li@oss.qualcomm.com>
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        quic_lxu5@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
In-Reply-To: <889c46b2-6c6e-4119-b748-a1d5706c276b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1OSBTYWx0ZWRfXzX90U3+XUZMm
 hqvId2VN4vuZeCRp7Cg8vre9z7kpJdcDqUQ5GAoVF0kblcq/eOoxeXn4emCEmKMnwCkSKvJGe7e
 7kqP1hwC3asmBJOPP5xuhNywdN+2OizM1r2PuWHfIs3Y+pu1tWqe6591Up/E0XcIjQJAXVWYf2Q
 hctO2wwglQPiNYGCIPBMW3bz3aB3/llpOXYL35T5W6QKPprsbciztspOAk+3fc6HqmbE2R4yY1f
 fPl4WB1/NjYkJt9EjOxEKVKzVWWttxtKZOmgUbHWOZxd9gY6+6JEEdeBowZyaXH5ZkyEt9+pg8k
 PqE+YfacxzMJG778QuEnZ1ayoBw/T0HPIAE2F38pkRlW8qTjYU2BYhlTfwN2G9dt63qdJJoYqfv
 K14NUMuqxyO+lVZUW6IPalo/RzqIxvFf60MB3CCX6paUjc306GhFJpij9F1clUUKwFp3UXIXGV1
 es1UjcSDnssSuUK9wqg==
X-Proofpoint-GUID: teNusqh6Sv_stfLfY-aTkYXnQQxfmS82
X-Authority-Analysis: v=2.4 cv=HPfz0Itv c=1 sm=1 tr=0 ts=6a6b0a0f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-3ynHoheCNO4ieMCxRUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: teNusqh6Sv_stfLfY-aTkYXnQQxfmS82
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1OSBTYWx0ZWRfXwv+c/WoJTayO
 q5BQ2c/5zfwtXObx/Y3YLlwdOcI4ZTcW5XXd4UizT3QHDvEmKVYaVpMyqONsU/zdf6cwHf1EKcK
 lPnjE5jNehvnHM5sSfuZt+86B+TOdIE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300059



在 2026/7/30 12:34, Ekansh Gupta 写道:
> On 16-07-2026 17:02, Jianping Li wrote:
>> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
>> to the same dma_buf fd as an input/output buffer argument. Taking an
>> extra reference for such DMA handle maps leads to duplicate mappings and
>> an unbalanced reference count, since DMA handle maps are released
>> separately when the DSP returns the fd through the fdlist.
>>
>> Fix this by not taking an extra reference for DMA handle arguments
>> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
>> these maps are borrowed references, fastrpc_get_args() re-validates the
>> map via fastrpc_map_lookup() before dereferencing it, so it is not used
>> after being freed. fastrpc_put_args() only releases maps flagged as
>> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
>> exactly once.
>>
>> Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
>> handles are already mapped implicitly during the remote invoke call and
>> must not be mapped again through the explicit MEM_MAP path.
>>
>> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
>> Cc: stable@kernel.org
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>> Patch [v1]: https://lore.kernel.org/all/20260625080832.17477-1-jianping.li@oss.qualcomm.com/
>>
>> Changes in v2:
>> - Rework the commit message to describe the DMA handle reference and
>>    lifetime problem more precisely.
>> - Introduce a new FASTRPC_MAP_DMA_HANDLE uapi flag and a 'flags' field
>>    in struct fastrpc_map to explicitly tag DMA handle maps, instead of
>>    relying only on the nbufs boundary / take_ref.
>> - Plumb an mflags argument through fastrpc_map_create() and
>>    fastrpc_map_attach() so DMA handle maps are tagged at creation time.
>> - Re-validate the borrowed map in fastrpc_get_args() via
>>    fastrpc_map_lookup() before dereferencing it, to avoid a
>>    use-after-free when the map was created with take_ref = false.
>> - In fastrpc_put_args(), only release maps tagged FASTRPC_MAP_DMA_HANDLE
>>    and clear the flag afterwards, so such maps are freed exactly once.
>> - Reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since these
>>    handles are already mapped implicitly during the remote invoke and
>>    must not be mapped again through the explicit MEM_MAP path.
>> ---
>>   drivers/misc/fastrpc.c      | 56 ++++++++++++++++++++++++++-----------
>>   include/uapi/misc/fastrpc.h |  2 ++
>>   2 files changed, 42 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index d86e79134c68..fa8c58a97e35 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -223,6 +223,7 @@ struct fastrpc_map {
>>   	u64 len;
>>   	u64 raddr;
>>   	u32 attr;
>> +	u32 flags;
>>   	struct kref refcount;
>>   };
>>   
>> @@ -833,7 +834,7 @@ static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
>>   }
>>   
>>   static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>> +			      u64 len, u32 attr, struct fastrpc_map **ppmap, int mflags)
>>   {
>>   	struct fastrpc_session_ctx *sess = fl->sctx;
>>   	struct fastrpc_map *map = NULL;
>> @@ -850,6 +851,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   
>>   	map->fl = fl;
>>   	map->fd = fd;
>> +	map->flags = mflags;
>>   	map->buf = dma_buf_get(fd);
>>   	if (IS_ERR(map->buf)) {
>>   		err = PTR_ERR(map->buf);
>> @@ -924,13 +926,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>   	return err;
>>   }
>>   
>> -static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
>> +static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64 len, u32 attr,
>> +			      struct fastrpc_map **ppmap, bool take_ref, int mflags)
>>   {
>> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
>> +	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
>>   		return 0;
>>   
>> -	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
>> +	return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
>>   }
>>   
>>   /*
>> @@ -1000,23 +1002,25 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>>   	int i, err;
>>   
>>   	for (i = 0; i < ctx->nscalars; ++i) {
>> +		bool take_ref = i < ctx->nbufs;
>> +		int mflags = 0;
>>   
>>   		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>>   		    ctx->args[i].length == 0)
>>   			continue;
>>   
>> -		if (i < ctx->nbufs)
>> -			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
>> -		else
>> -			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
>> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
>> +		/* Set the DMA handle mapping flag for DMA handles */
>> +		if (i >= ctx->nbufs)
>> +			mflags = FASTRPC_MAP_DMA_HANDLE;
>> +
>> +		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
>> +					 ctx->args[i].attr, &ctx->maps[i], take_ref, mflags);
>>   		if (err) {
>>   			dev_err(dev, "Error Creating map %d\n", err);
>>   			return -EINVAL;
>>   		}
>> -
>>   	}
>> +
>>   	return 0;
>>   }
>>   
>> @@ -1144,6 +1148,16 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>   		list[i].num = ctx->args[i].length ? 1 : 0;
>>   		list[i].pgidx = i;
>>   		if (ctx->maps[i]) {
>> +			/* It is possible that map is created with
>> +			 * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
>> +			 * is false. Check if map still exists or is
>> +			 * being freed as take_ref is false
>> +			 */
>> +			if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
>> +					       &ctx->maps[i], false)) {
>> +				ctx->maps[i] = NULL;
>> +				return -EINVAL;
>> +			}
> if map is created by R1 call with DMA handle flag, when any inbuf/outbuf
> carries the same fd for R2 call, wouldn't the refcount get increased as
> part of fastrpc_create_maps()? So if the refcount is already increased
> there, why do you need to have a check here?>  			pages[i].addr =
> ctx->maps[i]->dma_addr;
The check is not for the case you described (same fd reused as an in/out 
buffer in a later call). In that case i < nbufs so the map is created 
with take_ref = true and the refcount is indeed held, and the re-lookup 
simply passes.
The check is needed for DMA handle args themselves, which are created 
with take_ref = false. For those maps this context holds only a borrowed 
reference — the owning reference is dropped when the DSP returns the fd 
via fdlist in fastrpc_put_args(), which may run from a concurrent 
invocation. So between fastrpc_create_maps() and fastrpc_get_args() the 
map may already have been freed, and dereferencing ctx->maps[i] would be 
a use-after-free. The re-lookup re-validates that the map is still 
present before we dereference it.
(If you believe there is no competition, I will drop this code.)
>>   			pages[i].size = ctx->maps[i]->size;
>>   		}
>> @@ -1200,8 +1214,13 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>   	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>>   		if (!fdlist[i])
>>   			break;
>> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
>> +		/* Validate the map flags for DMA handles and skip freeing map if invalid */
>> +		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
>> +		    mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
>> +			/* Allow DMA handle maps to free only once */
>> +			mmap->flags = 0;
> flags are getting updated without any locks, this is considering that
> DSP can updated a particular fd on fdlist only once. Can you add this
> information here?>  			fastrpc_map_put(mmap);
Agreed, this relies on the DSP reporting a given fd in the fdlist only 
once, so no concurrent fastrpc_put_args() can update the same map's 
flags. I'll add a comment documenting this assumption in v3.
Will send v3 with the clarified comments.
>> +		}
>>   	}
>>   
>>   	return ret;
>> @@ -1511,7 +1530,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>>   	fl->pd = USER_PD;
>>   
>>   	if (init.filelen && init.filefd) {
>> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
>> +		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true, 0);
>>   		if (err)
>>   			goto err;
>>   	}
>> @@ -2107,9 +2126,14 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>>   
>>   	if (copy_from_user(&req, argp, sizeof(req)))
>>   		return -EFAULT;
>> -
>> +	/*
>> +	 * Prevent mapping backward compatible DMA handles here, as they are
>> +	 * already mapped in the remote call.
>> +	 */
>> +	if (req.flags == FASTRPC_MAP_DMA_HANDLE)
>> +		return -EINVAL;
>>   	/* create SMMU mapping */
>> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
>> +	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
>>   	if (err) {
>>   		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>   		return err;
>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>> index c6e2925f47e6..142ddaeed85f 100644
>> --- a/include/uapi/misc/fastrpc.h
>> +++ b/include/uapi/misc/fastrpc.h
>> @@ -44,6 +44,8 @@ enum fastrpc_map_flags {
>>   	FASTRPC_MAP_FD = 2,
>>   	FASTRPC_MAP_FD_DELAYED,
>>   	FASTRPC_MAP_FD_NOMAP = 16,
>> +	/* Map the DMA handle in the invoke call for backward compatibility */
>> +	FASTRPC_MAP_DMA_HANDLE = 0x20000,
>>   	FASTRPC_MAP_MAX,
>>   };
>>   
> 

