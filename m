Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4C92EBB89
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672476; cv=none; b=B7NpbjC+xIi4mAQQI7IEk/8E5zeIPFLZIMkVMnggeCrBjRykNUOwlI4Zyo3dM6EM4fnTc0xe7iYDDXei7Xq1sdWOa48SFSNaPL6z4AEikCHIbULcPGdocV75DM5quS6Wpc+R5FmMNwAb/hUI8+f4YVtebNxllQ/5upQ/QYQJuLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672476; c=relaxed/simple;
	bh=l1HRlVFJssg3uHFqoGtWTTcC5MNCK8mpeRbVnrsXbh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHl6ORcV6nUFvNZSAV4D3vY3w4TI9GXzKL6pKshxe9bFcExAO2fwalutYxcu7P/BycsHgyORv9MmPqsrbdYrpo21G9IMYiYKDocbttiddPa0A6RMmxD2aBeBCxQ8fTg8p2BGBuHtdVEWlR5v3HbBx5aIGXTfsV0PXs2Z92kQnWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J5Vgmx2c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J5Vgmx2c"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 49527B1A;
	Mon, 16 Mar 2026 15:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672401;
	bh=l1HRlVFJssg3uHFqoGtWTTcC5MNCK8mpeRbVnrsXbh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5Vgmx2cOLKPcqHKrIsTbfitiHSs+xMWlkwMrEPO02GSUVM6FoWTUtJWmAYoP6IQ5
	 zc5RfpR2VNlD6e/iDV5K0inChz6RXT6H8LK37BYHLYIquqTvtc4tC7yv9i1EbKCoTh
	 MjxpLxvkSgDh5C7vYg+YUUkd/BQgIxq9dAebf6rU=
Date: Mon, 16 Mar 2026 16:47:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 07/11] Arrange headers alphabetically
Message-ID: <20260316144751.GI31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-8-sakari.ailus@linux.intel.com>

On Tue, Mar 10, 2026 at 10:46:13AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index bb9a2d576969..0e0a5b1e63e9 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -25,13 +25,13 @@
>  
>  #include <ctype.h>
>  #include <getopt.h>
> +#include <limits.h>
>  #include <stdio.h>
>  #include <stdint.h>
>  #include <stdlib.h>
>  #include <unistd.h>

Interesting... :-)

>  #include <string.h>
>  #include <sys/types.h>
> -#include <limits.h>
>  #include <linux/videodev2.h>
>  #include "utils.h"
>  #include "raw_to_rgb.h"

-- 
Regards,

Laurent Pinchart
