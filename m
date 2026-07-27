Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B933FAE09;
	Mon, 27 Jul 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149343; cv=none; b=NRKtXFY4RHY9u9HmWxsL4Lhb7M+wdzsvtzh5ZM4vV6Tuqf0EBB2KXU/TcsapCckTiqqaT0me7Y7OO7ou4LVfppjwWmOVHCpmM69/s5vPYf+9NRa50/oy0LcZ6+FNyE33aIkWYRlOZuzQw95DP7OPo9Nwpx/rf378aFDJn59pGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149343; c=relaxed/simple;
	bh=xKkfAbnttpms7HTQtxkotA7x3KNV29VFaSazTYb7GQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUw19pzT1/cjEZxg6yaTip+URdo15aMcaCXGEfiPx//3oG31H38sxxVXBzipvSYA9B/wtKeRImpztkWTElOb8akE6b2GNsNVvangtd3J4nQT3MZahTSNZPl/fQbP0psKx7lj1CDPDJddgyN04zdxn7fddoySb/tqb1YtQvpa05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ELJFk57D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ELJFk57D"
Received: from ideasonboard.com (mob-5-90-50-102.net.vodafone.it [5.90.50.102])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 497C7BB;
	Mon, 27 Jul 2026 12:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785149276;
	bh=xKkfAbnttpms7HTQtxkotA7x3KNV29VFaSazTYb7GQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELJFk57Dt8iVATRdBY+omTmuauv9PtmKHXoW4AYibi5Ibp1BYsxcrGwAiyepo564U
	 LQ//HHmkOxGUDGScL78CdrOUSqWaga2sH8unk82LBzLUsOFTerG3EwbvZpiSOsDzyT
	 B/Y1xfEVVvj2JrYKIFEGHyz7RWm0/4ugCOM03Gto=
Date: Mon, 27 Jul 2026 12:48:57 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Chen Changcheng <chenchangcheng@kylinos.cn>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, p.zabel@pengutronix.de, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: fix clock leak when reset deassert fails
Message-ID: <amc3aBU6dTistIgw@zed>
References: <20260724025345.32644-1-chenchangcheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724025345.32644-1-chenchangcheng@kylinos.cn>

Hi Chen

On Fri, Jul 24, 2026 at 10:53:45AM +0800, Chen Changcheng wrote:
> In __mali_c55_power_on(), if clk_bulk_prepare_enable() succeeds but
> reset_control_bulk_deassert() fails, the function returns the error
> directly without disabling the clocks. This leaves the clocks enabled
> permanently in the runtime resume path, or leaks them in the probe
> path.
>
> Fix this by calling clk_bulk_disable_unprepare() before returning the
> error.
>
> Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>

The issue has already been fixed by:
https://patchwork.linuxtv.org/project/linux-media/patch/20260703163503.715606-1-devnexen@gmail.com/

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 94a389b3f833..f28e9f4354ac 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -698,6 +698,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  					  mali_c55->resets);
>  	if (ret) {
>  		dev_err(mali_c55->dev, "failed to deassert resets\n");
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
> +					   mali_c55->clks);
>  		return ret;
>  	}
>
> --
> 2.25.1
>
>
