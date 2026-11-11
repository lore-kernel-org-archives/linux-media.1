Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389282;
	b=1a+RqW1C4Y1C+kVOgjwyIsISWzsKx8aW6nsfRhMKWp71QzfWHCUxiCjTYOyrkV9I0h2P
	 dgBx6Jiuub7NdMaOHu4tMipwOHHtpmgpnbQK9qfxzU7YIfB0D6jKRFvoSQADlv5NIy3Pv
	 ZiNyMStVxW6OskOUhVBr69X7kqKez7CT/3+wN0xGb39hTlEpTFvgowVcc4TD1Ht/SekR0
	 tdsOF6nkpt6gGWqoQfAP/QlF491zvK5EJj0FjUos//Jbt1nnkOwyN8cLDpj3vLwVV0ec6
	 Detb05mVab6XaGPFOr4S3BVrNGDlrpAY/kLwvLgb1IrA5212161mdtBNaID85E0hQ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389282;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=orFkrkq+5c3d0t0vQZc0bg+eHBlx+/0yRXBImM6McQA=;
	b=TgP9bOf5aSMwiahTUh40KYNQGhTQwxP14kBMOIGaYn3bBIpepqqkGSrT5bFV8aV8Vzsq
	 Q7+m1+3t8Dw/jjPHD4WjEgTjaoc4bVg2NGkgEEMmdJT52DljXRF84gVfEnqgPp7zyzzW9
	 H2o+NMw7tK6FaxKRMvEBY4yAuDudmFQ5cLpMzyftonUdh4bAyrk/zkzui1J/Nu9kAFaGk
	 lBNaGld2wa02q3HIOBI50LSN8qCb+NAhlpEl3/KjqDhUz00pmaQqK7gvzyIDscZdaELJj
	 MGCQB8w7vzhwsh2ZlHSgJHFTDLQ2s+GwT8Zj+6plCZzwRYjK1c8j/ahfkDEwJbHcnnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KZ3dJXXV;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15095606A32E
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15095606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KZ3dJXXV
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B07A8FD;
	Wed, 11 Nov 2026 10:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794389137;
	bh=hU81ZzCQMnV10WkLb0JKAwC8fwizEz1FBpEUP0cXPPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZ3dJXXVIE9CEMMrKLJFRowmFmgqp0O1U020OMWVu642gAzDuLMjqGmAWjQjJG74w
	 zXFGXFq/xMgU8Yxl7dfr97PHqM56oKOt2sYKEC5KjmJz3gq1GeNjVtUwDc3DRBYrHM
	 TKOA2WtMm/edaRTrlDIv00YZp88+VaLdqq3NHatw=
Date: Wed, 11 Nov 2026 11:27:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm] [PATCH] Fix sign compare error when checking file
 size
Message-ID: <20261111092758.GF86558@killaraus.ideasonboard.com>
References: <20261111012621.1701729-1-paul.elder@ideasonboard.com>
 <20261111085014.GE86558@killaraus.ideasonboard.com>
 <avQz_ma4DXEqwaWk@valkosipuli.retiisi.eu>
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
In-Reply-To: <avQz_ma4DXEqwaWk@valkosipuli.retiisi.eu>

On Wed, Nov 11, 2026 at 11:23:10AM +0200, Sakari Ailus wrote:
> On Wed, Nov 11, 2026 at 10:50:14AM +0200, Laurent Pinchart wrote:
> > On Wed, Nov 11, 2026 at 10:25:25AM +0900, Paul Elder wrote:
> > > Fix the sign compare error when checking file size by casting the file
> > > size returned by ftell to unsigned int, as it is a signed long being
> > > compared against UINT_MAX.
> > > 
> > > This fixes the following compiler error:
> > > 
> > > FAILED: [code=1] raw2rgbpnm.p/raw2rgbpnm.c.o
> > > /home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-gnueabi-gcc -Iraw2rgbpnm.p -I. -I.. -I../include -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Werror -O3 -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -MD -MQ raw2rgbpnm.p/raw2rgbpnm.c.o -MF raw2rgbpnm.p/raw2rgbpnm.c.o.d -o raw2rgbpnm.p/raw2rgbpnm.c.o -c ../raw2rgbpnm.c
> > > ../raw2rgbpnm.c: In function 'read_raw_data':
> > > ../raw2rgbpnm.c:173:36: error: comparison of integer expressions of different signedness: 'unsigned int' and 'long int' [-Werror=sign-compare]
> > >   173 |                 if (UINT_MAX / bpp < file_size)
> > >       |                                    ^
> > > ../raw2rgbpnm.c:185:23: error: comparison of integer expressions of different signedness: 'long int' and 'unsigned int' [-Werror=sign-compare]
> > >   185 |         if (file_size > UINT_MAX)
> > >       |                       ^
> > > 
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > ---
> > > I've been getting build failure reports from buildroot for this.
> > > https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5/
> > > ---
> > >  raw2rgbpnm.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > > index 0c71be321746..39b186473624 100644
> > > --- a/raw2rgbpnm.c
> > > +++ b/raw2rgbpnm.c
> > > @@ -170,7 +170,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> > >  	}
> > >  
> > >  	if (!*height && line_length) {
> > > -		if (UINT_MAX / bpp < file_size)
> > > +		if (UINT_MAX / bpp < (unsigned int)file_size)
> > >  			error("line length too large");
> > >  		*height = file_size / line_length;
> > >  		*width = line_length * 8 / bpp;
> > > @@ -182,7 +182,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> > >  	if (!line_length || UINT_MAX / line_length < *height ||
> > >  	    line_length < *width * bpp / 8)
> > >  		error("stride %u is bad", line_length);
> > > -	if (file_size > UINT_MAX)
> > > +	if ((unsigned int)file_size > UINT_MAX)
> 
> This will never be true, as an unsigned int won't be larger than UINT_MAX.
> file_size is long so unsigned long would seem reasonable here. Although it
> seems there was no bug here, it's just a compiler warning on what could
> have been a bug...

What's your preference to silence this warning ? Would you like a
minimal change, or a larger cleanup ?

> > A better option in my opinion is to turn file_size into an unsigned
> > variable (after checking for errors from ftell()) and drop all the
> > casts. There are already casts to unsigned int though, the cold is old,
> > and there's little incentive in refactoring it extensively, so I think
> > this patch is good enough.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > >  		error("too large file");
> > >  	if ((unsigned int)file_size < line_length * *height)
> > >  		error("out of input data");

-- 
Regards,

Laurent Pinchart
