Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD202D7DC4;
	Fri, 27 Mar 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634817; cv=none; b=sqwrGfmCH3mnxi3ZtG7LyA9QyC2Uxtuxwsrr950jsMjNhyH4C88vlN9SyrsMmBc9rbMlj4EpAnpOEi77nNWPJL65c+vt7kpzPGdI5z3l6H05e3Bwtdc/yVJTxNWh64nUF2oxRlOH6ZxuH5UdEHByIedQIyO3cs/MfrYIa05Pa9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634817; c=relaxed/simple;
	bh=xQYrBqJ+bxWqCjw5RpGcp7/le/nNMkHmBSlehzr7NXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu5SdB4qAqPLTg2LAe4Bi7YXPn5D4IztCL4vkuFxKP9vtXSghpgAx98s33RbKCWBtsQOv846ng4VShBmukODkr2w+O/YKItbJbjLvY82BmCqLzABqE7r2a3mfCg3jkf7gOxWIjgkx44gT+f49VSpFFkHXrs3ipSJrMD5WcRuA/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O6w1FNIF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O6w1FNIF"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 711551C4C;
	Fri, 27 Mar 2026 19:05:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774634734;
	bh=xQYrBqJ+bxWqCjw5RpGcp7/le/nNMkHmBSlehzr7NXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6w1FNIFbh0fyodqbyNCIfie5II5rrTbFzdJB35pufj4/L+wOc1z5W3pRoubeq9VI
	 MEYqE8Zzh54ZjkD0dyzc0ztaSccLUYcc4P82xytaztVZ4VMzYvPNxSE54PkjUvri46
	 3V/5yWLO/CMIbEqnWQNfEXfgRwRlbS4+RRBaZzbQ=
Date: Fri, 27 Mar 2026 20:06:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-common: Always register clock with
 device-specific name
Message-ID: <20260327180652.GE3026673@killaraus.ideasonboard.com>
References: <20260327175212.443987-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327175212.443987-1-paul@crapouillou.net>

On Fri, Mar 27, 2026 at 06:52:12PM +0100, Paul Cercueil wrote:
> If we need to register a dummy fixed-frequency clock, always register it
> using a device-specific name.
> 
> This supports the use case where a system has two of the same sensor,
> meaning two instances of the same driver, which previously both tried
> (and failed) to create a clock with the same name.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 554c591e1113..5f3295c3122a 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -792,14 +792,11 @@ struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
>  	if (ret)
>  		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
>  
> -	if (!id) {
> -		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
> -		if (!clk_id)
> -			return ERR_PTR(-ENOMEM);
> -		id = clk_id;
> -	}
> +	clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));

This will now fail if the same device needs to register two clocks. You
need to include the id in the name. Maybe something like

	clk_id = kasprintf(GFP_KERNEL, "clk-%s-%s", dev_name(dev), id);

> +	if (!clk_id)
> +		return ERR_PTR(-ENOMEM);
>  
> -	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
> +	clk_hw = devm_clk_hw_register_fixed_rate(dev, clk_id, NULL, 0, rate);
>  	if (IS_ERR(clk_hw))
>  		return ERR_CAST(clk_hw);
>  

-- 
Regards,

Laurent Pinchart
