Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684732517A5;
	Tue,  7 Apr 2026 07:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548002; cv=none; b=fd1SrQ4UZ9tumxVNATotaA6kP+JARmk0s6F7l4Wi0GOwaRY1f+rEDpysuOV0GQbH6naWrGG7bGBytGDgb7fjHDxcFrd5HQpPY10PDVIlRwPbpzTLgSSB61Z3OO0eeczebtG1LBEzRyfdwLuD7qir6awW7Zd7Cr7XtoOeWatObLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548002; c=relaxed/simple;
	bh=fwmwDOFU2+YE8aiMHVAufztBoq3lmBfqy29buAEJQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXgSHat+EiHQuna8MclVhL00JP1BcwCD39DNPrLsvQbaw7Oq2br4e9VDAPWq2hRdvn+ZJTuQToRlnn4+gVNqH/gISIdGXDDjHeoww01t4c1DCrQAJWCNyD+PKcMdnkgCR1DgfVJnTlaHM6G3e/LxSI6XTz21ycXHkwUpEfEJwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r5WkBJA5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r5WkBJA5"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DF00863C;
	Tue,  7 Apr 2026 09:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775547911;
	bh=fwmwDOFU2+YE8aiMHVAufztBoq3lmBfqy29buAEJQg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r5WkBJA5ix5A/tpOUcD1/QR2myPd/Z/ZIpj6UA7qc95f8uqr3He114rNstLKUAsy6
	 nqXHQVKGYuYt3ZPQClTdvUwd7qdFcwO38yaO1YRR1lhvN7glnoN2B8u3WfchHvB7Te
	 L/dBcODn43/yLZDN3HTXOFz3dljDOcKyblt/GVTY=
Date: Tue, 7 Apr 2026 10:46:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: v4l2-core: Removed duplicate lockdep assertion
Message-ID: <20260407074636.GA1214579@killaraus.ideasonboard.com>
References: <20260406122346.GA1268443@killaraus.ideasonboard.com>
 <20260407053947.9113-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407053947.9113-1-nueralspacetech@gmail.com>

There was a review comment in the previous version of this patch and you
didn't take it into account. Please reply to it and explain why.

On Tue, Apr 07, 2026 at 11:09:46AM +0530, Sunny Patel wrote:
> The __v4l2_subdev_state_get_interval() function has a duplicate
> lockdep_assert_held() call. Removed the redundant assertion.
> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
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
