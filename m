Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A415E30D401
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386064; cv=none; b=kYRLIeVE6rrQ4/ZCPgUlTpzoOv9q/coqXmBEj7HMTO44dzz266zfQDeC3Pn6dCVaZgqbpE94dho7O5iVDR/uTMjKDDiE2/HQrZkaZGs7LlIXX8dWNZmtCeyCwwIye9pyUZ/DUjOpIM+fk511dgGRVypI6YPQkKs6ghfqaiUxDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386064; c=relaxed/simple;
	bh=8l07eIxeAIEL/Qh5VQISoclAjhvJhvZHzf2IzyPlrq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dud8N0QHoWSgdUfDWI7HXOjml6Fb8dLAu9SdMpm51iobkMZakIj0eLtsaBbsrHumQefMaGZgWS7QjtX27amCgXEh5D+ijgUHly5aJdkqY1hlj+ULLlvycOAiCBrCrjJN7m6TYL4CgdAbS413v7dcVNIWPBs1cz81/DXQfNOp25w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dyunrh/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrGzQm5x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dyunrh/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrGzQm5x"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4QYh34165531
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 04:34:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cdk8Yiwk/sa/VglH2VfCbyGGThIsIyvwEWETM1Y7xE=; b=Dyunrh/Y+P34Hnu3
	pvJ94Myn6z4uODclHr02s9/iGWbx0YZtS8ghl5C2tNRandRpGBRMFWTGZ1j9BhbF
	q9qrKhq+ujcOkClOwVxMQpZrhnWjPB3XFc/FazkMIZ1olv+ZjtSd+VKifB3zKIMP
	DaEHqFtFRO7+9QTfpyMOBPwZhKuruorg0QKlZ5ynZSeMRTvJOPBKfc8upP74L2qe
	Mu86Sylht6SPu+kCrRvjUp9RmQJqqnP/ZuxmjxfDkDmGf+dPTa4WFFTb8cC9ekHw
	1lgUNg0vEoP+unpZeiXvHP0TzsypJtYBgAoB5Ktnh7xLgqu0ZsmfZGspMBrYb8Ms
	LIT7Lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqykcr0w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 04:34:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e6d253330so165633a91.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jul 2026 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785386060; x=1785990860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cdk8Yiwk/sa/VglH2VfCbyGGThIsIyvwEWETM1Y7xE=;
        b=KrGzQm5xED+TfKhdVuqSdNnvd75Hap0p3UcQrERfp+V8ecyhnT/fOaiaG/1IwiJnf0
         qC22zRRfXdUgO5WDN+r+u7h7o9bM6YIxt3NEv36l3LwOHXHPk7ZUylaFUgnt+LKpAYsI
         oCwtckSQcVA4Kuqc8WGcdM4EGEuOfLHOQ+3iXjZ7VLkeyeUrKDdTvH56qkPkivbrEVa3
         K8brD4M7FH8SPbdE5dvCzu3AZrkPfO6NQchJ/SC7z93jUhhKvutdlyP0NiinOLy17FYY
         j7a5S0LAPEnkTE3lGIasfK6nJkI1CpKwUSgqT/yQY3o5fGyX2C2aC4b0BGyEao7s/0gZ
         dLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386060; x=1785990860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cdk8Yiwk/sa/VglH2VfCbyGGThIsIyvwEWETM1Y7xE=;
        b=GatRlYh41W1SgOMKVAt26PziYQbi9jVe+diVW3WzV3MIuItjgvvFakA2LBaGztUbIs
         58tPJYDyjB/69E/aT2OPB5AKAhy4v8tvH7cFRhpldRL2dx8E8MBs2ilWGiXgUy+OvPHv
         hMxaQHdrUFA4MvkarppLy7pb6cEMxPfIwDRXpRjT77Gron3KuUOecwjOuiT5qFMTAyBh
         1e/xeD+rzZFBrmkh76vllNS20y0/ixbH4aA93eCkD09Bij8tRi1azT92Cbb0j2KntYYf
         Hs5wGRPc7AwhDoBJ+9rrT5mGgfPZul6Y2Wi/fetrx1aT4yPOkwzv5UpswUY44gnQ1oHl
         VYkg==
X-Forwarded-Encrypted: i=1; AHgh+RohzGOJIEqAlNopafHgVHD6mA/jkfpBVgrmTiDJMBeoGVaAUXtLlYaOKRfnCI+XhdTd6GOJyBtnZV9ENQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtFanyDaR98IvKvn2+2kuiinQnfYToEprzMpF0eAQEDd3+Ptet
	lYmDtvwQbH/zDkM96gBOPKIQanNITeEtp5d2CTjxNY8gAah9YLtUSmf1Gyct63KykF6IXZj5t39
	GgQPXb6jz1dz1V6FOXJmjSITFJ9zIaTImKHxFr/lTHVGjYQTh9MPZawFldc3iG9LM8g==
X-Gm-Gg: AR+sD116r18wjefGFSi8w/jhAa26dpSWnfq632IRPm8bCFUOu3+dWLxLxn2lcz4To0M
	ddZPw2oTtZugEKE29l7mnwHdNLTugeRaHLqJajNgGfiBUhxyf4o38Xq2ScURlhPHiQ/cmFviUwK
	AcwuL0CYQhqD2tb0sNyv9C6EyyCPkzAMigcEqeFiBnP7z4rFLcRS0niQQ2eZDy06Pbf1s72kQJh
	MB6v1MY1zqXu6Ho511MJnAbKHrEW4qw5VajHk0XgM0dv3wtDbFy8d2i8OPgI2nUU5FiC9X4ka20
	r7bVI4f+z6ODib89SP5Rpc96aP+rR7udG9/tc/8VsX8tL3SDrKklh98Ou6RxR/hMK5uVE4TJw1f
	T2vBUfsEuCi18b3V1RNF4RM5NKHTwkA==
X-Received: by 2002:a17:90b:3908:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-38f9d3e383fmr498566a91.8.1785386059821;
        Wed, 29 Jul 2026 21:34:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-38f9d3e383fmr498546a91.8.1785386058885;
        Wed, 29 Jul 2026 21:34:18 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dd42a9sm19203723eec.30.2026.07.29.21.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:34:18 -0700 (PDT)
Message-ID: <889c46b2-6c6e-4119-b748-a1d5706c276b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 10:04:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: avoid duplicate DMA mappings in
 fastrpc_create_maps()
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260716113254.570-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260716113254.570-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=So6gLvO0 c=1 sm=1 tr=0 ts=6a6ad44d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pdARdrlki2Vdj_-LtegA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAyNyBTYWx0ZWRfXzCA0McLYyAYz
 +V6VIw1QEktUyehI6gA5coY1XuduLtB6xwi5MoDaE+vmwHDz6YjOE+a8ESSvg1arVXyzL+51duF
 rKzE1WwD4SWF/If3vvFxS/rm45rmhljb/rOWupWPLDj1En3sKgvn6qP+ImG3M3xaKdGsbm3MEll
 2M+MEsnyRpx/2rcFFDwVj2MrxRLhmyKpQsOuAWxxo9axGxfPizV5wxsGdbgFLX5TOMIHXFZHXQB
 LodUxSkCet0V/TnpVmP6oqv9JsrY/Bat/oyd+FdATpt3+mRGME7NkVuYnG8zelTCJMJ0QA8bS0Y
 HoGMJm0A3XyflYetqZ1k24nooTGhIsHR0M0AXCVwBECY65Uu1+4BiueRsXcnWunYMTB4rBSqFmY
 UnZegsAv00xLCG8xl3FTwSaawlbQSzfCOtqCwdPpz2WiARJ06vjfykdFMXU2xbJeeRqRozZNcts
 djrkt4OKdoocH9ohz+Q==
X-Proofpoint-ORIG-GUID: q4vSFIrepAYftpTTeewAMaDXQo_bw_Mq
X-Proofpoint-GUID: q4vSFIrepAYftpTTeewAMaDXQo_bw_Mq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAyNyBTYWx0ZWRfXzF69ORnAHvjN
 XRaPqyF3ug6p1EbAWb6CtPFHmP2XWzS1+nTyBHIg6msr/NXKgE+O36mPCkr1EZCnuypiOQoQj/w
 ddp0zev+omQE7T2lt7IWsJFn4MKRBlE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300027

On 16-07-2026 17:02, Jianping Li wrote:
> DMA handles passed as invoke arguments (scalars beyond nbufs) may refer
> to the same dma_buf fd as an input/output buffer argument. Taking an
> extra reference for such DMA handle maps leads to duplicate mappings and
> an unbalanced reference count, since DMA handle maps are released
> separately when the DSP returns the fd through the fdlist.
> 
> Fix this by not taking an extra reference for DMA handle arguments
> (take_ref = false) and tagging them with FASTRPC_MAP_DMA_HANDLE. As
> these maps are borrowed references, fastrpc_get_args() re-validates the
> map via fastrpc_map_lookup() before dereferencing it, so it is not used
> after being freed. fastrpc_put_args() only releases maps flagged as
> FASTRPC_MAP_DMA_HANDLE and clears the flag to guarantee the map is freed
> exactly once.
> 
> Also reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since such
> handles are already mapped implicitly during the remote invoke call and
> must not be mapped again through the explicit MEM_MAP path.
> 
> Fixes: 10df039834f84 ("misc: fastrpc: Skip reference for DMA handles")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
> Patch [v1]: https://lore.kernel.org/all/20260625080832.17477-1-jianping.li@oss.qualcomm.com/
> 
> Changes in v2:
> - Rework the commit message to describe the DMA handle reference and
>   lifetime problem more precisely.
> - Introduce a new FASTRPC_MAP_DMA_HANDLE uapi flag and a 'flags' field
>   in struct fastrpc_map to explicitly tag DMA handle maps, instead of
>   relying only on the nbufs boundary / take_ref.
> - Plumb an mflags argument through fastrpc_map_create() and
>   fastrpc_map_attach() so DMA handle maps are tagged at creation time.
> - Re-validate the borrowed map in fastrpc_get_args() via
>   fastrpc_map_lookup() before dereferencing it, to avoid a
>   use-after-free when the map was created with take_ref = false.
> - In fastrpc_put_args(), only release maps tagged FASTRPC_MAP_DMA_HANDLE
>   and clear the flag afterwards, so such maps are freed exactly once.
> - Reject FASTRPC_MAP_DMA_HANDLE in fastrpc_req_mem_map(), since these
>   handles are already mapped implicitly during the remote invoke and
>   must not be mapped again through the explicit MEM_MAP path.
> ---
>  drivers/misc/fastrpc.c      | 56 ++++++++++++++++++++++++++-----------
>  include/uapi/misc/fastrpc.h |  2 ++
>  2 files changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..fa8c58a97e35 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -223,6 +223,7 @@ struct fastrpc_map {
>  	u64 len;
>  	u64 raddr;
>  	u32 attr;
> +	u32 flags;
>  	struct kref refcount;
>  };
>  
> @@ -833,7 +834,7 @@ static dma_addr_t fastrpc_compute_dma_addr(struct fastrpc_user *fl, dma_addr_t s
>  }
>  
>  static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
> +			      u64 len, u32 attr, struct fastrpc_map **ppmap, int mflags)
>  {
>  	struct fastrpc_session_ctx *sess = fl->sctx;
>  	struct fastrpc_map *map = NULL;
> @@ -850,6 +851,7 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  
>  	map->fl = fl;
>  	map->fd = fd;
> +	map->flags = mflags;
>  	map->buf = dma_buf_get(fd);
>  	if (IS_ERR(map->buf)) {
>  		err = PTR_ERR(map->buf);
> @@ -924,13 +926,13 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  	return err;
>  }
>  
> -static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
> -			      u64 len, u32 attr, struct fastrpc_map **ppmap)
> +static int fastrpc_map_create(struct fastrpc_user *fl, int fd, u64 len, u32 attr,
> +			      struct fastrpc_map **ppmap, bool take_ref, int mflags)
>  {
> -	if (!fastrpc_map_lookup(fl, fd, ppmap, true))
> +	if (!fastrpc_map_lookup(fl, fd, ppmap, take_ref))
>  		return 0;
>  
> -	return fastrpc_map_attach(fl, fd, len, attr, ppmap);
> +	return fastrpc_map_attach(fl, fd, len, attr, ppmap, mflags);
>  }
>  
>  /*
> @@ -1000,23 +1002,25 @@ static int fastrpc_create_maps(struct fastrpc_invoke_ctx *ctx)
>  	int i, err;
>  
>  	for (i = 0; i < ctx->nscalars; ++i) {
> +		bool take_ref = i < ctx->nbufs;
> +		int mflags = 0;
>  
>  		if (ctx->args[i].fd == 0 || ctx->args[i].fd == -1 ||
>  		    ctx->args[i].length == 0)
>  			continue;
>  
> -		if (i < ctx->nbufs)
> -			err = fastrpc_map_create(ctx->fl, ctx->args[i].fd,
> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
> -		else
> -			err = fastrpc_map_attach(ctx->fl, ctx->args[i].fd,
> -				 ctx->args[i].length, ctx->args[i].attr, &ctx->maps[i]);
> +		/* Set the DMA handle mapping flag for DMA handles */
> +		if (i >= ctx->nbufs)
> +			mflags = FASTRPC_MAP_DMA_HANDLE;
> +
> +		err = fastrpc_map_create(ctx->fl, ctx->args[i].fd, ctx->args[i].length,
> +					 ctx->args[i].attr, &ctx->maps[i], take_ref, mflags);
>  		if (err) {
>  			dev_err(dev, "Error Creating map %d\n", err);
>  			return -EINVAL;
>  		}
> -
>  	}
> +
>  	return 0;
>  }
>  
> @@ -1144,6 +1148,16 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  		list[i].num = ctx->args[i].length ? 1 : 0;
>  		list[i].pgidx = i;
>  		if (ctx->maps[i]) {
> +			/* It is possible that map is created with
> +			 * mflags FASTRPC_MAP_DMA_HANDLE and take_ref
> +			 * is false. Check if map still exists or is
> +			 * being freed as take_ref is false
> +			 */
> +			if (fastrpc_map_lookup(ctx->fl, ctx->args[i].fd,
> +					       &ctx->maps[i], false)) {
> +				ctx->maps[i] = NULL;
> +				return -EINVAL;
> +			}
if map is created by R1 call with DMA handle flag, when any inbuf/outbuf
carries the same fd for R2 call, wouldn't the refcount get increased as
part of fastrpc_create_maps()? So if the refcount is already increased
there, why do you need to have a check here?>  			pages[i].addr =
ctx->maps[i]->dma_addr;
>  			pages[i].size = ctx->maps[i]->size;
>  		}
> @@ -1200,8 +1214,13 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>  		if (!fdlist[i])
>  			break;
> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false))
> +		/* Validate the map flags for DMA handles and skip freeing map if invalid */
> +		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap, false) &&
> +		    mmap->flags == FASTRPC_MAP_DMA_HANDLE) {
> +			/* Allow DMA handle maps to free only once */
> +			mmap->flags = 0;
flags are getting updated without any locks, this is considering that
DSP can updated a particular fd on fdlist only once. Can you add this
information here?>  			fastrpc_map_put(mmap);
> +		}
>  	}
>  
>  	return ret;
> @@ -1511,7 +1530,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	fl->pd = USER_PD;
>  
>  	if (init.filelen && init.filefd) {
> -		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
> +		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map, true, 0);
>  		if (err)
>  			goto err;
>  	}
> @@ -2107,9 +2126,14 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> -
> +	/*
> +	 * Prevent mapping backward compatible DMA handles here, as they are
> +	 * already mapped in the remote call.
> +	 */
> +	if (req.flags == FASTRPC_MAP_DMA_HANDLE)
> +		return -EINVAL;
>  	/* create SMMU mapping */
> -	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map);
> +	err = fastrpc_map_create(fl, req.fd, req.length, 0, &map, true, 0);
>  	if (err) {
>  		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
>  		return err;
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index c6e2925f47e6..142ddaeed85f 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -44,6 +44,8 @@ enum fastrpc_map_flags {
>  	FASTRPC_MAP_FD = 2,
>  	FASTRPC_MAP_FD_DELAYED,
>  	FASTRPC_MAP_FD_NOMAP = 16,
> +	/* Map the DMA handle in the invoke call for backward compatibility */
> +	FASTRPC_MAP_DMA_HANDLE = 0x20000,
>  	FASTRPC_MAP_MAX,
>  };
>  

