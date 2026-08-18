Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A892D77F7;
	Tue, 18 Aug 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047530; cv=none; b=S/CL1NuqHXXt1neIjGLAk8TxE/iMtIsRPXdTdpHzHfnrbXQ0y1sxd0ZU0Clsk6b4soFigc2crDyUBMtmnMAxH8uwV99mHuBAE0qU0j1gk/h5EdUKDrxnK9MzrogRK9rVRaQt3gB0Ncqw2Rqse0l4CcHtihNKJL5/EiPheMZ1iMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047530; c=relaxed/simple;
	bh=MVzutqfE0RrBlOSu8tsyluuhgkqHMCEcx2LLJBrLIiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4LervhRLM9XPPiIlJGiiNomnN/EzgDEqX3Bb81gOp4QTpDBNZ5LtXnKV2cBY/yQuMz8CejpkfSTS1OEunl5VPMqLQqdTeroARfObG1cgThEKfzru0csI/r9uEYktqugwSfBUnsiPK28Zg5SrZwTk92TjyMFx8kltrA0aJ0Em/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OKmV13OX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OKmV13OX"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBD2BABF;
	Tue, 18 Aug 2026 12:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787047440;
	bh=MVzutqfE0RrBlOSu8tsyluuhgkqHMCEcx2LLJBrLIiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKmV13OXYTni3OjjiaT1gFxa8+rWqT2dU4VqG0Ml7QnfzYnCJRXprJz2UcRqcG/Tr
	 awh0i4K/WzBa7/Dyuz8MyHaXMKWW+UY67z3yb6OYWKlpv5vvmE3EWDLMqs3GM983Y/
	 c16WwUpkTW2ee9LWqf+ZUSZpl2s1pYW0AOeNPTpk=
Date: Tue, 18 Aug 2026 12:05:15 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2] media: rppx1: bls: read the raw pattern from the PRE2
 acquisition module
Message-ID: <aoQuSs1aSw2Z4Wyq@zed>
References: <20260818095929.3194503-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260818095929.3194503-1-lilinmao@kylinos.cn>

Hi Linmao

On Tue, Aug 18, 2026 at 05:59:29PM +0800, Linmao Li wrote:
> rppx1_bls_swap_regs() gets the Bayer pattern from the acquisition
> module. The PRE1 path uses pre1.acq, but the PRE2 path mistakenly uses
> pre2.bls. The BLS module does not store a Bayer pattern, so PRE2 would
> read zero (RGGB) and map fixed black levels to the wrong colour
> registers.
>
> PRE2 is not started or dispatched yet, so the bug is currently latent.
> Read the pattern from pre2.acq, as the PRE1 path does, so that enabling
> PRE2 does not start out with the wrong register mapping.
>
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
> Changes since v1 [1]:
> - no code changes;
> - dropped the Fixes: tag, the patch is expected to be collected together
>   with the driver for v7.3;
> - picked up Niklas' Reviewed-by;
> - resent after Jacopo offered to collect this one as well [2].
>
> v1 was patch 2/2 of "media: rppx1: parameters block fixes"; its patch
> 1/2 is on the list separately as "[PATCH v2] media: rppx1: describe the
> MAIN_POST white balance gains block".
>
> [1] https://lore.kernel.org/linux-media/20260817104529.3132552-3-lilinmao@kylinos.cn/
> [2] https://lore.kernel.org/linux-media/aoQniglSwAEH3V0D@zed/
>
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
>  	enum rpp_raw_pattern pattern = acq->info.acq.raw_pattern;
>
>  	for (unsigned int i = 0; i < 4; ++i)
> --
> 2.25.1
>
>
