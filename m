Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943A330D3B;
	Mon,  6 Apr 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478231; cv=none; b=VUFEzyX59IpCfhtJJun4myIqbBhld7OwNjvAf9qISyirHNLLhbjRobqUUn6FEQhxq5g3DYHa7bzoA1qCghdEsW7lfOi+00zR3linj9F0CZT2jnGTXjbZUws2wGyA6G923ZyBPI5bULq8LkBMmqb3TflzmG/PXXYY/PBdf8g8Z50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478231; c=relaxed/simple;
	bh=CZ2TQtbJlcmSqkpVbwk3oMXkS75vL7hpvL/GOHfsj/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp1Ed5d22EUR1cAGwbjUb3WNPbgY0uUHXbaSsV7foAmHNUOJcL0jZaBZktnVfJmCgeFNXqOjDd7+6jGf/odC8VKU8oPJWBJlfWaivpqsrYEI100y38+BXqjZbwSkbwOxNmwfKX9wJxADbQhY5lcfww04eirRZ064VIeCsTb6Suk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OHfQfCiY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OHfQfCiY"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7FB5010D4;
	Mon,  6 Apr 2026 14:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775478141;
	bh=CZ2TQtbJlcmSqkpVbwk3oMXkS75vL7hpvL/GOHfsj/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHfQfCiYXWv+hidfsczBC05rToVqRW92Ozcak1jTsxGolmmqR/yWEy+IVgHLrmh7P
	 4Zw6gNhN762fMUrqQLAlGb2O2bkk3yV/FVmeNoMFlq8XB5Ld8im4JZyuwJPlbwqRFN
	 +MBLwL2QKckmta+GTkCWfn/xepA+9sk0jTc997j4=
Date: Mon, 6 Apr 2026 15:23:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep
 assertion
Message-ID: <20260406122346.GA1268443@killaraus.ideasonboard.com>
References: <20260405212020.GG1213462@killaraus.ideasonboard.com>
 <20260406095850.32732-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406095850.32732-1-nueralspacetech@gmail.com>

When submitting new versions of a patch (or patch series), please
remember to indicate the version in the subject line. The -v option to
git-format-patch helps.

On Mon, Apr 06, 2026 at 03:28:50PM +0530, Sunny Patel wrote:
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

Why do you remove this assertion and not the next one ?

>  	if (state->pads) {
>  		if (stream)
>  			return NULL;

-- 
Regards,

Laurent Pinchart
