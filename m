Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F218A6CF
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 23:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771372786; cv=none; b=pHdwmDXXSgoSO7i78yznivXjmNkW+L1iBJPnoM5vrD6voyFrF8SqsdkPxReAn1e4OhIGqrL+J623ENmw32paAsYyvpviKXdUhFer+ZHmroyZKpzQd8Y6bzBCvDmH+V0b/WwuoPs3+lbbscrDRcM71SHmTy6AP/2R0tu1EMPwA24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771372786; c=relaxed/simple;
	bh=SPi9YoxXyywCBotPG1CnNm1mvFWyKh/FlWmCUuRHCI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOnDZRzACksv+yv1o4MetX/mO39UgSj4qUTtdfYtLwqAmlMgeFJ60pze2IOh55MuBSTLtV4OTmttahjQPtOiX8iKh8kjuMwkmV7iSpu0a0UO7LBkOzvR6U4i13AbaCIcQvouBYdeuOC8MDT6jxwLaJVttxGlE+QglHLwJGTwf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u8qwf/T5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u8qwf/T5"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a02:a03f:a440:2900:9751:ae5e:a777:a318])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3D2C555C;
	Wed, 18 Feb 2026 00:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771372723;
	bh=SPi9YoxXyywCBotPG1CnNm1mvFWyKh/FlWmCUuRHCI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8qwf/T51BMY+nlmXMSl2Yf+JgfNq6V8LAENvmiypCg6KE+eIyxPQVUFmSMtEP+0p
	 tT3wbr98UqtmaMHCZFAOMXrw+CP9EbVfJl6er5mYktN4pRu0/Pg008bZw6Yjzp2DbT
	 ITx/W62EOUN/Ns8mu4Mt6WPQND59ML7sqj5D9WOw=
Date: Wed, 18 Feb 2026 00:59:33 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH 1/2] Add compiler options to avoid warnings
Message-ID: <20260217235933.GD18192@killaraus.ideasonboard.com>
References: <20260217214435.2431864-1-sakari.ailus@linux.intel.com>
 <20260217214435.2431864-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217214435.2431864-2-sakari.ailus@linux.intel.com>

On Tue, Feb 17, 2026 at 11:44:34PM +0200, Sakari Ailus wrote:
> Add -Wno-missing-field-initializers and -Wno-implicit-fallthrough options

How about fixing the implicit fallthrough occurrences ? :-)

> to avoid warnings on modern GCC.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab363501a212..8a612710ee2e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,7 +1,7 @@
>  CROSS_COMPILE ?=
>  
>  CC	:= $(CROSS_COMPILE)gcc
> -CFLAGS	?= -O2 -W -Wall -Iinclude
> +CFLAGS	?= -O2 -W -Wall -Iinclude -Wno-missing-field-initializers -Wno-implicit-fallthrough
>  LDFLAGS	?=
>  
>  %.o : %.c

-- 
Regards,

Laurent Pinchart
