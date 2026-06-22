Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF2D390CAB
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116999; cv=none; b=m2Ny5p0YR+j066jQj6ls3jfCGdnB0T2s8NlysaXt7k0eAVWhXG4GjL9POS4lTIzSfIGLiqUWcM4z7jS/iqmwYXojrp0+oC8WDY6/4Sq0odEEKarYSPw/wmPvoyYddTdeUnBC3mDzWFvH0Os/grSKBmrd5Z1qmbTH8ik77eUqmMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116999; c=relaxed/simple;
	bh=qpoF0S7hMbCTV0Mwa/tb2o66PqPHIr1kRhRZYa6yVXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2Ulq4PaHWW6VgjyYz25M4hTxvK4z8El0HV3Qq2uLo9pt5YXmKN6AhoQVswmKn23fiOOnBlgBV0wLFl01aPDy8uuyu+IbZVw2t1lC70tLcpEsGi0V0yCB/Ft1DZ1z3fLWz94msU7BlwrtEnPIBbXpnYur0nUcg1VUXOaQ/BbUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jGrTl1Eu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jGrTl1Eu"
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACFED874;
	Mon, 22 Jun 2026 10:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782116954;
	bh=qpoF0S7hMbCTV0Mwa/tb2o66PqPHIr1kRhRZYa6yVXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGrTl1Eu4Bm4qx8SrnQ4w4u3tnGnIHm0Vcskq3ZnKXnIFqkaiM5KFgg6VYL5wV5Kw
	 VseM6laBrEna/Je7JPcBNT23fiz9PVcHpPIC7lPtRfULKbnDtdlTW7GzTT8kVxL4y3
	 AlHNBv9hbqRNDRhZ/+XLi5+LkpN8/f7doQ5qPRQo=
Date: Mon, 22 Jun 2026 10:29:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: max9286: Add missing
 media_entity_cleanup()
Message-ID: <ajjyVMy3yRu7n7KE@zed>
References: <20260619100126.22197-7-birenpandya@gmail.com>
 <20260619100126.22197-9-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619100126.22197-9-birenpandya@gmail.com>

Hi Biren

On Fri, Jun 19, 2026 at 03:31:29PM +0530, Biren Pandya wrote:
> The probe error paths and unregister function are missing calls to
> media_entity_cleanup(). Add them to prevent memory leaks if pads
> are dynamically allocated.

I think the last phrase can be dropped. media_entity_cleanup() is a
nop.

>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/max9286.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index ac0712ce1e65..79eab9045e24 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1062,7 +1062,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  	priv->sd.state_lock = priv->ctrls.lock;
>  	ret = v4l2_subdev_init_finalize(&priv->sd);
>  	if (ret)
> -		goto err_async;
> +		goto err_entity;
>
>  	ret = v4l2_async_register_subdev(&priv->sd);
>  	if (ret < 0) {
> @@ -1074,6 +1074,8 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>
>  err_subdev:
>  	v4l2_subdev_cleanup(&priv->sd);
> +err_entity:
> +	media_entity_cleanup(&priv->sd.entity);
>  err_async:
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	max9286_v4l2_notifier_unregister(priv);
> @@ -1084,6 +1086,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
>  static void max9286_v4l2_unregister(struct max9286_priv *priv)
>  {
>  	v4l2_subdev_cleanup(&priv->sd);
> +	media_entity_cleanup(&priv->sd.entity);
>  	v4l2_ctrl_handler_free(&priv->ctrls);
>  	v4l2_async_unregister_subdev(&priv->sd);
>  	max9286_v4l2_notifier_unregister(priv);
> --
> 2.50.1 (Apple Git-155)
>
>
