Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA8337BA0;
	Sun,  5 Apr 2026 21:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775424026; cv=none; b=BdoK+FDyvs8MRmNHAxHcErZIfpe9MNrmWKSe/z76UZi5fCK+PYmBJxa+w5MGS4yt+jE7c2c4ydoEBDABJEYZEE9BN+j7ykHuVs+y4y+9M+uQqQbeRRwGuMTGMNhOc/NMQmHeAsQHhbLMT3TBPajOfaqiWN3jMB17ITXmjUNBeBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775424026; c=relaxed/simple;
	bh=7ZqUSsS3QkoYDVPSPodTxrKn2K/MMsb/6JT93sPIFsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGjXLdUVAU+273RpdFkc4dAzsPH38L/JnkCGIidP889Npwc7KJJjbxXl4O7hQxsETCsmfJHNRn5bSPHNA3+d1AVvNQzPUZP9NJUhu9fwrevmNYhiRITMC6yKv9Fpq7YN+rDrQoxbhmawBooeqiFCWp7urNdLVbAPQPonivGvnsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jmIR6nlZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jmIR6nlZ"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CFCAC6AF;
	Sun,  5 Apr 2026 23:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775423936;
	bh=7ZqUSsS3QkoYDVPSPodTxrKn2K/MMsb/6JT93sPIFsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmIR6nlZ5JoXv0ID0wjebuYuVRuUW1kVvVWxoJRX8KG8zRjfnCP+iEVdOBC32FKmF
	 Ltji1gPC4X5N9ctMIHoVHhkeNdzLQ6Glhi6m5SFpRevn4CX1NuJRUiuBI5TtKmrTxk
	 u7oxpN7bS2pI0N88cDFkvHXZtYWyy+CSKW3Qp+H8=
Date: Mon, 6 Apr 2026 00:20:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep
 assertion
Message-ID: <20260405212020.GG1213462@killaraus.ideasonboard.com>
References: <20260404141226.77477-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404141226.77477-1-nueralspacetech@gmail.com>

On Sat, Apr 04, 2026 at 07:42:26PM +0530, Sunny Patel wrote:

Missing commit message. Please read
Documentation/process/submitting-patches.rst

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 32e6f60e26c7..4616e9280a28 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> -	lockdep_assert_held(state->lock);
> -
>  	if (state->pads) {
>  		if (stream)
>  			return NULL;

-- 
Regards,

Laurent Pinchart
