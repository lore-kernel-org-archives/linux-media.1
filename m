Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5E27EFEE
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671325; cv=none; b=ZMFVWvlDQ+PmyKGQzM3nLO+RGQXgM9hy8lJWeOKtII6hrvIqr/Cp+bLsqULXsIkgvTNXKL82nMTFi23aotWggoLID+LPrsXaH853ZqQYDGmdFBAMw0mXIihvYVXQpR6EFAM/FQixXCkJKeSI/2k+H0glWkXYjgUBY7Yl1Tkiy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671325; c=relaxed/simple;
	bh=G617Dx75gjZIghL4p9Uz5B7z38IBN+1JrmeUvWvRw68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG7V+I8bNPeOnDcdbhQBVo8T12K+VC/RzfX+jHmClcMNu6IF8QnDBiQHfmsiw0v+74Yf5og09anyFyAd0C3pjFx44hmyhIQbBfnpXEUInF1TErXQUB1eVSXgboGdaL1ioBTq+7yk/oUcAAFR7vUG0SmxvIWdlAP+LButNuPEyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PNCBg6w+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PNCBg6w+"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D5A6B1A;
	Mon, 16 Mar 2026 15:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773671251;
	bh=G617Dx75gjZIghL4p9Uz5B7z38IBN+1JrmeUvWvRw68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNCBg6w+M5dyMGadmsLlo4n6+zTmj7K31RdhO+ScjLkKnvgJEUZgfX9yQbRsgsD05
	 YDYN43NgOHS8eY6cdRLC1ZHrezewIvq+CJ7lYSs0cfHWvA88MxW2W/ukebdW79/MED
	 T/2G8KiT4qAj6x3vUm3XtX509/jnsjkCPXmoAFXA=
Date: Mon, 16 Mar 2026 16:28:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 02/11] Add compiler options to avoid
 warnings
Message-ID: <20260316142841.GC31616@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-3-sakari.ailus@linux.intel.com>

On Tue, Mar 10, 2026 at 10:46:08AM +0200, Sakari Ailus wrote:
> Add -Wno-missing-field-initializers option to avoid warnings on modern
> GCC.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab363501a212..7545682dbcce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  CROSS_COMPILE ?=
>  
>  CC	:= $(CROSS_COMPILE)gcc
> -CFLAGS	?= -O2 -W -Wall -Iinclude
> +CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers
>  LDFLAGS	?=
>  
>  %.o : %.c

-- 
Regards,

Laurent Pinchart
