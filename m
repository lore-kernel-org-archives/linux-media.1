Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFA37C0F9
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745074; cv=none; b=tzcL7bpjB4qaIa0x5WqI6D18r/OPmeC6a0WsdWMxTjUDNVVLic8/TM/1d/nkPFfLf8frOEBfsbQUeE58isRnfsP+yZPZ3gtpK4JP+FH+4UEClmarLLtdQiX9bbiXqr6Eo6zKUulN3ux4/ItE06JJPeiaHguiGof+n/JwwbJLePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745074; c=relaxed/simple;
	bh=1bMJuMBJJhL47u2lyL1Z6DcjHIi14k3lmMlT6iLCpzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3ERoIR4tKbVil899FG1XMJA4u8YNMhyzpHw6NjfVBvttVud3f+lGmPjTCD+UZNJ2XZMV5iWJ5iZnsySUQ4WWY8ih9EklQhAMZgL2gt7aecn7UAiaQB8WhGPDGYA1ek8js9maO5AUQ8M2mtO4cJA/jkL7GxC97Z0ri9dYHna8m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nnEa+te3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nnEa+te3"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BA3EC308;
	Tue, 17 Mar 2026 11:56:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773744999;
	bh=1bMJuMBJJhL47u2lyL1Z6DcjHIi14k3lmMlT6iLCpzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnEa+te3+XiO0aYaOz2unt+S5grLgAhHA3VW/LAF9eeN0AKd0g1dPzrQHKYwEwLj8
	 8BAhblRJubPGWDjt9768oHiw4VKXGDquzE+o9YiLbb6O1drS56JrswSH2VPbofMPKl
	 OxAaotHFl+1Xk0g/2cM0I55z5f72pRRzX5W7/ypc=
Date: Tue, 17 Mar 2026 12:57:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 7/7] Fix file size check
Message-ID: <20260317105750.GH302774@killaraus.ideasonboard.com>
References: <20260317095802.214532-1-sakari.ailus@linux.intel.com>
 <20260317095802.214532-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317095802.214532-8-sakari.ailus@linux.intel.com>

On Tue, Mar 17, 2026 at 11:58:02AM +0200, Sakari Ailus wrote:
> The file size was unintentionally multiplied by 8 and that's not right
> anymore due to changes elsewhere.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: 578f7012a851 ("Improve input validation")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  raw2rgbpnm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 3b92c6ba519b..49b8071b299e 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -187,7 +187,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
>  	if (file_size % *height == 0) {
>  		padding = file_size / *height - line_length;
>  		printf("%u padding bytes detected at end of line\n", padding);
> -	} else if ((file_size * 8) % (line_length * *height) != 0) {
> +	} else if (file_size % (line_length * *height) != 0) {
>  		printf("warning: input size not multiple of frame size\n");
>  	}
>  

-- 
Regards,

Laurent Pinchart
