Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05560463B9A;
	Mon, 17 Aug 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986858; cv=none; b=NLitk3Sj4FDJkVvAWQ2WKuCxcItM+lERa3mwp9VGApLWcgGL04J5wIpIFnWiJgu9X6OMVxgSEslzLMU8ES5M9oHuWATM/yzBjuCsiQLxpFm9XSHjV7qLE2+OGmXKuGYcKOHMsFGo9RMxtPeBPcKsbor3vreVDLVq0463gHzDACc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986858; c=relaxed/simple;
	bh=E7AQQ7E9iRsVZ3/uwkBQqgZFZJAhqxUd5nmvxUHxQIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxSypX2MOpYgdrzKVMDXBDX91SJFJWszKGZmjafHRrqbyDD3MTaDmq3W8XZhfxlCKjm+JbXRkXCjLzGs+bcB4lNw6Tq9G1Cyh/e1yw+xvexmRXu9+GWHoMp4uTfe3vn6Kkpf5+0oJf4F4gX5/2bAkN4SdwaZVFrHO5A2ZH3HffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=imDKBWQs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WkhF+Gk9; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="imDKBWQs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WkhF+Gk9"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1598E1400060;
	Mon, 17 Aug 2026 13:14:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 17 Aug 2026 13:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786986855;
	 x=1787073255; bh=XEz6jJPMypeL6O3581aitXUQ4nlKFKql6QjN3NglMi8=; b=
	imDKBWQsaA8MkhhcP9EgkbspPDWyxA5C6/heg5T9m05cF6HWSQP4EB+k3TgviKY3
	lx73TR/IaJu/RgCvY6VpBlJqfoCSCpWyvIQDDNRds6sGYGX2On44qz/Ng5dTpHGQ
	vwbEqBWJfQcsvhD35vzSrWhn6L5l1jeKGJOxkebeQHRQcXI70306xIiCZEQVUOpY
	mZej64XHh6xcU00t97xmvVIqKsn7Ap6oa4Hei6Ugajoqrml6oNOHc9Ye/nVAnIte
	PcmcCa+crx1SfWDBnK3bfH5tsIQQrqGpfzpz1DMZ5VtVTu9vbNZV6O1y52roh9Nd
	5Wiy0oxMuaATACIZycIUSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786986855; x=
	1787073255; bh=XEz6jJPMypeL6O3581aitXUQ4nlKFKql6QjN3NglMi8=; b=W
	khF+Gk91rNOGbvW/K/a2pwWTy8fVK+VmamctUFjNaFCYhOs50DJ5zQLgytNLcbZX
	kqPHX4fPaa37t2F47R0e9j0t7uA19pcqAq0JcSpRhum4l8DbNemgWJrDJZHnVzh1
	wCzFBm9UNnmZCdzPX+W0f3GTmIX4/3mJFPyWYGykyuw41QmEZh0x5yKmRSXn71OT
	ZT/egxJFyuE/BmfXT2WAueZXunISWsaODIU6Whsd4FlallpkRw+3S4NbcOwXpjrq
	r/OLuyOv6I4WMBlkWMjb3Yv0I7WIwCXkrU1pzoZ3OD6jCjRNDwMJHxHMbai4r0yr
	xYgpbKl1ydHyBZ3GN9bPg==
X-ME-Sender: <xms:ZkGDajBXX0Az7BWfSQouX47HJjHAU4LUnro_UMyB6OyEqIOleQgURg>
    <xme:ZkGDajmfemPc0eFNTDFcdpyoJEDPRsLZ6WWDbdrF789DUjnFREfgekgwwHGH-1otO
    PMUdKktBYVJgrk6GhYTHJQIyCsQCbC_AsDsHexJGytwaFazdEwvvoxT>
X-ME-Received: <xmr:ZkGDaudcqTBiaHMJZGRtyUzjhBtFJwXt5dHVQUzGmUQpLzWF-pZxxaBwVJh83ULa39Qtgb2UKEXrXzwufaMyUyMOdK7Ygjk>
X-ME-Proxy-Cause: dmFkZTGIdQAjq1QJgHkwPYWqrkKtgei2anHcEu0XbIEpBH1Hr8tkNO7WP93XcpcP1R77s8
    TxaQ8yePjHLPqV1CtHW04yUHjwQvkHjV+OTYVGLiCgmggLEwpNp8A8e/dWNKVeTKUDZbaD
    JzARUf1z1k9JeE9UFPEEXU3aQmgpuKRnIu1h9u2u7LvCyiaLuP1CfwxLFBQ5Dd50YhlbxV
    d+yiwP/vGtR95MXoMyRaQh5eLm4J6qEecOzpssoFwghTGWUDJx15+1//03ueH8g51YaWmL
    CRgzJJneTRxMHHIb77YxT02YzK0BcTqzxHnWItyzc9AnETwDyabQbs3YGugTIQcbhPtxYv
    ImlslVnQQiRxMTbbb/RH3meGlVow9WTrCdqh6fZjVrOBoEMGgCgWaU9gBemqTtWae3tyoi
    zsljQzVXYBs+q2FvUYorKNETSHxfS486RY4n3ZAC63iadKsjntNZQ3h/3iFx9GxFiIRbAj
    5Goty2CDTI5cZZgFf7i9MBbNJS/s4aCot0+qVnW+/mNwv0d8RVSbI4OCcZ0+vNJQ9iAG0t
    71sUPjp1w3Cat+X1NlwwH2NBHl1Y5CUIw+8n7tGZXwkUGqC0AvhdnrGTd9Ckz4BFrb16YU
    6vcKIN+DR6q7tbGvOm6hpi7EczpoCXQu9uW7yq2dYGmDZYJ27bvI54ZChmtw
X-ME-Proxy: <xmx:ZkGDanQT8WYT1S3k4TsGlzwaPCyj-W-DcwsjWXKolAsBJ54PjVRrmQ>
    <xmx:ZkGDals-nIbR_K7ZD0Q63kSma0iEypgNhvYfk13d-prxsjHtN_yBLg>
    <xmx:ZkGDaodsWYsI14hRgWt3PTdaPWjcMVORBvteAu36qtW2gZrzil9cTg>
    <xmx:ZkGDavYNR_PaOpvByZ09xvAkkLMUC6IBaK9wGgwiy6v1HSfwtIdk2g>
    <xmx:Z0GDai_Tqh0J0GF25RVw3HPU1wa5-NAYMkWxGQZup7YzICvfOfbQepGL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 13:14:13 -0400 (EDT)
Date: Mon, 17 Aug 2026 19:14:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: rppx1: bls: read the raw pattern from the
 PRE2 acquisition module
Message-ID: <20260817171412.GJ2757863@ragnatech.se>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-3-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817104529.3132552-3-lilinmao@kylinos.cn>

Hello Linmao,

Thanks for your work.

On 2026-08-17 18:45:29 +0800, Linmao Li wrote:
> rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
> module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
> pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
> read zero (RGGB) and map fixed black levels to the wrong colour
> registers.
> 
> PRE2 is not started or dispatched yet, so the bug is currently
> latent. Read the pattern from pre2.acq, as the PRE1 path does.
> 
> Fixes: 3f8a2a883655 ("media: rppx1: bls: Add support for black level compensation")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/media/platform/dreamchip/rppx1/rppx1_bls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> index 01a61db279bf7..71c5561457d52 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
> @@ -70,7 +70,7 @@ rppx1_bls_swap_regs(struct rpp_module *mod, const u32 input[4], u32 output[4])
>  
>  	/* Swap to pattern used in our path, PRE1 or PRE2. */
>  	struct rpp_module *acq = mod == &mod->rpp->pre1.bls ?
> -		&mod->rpp->pre1.acq : &mod->rpp->pre2.bls;
> +		&mod->rpp->pre1.acq : &mod->rpp->pre2.acq;

As pointed out elsewhere in this series, PRE2 is not enabled yet.

>  	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
>  
>  	for (unsigned int i = 0; i < 4; ++i)
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
