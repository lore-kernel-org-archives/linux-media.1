Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7236402D;
	Mon, 29 Jun 2026 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732804; cv=none; b=bbAh8ybcosFCZcWgYrqaYIW7T9acPpDBYEth/4tUoDXUXPsnUc3Cgma18w9TvKFp1JD1SM6EOOykCzBZRvYn1j4ZE8oDMKokCOjjfxIwwmZxRviIxT8keXnguNx6q/BhtaKPwANkeZfWCmQVjQOfLcY9Fb5I/8dymn0o/NAPIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732804; c=relaxed/simple;
	bh=6macRaziI1tZ0NmWWFowpIhhpeq4OFp0Xn+2v0Bh/7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWv3aBbPDZUdgpDs2TiadNyGaiNLaoWclctKzUKx1DjKX0mTMCzNDST0tMJ67jT8OHd3X59YzJQ0I13UDxCM71JQ5MwX+WJ0xIt6lvUIrM2dbrBCoGwgaF30fK3/Tcc75ugQ7Sjo32DFZNacozhfR8oNcLlzxD3RbEM+osYxG7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KwaXVkh5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KwaXVkh5"
Received: from ideasonboard.com (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5132F324;
	Mon, 29 Jun 2026 13:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782732751;
	bh=6macRaziI1tZ0NmWWFowpIhhpeq4OFp0Xn+2v0Bh/7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwaXVkh5tW0cRdS1C0CZIHR0jMHPvzQfYiW+y9ZsDwqouUK6K8JOBkCJ2ek2obKq5
	 VXN8qbM/sAJYxlJHtA3cRNZHlx8IlXbjdpmEt4+dShS+OfrCBlYyYhZYRPL25K9p26
	 JARpvidte78bUa75WqXBbNhA/B21s+kGNORM4Whg=
Date: Mon, 29 Jun 2026 13:33:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Message-ID: <akJUZ7TAGLnTmbFJ@zed>
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

Hi Vincenzo

On Mon, Jun 29, 2026 at 12:08:08PM +0100, Vincenzo Frascino wrote:
> Hello Laurent,
>
> On 29/06/2026 10:57, Laurent Pinchart wrote:
> > Hi Jacopo,
> >
> > Thank you for the patch.
> >
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
>
> @Jacopo, can you please confirm if this is the case?

validation happens in the qbuf ioctl handler call path (and in the
prepare_buf handler too).

I don't think it's strictly an hot path but we're in ioctl context and
I think it makes sense to minimize the time it takes to complete the
ioctl call.

Thing is, if we go down the path of validating everything, then why
would you validate Gamma LUT tables of 129 entries but not LSC tables
of 3k values ?

I feel it's hard and quite subjective to draw a line on when it's too
costly to perform validation or not, and I think the severity of the
potential issue caused by a wrong parameter is a more suitable metric
to decide what to validate ?

>
>
> --
> Regards,
> Vincenzo
>
