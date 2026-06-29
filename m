Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AC83DE445;
	Mon, 29 Jun 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734758; cv=none; b=IyuHH6H+fsk/jVNeZOyfAcd3BgNKZ3A20LhnKW64xhtT7iRw02Y8QT7tEox/V6/+CT9B6HxVdfNG1NlQVdjjO/FX+if9/WChhVcV18o5PzlepXAjDoruruICxG0mtq0m358RpbSVWg2apspZFBNpdOBZymyZHgeTa6uRwKclfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734758; c=relaxed/simple;
	bh=DHwgphUmlbxgLc24Ph5sZ43WhZWNIQjAa2XiVhZFpOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY3QaSPGBlyq9XIOZaPzjHypgmfenbcwQDPpR8had9DZljGXlGRKPfYhn6SvURbuETRHlZO2w+J0zJnbkXe6qgkHqCREqWjbSm62ohez/RROLZTFzGiycsOPgNfZtXZ3iRrzJ8yn73X6QOiG1MT5WRmhyuyvMIEIAhpKSVAqy3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T6QbnTJ9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T6QbnTJ9"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C168D4;
	Mon, 29 Jun 2026 14:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782734710;
	bh=DHwgphUmlbxgLc24Ph5sZ43WhZWNIQjAa2XiVhZFpOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6QbnTJ9wwTsH/tZzrlJqYF198UavhKbi95td6A7AmR7ZCZ1scfrX/MfQOsVlYFYU
	 jTghHH4tvXZVI3XiYFngjXJGc9KmkoJEjp0AXGG0+iXn+1GtAUu3FND8VNHv8bCJK1
	 K+cQLBv5i4vEpNv2XFeR0dxQFxFQbSnpP36Tmo/s=
Date: Mon, 29 Jun 2026 15:05:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
	Konstantin Babin <Konstantin.Babin@arm.com>,
	Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Message-ID: <20260629120552.GE3054459@killaraus.ideasonboard.com>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <20260629095732.GC3054459@killaraus.ideasonboard.com>
 <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34de3262-3e3a-4b93-90a0-bf662162dd10@arm.com>

On Mon, Jun 29, 2026 at 12:08:08PM +0100, Vincenzo Frascino wrote:
> On 29/06/2026 10:57, Laurent Pinchart wrote:
> > On Sat, Jun 27, 2026 at 04:29:14PM +0200, Jacopo Mondi wrote:
> >> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >>
> >> Implement validation of CCM block parameters.
> >>
> >> CCM coefficients are expressed as 13 bits signed Q4.8 format and their
> >> raw value cannot be higher than 8191 (BIT(13) - 1).
> >>
> >> CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
> >> value cannot be higher than 4095 (BIT(12) - 1).
> >>
> >> CCM offsets are 12 bits unsigned integers and their value cannot be
> >> higher than 4095 (BIT(12) - 1).
> >>
> >> Validate the parameters provided by userspace using the .block_validate
> >> callback of struct v4l2_isp_params_block_type_info.
> > I don't think this is needed.
> > 
> > We need to validate parameters that can cause the ISP to malfunction in
> > ways that requires a system reset, or in ways that cause malfunction of
> > other system components (e.g. buffer overflows, memory bus lock ups,
> > ...). The rest doesn't need to be validated.
> > 
> > If you want to be cautious, you can just mask the value when writing to
> > registers, which I think you're doing in patch 1/4.
> 
> According to me here is not a matter of being cautious, but of honouring the
> contract with the userspace.
> 
> If the userspace is doing something wrong it should be notified. The only
> reasonable argument against this would be if this code is on a critical path and
> the validations have a performance impact.

I don't agree with this. As long as it doesn't have an impact on other
parts of the system, there's no need to notify userspace. It's purely a
userspace issue, it's pointless to waste CPU cycles every frame.

> @Jacopo, can you please confirm if this is the case?

-- 
Regards,

Laurent Pinchart
