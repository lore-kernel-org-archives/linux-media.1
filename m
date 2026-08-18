Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2213B3C1B;
	Tue, 18 Aug 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045840; cv=none; b=PSsfeyOJMX2J+R1ZVxbefdr3GcnFFsK4iUZC+AEvd0Z5Ar3276Ol9sFcK17sP008dyRDKC/aI+wdZ6CdmVe3j2mGBDLdWvFQsUMzLkUvI/e6EtSpRpD5ioInfPrqZRVjG4tIStuExj6vWEs5bbOan1SH4U/nGcszn1Y1gjeIydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045840; c=relaxed/simple;
	bh=t0H2sDiFuDM30AlySpNMeAwggy64kA5eXO/ihSOnWos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0dyje7n1nnXrMxQHpL6KmrCKdNJWK5XAzFqaD/HiMvFxdv4/Rhydrr1sdBm5jf6wIs02QeQapl0bJkWY8MstPnkM/B9rv8M+hf0Mgu1aMB3cJd6fiOC1oGmN6/b9mi8zR7H/v+poo4XQ/Mwo6xeZi+UpPcGLs6iRE/SUcmP92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NBy/lctb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NBy/lctb"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D40F61F8;
	Tue, 18 Aug 2026 11:35:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787045756;
	bh=t0H2sDiFuDM30AlySpNMeAwggy64kA5eXO/ihSOnWos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NBy/lctbAZkBXI2+pJOXIdQKIlFyKWNItwr3dDddsaQCqovKrbrpNsJ7VrNBWCRAN
	 R0A5w6te1xsCTCz4t9s0z/ytvhBJrJ1oSFrK/ajaqSt8ec4jfgmSQrJiACpnA1Y42V
	 IKqdusdG2ekUX2XpXfXx6hLPBM/nhFTBoj8jYfQs=
Date: Tue, 18 Aug 2026 11:37:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: rppx1: describe the MAIN_POST white balance
 gains block
Message-ID: <aoQniglSwAEH3V0D@zed>
References: <20260818020933.3153280-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818020933.3153280-1-lilinmao@kylinos.cn>

Hello Linmao

On Tue, Aug 18, 2026 at 10:09:33AM +0800, Linmao Li wrote:
> rppx1_ext_params_blocks_info[] is indexed by block type and is built
> with designated initialisers, so a block type without an entry is left
> as a zero-sized hole. RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST is the only
> such hole: a block reporting that type and a size of zero passes
> v4l2_isp_params_validate_buffer(), which then has nothing to advance
> the walk with.
>
> Describe the block, so the array covers all block types the uAPI
> defines. The MAIN_POST white balance gains module is probed and started
> with the rest of the POST pipe, and RPPX1_PARAMS_MAX_SIZE already
> reserves room for all three white balance gains blocks.
>
> The block is not dispatched by rppx1_params(), in line with the other
> described blocks that have no users yet.
>
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Thanks

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
> Changes since v1 [1]:
> - dropped the rppx1_params() dispatch hunk, the block stays undispatched
>   like the other described blocks that have no users yet (Niklas);
> - retitled, and the commit message now leads with the hole in the array;
> - dropped the Fixes: tag, the fix is expected to be collected together
>   with the driver for v7.3 (Jacopo).

I'll sync with Sakari/Hans to see if this can collected as soon as
-rc1 is out

>
> The second patch of v1, "media: rppx1: bls: read the raw pattern from
> the PRE2 acquisition module", is dropped for now and will be resent when
> PRE2 support lands.

If you wish to resend, we could collect that one as well!

Thanks
  j

>
> The zero-sized block problem in the common validator is addressed by
> David Carlier's "media: v4l2-isp: reject zero-sized parameter blocks"
> [2], so it is not touched here.
>
> [1] https://lore.kernel.org/linux-media/20260817104529.3132552-1-lilinmao@kylinos.cn/
> [2] https://lore.kernel.org/linux-media/20260815193839.141406-1-devnexen@gmail.com/
>
>  drivers/media/platform/dreamchip/rppx1/rpp_params.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a75a27a8afd09..5e6727d589464 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -25,6 +25,7 @@ rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> +	RPPX1_PARAMS_BLOCK_INFO(AWBG_POST, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
>  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> --
> 2.25.1
>
>
