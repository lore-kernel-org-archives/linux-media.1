Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389467;
	b=Gm6iw3ld52mSBP//AjQRoNQX8f8G/OvQsvqGBROfhUrt0FtM2hzU7kGyaaRU/YZl4HFx
	 IyL6BlHxALzKpd9d1qG8eh0QC12cBPMpyuBcdTDv2780X7gTA8/LAL1vdarrRFER1Fe7P
	 jjTWueZdfxrK0Tl4iBHGim9+hnc3ek8aR1SWplP5Jky+it0yY2+9j58+WetS2Fv6JPwUG
	 p70dk891CaZHOGPBnIMUizqVI6IEXSUYrrDmpGTsHvlhHB8p9KdvWDIuP2XnWltIMi3j9
	 zCh7yffB+5uWp3oZJs0lwY6nVXjbVKKtAieH/JrvsDt2iqIwq7qDylsznxv5z7BzEVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lFnAzFRLX5xmkDa2ystWO5mN4O1xvKLymwIsd+4d22M=;
	b=jKiUn5hHO8+3Kcs9+mS2/qECulBrwHN5DEAyNMMx8HwsdaKU0gyMHAe+g/5S+PUD6v3F
	 fFjtnmPpYCeatjFNwNZp4G9Ucnm8Fx1H0CSNI5VWjcgnDLdUPdHUM9FN/++7AJPKbpJW5
	 Sifrtf2a3YLEDOMHF61zlmuPJ7atXEE6Q+bJXAgdqcwEffkltlveAR4o7vTQ9lKlugEZk
	 4Lv4pcpBGhDkErSQGDEXIn9XOkCo3JYeuQLbvEBnKfnT4BmeU/qvnlFMeHvX6uxIcTEaW
	 mr2q1mRRNLYqqMtSfFmI5Ti77QrNGT6YBK1QSky4TLFSYc3tKmZCEL2XaWlNzn5Y+wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=iki.fi;
	spf=pass smtp.mailfrom=iki.fi;
	dkim=pass header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=cetVYQ6i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=195.140.195.201
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94E60A2610
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 09:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F94E60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=meesny header.b=cetVYQ6i
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4jPdYV321wzyWc;
	Wed, 11 Nov 2026 11:30:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1794389454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFnAzFRLX5xmkDa2ystWO5mN4O1xvKLymwIsd+4d22M=;
	b=cetVYQ6iVDSHf0wIxGRGnXl97IdohZGJ+EwowcGPs0osHW0FFHcq8mNzjc9yx2zV0mQe7E
	B6hue/nAROf7JzVBSuQ95QikVIQ8cIWAG4XwFqNKnOMEjjeWqGm6t50i1hRLmTrqz1VZAw
	RJQ1gKIxd/t/C1ags/MJzVRYbYrEJRY=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1794389454;
	b=vQ2v+PNPKw9qKqHXw4X8jM7ZmVZGdvUPNAXpH3GKDocWzpAbmiHcwb9dOJMkbWMqrBjEel
	m4fH8u9TQilmNoLHIEbi3rSkj4wAx64jnFc8obyTSEF09rWg9MfbbqbI3ChlEvNi8gbQcG
	b187DaCNjIKN3JO0RmRwx21/v/xMunI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1794389454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFnAzFRLX5xmkDa2ystWO5mN4O1xvKLymwIsd+4d22M=;
	b=dYX9VOQwCXqKBiANdTxvrfT5D23P2/KcyyXgd3U95BkbKX7TJmfiAJwo5AY24FFDJVICYy
	JXVWH6xNhArKuch1fjqCb9VHfpSYclVKbMmgYdSgbx0/Xj9egq3/JlnakveORqsIZnYMWm
	OK5SGkjsTK7Zqn75S36VgZTryMPXC54=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3117C634C4E;
	Wed, 11 Nov 2026 11:30:52 +0200 (EET)
Date: Wed, 11 Nov 2026 11:30:52 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: [raw2rgbpnm] [PATCH] Fix sign compare error when checking file
 size
Message-ID: <avQ1zEdWMBgmL9cW@valkosipuli.retiisi.eu>
References: <20261111012621.1701729-1-paul.elder@ideasonboard.com>
 <20261111085014.GE86558@killaraus.ideasonboard.com>
 <avQz_ma4DXEqwaWk@valkosipuli.retiisi.eu>
 <20261111092758.GF86558@killaraus.ideasonboard.com>
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
In-Reply-To: <20261111092758.GF86558@killaraus.ideasonboard.com>

On Wed, Nov 11, 2026 at 11:27:58AM +0200, Laurent Pinchart wrote:
> On Wed, Nov 11, 2026 at 11:23:10AM +0200, Sakari Ailus wrote:
> > On Wed, Nov 11, 2026 at 10:50:14AM +0200, Laurent Pinchart wrote:
> > > On Wed, Nov 11, 2026 at 10:25:25AM +0900, Paul Elder wrote:
> > > > Fix the sign compare error when checking file size by casting the file
> > > > size returned by ftell to unsigned int, as it is a signed long being
> > > > compared against UINT_MAX.
> > > > 
> > > > This fixes the following compiler error:
> > > > 
> > > > FAILED: [code=1] raw2rgbpnm.p/raw2rgbpnm.c.o
> > > > /home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-gnueabi-gcc -Iraw2rgbpnm.p -I. -I.. -I../include -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Werror -O3 -Wno-missing-field-initializers -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -MD -MQ raw2rgbpnm.p/raw2rgbpnm.c.o -MF raw2rgbpnm.p/raw2rgbpnm.c.o.d -o raw2rgbpnm.p/raw2rgbpnm.c.o -c ../raw2rgbpnm.c
> > > > ../raw2rgbpnm.c: In function 'read_raw_data':
> > > > ../raw2rgbpnm.c:173:36: error: comparison of integer expressions of different signedness: 'unsigned int' and 'long int' [-Werror=sign-compare]
> > > >   173 |                 if (UINT_MAX / bpp < file_size)
> > > >       |                                    ^
> > > > ../raw2rgbpnm.c:185:23: error: comparison of integer expressions of different signedness: 'long int' and 'unsigned int' [-Werror=sign-compare]
> > > >   185 |         if (file_size > UINT_MAX)
> > > >       |                       ^
> > > > 
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > ---
> > > > I've been getting build failure reports from buildroot for this.
> > > > https://autobuild.buildroot.org/results/f1f070bc5ac72d8b0f2ed403273635b7459a9ae5/
> > > > ---
> > > >  raw2rgbpnm.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > > > index 0c71be321746..39b186473624 100644
> > > > --- a/raw2rgbpnm.c
> > > > +++ b/raw2rgbpnm.c
> > > > @@ -170,7 +170,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> > > >  	}
> > > >  
> > > >  	if (!*height && line_length) {
> > > > -		if (UINT_MAX / bpp < file_size)
> > > > +		if (UINT_MAX / bpp < (unsigned int)file_size)
> > > >  			error("line length too large");
> > > >  		*height = file_size / line_length;
> > > >  		*width = line_length * 8 / bpp;
> > > > @@ -182,7 +182,7 @@ static unsigned char *read_raw_data(char *filename, unsigned int *width,
> > > >  	if (!line_length || UINT_MAX / line_length < *height ||
> > > >  	    line_length < *width * bpp / 8)
> > > >  		error("stride %u is bad", line_length);
> > > > -	if (file_size > UINT_MAX)
> > > > +	if ((unsigned int)file_size > UINT_MAX)
> > 
> > This will never be true, as an unsigned int won't be larger than UINT_MAX.
> > file_size is long so unsigned long would seem reasonable here. Although it
> > seems there was no bug here, it's just a compiler warning on what could
> > have been a bug...
> 
> What's your preference to silence this warning ? Would you like a
> minimal change, or a larger cleanup ?

My suggestion was to use unsigned long instead of unsigned int.

In fact I'd move the file_size check above its first use while at it.

-- 
Sakari Ailus
