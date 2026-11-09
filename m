Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267200;
	b=Pjkmw80J1rKN5Mr046tXCJwqfeUqTyeIzhgYhPCMe6d8Aact+gj9GTDHMhjEAG1ps55/
	 +z1iOIwmwdnPS6+mJCc36mBagMPtnUgpTKVkkjotcmDsSw1tuTpVukmeHfLv6bkYUnCU5
	 U5y3DpLpCxbSwK2sR/zG66ScPoQ64Gfanj2vU6NrgPjRCzaTe35EVskTW3zq4bR+A0CjE
	 HhmCaRK8VzJexWqNnU2sk/oJXjzvLzpmf28lCNWWqT7DQnWgxesyHdsafrEB7Y5xQ553g
	 77N6ZPughyvIYux06NP7K+f8HKuCol+XxxypyMlB/fqvK566GSlSfAyNMzagNSwwYjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267200;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=i7SlRV1MdWG/+4eUN0UybyzUnUjM2xBaq8VCAdNH59I=;
	b=BtvcdMjwslmUf1BYYZxnVPe68ZwgwYejbSdlv1n3amkssHY5IRqGZ4ms57n/twx1y5Al
	 H02J97ffVhxTxX8q1ZLtvXEraBZJxPtYa+uWxt765vwQ/KmE0LzypRlnhUPFr1ITmaS5f
	 IU0ZBRJPJ9pmc8cqR0fWPFGkuBU75bJEShoRjt1QnS/4QbiBuEHA+v2ZMoVocXomFnL78
	 otXooHDBWFT5aR9CZrz3xA6YjVulOWs7KkRn6Y+BVRhhrytsFt1sTUAkiZgeN8KP2uwme
	 jz96oIDPBoYavnO5wjvDjaNKsLVwJ+TPXWMU2YSiWMXUqu6qvi4GlbaikNjl5a9rr4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ozq0BZWv;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7885606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 23:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7885606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ozq0BZWv
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82E9033D;
	Tue, 10 Nov 2026 00:30:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794267054;
	bh=GMcSjTTqfRhiPv7b224/7EvjUU5Ml1qJiNNfAnvTtdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozq0BZWvrDyF4iJpgrCHItI8huKgZY+P5PLrseU2YAo0cX5K9d0fI4+qOuJvD+Jph
	 btNkw2Gl9MWV8at6cZAmwbyN0pRJMFVRn8ef41vLFNP19fG/zlPRMHle+YiJ0rgmBv
	 0Dal5fq0hz1fi8E73DzyYa32Cfco0Tt502EbEqXE=
Date: Tue, 10 Nov 2026 01:33:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH] Documentation: media: Document impact of errors on
 buffer fields
Message-ID: <20261109233315.GA1000823@killaraus.ideasonboard.com>
References: <20261030103815.3098340-1-laurent.pinchart@ideasonboard.com>
 <auR63iwOm_mih97K@valkosipuli.retiisi.eu>
 <20261030140958.GB3109745@killaraus.ideasonboard.com>
 <auUepevHsfBZB2nV@valkosipuli.retiisi.eu>
 <9fe913fc3f750462a4655d51fa1a2f110a02ea18.camel@ndufresne.ca>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe913fc3f750462a4655d51fa1a2f110a02ea18.camel@ndufresne.ca>

Hi Nicolas,

On Mon, Nov 02, 2026 at 09:40:22PM -0500, Nicolas Dufresne wrote:
> Le samedi 31 octobre 2026 à 00:48 +0200, Sakari Ailus a écrit :
> > On Fri, Oct 30, 2026 at 04:09:58PM +0200, Laurent Pinchart wrote:
> > > On Fri, Oct 30, 2026 at 01:09:18PM +0200, Sakari Ailus wrote:
> > > > On Fri, Oct 30, 2026 at 12:38:15PM +0200, Laurent Pinchart wrote:
> > > > > When an error occurs related to a captured buffer, hardware can produce
> > > > > less data than expected (or no data at all), and timestamps may be
> > > > > unreliable or unavailable if the device uses hardware timestamping.
> > > > > Document this in the description of the V4L2_BUF_FLAG_ERROR flag.
> > > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > I've posted a corresponding fix to v4l2-compliance in [1] to relax the
> > > > > bytesused and timestamp checks.
> > > > > 
> > > > > [1] https://lore.kernel.org/linux-media/20261030103717.3098080-1-laurent.pinchart@ideasonboard.com
> > > > > ---
> > > > >  Documentation/userspace-api/media/v4l/buffer.rst | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > > > > index 94dc2719e907..5a7a1511cee7 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > > > > @@ -503,6 +503,11 @@ Buffer Flags
> > > > >  	streaming may continue as normal and the buffer may be reused
> > > > >  	normally. Drivers set this flag when the ``VIDIOC_DQBUF`` ioctl is
> > > > >  	called.
> > > > > +
> > > > > +	Depending on the type of error, the buffer may contain less or no
> > > > > +	data. In such cases the ``bytesused`` field can be lower than expected,
> > > > > +	including being zero. The ``timestamp`` field may also be zero or be
> > > > > +	otherwise unreliable.
> > > > 
> > > > Could we say that if bytesused field is non-zero, then there is a
> > > > timestamp, but when bytesused is zero, there's no data and probably no
> > > > expectation of a valid timestamp either?
> > > 
> > > How about this?
> > > 
> > > 	Depending on the type of error, the buffer may contain less data than
> > > 	expected, or no data at all. The ``bytesused`` field reflects that
> > > 	situation. When ``bytesused`` is zero, the ``timestamp`` field may be
> > > 	unreliable and may be zero.
> > 
> > Looks good to me.
> 
> Since its not specified, have you asked yourself if this is CAPTURE device
> behaviour, or if you do believe this should be true for all type of devices ?
> 
> I've had recent discussion for M2M in regard to CAPTURE buffer ERROR. The API
> has a gap and we don't know if we should complete a capture buffer when an
> OUTPUT buffer triggered an error. If the timestamp copy should be honoured and
> what the byeused size should be and mean.

Good question. The bytesused field is actually not well specified for
OUTPUT devices. The documentation only states that it's set by
applications, therefore at QBUF time, even if that's not explicitly
stated. There would be no interaction with the ERROR flag then, as the
flag is set by drivers at DQBUF time.

At DQBUF time, I'm not sure what should happen for OUTPUT devices. I
could image a theoretical use case where a driver would want to report
how many bytes have been consumed in case an error occurred and only
part of the buffer was consumed, but I don't know if there are any real
use cases for that.

The same likely applies to the timestamp. I think the current
documentation is quite vague there too. It states that

  For output streams the driver stores the time at which the last data
  byte was actually sent out in the ``timestamp`` field. For output
  streams that use ``V4L2_BUF_FLAG_TIMESTAMP_COPY`` the application has
  to fill in the timestamp which will be copied by the driver to the
  capture stream.

So for a pure OUTPUT device I can imagine that the returned timestamp
could be unreliable when an error occurs, while for a M2M device with
TIMESTAMP_COPY the timestamp on the output side will not be modified by
the driver, and the timestamp on the capture side should probably be
always copied.

Should I document that the behaviour described by this patch only
applies to capture devices ?

-- 
Regards,

Laurent Pinchart
