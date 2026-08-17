Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6873AD520;
	Mon, 17 Aug 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786981799; cv=none; b=TKZ013e26tH/V7tgnHtDxkDAlaWEya23jhe2MErXP0ji5FlLgA7MZCMadYRP0EW/F6OA34u+dBFCmFjyJ+w/GB+kQYm+neKFupd5140rGHESCE1AE6mv04mUO8ilQQjXzYYDYb8Go1GyRZnyOv91gUtce2a0OGuKnDs5INn4MIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786981799; c=relaxed/simple;
	bh=Ce0BtuDnaniEUtE5jr2K4VrElTCPzqIT4grv8vEs1Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryIs9ranMuDVeXWRNayO/H/s6uHEoA0MQuTRhWnYJEt8GEi2hEi15vdk8XhxbhXa8pLesD07IYQtwLz1p/CHICtnctesnAs8YETEE6o1HaeQ2QkEN4ftKzDQFCzEBxkxtHuPp9K4znqdT5PAOq55Y8k3Mdxo+6haTjRAHSV4KsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pz5sKvFQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ov3YNx8d; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pz5sKvFQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ov3YNx8d"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06B1A1400107;
	Mon, 17 Aug 2026 11:49:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 17 Aug 2026 11:49:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786981796;
	 x=1787068196; bh=HMMF/wuH8tshG6q+B30qF4h1OZF7m+zxP/3az7hykEY=; b=
	pz5sKvFQDLhmxArKpkgS/J2MfhfQcISrL/90AyTb2FptJG1fz0P/eqsqPMulPMqu
	+B8TD7Yau8zKiKDI0CSH1JUR+oFEwoAZmwazuPDidGxL5WShx9h8KIWShDBhwtxm
	7dLs50lw+bTE/7pgVhtiXHGvhEO3Cx2z74z5OeAy+pa7nZ+ipjlfJvL2+/yLkieW
	z2OZpiAuIxGv/lBh18NDy7ZaDuoR96X+5xrEDZqjntOXQvSjvXidaiZVzVbia3S0
	KL9TuvvMJktjeOdd/Ii/UtBGSFJdVdNQ/t1tUCXb4s4h+geDUq3cwyfCC3C7MJAI
	jVBWGSNYfdHfWur/YLKKaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786981796; x=
	1787068196; bh=HMMF/wuH8tshG6q+B30qF4h1OZF7m+zxP/3az7hykEY=; b=O
	v3YNx8dn4DjlfO1Xx6g02oYnf7H1VKoGwiJ+R7PMBp6ksMREU6aJuSLxobSwtChd
	VZ3kUtk30CFbK8Tcu6GIvId+uGM0Hvh3wXxngvhx0+bhbl9esfVyidy6O0V/1jeB
	0D5HpyZydlgxSR2hwZM62C+I3RC2hXW95/UsBXGFlyKfGYBUxOrCSDBPdv00sSoQ
	dCM2nOwx8wNGbvAV7S4Ne4w42sGSxkvJt96oec5jG6+tVJcyxJfkZPQgrwiR7kVo
	S2WOfTHlooO8dI8Y7pEAzApYl4pELs3KU8F2SEKB0UyTpFIL3iHENR3lUV5DYIru
	1ONBnDH3MxOV9q8O8spsw==
X-ME-Sender: <xms:oy2DahpHqNhPR4McRojv-N-FO0i7HsBZ1oE25XZK0cS9o31FLwG4qA>
    <xme:oy2DatsBzdmMYCHBnw99Ox8gqKQ5fqXm2KXjrd63H6B2RhwZ1jwKkKsiLHctfNh2f
    063IxyCX5U7IsGS3m1i4uqbn1xoiayKyAPc2Y-D_oc2W5RVxAqHlunx>
X-ME-Received: <xmr:oy2DauHnsv8REF9-w2kmqSHWTiujbs9eq7KgEe0xtS2I7t_RBmASndGaVd0U0l2ASc09sF77Yyhfjd8LfslFkk8QlIXskpw>
X-ME-Proxy-Cause: dmFkZTF4hLU1zroaifqQqsQtzh/CIlSv0xaNvR3VzdCAqcOh0IwEa4EtDBwqaIDL0kMvXV
    GCZotxdkL46Z+EbJxB+J8YHl1VmCrTZ5n2fHoP/P5SsBGsFJfQxkDBfHu0mt6AEpksgu39
    5BTkOYg+RNW35SQZHSDAbxbOgH7qxYQ8e6VG7Q0rFvlpC3K9TbA3fHt5Z6guDOyiNxSDmd
    uSJgijwBF3bqRNsVmCotg17lnGsR2OjwGeInzfWjqc17XUJYkmMNj0lEyyvYNZ1/gcGciv
    l1zmE/kI+bSXI58a9fdwzxrwsVLq6FRiZHpdXanku8R/3DVR/F0j9H4pg5HUkufn179tlI
    xXKATbmwQ+NxW3XVX8FAKnw8ZFoSvga70uIdHh43mriYFn4jTXcaHC3drpFSbf6m1nLw2n
    vLyBut+p4yJ00jgIvFAt/RAMhur8FeBOAoaf3HXLg89bvuwRweybRv3XOpocI3WtDxm24M
    Px5B4Cyu50yomQUSdFGH/VuGRg60UlnW3A3FB/fPen16KdIEkPSoNllJkuxS2IH7WSz2bN
    aFpXR/q+wdWMpPjQ3v+YS/LcvX07XtEnsxbs/jdXIVvxEQzQviYT1zwhZSzLwZ8VyZjNiT
    4oddUelJoZ9i+PbY+ae1ibG9GdeKBu1lNizaSjUajuUGkB5eUnzpPWSmVl1w
X-ME-Proxy: <xmx:oy2DaubbVQubtqaDwWHqe2CpGfnAMm7SZY6suArEe9DaXL0I4cfReQ>
    <xmx:oy2DauUCtLY2BOhpPVTm44ex4fNsrFH0C_jWgrEVBLMRBuc83B1YaQ>
    <xmx:oy2DakkXRDswHlJ0MFdzI6bcHG-Z5nhP-uo9M279j9kRfrmJSVx_xQ>
    <xmx:oy2DapAOdFapFCYgiwB5whT4VLy1W-XTl7wcTIvCakE47h65QFPc2w>
    <xmx:pC2DarGBOMnWzMpQy--oK1wpGHU4vq1SzgZqC24RRnybGdhjBp4kEUQe>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 11:49:54 -0400 (EDT)
Date: Mon, 17 Aug 2026 17:49:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rppx1: handle the MAIN_POST white balance
 gains block
Message-ID: <20260817154952.GI2757863@ragnatech.se>
References: <20260817104529.3132552-1-lilinmao@kylinos.cn>
 <20260817104529.3132552-2-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260817104529.3132552-2-lilinmao@kylinos.cn>

Hi Linmao,

Thanks for your work.

On 2026-08-17 18:45:28 +0800, Linmao Li wrote:
> RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is defined in the uAPI, the MAIN_POST
> white balance gains module is probed and started, and
> RPPX1_PARAMS_MAX_SIZE already reserves room for all three white balance
> gains blocks. However, the parameters type table has no entry for
> AWBG_POST and rppx1_params() does not dispatch it, so userspace cannot
> configure the module.
> 
> The missing type-table entry is zero-initialised. A zero-sized
> AWBG_POST block can therefore make v4l2_isp_params_validate_buffer()
> loop forever. A pending v4l2-isp patch rejects zero-sized blocks in the
> common validator.
> 
> Add the missing type entry and dispatch AWBG_POST to rpp->post.awbg.
> 
> Fixes: 9ebf50010c68 ("media: rppx1: awbg: Add support for white balance gain settings")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a75a27a8afd09..88162f0bdc115 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -25,6 +25,7 @@ rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> +	RPPX1_PARAMS_BLOCK_INFO(AWBG_POST, awbg),

This looks good.

>  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> @@ -79,6 +80,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
>  			module = &rpp->pre1.awbg;
>  			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST:
> +			module = &rpp->post.awbg;
> +			break;

As you point out in the cover letter there are many modules, specially 
in the PRE2 pipeline, that we reserve space for in the configuration 
buffer but to not dispatch yet. But also some in the POST pipeline. The 
reason for this is that we have no users (libcamera) or test-cases for 
those blocks.

I think I would prefers keeping it like this until we do. If you really 
really want to go this path should you not also add AWBG_PRE2 here, that 
is also not dispatched ;-) But I think you should drop this and just add 
the missing entry to rppx1_ext_params_blocks_info.

>  		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
>  			module = &rpp->post.ccor;
>  			break;
> -- 
> 2.25.1
> 

-- 
Kind Regards,
Niklas Söderlund
