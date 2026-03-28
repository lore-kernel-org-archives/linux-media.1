Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2D3932ED;
	Sat, 28 Mar 2026 16:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774716530; cv=none; b=cuXcuVBXdRJqroffhdAwFmbbKTznDgakz44VOEovRvO6+vkfk9cdB4Dgl0SqK4bv/71P91F/sP7qZgmlK2BTiycW4FMjZRh+Y7GVGrfUQVhYHu4T2YFn4R6vnLhxhQJ+n8I4ycrG8bLQCG3SXzumpnzBpgYJjt0h/AfcIWiDH/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774716530; c=relaxed/simple;
	bh=H0DScYyyAD6OwnxxeTsYZtTqDXpWJgF1OkFgmQ+h8Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idD234q6sXMkunkGCPynxZchnEigAUjmGvM113PlEBf9EtFFaZOplxF0y0uG2FccYzsIx9b62tPE7NLVqhihUmOiFJMjtVPVyBuJev2T4q8aDg79G6Y8LnhkZMe2tmw3j+lBVDFuNurVnMokq/9oUZKyzm61DpwY2pk6DnIfXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tSoG012n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tSoG012n"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A7103DA;
	Sat, 28 Mar 2026 17:47:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774716447;
	bh=H0DScYyyAD6OwnxxeTsYZtTqDXpWJgF1OkFgmQ+h8Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSoG012nW3gH+kd9oPTVfwKArwzCIr3Nq9nCzpQxjdr0lpsdcvZYap0utDXpPG4Oq
	 oOFN0BfCwdl4Cce4c0wWZZmUFgh+ZmMNGiEWcd1Sx6xlI8neJ7+XF3iUA1r2AqvqHW
	 sXXoEAuBk6Cc3T4GRp3IRaehHYhIV9vgX8zwn3d0=
Date: Sat, 28 Mar 2026 17:48:44 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	mchehab@kernel.org, nayden.kanchev@arm.com, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] media: mali-c55: fix probe error path skipping
 pm_runtime_disable()
Message-ID: <acgGSvVgsD7zGsgz@zed>
References: <20260328151452.148901-1-devnexen@gmail.com>
 <20260328151452.148901-3-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260328151452.148901-3-devnexen@gmail.com>

Hi David

On Sat, Mar 28, 2026 at 03:14:52PM +0000, David Carlier wrote:
> When mali_c55_media_frameworks_init() fails, the goto target jumps to
> err_free_context_registers, skipping pm_runtime_disable() despite
> pm_runtime having already been enabled earlier in the function.
>
> Fix this by adding an err_pm_runtime_disable label and redirecting the
> frameworks init failure to it, so pm_runtime is properly unwound on
> that error path. The runtime PM status is also set back to suspended
> before disabling, to undo the pm_runtime_set_active() from probe.

Thanks

>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index cf238bdf65c8..0f0043927cfa 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -828,7 +828,7 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  	ret = mali_c55_media_frameworks_init(mali_c55);
>  	if (ret)
> -		goto err_free_context_registers;
> +		goto err_pm_runtime_disable;
>
>  	pm_runtime_idle(&pdev->dev);
>
> @@ -843,8 +843,9 @@ static int mali_c55_probe(struct platform_device *pdev)
>
>  err_deinit_media_frameworks:
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +err_pm_runtime_disable:
> +	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> -err_free_context_registers:
>  	kfree(mali_c55->context.registers);
>  err_power_off:
>  	__mali_c55_power_off(mali_c55);
> --
> 2.53.0
>
