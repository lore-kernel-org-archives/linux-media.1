Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389003;
	b=gjOj+IMYcuYpw1pMCDeRRVpx0Wj/fF5Me79/Q1RpQYH42VEMK0Sm+32WCQYdmTmNihD5
	 B3lfJFR6AaFpD1ZyS4eK0qzbWfAHhQ89iZzjW+j2v3OUw1SBM0uUI953EvLClUTFYusom
	 vjoXDq1GEps8patpaGF5SYPaKRzKKsc7OrHafulKwu+MWzhtCCjwQi+eJVBLWEbbch5t1
	 0y/dbKiEmS7/tkq78cpXpLDJJ46Bnq5B4q5cRl+coeGsTyUNQe+kiDcZz6apby9vmZvbu
	 soUcl9BJsZFhDdiE+9tjWxdSYyuptyzr5Zg1OIRGeik9RrLu7q1orr7CnYRa1Ni0TUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oKq4wmLB7jL1xV/9HC9L3HhymQhzzg0CEQzsMgC5bRI=;
	b=lDxUo4qDGiyUrlWQO1jzfZXU60xwX8Jby9IwOwVQvkDDuiKWPy0HZqve50NIUnL5g2OO
	 dSFkXmz76a919P5XNF0GosjfUtPKugueyuUjXD1lPvEg79YzMppge7fDyNQ/Sw5bXH9Wv
	 l56djgmHSSkY0tRmfLXFcsgoHPxqkz12BuehPysK57KqrWYpK8HC6TMyBPNZxmxeqrhDu
	 kr1eSz/x1XB9OL212xVCAMHChf48Q04/rOaMSDLLKvChGNL5tSRPjs7MdvtAe96iiGCuV
	 oKhM80p+Oevnt7QX43tfdtZmMx6R+86eAGbP/2Tua070HsvFWXPhBvnXx7Ejqab6hlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b="Eer/GrFs";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.185.170.37
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B0606A321
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 885B0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=Eer/GrFs
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4jPdNb1SNHz49Px4;
	Wed, 11 Nov 2026 11:23:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1794388991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oKq4wmLB7jL1xV/9HC9L3HhymQhzzg0CEQzsMgC5bRI=;
	b=Eer/GrFsdNpJIRdyJCbG9DvuxhFpLk6UdTqGdkm3AzQBXSvirNDLOID4b4MzO/PaftUdcd
	g9g1JmSbERhZhBBqCvUIaEJ5v8iSYE9s2gBcysIGuRKNzNCktzzxw7VdrUE7qo77qQooX+
	2Rr4zNlj+7SVinvec6E8CP+ow5FMLLvIsaGBjcfr3XLqY8bTLrDFtPyPfARQsURUhMaA+Q
	qDYHskrLIcRTqYGmdvbSIEtxoM33m/uG/0OzhzTsGxB4HolhMeAh4kw4Z3LlZ8R75JXkqf
	8a/xc18G7e8r/8s6POw7E1OJ9Ja1e5jkCGvFFYSgnISoq52zyJ0BdY3xq5qoJg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1794388991;
	b=Nm9WxeZ078QdsD/mci9BGSJy91Jzu0Pyvf5T7C3Q3STpg5PQp8q6pPoKkU8ffkK1664nJu
	+kz/pQUieN21e/YwK76Dnk7NWFCUyPc3euQg1FRaKTFk6pO9vBi+9U6fXliJAfKCKrvn2b
	MNXUdj2G+SusvZ6S9FoxH0Qw5hIDJRzF8/f9Xbi/z8SV2XOApdMyVHMplTMVre0weVs241
	3JMCpqGQ/aNST4rdSexmw0tQ1Ft+LLFixnOWsqOT8OATZ4PQzTtVgDt6xpzCDXSVoWjS66
	1UivZmrWqBTXcHwRcQTC+Tl7ZnyPv2vrrCeHa2g7Yo2rr+8Qh/Z4PiVRef5bvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1794388991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oKq4wmLB7jL1xV/9HC9L3HhymQhzzg0CEQzsMgC5bRI=;
	b=vwBOgzv+1KuXpZIRtI+y+2ISIcDEacnpdHxsJhdl53Aoubj6Ch30jqqq4X1fco+GG+ZVod
	gmH1kq9kqMhBgDjD6PqRr9/A8i5oCmRhlJ4ZCdEBtZndnlcg06h/5z7AoEaZlzi23zlkJK
	/IbYOPNy/OoaIsNiHykOq0psy1Jo74tQBg53JhFa8GR98h4w+BFs6c6Kp9+it/ZMRWJdHh
	BWifwL1RkG+HEuiC2SIE59hTaewHFrIi/7QjNycZ8D7TXxgHhKXjDG+UEVmvkPr0Sy2m+7
	Ne2L2UF9JGmBlZLEDwDwFeNVvJT0YwcznmItZEQ1SSQnK95hsUeZAX3n8O+FsA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A81D3634C4E;
	Wed, 11 Nov 2026 11:23:10 +0200 (EET)
Date: Wed, 11 Nov 2026 11:23:10 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm] [PATCH] Fix sign compare error when checking file
 size
Message-ID: <avQz_ma4DXEqwaWk@valkosipuli.retiisi.eu>
References: <20261111012621.1701729-1-paul.elder@ideasonboard.com>
 <20261111085014.GE86558@killaraus.ideasonboard.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111085014.GE86558@killaraus.ideasonboard.com>

Hi Paul, Laurent,

On Wed, Nov 11, 2026 at 10:50:14AM +0200, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 10:25:25AM +0900, Paul Elder wrote:
> > Fix the sign compare error when checking file size by casting the file
> > size returned by ftell to unsigned int, as it is a signed long being
> > compared against UINT_MAX.
> > 
> > This fixes the following compiler error:
> > 
> > FAILED: [code=1] raw2rgbpnm.p/raw2rgbpnm.c.o
> > /home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-gnueabi-gcc -Iraw2rgbpnm.p -I. -I.. -I../include -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Werror -O3 -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -MD -MQ raw2rgbpnm.p/raw2rgbpnm.c.o -MF raw2rgbpnm.p/raw2rgbpnm.c.o.d -o raw2rgbpnm.p/raw2rgbpnm.c.o -c ../raw2rgbpnm.c
> > ../raw2rgbpnm.c: In function 'read_raw_data':
> > ../raw2rgbpnm.c:173:36: error: comparison of integer expressions of different signedness: 'unsigned int' and 'long int' [-Werror=sign-compare]
> >   173 |                 if (UINT_MAX / bpp < file_size)
> >       |                                    ^
> > ../raw2rgbpnm.c:185:23: error: comparison of integer expressions of different signedness: 'long int' and 'unsigned int' [-Werror=sign-compare]
> >   185 |         if (file_size > UINT_MAX)
> >       |                       ^
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> > I've been getting build failure reports from buildroot for this.
> > https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5/
> > ---
> >  raw2rgbpnm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > index 0c71be321746..39b186473624 100644
> > --- a/raw2rgbpnm.c
> > +++ b/raw2rgbpnm.c
> > @@ -170,7 +170,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> >  	}
> >  
> >  	if (!*height && line_length) {
> > -		if (UINT_MAX / bpp < file_size)
> > +		if (UINT_MAX / bpp < (unsigned int)file_size)
> >  			error("line length too large");
> >  		*height = file_size / line_length;
> >  		*width = line_length * 8 / bpp;
> > @@ -182,7 +182,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> >  	if (!line_length || UINT_MAX / line_length < *height ||
> >  	    line_length < *width * bpp / 8)
> >  		error("stride %u is bad", line_length);
> > -	if (file_size > UINT_MAX)
> > +	if ((unsigned int)file_size > UINT_MAX)

This will never be true, as an unsigned int won't be larger than UINT_MAX.
file_size is long so unsigned long would seem reasonable here. Although it
seems there was no bug here, it's just a compiler warning on what could
have been a bug...

> 
> A better option in my opinion is to turn file_size into an unsigned
> variable (after checking for errors from ftell()) and drop all the
> casts. There are already casts to unsigned int though, the cold is old,
> and there's little incentive in refactoring it extensively, so I think
> this patch is good enough.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  		error("too large file");
> >  	if ((unsigned int)file_size < line_length * *height)
> >  		error("out of input data");
> 

-- 
Regards,

Sakari Ailus
