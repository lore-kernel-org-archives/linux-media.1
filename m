Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272945;
	b=DBNKBMoeR6pq8LvRn5SsIL/MxlSlrnDghW/ko4SPewIKD+hUUS/8QQwJgmWP/o4O9rzW
	 lMzaPTf8rqNqJH9MTXrt9YxDzD8dAoJbAIUqQSwWamx/iITnpVj0/upi2xo9huxj0c3hm
	 tjoJER/J26HZzQzhWrC8Y+WmqLFla7T7wOWkk6Wz1ztpbIi0qvJZNPdCtb8lASqKpvatD
	 TMJ+vD1ZyVaA8wPewsDNZo7x0hfXi+I8cDpHzuUxGLRA2deZZpZiGXJnPCAk52wmiUt+5
	 E2gQKqtda8UaYt3GGA7v0oheDNJshVZguWZ+utmAKqGN+oEzY5E3wspLQm6cFx4M2KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272945;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=eGx18/X/MEhaPoukM+MtHDbnzcqUw1U0EbIZxX6ggtY=;
	b=41cCmgK6pLKRuwQOmFqCFPDPyPn7ap7fhhdx6C/eIk5nPm0S5nE+oLhr5xL+oqAgy5Yz
	 12jaztMEmxqmFgjlK4zAubYxPoHCTifjCqScbgdBqMSf6zzWS2tEGPEUYBRKBbvHT/ej7
	 sosRIwb9Lrg15tPqrzEmyUg1FY7XC3KQ8LIC7KkCHXnEnKjJzcJSvU7tipuekBoJPGJ3B
	 YZTCdkvAPAwxGWlWVe8ls9MtDRejBeO+JzAqBqE9c9KgfYfxdwrBxtv+m8l+M1yDNY665
	 9sNtsSTPI8xiw4p3qsFa+G3qBM401kh4Cb8fMuSrL0ktaB5OIh1qHH1KTWqw3IHBvOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TzQyhEOo;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA043606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 11:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA043606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=TzQyhEOo
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4BB24DC;
	Thu, 29 Oct 2026 12:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793272808;
	bh=uLjLJv0jCXEPB2COZuXAlnt9/yGgPXUsTB6GmGtYsKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TzQyhEOoL7tC1N3Wrzhn7K2A3zUaPebq8iTgeJr5MksZhQBD4GGtFjc0G+WKQ2H/q
	 0AiNqkmgnl+nQafVbmNYPrGNrJ/PiRic+pkSCKkzDOAzHjMvIduwLvr90n10IOQIxe
	 NYP4U+F2CdJoFipxeRENW1l2yJtjn6cc+UAYtGcQ=
Date: Thu, 29 Oct 2026 13:22:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [v4l-utils] [RFC/PATCH] v4l2-compliance: Don't check bytesused
 or timestamp for error buffers
Message-ID: <20261029112220.GB2587681@killaraus.ideasonboard.com>
References: <20261027191929.2528156-1-laurent.pinchart@ideasonboard.com>
 <b4aa95de-174b-4a4d-b55d-136aaa2dabff@kernel.org>
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
In-Reply-To: <b4aa95de-174b-4a4d-b55d-136aaa2dabff@kernel.org>

Hi Hans,

On Thu, Oct 29, 2026 at 11:07:38AM +0100, Hans Verkuil wrote:
> On 27/10/2026 20:19, Laurent Pinchart wrote:
> > When DQBUF returns a buffer marked with the ERROR flag, the bytesused
> > and timestamp fields are not meaningful. Don't check them.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > I'm sending this as an RFC because the V4L2 API documentation isn't
> > clear on the subject.
> > 
> > For the bytesused fields, I'm fairly confident that this change is good.
> > A driver can't be expected to provide data for buffers with errors,
> > especially if a transmission error occurred.
> 
> Dropping all the bytesused tests if ERROR is set isn't a good idea.
> If ERROR is set, then bytesused is allowed to be 0, but you still want
> to check that e.g. bytesused isn't > length. Otherwise applications that
> do not check for the ERROR flag might try to read beyond the buffer size.
> 
> So we have to ensure that what the driver returns for data_offset and
> bytesused won't go beyond the buffer size. But they may be 0 if the ERROR
> flag is set.

Good points. I'll send a v2.

> > Similarly, timestamping a buffer upon error may not be something we can
> > always expect from drivers. I'm a bit more hesitant here though: while
> > precise timestamping can't be guaranteed, a driver can always use some
> > sort of timestamp. Doing so could cause issues though, as a driver for a
> > device that provides hardware timestamping would need to switch to a
> > software timestamp source for buffers with errors. That would not just
> > complicate drivers, but would also make it awkward for userspace.
> 
> Makes sense.
> 
> > There are a few open questions:
> > 
> > - Are there other buffer fields that we should ignore ?
> 
> Possibly the 'field'. In practice I think this might only be an issue for
> interlaced formats. If we run into problems with that in v4l2-compliance,
> then we can always address that later.

There was a failure with the libcamera v4l2-compat adaptation layer that
didn't set the field in that case, leaving it to 0. I've handled that in
libcamera for now, hardcoding V4L2_FIELD_NONE as we don't support
interlaced formats. We can revisit that later if needed.

> > - Shoulg (some of) the ignored fields be required to have a specific
> >   value ? For instance we could require the timestamp to be 0 on error.
> 
> No. Leave that to the driver. You'd have to analyze the existing drivers
> just to figure out what they are doing today, and drivers using
> V4L2_BUF_FLAG_TIMESTAMP_COPY may still copy the timestamp if they have
> enough information to tell which output buffer originated the error.
> 
> But perhaps adding a note in the documentation saying that the timestamp is
> unreliable for an ERROR buffer would be useful.

OK, I'll do that.

Thank you for your thoughts on the topic.

> > ---
> >  utils/v4l2-compliance/v4l2-test-buffers.cpp | 22 ++++++++++++---------
> >  1 file changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > index dba471e5b488..47d4627ee373 100644
> > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > @@ -393,16 +393,20 @@ int buffer::check(unsigned type, unsigned memory, unsigned index,
> >  		warn_once("V4L2_BUF_FLAG_TIMECODE was used!\n");
> >  
> >  	if (mode == Dequeued) {
> > -		for (unsigned p = 0; p < g_num_planes(); p++) {
> > -			if (!(g_flags() & V4L2_BUF_FLAG_LAST))
> > -				fail_on_test(!g_bytesused(p));
> > -			if (!g_bytesused(p))
> > -				fail_on_test(g_data_offset(p));
> > -			else
> > -				fail_on_test(g_data_offset(p) >= g_bytesused(p));
> > -			fail_on_test(g_bytesused(p) > g_length(p));
> > +		if (!(g_flags() & V4L2_BUF_FLAG_ERROR)) {
> > +			for (unsigned p = 0; p < g_num_planes(); p++) {
> > +				if (!(g_flags() & V4L2_BUF_FLAG_LAST))
> > +					fail_on_test(!g_bytesused(p));
> > +				if (!g_bytesused(p))
> > +					fail_on_test(g_data_offset(p));
> > +				else
> > +					fail_on_test(g_data_offset(p) >= g_bytesused(p));
> > +				fail_on_test(g_bytesused(p) > g_length(p));
> > +			}
> > +
> > +			fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
> >  		}
> > -		fail_on_test(!g_timestamp().tv_sec && !g_timestamp().tv_usec);
> > +
> >  		fail_on_test(g_flags() & V4L2_BUF_FLAG_DONE);
> >  
> >  		// The vivid driver has unreliable timings causing wrong
> > 
> > base-commit: c6600a7e342ef6e336fba02212c90b60a36ca02d

-- 
Regards,

Laurent Pinchart
