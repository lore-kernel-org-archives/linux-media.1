Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F349D361DB3
	for <linux-media@vger.kernel.org>; Fri, 27 Mar 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630895; cv=none; b=X9Evz5WppjkjJ10XBvAhVAX5Vh6GAP/8GdgsYN1Tum40ESLVN6JTFjHkS9PnPSCDwWLptrtXoxAEHalsK8hx50+OAHHRqPh2qS0V2HcwrHbxjtCv5eo0yQ+WcxObGXtNwKcJ8CaIIh5MoBb6ACpqOdQ5ZwIASE3CK2px3limVDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630895; c=relaxed/simple;
	bh=WjLnJd//dgaJXd0BcTXj6vm10TfF0noy6kMxAb9P9g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWGqFn2o8wow8RIgpCIZJBb4pOOHSOLyBABDvZiRyQsxWAulAoz34A30CSHmfcl0j1pKq42Vjt09GAgPmmDoqaOoSJqAZFAYb82zYpIce6ity3QNS0o6kzn8SVWvyCyP3o5TjjKExAnEn6bkfr85YHgcswj/w7myYYTP/9C/E30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f3SUMV3K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f3SUMV3K"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6340D21CD;
	Fri, 27 Mar 2026 18:00:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774630812;
	bh=WjLnJd//dgaJXd0BcTXj6vm10TfF0noy6kMxAb9P9g8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3SUMV3KjwhvtCLxNln3EK/StjXmFWcnewNOCHUYFxhhOyOn0yETDvJDnnMfn4FpB
	 fiMVUq5tXnHAiIFlwPz2QoPAM72oghOJ8lke11Df0GMsv7VhrgzUMrrqO6LC2QmtOy
	 jFgtTCB7dFKULJ28Qldd51QI4ADzIUJX2aHlDdcA=
Date: Fri, 27 Mar 2026 18:01:29 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: David Carlier <devnexen@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nayden Kanchev <nayden.kanchev@arm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: mali-c55: add missing pm_runtime_disable()
 in remove
Message-ID: <aca3Y6FHItK1cb9l@zed>
References: <20260327150707.256752-1-devnexen@gmail.com>
 <20260327150707.256752-2-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327150707.256752-2-devnexen@gmail.com>

Hi David

On Fri, Mar 27, 2026 at 03:07:06PM +0000, David Carlier wrote:
> pm_runtime_enable() is called during probe but mali_c55_remove() never
> calls pm_runtime_disable(), leaving the device's runtime PM state
> enabled after the driver is unbound.
>
> Add the missing pm_runtime_disable() call to the remove path.

The driver doesn't depend on PM, so we need to explicitly power-off
the peripheral in remove() (and set the pm_runtime status to
suspended)

>
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: David Carlier <devnexen@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

This patch is however correct, I'll add the power-off on top.

> ---
>  drivers/media/platform/arm/mali-c55/mali-c55-core.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 5cb59c70ffc9..38b11d5ba168 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -859,6 +859,7 @@ static void mali_c55_remove(struct platform_device *pdev)
>  	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
>
>  	mali_c55_media_frameworks_deinit(mali_c55);
> +	pm_runtime_disable(&pdev->dev);
>  	kfree(mali_c55->context.registers);
>  	of_reserved_mem_device_release(&pdev->dev);
>  }
> --
> 2.53.0
>
>
