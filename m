Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DA372B2B
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744915; cv=none; b=Qp2jU1Ndh2hYO7kgl0iHLGfSPvLj62ZxM3K9brzjr00dLBrSFnqZ6vR+InJHuI2KlJcMhEcMTNYVm7W8d3WT8QPfHYPWfKXsAvxOp99KAw//XuYhuiHmk/Rmpv76XZW0zeIwMWFG5avRFSAnrioaLP1eRPZG/IYLfIj5F8JSaG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744915; c=relaxed/simple;
	bh=ft5QcY36eVrFuWba9K8Ox9wENIIqqQItueXrl+NEpDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDV0EM//0B0pnQudlx4Oh9Ia7Wxa6++8tcF0R2suj8y5huBqYB5hdjTAjs7LErC7QFdJ081nWedtayH4NYIegM2g/MkC5pl4XJRnl+X3bMEHzQEgoB6J8wfcxTGwXVShdPwS9GoQeOB/OnOvyyjuKi5O3/OSY0ovraJW4UIYEq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p/z5q0/Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p/z5q0/Y"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A548D593;
	Tue, 17 Mar 2026 11:54:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744840;
	bh=ft5QcY36eVrFuWba9K8Ox9wENIIqqQItueXrl+NEpDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/z5q0/Yu3yOcpfVOp1wzlgrChI4WKf7FQH88wmeUj7FRLoT5sWbi0Jc8JR8I/ve7
	 hurC3x4DerQDmHSem9/34avhjXt3MuJ/QVaiV7CNVdWA9F1km0zGnQHIHJLkPcgHWE
	 qdki57G/URHt5SsGqwGXB/3ZaTWPsZtSH7lmBZ8I=
Date: Tue, 17 Mar 2026 12:55:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 6/7] Use "stride" in a stride-related error message
 instead of an internal name
Message-ID: <20260317105511.GG302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-7-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-7-sakari.ailus@linux.intel.com>

On Tue, Mar 17, 2026 at 11:58:01AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index ef12be820be6..3b92c6ba519b 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -177,7 +177,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
>  	line_length = line_length ?: (*width * bpp + 7) / 8;
>  	if (!line_length || UINT_MAX / line_length < *height ||
>  	    line_length < *width * bpp / 8)
> -		error("line_length %u is bad", line_length);
> +		error("stride %u is bad", line_length);
>  	if (file_size > UINT_MAX)
>  		error("too large file");
>  	if ((unsigned int)file_size < line_length * *height)

-- 
Regards,

Laurent Pinchart
