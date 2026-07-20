Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EB83C342B
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532652; cv=none; b=Rk+wc4ntBVm6dBnue05R0SiE1sIkNmKV4qIxYDFl9xw4ErzmuB3rHzqrZTT77OUyEH3H4p7cyWjYq0Z46swOWvrhxGJvc5ZAln4dDJ47lgE1XM4SOeF9s5RfpWdijXABKm9Lax0lDEk9hCGyib9wlM/ThjyEZSrxDRztYVY3juY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532652; c=relaxed/simple;
	bh=sAzDug9yigAB9DFxluOImeWiNEJqjxzu7k0Rhqcm7JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnF1u9GxtdGlchYRurUIUUxpGXOgNCJmzZu/UEXolC7Qso141jSimJ8Nh5enhWl1lYCv0THoFj3+7bx5/FCL+OEmnlqLf39Y26rJCgSugf912bUrAlngEle9VPUNLkBaBihn5ux+fqCek+E1/QKze4YYUVO/T+d82Dsx4f8ZiLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j3jZXAej; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j3jZXAej"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFC53161;
	Mon, 20 Jul 2026 09:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532589;
	bh=sAzDug9yigAB9DFxluOImeWiNEJqjxzu7k0Rhqcm7JA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3jZXAej47rT7LrktyQpWBX3Fs6P8ciy9ngA5btsArsbZGIud9JaqHWWJ+SMEZ/o0
	 bJiBvyQ8RUmBRXNsVkt+MX5eec7CUR4TFXfyQBKBMDYB38Es4cuicUFUtcZkli8j41
	 eGQ6A4CnuOXc4L2VXNu7eJdDb83APupH43CyHcas=
Date: Mon, 20 Jul 2026 10:30:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 08/16] media: v4l2-subdev: Move op check to sub-device
 op wrappers
Message-ID: <20260720073046.GA2288997@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-8-sakari.ailus@linux.intel.com>
 <20260720064521.GE2208631@killaraus.ideasonboard.com>
 <20260720064559.GF2208631@killaraus.ideasonboard.com>
 <al3MvhlOFGEIdZZM@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al3MvhlOFGEIdZZM@kekkonen.localdomain>

On Mon, Jul 20, 2026 at 10:22:38AM +0300, Sakari Ailus wrote:
> On Mon, Jul 20, 2026 at 09:45:59AM +0300, Laurent Pinchart wrote:
> > On Mon, Jul 20, 2026 at 09:45:22AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jul 01, 2026 at 03:26:25PM +0300, Sakari Ailus wrote:
> > > > In anticipation of performing work for sub-device operation when the
> > > > driver doesn't implement one, move the check of operation existence to the
> > > > wrapper itself.
> > > > 
> > > > No functional change intended.
> > > > 
> > > > Many drivers implement set_fmt() pad op that simply returns the format
> > > > just as get_fmt() would do, usually because the driver only supports a
> > > > single one. The arguments to set_fmt() and get_fmt() are about to get
> > > > differentiated so call get_fmt() always if set_fmt() isn't supported by
> > > > the driver. This avoids changing drivers now and allows removing
> > > > boilerplate code from existing drivers.
> > > 
> > > I don't see this change in the patch. Am I missing something ?
> > 
> > Patch 09/16 answers my question. With this paragraph dropped from the
> > commit message,
> 
> If you think the first paragraph is enough to explain why this is done, I'm
> fine with dropping this one.

The second paragraph states "call get_fmt() always if set_fmt() isn't
supported by the driver", which is done in patch 09/16, not here.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!

-- 
Regards,

Laurent Pinchart
