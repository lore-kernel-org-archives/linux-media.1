Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B703358BE;
	Mon,  6 Apr 2026 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775479061; cv=none; b=FRLr4DJHIr5ShSFxKtBQ3sK9j5fgGdqut1CTdH/81TqHxPj8+l/sOjxApgZ+HYp838RIzpdZ0VciYonWEuDBJp9DXHo9Dva/5oGZUDnTYRbsrB9iAQom/t5l7o1nb9QHobUeVMFI+CcDQ7hvfZAnFx0hLrFSNaIbrST4hutNkBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775479061; c=relaxed/simple;
	bh=dWbwUCeq7IovdBht7hhOFfGoGvdyB4QkD2NiGSfs02s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM14/GUz5eKJas4mO87uBwA211nwwHbS0RoNhcdYrzTOIymiAy0BNy3bcOM/nU4B7TjVj2n97ceNGUSYkolNTWRjn1bistbsrGSoXHGB+5zuPvkNizN9s+ow+1p1okkEZkLz9ipEajhObi8OUfJz30uc3hST8SX077pFneOFPT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vpw8vWBu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vpw8vWBu"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9408610D4;
	Mon,  6 Apr 2026 14:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775478971;
	bh=dWbwUCeq7IovdBht7hhOFfGoGvdyB4QkD2NiGSfs02s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vpw8vWBuQgvkF6VfJWdcbjvhhABa/+l3JaIGPJ0BQS4JYunDq0Imv8oehfYsdOt1u
	 KuwM3RithfMZa8eOGFD3DK9gWlUlONnxJ+fKaKN7JUDtlvqyKE2/+WkHffVq8kUxBR
	 z8SCmOQklYqf1GS1hnnr03fOIzELzcUkYPQdzWs4=
Date: Mon, 6 Apr 2026 15:37:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Gergo Koteles <soyer@irl.hu>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-media@vger.kernel.org,
	jani.nikula@linux.intel.com, anisse@astier.eu,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	open list <linux-kernel@vger.kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, pobrn@protonmail.com
Subject: Re: [RFC PATCH] media: Virtual camera driver
Message-ID: <20260406123736.GC1268443@killaraus.ideasonboard.com>
References: <20260201133342.335680-1-jarkko@kernel.org>
 <20260203145341.GB33304@killaraus>
 <20260203204911.GB56480@killaraus>
 <12919433.O9o76ZdvQC@natalenko.name>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12919433.O9o76ZdvQC@natalenko.name>

On Mon, Apr 06, 2026 at 02:23:46PM +0200, Oleksandr Natalenko wrote:
> On úterý 3. února 2026 21:49:11, středoevropský letní čas Laurent Pinchart wrote:
> > > > Just to share my current state of affairs:
> > > > 
> > > > * sender:
> > > > 
> > > > $ gst-launch-1.0 pipewiresrc path=<webcam_id> ! video/x-h264, width=1280, height=720, framerate=24/1 ! rtph264pay ! rtpstreampay ! udpsink host=<receiver_host> port=<receiver_port>
> > > > 
> > > > * receiver:
> > > > 
> > > > $ gst-launch-1.0 udpsrc address=<receiver_host> port=<receiver_port> ! queue ! application/x-rtp-stream,encoding-name=H264 ! rtpstreamdepay ! application/x-rtp,encoding-name=H264 ! rtph264depay ! h264parse ! openh264dec ! pipewiresink mode=provide stream-properties="properties,media.class=Video/Source,media.role=Camera" client-name=VirtualCam
> > > > 
> 
> > > I'm writing a blog post on this topic, I'll reply with a link when I'll
> > > be done.
> > 
> > https://www.ideasonboard.com/news/pipewire-is-the-new-v4l2loopback/
> 
> It looks like it's now broken in PipeWire 1.6.x. I've reported it
> here: [1], but I'm not sure what's next.

I haven't tried v1.6.x yet.

> Do you maybe have more info on this?

I don't, but Barnabás may. I think he's OoO this week though (chasing
easter bunnies and chocolate eggs somewhere, most likely), so replies
will likely be delayed.

> Thank you.
> 
> [1]: https://gitlab.freedesktop.org/pipewire/pipewire/-/work_items/5165

-- 
Regards,

Laurent Pinchart
