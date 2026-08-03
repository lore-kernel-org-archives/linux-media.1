Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00468431E70;
	Mon,  3 Aug 2026 19:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784335; cv=none; b=FnBCXVaNGGksMBRgZLtnQLQkc70gH60yICQYafwk/R0kCtH6bWIpLBlxega26235ggrgI6Ck2fC372RdN6rDYmbJP0X9vOSbcS6t2qaCfV7zZGcvi+iDZLuQD9iS3CZj51Rxvc+JYkDi1sPr+T25ylbdpCdpaZdpW6K9dAjgRTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784335; c=relaxed/simple;
	bh=/6KaWvUelBxDjgc2cwlXIqW/0SPvjE2lBZrFIgts5oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl8NmIuQVnyMCUUhZbtoYugtqs1jZ1H0TtEPk+AuikMVnYUA2KERaxGrJURqrrjotk/sH4wvQBdufGPUmRguhoBKlzxE729VnyiV9oG5lKdmuGp3ueSjnqs8RUHeIot6pFpQtgMlaQbBkUkRjS4bHKkr6kWX8v4VMT2FXMc7vqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NlOGalGj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NlOGalGj"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F272A5B3;
	Mon,  3 Aug 2026 21:11:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785784261;
	bh=/6KaWvUelBxDjgc2cwlXIqW/0SPvjE2lBZrFIgts5oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlOGalGjIbx+k28jCNWhAwSewPaUT6+v35KYAxwxMZw4y+IaneTdFMDx1v8F/Sg5i
	 MsjyCZhXybP4wjBIriKmQP+Eo12NR2KtTyCu3Za2WVSzXMfk3d/zD2LMque27YHdhf
	 aC6ODv7Z3b7nWRwB1O7m2/X8XdWF9T2/i1UWCogo=
Date: Mon, 3 Aug 2026 22:12:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
	Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <20260803191208.GA2201016@killaraus.ideasonboard.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
 <20260803005333.GE1927055@killaraus.ideasonboard.com>
 <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>

Hi Dave,

On Mon, Aug 03, 2026 at 06:37:47PM +0100, Dave Stevenson wrote:
> Hi Lachlan and Laurent.
> 
> It's brilliant that Sony are getting involved in upstreaming drivers!
> 
> <snip>
> >
> > In his IMX678 driver, Jai hardcodes the pixel rate to 594MHz, which is
> > 8 * 74.25MHz (IMX908_XHS_HZ). The rationale is that HMAX is expressed in
> > units of the 74.25 MHz internal clock, so we assumed that the pixel
> > array is not read out using the link clock but using a clock derived
> > from the internal clock. The multiplier was chosen to ensure that the
> > minimum HMAX value corresponds to a positive HBLANK, as negative HBLANK
> > would confuse userspace (and developers). Having a fixed pixel rate
> > greatly simplifies the driver, as you don't have to update the pixel
> > rate control, and HMAX calculation from HBLANK becomes a division by 8.
> >
> > We're not sure how the pixel array of the IMX678 is clocked exactly, so
> > I don't know if the above corresponds to reality, neither for the IMX678
> > nor the IMX908. If you could provide more information about the pixel
> > array readout, that would be greatly appreciated. Note that the pixel
> > rate value does not have to match the physical readout clock, as it is
> > only used by userspace to calculate timings (to convert between h/v
> > blank and fps).
> >
> > Jai can provide more information if needed.
> 
> In case you'd missed it, I'm trying to convert Jai's IMX678 driver
> into a generic Starvis 2 driver[1].

Just a quick message to tell you that I plan to reply to that mail
thread. I'm on vacation this week, so there will be a delay.

> IMX662 that I'm interested in is streaming with a total of 7 changes
> to defines or const structs in the current imx678 driver.
> IMX675 (5MPix Starvis2) frames with a similar number of changes but
> currently isn't giving me images (test patterns work).
> IMX585 looks like it may fit the same pattern, but I'm waiting on a
> module for that one.
> 
> I'm therefore looking to parameterise those diffs but otherwise keep
> it all common. This avoids the hassle of having to convert potentially
> 4 (or more) drivers to the Common Raw Sensor Model once it is
> finalised.
> 
> IMX908 here looks to very much follow the same pattern, so unless
> there are additional diffs between Starvis 2 and Starvis 3 it would
> potentially fit into the same framework.
> 
> I'm hoping to get an RFC out this week as I'm then on holiday for a
> week. It'll be interesting to see if IMX908 will fit with the same
> pattern.
> 
> Lachlan: Are there any particular people we should contact for details
> of IMX908, or just go through our normal contact?
> 
> Thanks
>   Dave
> 
> [1] https://lore.kernel.org/linux-media/20260312150437.1091195-1-eagle.alexander923@gmail.com/T/#m6072f85b03811932427597d8ffe5da008d33246a

-- 
Regards,

Laurent Pinchart
