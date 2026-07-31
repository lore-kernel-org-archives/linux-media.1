Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB8349CF0
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468250; cv=none; b=b+cMGyeitCqqcEUiXRINs+F70an0QekEY6/ywK3AtmUBQ3D3SNnmBdk9cabsM0nWB23L0u0iZsPvYNaGisDTRLSVpiBGDQprPcbGms39yUGkkVmDVfbUJoFm02qUdRiW4jkKdkxpqvCXjki3OuAb5+eMfJzbLbinLW841YVkSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468250; c=relaxed/simple;
	bh=y9mznrkWmrON2CjVCloD0voFaczw66onjM1Jbeq95FI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5gB3hfVacsLPs0oed+14V4eW72oN1QZNn53c5NNlB+MXTQ8T+Gtl3LB+m20HXVTzpSrxXGzumOqPar3kXPhz8lx3/+3eLhqqHEiEp7W/1su98r5eZCHflbEqOI+2f5h4zSgVLt6vKF9/8uP/Es4pNR23OGWgEtBqsOUBcDbWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddJMT1Xf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPMFrbSA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddJMT1Xf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPMFrbSA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2eI4d2494380
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qieevGNMVOGiyj6DCQhkfEGLyhz2E5twSdoSU6Cngw=; b=ddJMT1XfoDVvQHkH
	wJdPQIV47QGTStY8/p9iBYrLq4oNOiTZ90sdTewGbvC/sDHQDSFNKjAUbC5LfXAm
	bsNmQa67UD7BHxnYSoIuStxhH6rvKiLc/NsUThKIGN0S6/sBAAhNNh1sp6Gn/fbM
	KTxh90M/D6FA6nhBj3f0xUrRdy8xh2WoePN6SNC8li1D6aaEfP7zRaJG8lcwKatZ
	9qXNetqSvcHgSweJ5oTqlvnPUt4jVtuAd0kpALuuAnL2gj3y/fnF1FF7Ziw/kzZf
	Jg8uMq3uso+Y4rs/FJqOZYbnOV3kzS2iuM2TDazR8PmxYOve3HTOUFd1pSS5Ei2P
	ld/UEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frk4h04dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:24:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so885633a91.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785468247; x=1786073047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qieevGNMVOGiyj6DCQhkfEGLyhz2E5twSdoSU6Cngw=;
        b=fPMFrbSAWYKdbaFavjmtT0qNrbbLvhzMR4xckY7DjUBEBkfGv1iKhfUKMy1VELMTu0
         GJ3E0saJJlEellG/V7dBsRiabjZXlvOjdWWMwHSsFM8ujVmsDvwQ61elmeMWTQCpSZQu
         EKFshzOxG7Aw3eix4J3cfhmnz491Ub8zOT9BoyKWBVdKU91qnx0Sirzb0yvJIpjoREgu
         zzz7dgh3l8vVPvlpDjVsAndqPhRiCJ5e+P5sigh+Md/7mK9TGv1qhPe8bWLcM8bARcol
         ARYhPOGvnJl4nA+Ps4JARvxnR5Fe6tCetCM9Gw7pUVd3TTLtvLHAHr15cWgswWIhMUQ7
         UP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785468247; x=1786073047;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qieevGNMVOGiyj6DCQhkfEGLyhz2E5twSdoSU6Cngw=;
        b=TA9v43ZcF+qhRnDu1aftgyFIAWurIMuUbIW03m12Qgks7/D2BolGxYzD3uFmVVSFGV
         MIl/zXZ/IsOkWKwIHed4+vGRjmlbWfhDBHVsflt64bd0bcchivIDXX69SBdecabLnZOS
         mLBia8H1Z1VGi9+MvevaLec5LRXtZfv8r11BDJlXwgoKp0NA7ax5dOdKxgYvruy0mmWh
         dQURV76CAnbt5gh5NXLUw/l3YKLVfQ/QxO5HLJx7MSMSNQJW75glpF1RNG+OED7tMuIs
         QMTZa1byzT+OEvc4JdNCtAID1Kdl3agCTbOWVtGoVW67RrWGBr66v2k3Mh/bB/S+TDRx
         c9Og==
X-Forwarded-Encrypted: i=1; AHgh+RrIa224hZzwmv9yh16+pYF2Piz9P1Tdz+xVFOX1Ofv7ipNVfHuOL3RDL6jyiFZZgsktLTzxQcuwZS6nkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMPtk3RgCXIaw7xBMcnTldpNx/RXCmgnhRgj5/4jbUVRfrQJK
	7j3EnRKr55XtfnfH/Fu40c1JQrKE5ea22JxdYHvGdJ+j7+IiQ4Vo4iukcwcpJ+BPa9P+tZSExQv
	zbgaR4UAdhXcZrhLXvXzJ9sW7uqg62eXU8ejUTgvn+UHGqTCgHOHCVP0kl/vYPtn2ww==
X-Gm-Gg: AR+sD12azFgmfa/K4Q9H2PPfSqcCUJX45IRpb/B9fM4r9oBOPKmaWhLlNFID0xUUFC+
	VKDFpXCnY0h8TaGvh7fGIkI99+P8rALTxhaRL7FREzrAnc8KlVJHTYgiH5B/CvMMtSJ3beKmkJB
	QxGMcAQbvDG9/UkRDs5gQ+he1dvroXYd20qOg2H7sKYWgMZJ9Sa2cqmt/np2zdoE5fL1OJSiHY5
	xpQiBuhNlZMX3Vw0j9OEnnUgifnCC3O1TiRl/C+5nSKYSpca7IUIyJe7GS/V+jRs9ivzcGA6QEj
	a8aiMbJtODv9hDvhCNquXCj3BnJW9nVpoLCvDqbINPDa1qQoTNL0Gl6nryTGM2+WGIhUq0NImw0
	YKMVaLuZgmXBhJQGNzgswvVvajvzI2w==
X-Received: by 2002:a17:90a:dfc7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38fb1148a92mr443382a91.13.1785468247251;
        Thu, 30 Jul 2026 20:24:07 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38fb1148a92mr443354a91.13.1785468246628;
        Thu, 30 Jul 2026 20:24:06 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2b0f82csm23581a91.2.2026.07.30.20.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 20:24:06 -0700 (PDT)
Message-ID: <dfd4793d-18c1-4d0d-a744-efe3b1f622f2@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 08:53:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Jianping <jianping.li@oss.qualcomm.com>, srini@kernel.org
Cc: arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        quic_lxu5@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260716113254.570-1-jianping.li@oss.qualcomm.com>
 <889c46b2-6c6e-4119-b748-a1d5706c276b@oss.qualcomm.com>
 <1ee6949a-1b4f-4c10-bc93-59abe88218d6@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <1ee6949a-1b4f-4c10-bc93-59abe88218d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAxOCBTYWx0ZWRfX/pqPz/lw/X1H
 GPK/H4E73WZbxHeWJMjct/pl6opgog8CSqC62/L3M3n5SUouu4S8zb8p+5/ao2IF/v3/+UewqYi
 iOytCSL1qrBgCBrbtT4yaRa1I3VHvPt2FI7v06sRhX0JQ738Rd9UJgep5ZawJNdBaREVzIi5EOi
 coHJIXQ0QuBr6MDd/ZZxZDw/yjJ9+T/QgKbmsw3CsCY62N7VF4FCrGFcKWYEtcHJbt/1ytuAvzt
 tKUty5I8ULpinxYw10UGFAUsSC0w84RBFThEf/01p2xVaSlmbeyvMt6uo8ugMPwZLh47JKGMU28
 8JmAPNj4TDKCwkRydhqIu2H9/LdvO9Cik/JrrXQJSYA0W6lbf9Vj/xdyYJ4wKkkfstjHpHyuQuF
 JDybjuzFyp6RE041HqAmw7EUnIGJy1Ccih+81yOKvmWgccYkZt7zv6mSjMtQwBGo3Jqvo5jdK+e
 3E5QITIvNQvidJXE+Nw==
X-Proofpoint-GUID: mXbtbNtDyNKKabZA0B2wsTuFupoc6HT7
X-Authority-Analysis: v=2.4 cv=ZvLd7d7G c=1 sm=1 tr=0 ts=6a6c1558 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ysM9QyvtlLqIj_i5kYEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAxOCBTYWx0ZWRfX3NmOIBB+FRYT
 o0PTupXkND+tPCFH3c5iIkrpu57FhKh3e1+6j7VrHlY1wjTXnBojszvI0SlPFJYQdmvzSVWWzeW
 nrIvMXWHYPDSgw2CIEWGIVyRgN65R9s=
X-Proofpoint-ORIG-GUID: mXbtbNtDyNKKabZA0B2wsTuFupoc6HT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310018

On 30-07-2026 13:53, Jianping wrote:
> 
> 
> 在 2026/7/30 12:34, Ekansh Gupta 写道:
>> On 16-07-2026 17:02, Jianping Li wrote:
>>> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
>>> to the same dma_buf fd as an input/output buffer argument. Taking an
>>> extra reference for such DMA handle maps leads to duplicate mappings and
>>> an unbalanced reference count, since DMA handle maps are released
>>> separately when the DSP returns the fd through the fdlist.
>>>
>>> Fix this by not taking an extra reference for DMA handle arguments
>>> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
>>> these maps are borrowed references, fastrpc_get_args() re-validates the
>>> map via fastrpc_map_lookup() before dereferencing it, so it is not used
>>> after being freed. fastrpc_put_args() only releases maps flagged as
>>> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
>>> exactly once.
>>>
>>> Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
>>> handles are already mapped implicitly during the remote invoke call and
>>> must not be mapped again through the explicit MEM_MAP path.
>>>
>>> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>>> ---
>>> Patch [v1]: https://lore.kernel.org/all/20260625080832.17477-1-
>>> jianping.li@oss.qualcomm.com/
>>>
>>> Changes in v2:
>>> - Rework the commit message to describe the DMA handle reference and
>>>    lifetime problem more precisely.
>>> - Introduce a new FASTRPC_MAP_DMA_HANDLE uapi flag and a 'flags' field
>>>    in struct fastrpc_map to explicitly tag DMA handle maps, instead of
>>>    relying only on the nbufs boundary / take_ref.
>>> - Plumb an mflags argument through fastrpc_map_create() and
>>>    fastrpc_map_attach() so DMA handle maps are tagged at creation time.
>>> - Re-validate the borrowed map in fastrpc_get_args() via
>>>    fastrpc_map_lookup() before dereferencing it, to avoid a
>>>    use-after-free when the map was created with take_ref = false.
>>> - In fastrpc_put_args(), only release maps tagged FASTRPC_MAP_DMA_HANDLE
>>>    and clear the flag afterwards, so such maps are freed exactly once.
>>> - Reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since these
>>>    handles are already mapped implicitly during the remote invoke and
>>>    must not be mapped again through the explicit MEM_MAP path.
>>> ---
>>>   drivers/misc/fastrpc.c      | 56 ++++++++++++++++++++++++++-----------
>>>   include/uapi/misc/fastrpc.h |  2 ++
>>>   2 files changed, 42 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>>> index d86e79134c68..fa8c58a97e35 100644
>>> --- a/drivers/misc/fastrpc.c
>>> +++ b/drivers/misc/fastrpc.c
>>> @@ -223,6 +223,7 @@ struct fastrpc_map {
>>>       u64 len;
>>>       u64 raddr;
>>>       u32 attr;
>>> +    u32 flags;
>>>       struct kref refcount;
>>>   };
>>>   @@ -833,7 +834,7 @@ static dma_addr_t
>>> fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
>>>   }
>>>     static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>>> -                  u64 len, u32 attr, struct fastrpc_map **ppmap)
>>> +                  u64 len, u32 attr, struct fastrpc_map **ppmap, int
>>> mflags)
>>>   {
>>>       struct fastrpc_session_ctx *sess = fl->sctx;
>>>       struct fastrpc_map *map = NULL;
>>> @@ -850,6 +851,7 @@ static int fastrpc_map_attach(struct fastrpc_user
>>> *fl, int fd,
>>>         map->fl = fl;
>>>       map->fd = fd;
>>> +    map->flags = mflags;
>>>       map->buf = dma_buf_get(fd);
>>>       if (IS_ERR(map->buf)) {
>>>           err = PTR_ERR(map->buf);
>>> @@ -924,13 +926,13 @@ static int fastrpc_map_attach(struct
>>> fastrpc_user *fl, int fd,
>>>       return err;
>>>   }
>>>   -static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>>> -                  u64 len, u32 attr, struct fastrpc_map **ppmap)
>>> +static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64
>>> len, u32 attr,
>>> +                  struct fastrpc_map **ppmap, bool take_ref, int
>>> mflags)
>>>   {
>>> -    if (!fastrpc_map_lookup(fl, fd, ppmap, true))
>>> +    if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
>>>           return 0;
>>>   -    return fastrpc_map_attach(fl, fd, len, attr, ppmap);
>>> +    return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
>>>   }
>>>     /*
>>> @@ -1000,23 +1002,25 @@ static int fastrpc_create_maps(struct
>>> fastrpc_invoke_ctx *ctx)
>>>       int i, err;
>>>         for (i = 0; i < ctx->nscalars; ++i) {
>>> +        bool take_ref = i < ctx->nbufs;
>>> +        int mflags = 0;
>>>             if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>>>               ctx->args[i].length == 0)
>>>               continue;
>>>   -        if (i < ctx->nbufs)
>>> -            err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
>>> -                 ctx->args[i].length, ctx->args[i].attr, &ctx-
>>> >maps[i]);
>>> -        else
>>> -            err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
>>> -                 ctx->args[i].length, ctx->args[i].attr, &ctx-
>>> >maps[i]);
>>> +        /* Set the DMA handle mapping flag for DMA handles */
>>> +        if (i >= ctx->nbufs)
>>> +            mflags = FASTRPC_MAP_DMA_HANDLE;
>>> +
>>> +        err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx-
>>> >args[i].length,
>>> +                     ctx->args[i].attr, &ctx->maps[i], take_ref,
>>> mflags);
>>>           if (err) {
>>>               dev_err(dev, "Error Creating map %d\n", err);
>>>               return -EINVAL;
>>>           }
>>> -
>>>       }
>>> +
>>>       return 0;
>>>   }
>>>   @@ -1144,6 +1148,16 @@ static int fastrpc_get_args(u32 kernel,
>>> struct fastrpc_invoke_ctx *ctx)
>>>           list[i].num = ctx->args[i].length ? 1 : 0;
>>>           list[i].pgidx = i;
>>>           if (ctx->maps[i]) {
>>> +            /* It is possible that map is created with
>>> +             * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
>>> +             * is false. Check if map still exists or is
>>> +             * being freed as take_ref is false
>>> +             */
>>> +            if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
>>> +                           &ctx->maps[i], false)) {
>>> +                ctx->maps[i] = NULL;
>>> +                return -EINVAL;
>>> +            }
>> if map is created by R1 call with DMA handle flag, when any inbuf/outbuf
>> carries the same fd for R2 call, wouldn't the refcount get increased as
>> part of fastrpc_create_maps()? So if the refcount is already increased
>> there, why do you need to have a check here?>             
>> pages[i].addr =
>> ctx->maps[i]->dma_addr;
> The check is not for the case you described (same fd reused as an in/out
> buffer in a later call). In that case i < nbufs so the map is created
> with take_ref = true and the refcount is indeed held, and the re-lookup
> simply passes.
> The check is needed for DMA handle args themselves, which are created
> with take_ref = false. For those maps this context holds only a borrowed
> reference — the owning reference is dropped when the DSP returns the fd
> via fdlist in fastrpc_put_args(), which may run from a concurrent
> invocation. So between fastrpc_create_maps() and fastrpc_get_args() the
> map may already have been freed, and dereferencing ctx->maps[i] would be
> a use-after-free. The re-lookup re-validates that the map is still
> present before we dereference it.
> (If you believe there is no competition, I will drop this code.)
Okay, I see this is only for DMA handles. Thanks for the
explaination.>>>               pages[i].size = ctx->maps[i]->size;
>>>           }
>>> @@ -1200,8 +1214,13 @@ static int fastrpc_put_args(struct
>>> fastrpc_invoke_ctx *ctx,
>>>       for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>>>           if (!fdlist[i])
>>>               break;
>>> -        if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
>>> +        /* Validate the map flags for DMA handles and skip freeing
>>> map if invalid */
>>> +        if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
>>> +            mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
>>> +            /* Allow DMA handle maps to free only once */
>>> +            mmap->flags = 0;
>> flags are getting updated without any locks, this is considering that
>> DSP can updated a particular fd on fdlist only once. Can you add this
>> information here?>              fastrpc_map_put(mmap);
> Agreed, this relies on the DSP reporting a given fd in the fdlist only
> once, so no concurrent fastrpc_put_args() can update the same map's
> flags. I'll add a comment documenting this assumption in v3.
> Will send v3 with the clarified comments.
Thanks!

//ekansh>>> +        }
>>>       }
>>>         return ret;
>>> @@ -1511,7 +1530,7 @@ static int fastrpc_init_create_process(struct
>>> fastrpc_user *fl,
>>>       fl->pd = USER_PD;
>>>         if (init.filelen && init.filefd) {
>>> -        err = fastrpc_map_create(fl, init.filefd, init.filelen, 0,
>>> &map);
>>> +        err = fastrpc_map_create(fl, init.filefd, init.filelen, 0,
>>> &map, true, 0);
>>>           if (err)
>>>               goto err;
>>>       }
>>> @@ -2107,9 +2126,14 @@ static int fastrpc_req_mem_map(struct
>>> fastrpc_user *fl, char __user *argp)
>>>         if (copy_from_user(&req, argp, sizeof(req)))
>>>           return -EFAULT;
>>> -
>>> +    /*
>>> +     * Prevent mapping backward compatible DMA handles here, as they
>>> are
>>> +     * already mapped in the remote call.
>>> +     */
>>> +    if (req.flags == FASTRPC_MAP_DMA_HANDLE)
>>> +        return -EINVAL;
>>>       /* create SMMU mapping */
>>> -    err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
>>> +    err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
>>>       if (err) {
>>>           dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>>>           return err;
>>> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
>>> index c6e2925f47e6..142ddaeed85f 100644
>>> --- a/include/uapi/misc/fastrpc.h
>>> +++ b/include/uapi/misc/fastrpc.h
>>> @@ -44,6 +44,8 @@ enum fastrpc_map_flags {
>>>       FASTRPC_MAP_FD = 2,
>>>       FASTRPC_MAP_FD_DELAYED,
>>>       FASTRPC_MAP_FD_NOMAP = 16,
>>> +    /* Map the DMA handle in the invoke call for backward
>>> compatibility */
>>> +    FASTRPC_MAP_DMA_HANDLE = 0x20000,
>>>       FASTRPC_MAP_MAX,
>>>   };
>>>   
>>
> 

