Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C232E12E;
	Mon, 24 Aug 2026 22:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609220; cv=none; b=MqyYTDH8MTuAApyYiPxRsXotVtRypwufhzEqOiFmVzfzkZ4ASonry4HYNnAVtX/h0bLbpFDwb4DnyRXqST96L2oGwATSJLmTcd9eVsAlSAhWuWwB4CXl7p1dqInlBwGNIFig5pxoyrwJo98b4yQExqevcETcZKpVHbGm0/EkRDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609220; c=relaxed/simple;
	bh=GoErHIMicp0nmvLS9m+qyBTsqbfwwSSRewhoOAHZe24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3c3I2ObKrKOe7f/34SS1gwcOjXjZSJR67LkiFGOMdUa36lxE16Re1wzLXLSch5OAEzZephlhHGXbMBdivQZXJ8xALLJGE2agWtL/dDlduRJBa0I/UOjt1B1sXsA+lbJ8QnQioBu3Ss6ZwOtjEo+SLMPgIdEeuR53DXQxr9daV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u+HdUHPj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u+HdUHPj"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:c393:cb01:be9:acf5:9729:4e55])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED8FE512;
	Tue, 25 Aug 2026 00:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787609130;
	bh=GoErHIMicp0nmvLS9m+qyBTsqbfwwSSRewhoOAHZe24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+HdUHPjMkS2V0DwWNdtjaZYiqEzZQQxwUZpjn17ZkAhfilW9z4VkQiS+9+ilEcdM
	 PrI+me66O9Xqk8Ldb32oSOf8bn6JzkJTzuycGGX5/M8zUugRdj3OGThOjIrSqhMNha
	 Ecxj9N7rVNRGZtHMTj/Ms59QL2glmRtPnFR114Wk=
Date: Tue, 25 Aug 2026 00:06:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: mchehab@kernel.org, michal.simek@amd.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] [media] v4l: xilinx: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20260824220653.GA727417@killaraus.ideasonboard.com>
References: <20260821071125.213335-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821071125.213335-1-triet.hoang.dev@gmail.com>

Hi Triet,

Thank you for the patch.

I'm CC'ing Tomi Valkeinen who is currently working on the Xilinx V4L2
drivers. Tomi, could you handle this patch ?

On Fri, Aug 21, 2026 at 02:11:24PM +0700, Triet Hoang wrote:
> Convert the deprecated SIMPLE_DEV_PM_OPS
> to DEFINE_SIMPLE_DEV_PM_OPS
> and pm_sleep_ptr().
> 
> This lets us drop the __maybe_unused annotations
> from its suspend and resume callbacks,
> also reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index 7deec6e37edc..8bac01084605 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -686,7 +686,7 @@ static const struct media_entity_operations xtpg_media_ops = {
>   * Power Management
>   */
>  
> -static int __maybe_unused xtpg_pm_suspend(struct device *dev)
> +static int xtpg_pm_suspend(struct device *dev)
>  {
>  	struct xtpg_device *xtpg = dev_get_drvdata(dev);
>  
> @@ -695,7 +695,7 @@ static int __maybe_unused xtpg_pm_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused xtpg_pm_resume(struct device *dev)
> +static int xtpg_pm_resume(struct device *dev)
>  {
>  	struct xtpg_device *xtpg = dev_get_drvdata(dev);
>  
> @@ -895,7 +895,7 @@ static void xtpg_remove(struct platform_device *pdev)
>  	xvip_cleanup_resources(&xtpg->xvip);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
>  
>  static const struct of_device_id xtpg_of_id_table[] = {
>  	{ .compatible = "xlnx,v-tpg-5.0" },
> @@ -906,7 +906,7 @@ MODULE_DEVICE_TABLE(of, xtpg_of_id_table);
>  static struct platform_driver xtpg_driver = {
>  	.driver = {
>  		.name		= "xilinx-tpg",
> -		.pm		= &xtpg_pm_ops,
> +		.pm		= pm_sleep_ptr(&xtpg_pm_ops),
>  		.of_match_table	= xtpg_of_id_table,
>  	},
>  	.probe			= xtpg_probe,

-- 
Regards,

Laurent Pinchart
