Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369404;
	b=ILRUmRtWgeMEzpKl28JAb4UOlolAooTjz1z4OBNF7WDfKSt0+xVxG764kVevAv/duvTg
	 DnSujcAobZTvuGlmIVv4ZrlF+g3L5C3pHr7qq015kNYP1QqdmCS7OEhAxLa927PjjlBwC
	 6A6IQF3cGaxD+SaJ8d8brPN3MudqcfxcWCm+3rksleohTztJVGdLWNit9GJ6yKcgPefNV
	 JFrnWbECcMkARJw5+AgUdOGZhinX3u6DzrY/aZ1QpuLTrbMfLS3rT0HUkmXLZEPXqnUAX
	 bIxER9LOaHBA7FYWFNVE9dxVDJrjv9xUV7mkDiHuge0GiVmX/G+prqpzl99VOzv+FUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369404;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=H3cjYZ8RJkN5kaUpJvk9hhe9spH0ZMI4VyHWUWGa9/A=;
	b=wEDfWhkAX6xVWEa3l03SLEL56XxlOhkaaAdMWlGnEF7VQ6Flr0OADp0tnB9pf4Z7MgTG
	 +K7QRN6gAjA0xB+tIkKOnp2ESmedrotgk2FWu796hPwVFGDdBIELs7J2Hb/vLr6op+iL3
	 Wc6ncqlMeS3Vv1RrrGWT5dpnmj9uxKYzg+VFrHMXMsx75nFh2Yy4NLM4iEPyqLQyBd1BR
	 AvFxcl3JaZdivYxgh8bNfE7iGnbX06J+oAXJECic/eYsJZ24bRY7rGAGbICstMnHiu020
	 FDI+GlZjTl1dnMCYoy7TwymFZ0s7bAP8acgD6sYM5zgPc/aQdGIUzItbbQzsmabyDNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QJrRB9W2;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C462606A31A
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C462606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=QJrRB9W2
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 060384B0;
	Fri, 30 Oct 2026 15:07:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793369266;
	bh=i36pip5sGop6r9h/hnV6jR54jFYcXRUHprmX/0iX/uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJrRB9W2bzKdIPiQ5ew31bZ6FG5cF0XKjSTwHneUVw0W7UkZKYRYwwmZl3dtjkSEB
	 yzUHhRo9HMDeTNfJDiAXEgRP71M6zpl7TBtK/g7C8+Qz3U8yJKIH8jfbE+e3ZZ5vPg
	 CWsh9QA5bBf8kUJ0HCwpC7WrGSq9TR4OO0wLv1yc=
Date: Fri, 30 Oct 2026 16:09:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on
 buffer fields
Message-ID: <20261030140958.GB3109745@killaraus.ideasonboard.com>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
 <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
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
In-Reply-To: <auR63iwOm_mih97K@valkosipuli.retiisi.eu>

Hi Sakari,

On Fri, Oct 30, 2026 at 01:09:18PM +0200, Sakari Ailus wrote:
> On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
> > When an error occurs related to a captured buffer, hardware can produce
> > less data than expected (or no data at all), and timestamps may be
> > unreliable or unavailable if the device uses hardware timestamping.
> > Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > I've posted a corresponding fix to v4l2-compliance in [1] to relax the
> > bytesused and timestamp checks.
> > 
> > [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > index 94dc2719e907..5a7a1511cee7 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -503,6 +503,11 @@ Buffer Flags
> >  	streaming may continue as normal and the buffer may be reused
> >  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
> >  	called.
> > +
> > +	Depending on the type of error, the buffer may contain less or no
> > +	data. In such cases the ``bytesused`` field can be lower than expected,
> > +	including being zero. The ``timestamp`` field may also be zero or be
> > +	otherwise unreliable.
> 
> Could we say that if bytesused field is non-zero, then there is a
> timestamp, but when bytesused is zero, there's no data and probably no
> expectation of a valid timestamp either?

How about this?

	Depending on the type of error, the buffer may contain less data than
	expected, or no data at all. The ``bytesused`` field reflects that
	situation. When ``bytesused`` is zero, the ``timestamp`` field may be
	unreliable and may be zero.

> In the long run it would be probably nice to mandate the timestamp is zero
> or valid if there's no data. Drivers virtually always have an ability to
> get reliable timestamps or no timestamps at all, but unreliable timestamps
> shouldn't be used. This latter bit would be of course hard to enforce on
> existing drivers.

-- 
Regards,

Laurent Pinchart
