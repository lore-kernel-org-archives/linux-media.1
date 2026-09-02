Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B1D485500
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351900; cv=none; b=WgdIu3rFvQthdmNUDT1EKd7EeISyXAWllKcBQu0elINf+Am2/81M4jp+NFg2zarmJTvKXItQjOOCkRHkSi5JAtmnWS6kspqyr+K8PgROtLmF2Zz/6greXvFE6kGqr7zzbpthBL7/HSi8Hzj+mv1ih4lhPSgwXflRcWEG9wYBRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351900; c=relaxed/simple;
	bh=/sW6+Cj5kdfeKWI/RI/a0Qegr9MYaK6m5BGRkMQdNDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDynpcwFHCAPDsyqqXN+bGxAD/xr2dvW9Y2Qx5ZI0fGyXv6RGloPuZ2wL8CuAqPkNOPds/0KR/0IyYW3YCdB/5bfAdJX0xDXv/tWI0JQqCg9s0ab6CjS/L9N7xtTt4MZwZngdNQI4H6GxXp5eDoOt87ds1NbEx7+ITzDiqMXg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lPDQVPz1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lPDQVPz1"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8EB31F8;
	Wed,  2 Sep 2026 14:23:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788351805;
	bh=/sW6+Cj5kdfeKWI/RI/a0Qegr9MYaK6m5BGRkMQdNDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPDQVPz1e/LII1Zn9RASnVGNLwVDbdPcPM3Xk+lSaf7C5dgeU7XOcSvqElOAIaP/E
	 wRMLpljIdFtj0b/nQkQPt4Td01s80ETTPOe3gh36LvW580vJYGhDZAqblbHz2uxnCU
	 jBRYb2sX7VXy0t9PblHOnh3e/CssDA7iFS+Wno9U=
Date: Wed, 2 Sep 2026 15:24:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH] media: ti: cal: Deprecate non-MC API usage
Message-ID: <20260902122454.GA335893@killaraus.ideasonboard.com>
References: <20260723111903.742283-1-laurent.pinchart@ideasonboard.com>
 <2d3f854c-0731-4405-b77e-13929049ca67@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d3f854c-0731-4405-b77e-13929049ca67@ideasonboard.com>

Yemike, are you fine with this patch ?

On Tue, Jul 28, 2026 at 03:26:47PM +0300, Tomi Valkeinen wrote:
> On 23/07/2026 14:19, Laurent Pinchart wrote:
> > The MC API was introduced in the CAL driver more than five years ago in
> > commit 38e89e790fe2 ("media: ti-vpe: cal: Implement media controller
> > centric API") as a disabled by default option. Five years later, it's
> > time to give users another nudge to move to the MC API. Deprecate non-MC
> > API usage by printing a warning at probe time, and defaulting to the MC
> > API. The legacy API can still be selected through the mc_api module
> > parameter.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/media/platform/ti/Kconfig   | 11 -----------
> >   drivers/media/platform/ti/cal/cal.c | 10 +++-------
> >   2 files changed, 3 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
