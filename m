Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB91303A35
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672876; cv=none; b=pr9+aPZW9ctbS1YhDkos64jlGyC45vcDPOafbJRazJ/kJyM8AflddkKJRZ3Fom7HxF968ZzpYAroR6v098xpXgVmnUsNqXpx/r2dFaT7WStEEoshEPPuDpadboiUTTCvRYl512mTejKgVozoL7RWaAej5+xTznFA4FzirbLZ8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672876; c=relaxed/simple;
	bh=/zEZFk0TW3uBzVcS4ULOJaV/LoD7I5w0ETpi03eLYmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoaF65K/ioGbPnmlYYV7MZFUCLW+383sOQ8OWJHCGdq/B6hExUQJHZabLVSMvkGACuqtOepv+5tP2IRHmKKLpps5NZgFXtpqpHNbrCuToczNtASAmGijwDcJ9cAWmDbR11nrZLpwsgF/s2SLnyHroB0StdLf29FC496E+zhR8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a1bTzy/5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a1bTzy/5"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D6067B1A;
	Mon, 16 Mar 2026 15:53:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773672802;
	bh=/zEZFk0TW3uBzVcS4ULOJaV/LoD7I5w0ETpi03eLYmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a1bTzy/5Tqb32O9XBI/Ii4468y5meGiGeZyMRA8sKLqBBmz9YeH7Jm1UyGQ57Hjvq
	 Fu0D5D0fU2RX8qKA+/CJt9vtT53xdW+oKU7gVCqJ0IE5lI4Cv55WUI0fcah2rR+Ysa
	 F3bZIZ+qehxahBhYJbvzQhbSr/e2xrNd4qbHJ5GI=
Date: Mon, 16 Mar 2026 16:54:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 09/11] Improve input validation
Message-ID: <20260316145431.GK31604@killaraus.ideasonboard.com>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310084615.1183141-10-sakari.ailus@linux.intel.com>

On Tue, Mar 10, 2026 at 10:46:15AM +0200, Sakari Ailus wrote:
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  raw2rgbpnm.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> index 9ec9f06de052..4b7fa0e18f9b 100644
> --- a/raw2rgbpnm.c
> +++ b/raw2rgbpnm.c
> @@ -153,7 +153,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int width,
>  	if (!f) error("fopen failed");
>  	int r = fseek(f, 0, SEEK_END);
>  	if (r!=0) error("fseek");
> -	int file_size = ftell(f);
> +	long file_size = ftell(f);
>  	if (file_size==-1) error("ftell");
>  	r = fseek(f, 0, SEEK_SET);
>  	if (r!=0) error("fseek");
> @@ -163,13 +163,22 @@ static unsigned char *read_raw_data(char *filename, unsigned int width,
>  		height *= info->planes;
>  	}
>  
> -	if (file_size*8 < width*height*bpp) error("out of input data");
> -	if (file_size*8 > width*height*bpp) printf("warning: too large image file\n");
> +	if (!width || UINT_MAX / width / MAX(8, bpp) < height)
> +		error("width or height is bad");

The message isn't very explicit, but I suppose that no valid usage
should lead to this.

> +	line_length = line_length ?: (width * bpp + 7) / 8;
> +	if (!line_length || UINT_MAX / line_length < height ||
> +	    line_length < width * bpp / 8)
> +		error("line_length is bad");

line_length is an internal variable, I'd write stride here.

> +	if (file_size > UINT_MAX)
> +		error("too large file");
> +	if ((unsigned int)file_size < line_length * height)
> +		error("out of input data");
> +	if ((unsigned int)file_size > line_length * height)
> +		printf("warning: too large image file\n");
>  	if (file_size % height == 0) {
> -		line_length = width * bpp / 8;
>  		padding = file_size / height - line_length;
>  		printf("%u padding bytes detected at end of line\n", padding);
> -	} else if ((file_size * 8) % (width * height * bpp) != 0) {
> +	} else if ((file_size * 8) % (line_length * height) != 0) {

I think you need to drop the * 8 here.

>  		printf("warning: input size not multiple of frame size\n");
>  	}
>  

-- 
Regards,

Laurent Pinchart
