Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1443A3F39E5;
	Thu,  6 Aug 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009942; cv=none; b=TbWiC2uUG18PdVijHRjnpZCP/KemhV78vj5HdwkAcldYpEur34OkNlZvm4TMz6cSfimuXtXDUnDJ4YJNsoCDpYGiTPsJTPFf056zUL/O4uS26TL1V465Mw386BwCKAdF0tfDCjGXJK4kmYA4cLR6FD91dd4kidtCWdraUcL0/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009942; c=relaxed/simple;
	bh=LweUPu6cR5fkh2QSTAZQ8k2z59iNAJAMeeAj3IxTvwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pdJtW3gj/KpA6qBVolfikWWbqQKc1ik12pdn6FIo5BWA1SeuUYlEBYRkjyF/TWNDCUxb+pXI8+pB0q4ujCFWhwU8Tzm2eiw21ZPzHuiy5I2qAzn72adl4IBvnsFJSIwZ363kAmvKIDPw2RXJ8s+ov6OPEsDMAnGm6Ixdv0ebew0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LPeysNa0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LPeysNa0"
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A26EAEA1;
	Thu,  6 Aug 2026 11:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786009866;
	bh=LweUPu6cR5fkh2QSTAZQ8k2z59iNAJAMeeAj3IxTvwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPeysNa02gPTyL162UesYCDzJEqP+8lH+iyJ8DRWF5tcJ4I1vwDSN21R6N9hREuPM
	 deQLcP7RuBLWEReiNY4bkkbT+9xqkp6qQQMZnapXPzDyFespMM0vJmR5H6Ooz0Ziya
	 MgzzADpLN479cXmWxGB71ZHHi4DWoIbx7t6DJoXU=
Date: Thu, 6 Aug 2026 11:52:14 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: rzv2h-ivc: manage runtime PM with devres
Message-ID: <anRXzkIs61K8NyVG@zed>
References: <20260804141104.38891-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260804141104.38891-1-mhun512@gmail.com>

Hello Myeonghun

On Tue, Aug 04, 2026 at 11:11:04PM +0900, Myeonghun Pak wrote:
> Runtime PM is enabled before the IRQ is looked up.  If that lookup
> fails, probe returns without disabling runtime PM.  The subdevice
> initialization error path disables runtime PM but leaves autosuspend
> enabled, while the remove path does neither.
>
> Use devm_pm_runtime_enable() so the driver core disables autosuspend and
> runtime PM on every failed probe and after remove.  This also makes the
> manual subdevice error unwind unnecessary.
>
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
>
> Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c  | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> index 355842abb24b..48f9fd818bff 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c
> @@ -202,7 +202,9 @@ static int rzv2h_ivc_probe(struct platform_device *pdev)
>
>  	pm_runtime_set_autosuspend_delay(dev, 2000);
>  	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>
>  	ivc->irqnum = platform_get_irq(pdev, 0);
>  	if (ivc->irqnum < 0)
> @@ -210,14 +212,9 @@ static int rzv2h_ivc_probe(struct platform_device *pdev)
>
>  	ret = rzv2h_ivc_initialise_subdevice(ivc);
>  	if (ret)
> -		goto err_disable_pm_runtime;
> +		return ret;
>
>  	return 0;
> -
> -err_disable_pm_runtime:
> -	pm_runtime_disable(dev);
> -
> -	return ret;
>  }
>
>  static void rzv2h_ivc_remove(struct platform_device *pdev)

The deveres managed version of pm_runtime_enable() calls

	pm_runtime_dont_use_autosuspend(data);
	pm_runtime_disable(data);

So this version is already better than what we have here.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

We don't seem to forcefully suspend the device at remove time. The
device is only active during streaming and I don't think the driver can
be removed (or unbind) while it's actively streaming ?

> --
> 2.47.1
>
