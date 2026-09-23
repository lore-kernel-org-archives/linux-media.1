Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA653361DA7
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144630; cv=none; b=uCWxKl9lZx/RoakbqRQN0+hJq+lGD0ozjtcaSTmCtpLfz6UG9I264YRYvU8MUlJj1LhvNt4Dy/lrHHbNjpcDRE+I4Sp4e5Hw3fXCWIr+4EyFWWaNV9ETdneavHxqx6H/PaXPJgJ6UV8jso5Kh+k7Xr5X7anU3vdWBT9Vg9A8+nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144630; c=relaxed/simple;
	bh=VrjGXaUYWJUkEgpRyB/P9wZq8yVsJVkYBMfruW3kEr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZh3lfkL+CGWIuKbKYFv0OyZhhsc8tBtIuOMBm0eGZWHl/R4rhLRmjp/qH2dxTPEo/iFJt7xOjYU57iEMPxPdZYDuTkvFoVo7Xc0MCWa7DbOKtyJJk58NwyZv2QxFZToRGqNgWGPD6yezC5UmPBfA9rIQkr5HyiqsSUw63xW3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ffwypWTA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ffwypWTA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F4B2A25;
	Wed, 23 Sep 2026 08:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790144518;
	bh=VrjGXaUYWJUkEgpRyB/P9wZq8yVsJVkYBMfruW3kEr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffwypWTAAY594MPLq9J0x+Qocy6UMtBmkhluva+xBwoxJovLNrqhOWiB2ew4J3hwe
	 B4aGOzLndoEfFxevMVIsZA6e6fTjAnwLLRIbmudYuBxiC2DC5nAvCAjLrk/L8ZNijx
	 496C3t2rCv0ptHTobmFJZs+1Y68BiUd2vsYKcefg=
Date: Wed, 23 Sep 2026 09:23:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [raw2rgbpnm] [PATCH] meson: Fix license to match C files
Message-ID: <20260923062343.GA18141@killaraus.ideasonboard.com>
References: <20260921101704.3052292-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921101704.3052292-1-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Mon, Sep 21, 2026 at 07:16:54PM +0900, Paul Elder wrote:
> The license of raw2rgbpnm is GPL-2.0-only, while the meson mistakenly
> declared GPL 2.0+. Fix this.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Oops.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 4fba1229b691..aa34af767b89 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -7,7 +7,7 @@ project('raw2rgbpnm', 'c',
>          'werror=true',
>          'warning_level=2',
>      ],
> -    license : 'GPL 2.0+')
> +    license : 'GPL-2.0-only')
>  
>  #
>  # Configure the build environment

-- 
Regards,

Laurent Pinchart
