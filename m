Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1C53F4100;
	Tue,  2 Jun 2026 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410369; cv=none; b=VH+x515mrWIVrqTsEIz3r8lG1p4XgtVG8pxDS/t6a1+PuSzi+x+xW1lI6L0XnxCkpVxGqGyZYWRkL7nUzTF8GMie+Wi219hzCahTH7/XeLDkEWYbXZQd1G9gQkQ2GoBFBw9l3ALVS65y1DW0JmtwbJsn1fB+sK8IH5rTGEE2m48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410369; c=relaxed/simple;
	bh=ZIOGRoxp+zTPiCHMTJjlZ1IpZQk3v3ETvYNMofP+Egs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFHEjWvaP+benKsZZQkIHV4O5j5HmfIDRcjdmx6So5SmsURES7W9q0Trp5BjsSAA5XzuMDAZVTSAs8rkGNJ6ffJIL4YMOGp1bV8PBMt4Ha+01JItDH0kqTLdnhf520XVkTEghexECKZlI21nJmIwQWqj1a8f/VdRwlBkTUzMScM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WdD8l3wg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WdD8l3wg"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:e0a:e80:2e70:a22d:ffa9:436b:a9db])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16E2197F;
	Tue,  2 Jun 2026 16:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780410342;
	bh=ZIOGRoxp+zTPiCHMTJjlZ1IpZQk3v3ETvYNMofP+Egs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdD8l3wgnserEJnYku9MFcnV2M8t06AiRDsdW2YoUwIm/0+6gFbuMRTWrD3RbXZO2
	 CIonQa7LpubaMkBpumfwdH4joM8bT6YPGhAZ1vQgrjs1dkqQs+dHeF3mbtRy2fZdb5
	 chLWfYgzdy9w7S+i5NtXXnZQywPX9jw9yfbFP1hM=
Date: Tue, 2 Jun 2026 16:26:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: p.zabel@pengutronix.de, xavier.roumegue@oss.nxp.com, hverkuil@xs4all.nl,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself to dw100 as reviewer
Message-ID: <20260602142603.GB850227@killaraus.ideasonboard.com>
References: <20260601155059.1332290-1-bod@kernel.org>
 <20260601155059.1332290-2-bod@kernel.org>
 <gDn4RCB4gOUFyNFwqb1Z_PKSw6MZAJBkl09jatpSLYWEfXlHnTAeiOZuR08ssuKr3yWKuP-Bb21qRDbqy-8ceA==@protonmail.internalid>
 <20260602085551.GA850227@killaraus.ideasonboard.com>
 <b19493de-5d39-49d8-a5f1-acfc613cfacf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b19493de-5d39-49d8-a5f1-acfc613cfacf@kernel.org>

On Tue, Jun 02, 2026 at 11:10:24AM +0100, Bryan O'Donoghue wrote:
> On 02/06/2026 09:55, Laurent Pinchart wrote:
> > Thanks for volunteering 🙂
> > 
> > This may however not be the best candidate. The dw100 driver is well
> > maintained today, by Xavier as well as Stefan, as Ideas on Board makes
> > active use of it (Stefan, you could also volunteer as a reviewer).
> > 
> > Drivers that I think would most benefit from your reviews would be
> > imx8mq-mipi-csi2, dw-mipi-csi2rx (technically a Synopsys driver, but
> > used in NXP SoCs), and the new imx95-csi-formatter driver ([1]).
> > 
> > Other candidates could be imx7-media-csi and imx-mipi-csis, but those
> > see little activity as they support older hardware. The imx media
> > staging drivers could also do with some love, but that would be active
> > development and not just review.
> > 
> > [1]https://lore.kernel.org/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com
> > 
> >> Signed-off-by: Bryan O'Donoghue<bod@kernel.org>
> >> ---
> >>   MAINTAINERS | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index ec0743b41a463..35368c2ff0ca6 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -19243,6 +19243,7 @@ F:	drivers/media/platform/nxp/imx8-isi/
> >>
> >>   NXP i.MX 8MP DW100 V4L2 DRIVER
> >>   M:	Xavier Roumegue<xavier.roumegue@oss.nxp.com>
> >> +R:	Bryan O'Donoghue<bod@kernel.org>
> >>   L:	linux-media@vger.kernel.org
> >>   S:	Maintained
> >>   F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
> > --
> > Regards,
> > 
> > Laurent Pinchart
> 
> Ah, wrong set.
> 
> No problem, I'll v2 for the above instead.

Thank you. Don't get me wrong, your reviews for the dw100 driver would
also be appreciated, but if you have limited time (and I assume we all
do), the above drivers would benefit more from your comments.

-- 
Regards,

Laurent Pinchart
