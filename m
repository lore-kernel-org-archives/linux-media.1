Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6725B2EE611
	for <linux-media@vger.kernel.org>; Tue, 21 Apr 2026 11:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776770312; cv=none; b=IIvAhXrQ+xUOWd9xU2OCRUqPFIBqUIUu5e7oE7MYplBTGgwyhY9+x8AQIstWMrKtEdbUMnrxpu8uB5Np+91/E7kW3XufiMqdRqRcn0JkwOL0naBHlN5r6GD/R0j0bQQZAgkD9lo4udkEoj5zU5hnwM2lUqzuRgkowy1KM3IGyO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776770312; c=relaxed/simple;
	bh=1GEchCh0FXJp6Quu5xOiB83HlfgA43AxZcryhUMWbYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMncZe9ySrwPL7mPG+vvZ5xZZsUCHujeGtQTn7zfJqGtucGze+FhG8/OMKBHAeENfB5URRdwjTfR8ZbKZtJxFjYmaUYMD+glefh70DjKYFyCdqNC2prjhSe/l1TQMG/lCVtSthRjtdfmOLa+YInu0vCLfjNXowLNn8WISm2PPTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WXNl6p0q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WXNl6p0q"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 48A8A78E;
	Tue, 21 Apr 2026 13:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776770209;
	bh=1GEchCh0FXJp6Quu5xOiB83HlfgA43AxZcryhUMWbYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WXNl6p0qgowudNHQiSld/4Mi+fYx9KncAxZC1LvJ3LFO4RFZN35dbGyF0fdWI+LpK
	 Lmqx2UGbB4HlfrgZZiiaFVS/1CyRXpAAKVLZmkFP+8zLVR7NfumbO56oMmHn1Wwbkx
	 2usBtmARKdQ6b+/avHHc+Uj9695iDBF7kdVCGa14=
Date: Tue, 21 Apr 2026 14:18:25 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 18/29] media: mc: Simplify link processing in
 __media_pipeline_start()
Message-ID: <20260421111825.GB2315844@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-19-sakari.ailus@linux.intel.com>
 <20260416143524.GM1775831@killaraus.ideasonboard.com>
 <aedQUDOJtN72k7Pi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aedQUDOJtN72k7Pi@kekkonen.localdomain>

On Tue, Apr 21, 2026 at 01:24:16PM +0300, Sakari Ailus wrote:
> On Thu, Apr 16, 2026 at 05:35:24PM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 08, 2026 at 06:39:27PM +0300, Sakari Ailus wrote:
> > > There are two conditions checking the ENABLED link flag in the loop
> > > going through the links related to an entity. Drop the other one and
> > > simplify the remaining code.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> > > ---
> > >  drivers/media/mc/mc-entity.c | 11 +++++------
> > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> > > index 3fa0bc687851..6bf4730b89d2 100644
> > > --- a/drivers/media/mc/mc-entity.c
> > > +++ b/drivers/media/mc/mc-entity.c
> > > @@ -838,17 +838,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
> > >  			if (link->sink != pad && link->source != pad)
> > >  				continue;
> > >  
> > > -			/* Record if the pad has links and enabled links. */
> > > -			if (link->flags & MEDIA_LNK_FL_ENABLED)
> > > -				has_enabled_link = true;
> > > -
> > >  			/*
> > > -			 * Validate the link if it's enabled and has the
> > > -			 * current pad as its sink.
> > > +			 * Ensure the link is enabled and if so, record
> > > +			 * it. Proceed to the next link if the current pad isn't
> > > +			 * the sink pad of the link.
> > 
> > You can reflow this;
> > 
> > 			 * Ensure the link is enabled and if so, record it.
> > 			 * Proceed to the next link if the current pad isn't the
> > 			 * sink pad of the link.
> > 
> > but I find the new comment confusing.
> > 
> > I would keep the code as-is, I think it's more readable, and the
> > compiler will deal with optimization.
> 
> There's only one flag to test and I can't see how it'd be more readable to
> do that twice in the same location. I can keep the comment as-is if you
> prefer that.

The flag is tested twice for two different purposes, with two separate
comments. A subsequent patch in the series further modifies this code,
and makes things less readable as it inserts code in the middle while
still keeping a single comment to explain the multiple operations. I'm
sure we could expand the comment to explain things in more details (and
bikeshed how to do so), but I think it will still be less readable than
keeping those two steps separate with one comment each.

> > >  			 */
> > >  			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
> > >  				continue;
> > >  
> > > +			has_enabled_link = true;
> > > +
> > >  			if (link->sink != pad)
> > >  				continue;
> > >  

-- 
Regards,

Laurent Pinchart
