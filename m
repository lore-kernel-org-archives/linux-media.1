Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45F386C24;
	Wed,  1 Jul 2026 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890717; cv=none; b=Uqcma6R4wO8CO2HjpSpdnK7qmMiLlln3HI7TeEfDqjiKl8Ik1/dp8gdSL5iMkBiAeYLOz8pJthknfzKdlDi8Y93yQs6TsAsJYuLDX1RJ7LVF1ANCqHcrXDdKbcfyLh89IzXX2RMwQc2pGVCEe1rQZmHkX5GV1d9IpUrPLadeSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890717; c=relaxed/simple;
	bh=+ufJvxZgZDFPdQo3hb4/7dMPs1csoec+xF9tmmfpo84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g30ute2w+qGcR1RdnhBem0ovddcP+f9BAKZDvpLOYhTXDdqLsxcMOLbrk/jpbwBGDlrq0g7olp5dbtpk2NmiXnl7NWBqOiAEv6EsYJeXz6IFPAo8+byesgPERWSDn5uweYbb2tfd3Nhp8RZKVHdd6Piz9oOGCslh+DN4Io8sLIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fp1/dCNA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fp1/dCNA"
Received: from ideasonboard.com (mob-5-90-48-115.net.vodafone.it [5.90.48.115])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E007E91;
	Wed,  1 Jul 2026 09:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782890669;
	bh=+ufJvxZgZDFPdQo3hb4/7dMPs1csoec+xF9tmmfpo84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fp1/dCNApYTJnSu7WmZCi8HAzgMvG1llURp7Gjq34XLKpPA4GJkd9+XuzOsdbw0yD
	 c9sv6B09uzTQCsW7vk7rmNyuhlyHm5Xdr9MVD8cYIQ9L47vWGJOXrBOE+p+XlU/jdv
	 aqz9qnv355LkWRxHSTj92WbD/gE1e/WneehrVVYo=
Date: Wed, 1 Jul 2026 09:25:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: mali-c55: Fix clock leak on reset deassert failure
Message-ID: <akTAgKuI0CvMy1t-@zed>
References: <20260609113747.39592-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609113747.39592-1-devnexen@gmail.com>

Hi David

On Tue, Jun 09, 2026 at 12:37:47PM +0100, David Carlier wrote:
> __mali_c55_power_on() enables the clocks before deasserting the resets,
> but bails out on a deassert failure without disabling them again. Both
> callers treat a failed power-on as already cleaned up, so the clocks are
> left enabled.
>
> Disable them on the error path.
>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")

Fixes need to Cc stable

> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Could you please Cc: stable@vger.kernel.org on a new version so the
patch hits the stable list as well ?

Thanks
   j

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index ee4a42674..fb81141d1 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -699,6 +699,8 @@ static int __mali_c55_power_on(struct mali_c55 *mali_c55)
>  					  mali_c55->resets);
>  	if (ret) {
>  		dev_err(mali_c55->dev, "failed to deassert resets\n");
> +		clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks),
> +					   mali_c55->clks);
>  		return ret;
>  	}
>
> --
> 2.53.0
>
>
