Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F9495041
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 23:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810623; cv=none; b=EY6fj4+GT/X5Wh0tAvLDWUXtR9NNkwGX12wTNb8Pa2AU4RPx73BFMyYTQA1w2yDXEce7+OcoN54ATVd14hHI7O+yGIwV6VyTHNxqW8N+idRc8xhs4Cy37wydFkcjzJNzyU0CXe2A1QDx/nkcvddj3DgtfNJdEp0LFaqGR7WsSdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810623; c=relaxed/simple;
	bh=ZJjikGABeJHJouBKKK1nML3ff+AFjdVxV8EcZtfmWEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBV6934gLTLKWVp3OijlLwmkZv0P1l7Fv7avKmFzRaLtikxwnVs3VOTWf6v5DCKfnLW9PeNbaFtXT2BQc6Gijsv8I04YlgQ3MKv/rs/ySiFIbrsoHIH/aPYREbkFW5BNYKayJidn0D/5AwJhXcBWQc1MYSi6qVvZvu0+33RcAAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=buVu7BMs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="buVu7BMs"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95D86C1;
	Thu,  1 Oct 2026 01:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790810501;
	bh=ZJjikGABeJHJouBKKK1nML3ff+AFjdVxV8EcZtfmWEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buVu7BMsrIOiGXavtoWptFrcSGigZuVhPMNrrK9FT5MIyPf8kztLyLEJ+TgD8Fq9w
	 roHQwHRCgQxUqMVL6XDxXzNO4znJiYxzkM+hKGB9LrAxgSpnfuvTk31XUEGqJ83NWN
	 297oWLmggu/sTgkrL74nzyRuhq6ckM7ralNDq3OY=
Date: Thu, 1 Oct 2026 02:23:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gjorgji Rosikopulos <grosikopulos@mm-sol.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20260930232332.GG944070@killaraus.ideasonboard.com>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <2e1d628f-8183-4446-9500-9886561f320b@mm-sol.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e1d628f-8183-4446-9500-9886561f320b@mm-sol.com>

Hello Gjorgji,

On Fri, Sep 18, 2026 at 02:10:07PM +0300, Gjorgji Rosikopulos wrote:
> Hi Laurent, All,
> 
> On 9/15/26 02:38, Laurent Pinchart wrote:
> 
>     We can consider scheduling a third topic. Proposals are welcome.
> 
> 
> Below are my proposed discussion topics. All of them relate to advanced camera
> use cases:
> 
> 1. Electronic Image Stabilization (EIS).
> 2. Multi-frame Bayer or YUV noise reduction filters.
> 3. QUAD CFA reconstruction, including preprocessing algorithms for
> high-resolution Quad Bayer sensors.
> 4. AI-based denoising in Bayer or YUV domains, focusing on image preprocessing
> denoising algorithms.
> 5. DOL and video HDR use cases.
> 6. Background blur for video conferencing applications.
> 7. Face detection algorithms operating directly on image data.
> 8. Multicamera 360 image stitching etc.

Those are all interesting topics, but I won't be able to schedule all of
them in 15 minutes :-)

> All of these use cases and algorithm implementations can be vendor-specific or
> third-party solutions and may run on a GPU, DSP, or other accelerators.
> 
> I also think that, similar to the IPA used for 3A algorithms, we need an
> IPA-like for frame-processing algorithms.
> 
> As discussed, the only practical way to upstream such functionality into
> libcamera is to provide an open-source alternative (even a simplified
> implementation) that defines and covers the use case, including its input/
> output parameters and interfaces.
> 
> The main question is whether these algorithms should live inside libcamera or
> outside of it. Both approaches have their strengths, but I am personally in
> favor of integrating them into libcamera, perhaps as a layer above the pipeline
> handlers, for example through use case plugins or a similar mechanism.

I've long thought that libcamera should make pipeline handlers more
modular. Pipeline handlers would implement components for the pipeline
elements (such as the inline frontend and offline ISP) and declare how
those components are connected. We should be able to move most of the
logic required to run the pipeline into common code.

With a modular approach, inserting elements in the pipeline could become
easier. It's however not clear to me yet if we should try to separate
the processing required for the use cases you list above from the "core"
of pipeline handlers, into a separate layer on top, or if some use cases
would benefit more from being able to inject elements into the pipeline.

Note that we have started experimenting with the concept of layers, see
https://patchwork.libcamera.org/project/libcamera/list/?series=5753/

> We can also learn from Android's approach. Initially, the HAL3 and per-control
> APIs were created to allow applications to implement advanced algorithms such
> as HDR and EIS. Later, CameraX Extensions were introduced so that these
> capabilities could be shared across applications and benefit the broader
> ecosystem:
> 
> https://developer.android.com/media/camera/camerax/extensions-api

It's certainly something we should study more. As usual with Android
there's little documentation on the underlying architecture though :-(

> I believe Linux faces a similar challenge. Once PipeWire and GStreamer plugins
> based on libcamera become widely adopted across Linux distributions, it will
> become increasingly difficult to introduce these advanced use cases at higher
> layers of the software stack. Having a standardized framework within or closely
> integrated with libcamera could make these capabilities more accessible and
> reusable across applications.

No fundamental disagreement there, although we should also be careful
not to reimplement GStreamer or PipeWire inside libcamera.

An important question that will need to be answered is who will be
willing to do all this work.

-- 
Regards,

Laurent Pinchart
