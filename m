Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79EB1DBB3A
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350129; cv=none; b=QQUi9pesh1z+vk5hzcgun1Tz9BO8ar+NQCgEjEOxzvLMY79lswtkHhT68zGFZ+MS90aFS0JePaMOjBvJqCTEfo75si1XSlTDQ9jW+v97kWJDtmXa9LXf7ONxnfrfg+C6j34Wd2YIsnq1rmPcoeN9puSWkZQrEqEjRp0J3ylMIpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350129; c=relaxed/simple;
	bh=UxsXATKAGVqqJ9WrJ6GAkmJnh/uE43wH0LOgHImu6wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDFhVN/wxJOAAJM8DN/rKe7ROW0UwelQjMSn0oTNRwgT8G+/ZI5zGztfzDppJeRFnZ8SXDzcuEa1mgUAcKpaxT9HLw26b47cXbe6nHK7JliFVtn2Z0apCsPEWwrZcTpngDpVM+c4BGgubE5wLpv0qphds1VnA3i+0j/jQABy7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nc7wmtRe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nc7wmtRe"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AEE93132;
	Thu, 16 Apr 2026 16:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776350031;
	bh=UxsXATKAGVqqJ9WrJ6GAkmJnh/uE43wH0LOgHImu6wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nc7wmtRe+5Yggl80oRoX85E6HaRBhpYbLoVwbRjYWOa7f6gwBXLlkNP5qmVqMJjMs
	 bahQLf8CGrvwSiVzbyvGQirqgOlwwoLS24eMnosjpa+hu6FTdVAQ8GUptq1jIBmvHx
	 o3fx7P/rr72qDqkpx0gGYE4SNX+GccpcRTeALNO4=
Date: Thu, 16 Apr 2026 17:35:24 +0300
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
Message-ID: <20260416143524.GM1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-19-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-19-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 08, 2026 at 06:39:27PM +0300, Sakari Ailus wrote:
> There are two conditions checking the ENABLED link flag in the loop
> going through the links related to an entity. Drop the other one and
> simplify the remaining code.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/mc/mc-entity.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 3fa0bc687851..6bf4730b89d2 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -838,17 +838,16 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
>  			if (link->sink != pad && link->source != pad)
>  				continue;
>  
> -			/* Record if the pad has links and enabled links. */
> -			if (link->flags & MEDIA_LNK_FL_ENABLED)
> -				has_enabled_link = true;
> -
>  			/*
> -			 * Validate the link if it's enabled and has the
> -			 * current pad as its sink.
> +			 * Ensure the link is enabled and if so, record
> +			 * it. Proceed to the next link if the current pad isn't
> +			 * the sink pad of the link.

You can reflow this;

			 * Ensure the link is enabled and if so, record it.
			 * Proceed to the next link if the current pad isn't the
			 * sink pad of the link.

but I find the new comment confusing.

I would keep the code as-is, I think it's more readable, and the
compiler will deal with optimization.

>  			 */
>  			if (!(link->flags & MEDIA_LNK_FL_ENABLED))
>  				continue;
>  
> +			has_enabled_link = true;
> +
>  			if (link->sink != pad)
>  				continue;
>  

-- 
Regards,

Laurent Pinchart
