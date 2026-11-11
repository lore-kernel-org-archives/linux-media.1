Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387019;
	b=q1qOjHzexdD44yOTyHKE/uI6YlAN8y6x9UnPBCzHqbzNRRe9okJv+BYwID7dZTmlvkJb
	 Y3ZqDrqctunycSaGcGNX0ZSdLVjFNxsW+3f/a/v8TlipX9w/ZdJQ6t6ylflakbkZYMoQV
	 xIRs36aLkMK2yMJ97aeipuZYlALUJJewCdnznjaWjgvQJM9wKvJgBValJPbmNmasHibhg
	 Neh5fjVFbqRxsrZvLpgXMDr7PYyhNqk+PasHHvRGiYtr3NnuRWTm8Kmfzs7N5qbjcjpIn
	 U9OiqiIoBbtQNH6COqwxq/veFGZkooAotufU2e4mw7A+X1/B9QE7623nHGG0i/B/gnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387019;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VIM4XPthKQfQ937Qz6fiR6JtTUPN7bkzBu35LVSkQLo=;
	b=COcuItfSGfkyUPPn5Nz8TmwSh96Lg+Lq4iFZFZQb6PDs3TMA65vMGR1DsWzP0m0ktZeA
	 CZkpR0s5fCqkyoG0bWH88FSx4BkcN+iRk4gyXUQDAp30pcvT6V9zIsPraIPUrAy6zwtKp
	 g9DwNx4XoThG0FsK8JoslwNIx3TSNh8bJChiR309fdAmhAZQZQ9qF8ezYAyNgRlFMmBi7
	 QU9+ISPBRzyNXEoZBupELhExNHU2sq3IOrTpEaNE4SCgIZw+AOXpna4Q0C4q+bFuv0lwZ
	 wqhRE6w11/abMPk+sn6VejiXdytDHUAHQPQ+BzzYzEDVJlmMR9hkO4T7Gsxi0J0ljZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VdtKTaqP;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9912B606A326
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 08:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9912B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=VdtKTaqP
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F1868FD;
	Wed, 11 Nov 2026 09:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794386873;
	bh=L5+8RhC6nnO3xEPkp9tozlc+aosDMyzlxHF9ENYU7RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdtKTaqPqXUhVe7qXU0uYo4nEvFYVaJUoAJ8WD3zmrAq+ukjLU67y5aPTci8ho8qI
	 NAhXDJHQMpj3plWLdzra3Zzkhg4HongFGVvT6Y0vAeLMHKJNUfqbW7ymeOvC0+49AS
	 /cC7SdPkEF8X/wPKJG4jsHdP31GPzPb0/yq84dnY=
Date: Wed, 11 Nov 2026 10:50:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [raw2rgbpnm] [PATCH] Fix sign compare error when checking file
 size
Message-ID: <20261111085014.GE86558@killaraus.ideasonboard.com>
References: <20261111012621.1701729-1-paul.elder@ideasonboard.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111012621.1701729-1-paul.elder@ideasonboard.com>

On Wed, Nov 11, 2026 at 10:25:25AM +0900, Paul Elder wrote:
> Fix the sign compare error when checking file size by casting the file
> size returned by ftell to unsigned int, as it is a signed long being
> compared against UINT_MAX.
> 
> This fixes the following compiler error:
> 
> FAILED: [code=1] raw2rgbpnm.p/raw2rgbpnm.c.o
> /home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-gnueabi-gcc -Iraw2rgbpnm.p -I. -I.. -I../include -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Werror -O3 -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -MD -MQ raw2rgbpnm.p/raw2rgbpnm.c.o -MF raw2rgbpnm.p/raw2rgbpnm.c.o.d -o raw2rgbpnm.p/raw2rgbpnm.c.o -c ../raw2rgbpnm.c
> ../raw2rgbpnm.c: In function 'read_raw_data':
> ../raw2rgbpnm.c:173:36: error: comparison of integer expressions of different signedness: 'unsigned int' and 'long int' [-Werror=sign-compare]
>   173 |                 if (UINT_MAX / bpp < file_size)
>       |                                    ^
> ../raw2rgbpnm.c:185:23: error: comparison of integer expressions of different signedness: 'long int' and 'unsigned int' [-Werror=sign-compare]
>   185 |         if (file_size > UINT_MAX)
>       |                       ^
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
> I've been getting build failure reports from buildroot for this.
> https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5/
> ---
>  raw2rgbpnm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 0c71be321746..39b186473624 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -170,7 +170,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
>  	}
>  
>  	if (!*height && line_length) {
> -		if (UINT_MAX / bpp < file_size)
> +		if (UINT_MAX / bpp < (unsigned int)file_size)
>  			error("line length too large");
>  		*height = file_size / line_length;
>  		*width = line_length * 8 / bpp;
> @@ -182,7 +182,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
>  	if (!line_length || UINT_MAX / line_length < *height ||
>  	    line_length < *width * bpp / 8)
>  		error("stride %u is bad", line_length);
> -	if (file_size > UINT_MAX)
> +	if ((unsigned int)file_size > UINT_MAX)

A better option in my opinion is to turn file_size into an unsigned
variable (after checking for errors from ftell()) and drop all the
casts. There are already casts to unsigned int though, the cold is old,
and there's little incentive in refactoring it extensively, so I think
this patch is good enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		error("too large file");
>  	if ((unsigned int)file_size < line_length * *height)
>  		error("out of input data");

-- 
Regards,

Laurent Pinchart
