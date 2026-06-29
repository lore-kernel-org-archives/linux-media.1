Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B43B6356;
	Mon, 29 Jun 2026 21:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769467; cv=none; b=f0cGxCCmuVX0PavjuD0HpkGJPCRdaaBnhhuOySYxUj3JcL/EDR8RjWhfSjFph5PyTNc6pphndylW8CFRx5ptmeN6r69HT86zmc3SXE/WQuTFd0WKNvHcdP7LcDbBMmTBmIW5P2X+1J1WqnYk2IsILdD1s0bl1MKZJzf4pJ6C3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769467; c=relaxed/simple;
	bh=VntRchsGHa8Az/Gx57FacHavsecp170VwT//tMcTGWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeHMeol+eRgHxxMJ8k/f1ubc7CW+UjZS1NGrqiZFLrmL/GfbllzMarg5K2boEY4Qwq3Q8PwQpybbzJpwjgwOEX3cFLVjXG12ArmzbakPspOYzkowHujsf7IM39x/QptfiHHFpPZCCu8bDMGtqcN3Hcg7YAblFXoBEwb3CzXEkiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CRF0dSDM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CRF0dSDM"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F8291044;
	Mon, 29 Jun 2026 23:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782769420;
	bh=VntRchsGHa8Az/Gx57FacHavsecp170VwT//tMcTGWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CRF0dSDMKACmjvhJsBtuszXwY0SnqO5fI8YG7BlRYs6KFhU3+lAOJZDKlTErECGtM
	 8KoWAvRZ9FJGbnTfMrZfLxBgKcV7uPHGN6KEe/UYqQ4UZtYrhAxLFs4e6CyvKQf+Bw
	 cEuJ3n+04o3gxKKauHUwYWiKG6CYhuwMzXhbXnPY=
Date: Tue, 30 Jun 2026 00:44:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org, michael.riesch@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer
 to imx8mq-mipi-csi2
Message-ID: <20260629214422.GL3054459@killaraus.ideasonboard.com>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
 <20260603-dphy-params-extension-v1-1-22e0e1ed8bf2@kernel.org>
 <aiBqGVR11AZ-QI26@lizhi-Precision-Tower-5810>
 <aiCDwpd9rsPf1FxR@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiCDwpd9rsPf1FxR@lizhi-Precision-Tower-5810>

On Wed, Jun 03, 2026 at 03:42:58PM -0400, Frank Li wrote:
> On Wed, Jun 03, 2026 at 01:53:29PM -0400, Frank Li wrote:
> > On Wed, Jun 03, 2026 at 12:15:40AM +0100, Bryan O'Donoghue wrote:
> > > At the media summit in Nice this year we discussed that cross reviewing
> > > from different people on LKML was lacking and desirable. Laurent suggested
> > > NXP/Qcom do some cross pollination.
> > >
> > > Happy to read and review NXP stuff in that spirit.
> > >
> > > Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> > > ---
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Laurent and Bryan O'Donoghue,
> 
> 	which qcom part I can help review, I can add myself as reviewer also.

Bryan, could you please reply to this ?

> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index efbf808063e50..8436428865aac 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16094,6 +16094,7 @@ M:	Frank Li <Frank.Li@nxp.com>
> > >  M:	Martin Kepplinger-Novakovic <martink@posteo.de>
> > >  R:	Rui Miguel Silva <rmfrfs@gmail.com>
> > >  R:	Purism Kernel Team <kernel@puri.sm>
> > > +R:	Bryan O'Donoghue <bod@kernel.org>
> > >  L:	imx@lists.linux.dev
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained

-- 
Regards,

Laurent Pinchart
