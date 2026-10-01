Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025953B327
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888923; cv=none; b=SgqEkUQCXGJZoOCEU1nvwxSTrvH4CE33hevu5L+3tmqKWXPllHeuaykKCfGT+HvIhE2W1IexVagi+J/j0SLkQKSSt5v0lz2c0vx6L/URYjQisJoxxb91qenhFqFgWSY9UWCbpFEJW+ENsq8jda3ikfB+MAK5VANp6kO1i+GWZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888923; c=relaxed/simple;
	bh=6Z3tna5cMVxXhYOUBrKXTKBorvQ1p/A0XiSpw+r7W30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiiYparzs5SCcKVH1PEY1u19pEP3PNrlVSUGN8XPWdzyt2aD8Li2MhzVgq9I6VtDzF5p9J3cHpqxUsZq+xfldrbfq9FDIwdGS2xtfZy0/huL7CkkfcpiODZQ9CCNejIHjYXD6Q7JJID6Zw1IoARy+8aRoTZ+juA2jo/DVpJ1Tuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a7JBcWwY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a7JBcWwY"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 345F7269;
	Thu,  1 Oct 2026 23:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790888807;
	bh=6Z3tna5cMVxXhYOUBrKXTKBorvQ1p/A0XiSpw+r7W30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7JBcWwYim9e6twd1kTGIHMyXU9dzofELE/CBOfK7agIxc4I7sC1pLYEIyLS0AMxh
	 0LwJJduo68z8cl6189rcOJM6DcI6gBUjOIfZS9Ed4U00fFmEHxvF7HaS43qIpLo9uA
	 z+5uMcJ6qP9p8r2ztr0AlEfqe5sNyQYlOu3bJhA0=
Date: Fri, 2 Oct 2026 00:08:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20261001210838.GR944070@killaraus.ideasonboard.com>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <22a0424b-c67d-4dcc-a31c-26acd764c653@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22a0424b-c67d-4dcc-a31c-26acd764c653@ti.com>

Hi Rishikesh,

On Thu, Oct 01, 2026 at 11:49:17AM +0530, Rishikesh Donadkar wrote:
> On 15/09/26 05:08, Laurent Pinchart wrote:
> > Hello,
> > 
> > As most of you already know, the Linux Plumbers Conference will host a
> > Camera & ISP BoF in Prague in three weeks ([1]).
> > 
> > The initial proposal for a microconference has unfortunately been
> > downgraded by the program committee to a 45 minutes BoF. We have
> > therefore decided to limit the discussion to three topics at most. Two
> > topics have been approved so far:
> > 
> > - RGB-IR support in V4L2 and libcamera
> > 
> >    by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> > 
> >    The Linux kernel V4L2 API does not support RGB-IR image sensors.
> >    While building blocks necessary to handle those devices are slowly
> >    being merged, RGB-IR support itself hasn't been tackled yet.
> > 
> >    Rishikesh and Devarsh will also present this topic at the OSS Europe
> >    conference ([2]).
> 
> Hello everyone,
> 
> I have submitted an RFC for the OV2312 camera sensor driver[1]. This 
> patch series proposes the use of array controls to facilitate setting 
> controls for both the RGB and IR streams coming out of the camera 
> subdevice.
> 
> I would greatly appreciate your feedback and thoughts on this approach.
> 
> [1] https://lore.kernel.org/all/20260925133001.2780868-1-r-donadkar@ti.com/#t

Thank you for doing so. I strongly encourage every attendee of the BoF
to at least read the proposal ahead of time, and ideally start
discussing it on the mailing list.

> > 
> > - Camera module identification
> > 
> >    by Stefan Klug, Ideas on Board
> > 
> >    Camera tuning and calibration depend not only on the image sensor, but
> >    also on the lens and other characteristics of camera modules. While
> >    Linux supports identifying image sensors, it completely lacks the
> >    concept of camera modules.
> > 
> >    Identification of camera modules requires coordination between
> >    platform firmware (DT or ACPI), the kernel and userspace. Discussions
> >    will benefit from the presence of DT maintainers.
> > 
> > We can consider scheduling a third topic. Proposals are welcome.
> > 
> > Due to the 45 minutes BoF format, we will focus on discussions and won't
> > be able to afford presentations. All topic leads are expected to
> > circulate discussion materials on public mailing lists at least a week
> > before the event to give attendees time to read through proposals. The
> > materials should summarize the issue at hand and the ongoing work, and
> > clearly state the questions that will be discussed during the BoF.
> > Slides that support the discussions, if any, should also be submitted
> > prior to the event.
> > 
> > If there is enough interest, I am considering booking a meeting room on
> > Wednesday morning (location to be determined, likely outside of the LPC
> > venue) to extend the BoF. We could continue discussions on the topics
> > listed above, as well as schedule additional topics. We would overlap
> > with the following LPC microconferences:
> > 
> > - Networking Track
> > - Containers and checkpoint/restore MC
> > - Rust MC
> > - Scheduler and Real-Time MC
> > - Build Systems MC
> > 
> > Please let me know if you would be interested in attending a Wednesday
> > morning session by replying to this e-mail (publicly or privately). If
> > you would like to propose additional topics, please do so publicly.
> > 
> > 
> > [1] https://lpc.events/event/20/contributions/2364/
> > [2] https://osselceu2026.sched.com/event/2RaZj/enabling-multi-stream-camera-sensors-in-linux-rgb+ir-streams-and-embedded-metadata-rishikesh-donadkar-devarsh-thakkar-texas-instruments

-- 
Regards,

Laurent Pinchart
