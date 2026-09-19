Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AECE2DCBFA
	for <linux-media@vger.kernel.org>; Sat, 19 Sep 2026 22:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856961; cv=none; b=QcaORv58BCw+1BsgXbFf9f4Hb+k8Tr/apa9ta+lui2v24lRd/PVQsUh3Qgs2arOFOe1mzFSmwE3d+YqYesu5kJbb5MENyEhRC4tY2K+adErnGpLvzQ0KLtjW0QLF6p08JQ3SQ+XjHg+pJUMH7OMpriSb1+YBSe2MBBeFzvHj4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856961; c=relaxed/simple;
	bh=1WuTr3mQ7SAL2N9vqzDYOn2pSPnN7uGbVTtQyj9otlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6Ew+Y887ITrTql6w5yeTFL07ZiNbfV2szQRyTDfuQ3FLfU3tN7BVx4ERcGeUNJADhmJ/tb4KTNmAlCiXBcrm7EduUroL2pwEunTyOrqNoNSBBkuBd3i/1MI0Wm2BDCf09tZG4F7mlvKnUdthBCFXa1XWJ7idvOLKTLOQZ2D7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AgjbOGct; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AgjbOGct"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 316FCB08;
	Sun, 20 Sep 2026 00:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789856853;
	bh=1WuTr3mQ7SAL2N9vqzDYOn2pSPnN7uGbVTtQyj9otlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgjbOGctKVzlEaVT+gNi/wAsgMqbPQhu3WpEXorJ7K6BL3TLCQQGa8/aVBAoMMIeT
	 5niebO2FCqQ82MzK9Fg7mrePEGmfLLA8trGKxCTZqNPEOG9dy5lmWpbpBsJ6T9e2mA
	 nf1Iz3m8ChB1WNXaAGmGGq9GlHXbmlHCdywJGtfc=
Date: Sun, 20 Sep 2026 01:29:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20260919222915.GB1179126@killaraus.ideasonboard.com>
References: <UzpC1s2YnBtZIaRCab_Y8AbCecyauDUO4OC7Nhd1-h4TE21aLSghbwDuOKgdwJQugvPMjM4foPHuL-UKnBLD6A==@protonmail.internalid>
 <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <00cc46b2-0729-46d3-8e3b-ea717ec1675e@kernel.org>
 <xkoP0dfwjjBYtv2XeWuIvuqK5HAhjNFHul45Rvx8GUs5XTO3O8Mjnbwn4rV7ToCR6aqLrANyfzmKa7ssGAWk4w==@protonmail.internalid>
 <20260918091806.GE59058@killaraus.ideasonboard.com>
 <cadd6ff4-ec70-4ff9-9125-a0c4342261f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cadd6ff4-ec70-4ff9-9125-a0c4342261f6@kernel.org>

On Sat, Sep 19, 2026 at 10:45:00PM +0100, Bryan O'Donoghue wrote:
> On 18/09/2026 10:18, Laurent Pinchart wrote:
> >> There are clear benefits to having a loop of NPU/DSP to Offline ISP to
> >> Display that drm/accel seems to offer some interesting solutions to.
> > What are those interesting solutions ?
> 
> The chain I'm interested in is
> 
> Inline - V4L2 streaming
> -> Produces raw or YUV
> 
> CVP (&& ||) NPU - Likely implemented as DRM

Possibly, but that's bit very relevant from a userspace point of view.
An NPU will be controlled through a userspace stack, likely involving
Mesa if the stack is open-source, and exposed through higher-level
frameworks/APIs (TF, ONNX, ...). The fact that the kernel driver lives
in DRM won't have any impact.

> -> Produces motion vectors and/or further warps image
> 
> Offline - Sharpens, GTM, TNR (could be DRM, or v4lm2m)
> -> Produces YUV
> 
> Display - DRM

So likely OpenGL or Vulkan, involving wayland or X11. In rare cases
directly interfacing with KMS for embedded devices.

> V4L2 owning sensor -> inline engine is already supported and won't 
> change. For subsequent steps though each stage hands off in-kernel 
> without having to involve userspace.

That's fences, isn't it ?

> Given though it depends if you need user-space to "do stuff" at the 
> offline stage. If the offline stage has a firmware perhaps user-space 
> doesn't need to be involved much past setup whereas if that offline 
> stage has no firmware, then user-space really needs to drive it. The 
> difference between the OPE on-list right now without a firmware and the 
> ICP which does have a firmware.

Cases where userspace wouldn't need to be involved exist, but then
there's even less userspace involvement than you describe above. The
firmware would control all the components directly (sensor, inline and
offline stages), exposing only the end result (possibly with the ability
to additionally capture raw frames).

> Taking the example of sharing params and stats between Inline and 
> Offline - in this case you are constructing a single ISP around two 
> blocks basically in libcamera, whereas what I've described above 
> traverses several blocks and isn't really an ISP - the ISP is already @ 
> stage 1 - you have an additional fully offline block with its own 
> firmware, sessions and runtime context. Stage 1 and stage 3 don't share 
> kernel-side stats and params; they have their own isolated contexts, in 
> contrast to TFE/OPE on Agatti where its integrated and must live in a 
> dedicated libcamera pipeline.
> 
> But because you have a functional ISP @ stage 1 - the question is does 
> the firmware based offline engine provide better overall system 
> functionality as a DRM device ...

I don't see why that would be the case.

> Its actually the question I'd like to discuss with colleagues in sunny 
> Prague :)
> 
> So I think the tension comes from wanting to have the DRM scheduler but 
> acknowledging that it is probably only for some use-cases possible.
> 
> You implement the device as a DRM device, you are still free to have a 
> complex user-space context for that if that is your need - whereas if 
> you have a use-case which can tolerate non-intervention from user-space, 
> then the DRM scheduler _is_ what you want for complex hand-off from one 
> device block to the other.

Not quite. It's a matter of fences.

-- 
Regards,

Laurent Pinchart
