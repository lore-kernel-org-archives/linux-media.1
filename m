Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2908D288505
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776355164; cv=none; b=A42Y62h91HDmfl8ljBp3WyemHFXlHTbxLphkXrMBQvBCBegJowlViKu2+lFntS+VoZcXPb1FRZ5Kmfp0gCwgWclFPwz2LcPlXq4seSssnWWEuBLP7JVYDQF75QtbtQM3IDV2ZEGW0ZR8fOkMJN3US4uYhoRyfOAZ9puhzsq8InE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776355164; c=relaxed/simple;
	bh=+he7TfvNH6kojfp6QCkH0BOp2hAxg/+VHy+6UufLVBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwSvVLXBt77yPLnfHb8RRUtzrMJH7+2/E1UVvX+lvxBqLX3nQy9fbbMl/ZPi0f/I89dM5t7TWufO1LCuRnX4uOuhlvvt7hC9eOjn0FOzieI4qpPznaHkJ5RtKTyNx5ar4WlJ/Ld6mpgtEUSGnOQL97RsPaWG1wFcFbMIV6IxAms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YPDnxo6j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YPDnxo6j"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 472A1107;
	Thu, 16 Apr 2026 17:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776355065;
	bh=+he7TfvNH6kojfp6QCkH0BOp2hAxg/+VHy+6UufLVBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPDnxo6j14N7HXMJiCxiSu7/BvIAohjT1mYYogaQvx1/U3tHfWB8Nj4xXD763xkwr
	 7JSz286u4r15cuQ8sd4ja1guzxsPAwU73TnVobWhawHOjitsJZnqr2jesOlTy+MuBO
	 Z2ZB4voaB/pWCc6+jDpfPZEmSRx/H0FXoDOhyg5g=
Date: Thu, 16 Apr 2026 18:59:17 +0300
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
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
Message-ID: <20260416155917.GB1823068@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-22-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Apr 08, 2026 at 06:39:30PM +0300, Sakari Ailus wrote:
> The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> flags that are set by the driver are correctly set as the driver expects.
> This poses a problem for adding new flags as programs could not work with
> links that have unknown flags even when the use of these flags wouldn't
> affect the program.

I suppose applications could be instructed to preserve the flags they
don't know about, but some existing applications probably don't do that.

> Ignore the non-settable link flags.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 717569bd1a8c..287eded356bb 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
>  
>  int __media_entity_setup_link(struct media_link *link, u32 flags)
>  {
> -	const u32 mask = MEDIA_LNK_FL_ENABLED;
> +	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
>  	struct media_device *mdev;
>  	struct media_pad *source, *sink;
>  	int ret = -EBUSY;
> @@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
>  	if (link == NULL)
>  		return -EINVAL;
>  
> -	/* The non-modifiable link flags must not be modified. */
> -	if ((link->flags & ~mask) != (flags & ~mask))
> -		return -EINVAL;
> +	/* Only allow changing user-settable flags. */
> +	flags &= settable_flags;
> +	flags |= link->flags & ~settable_flags;

Now that the link can be configured with different flags than the ones
set by userspace, I think the ioctl should return the actual link flags.

>  
>  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
>  		return link->flags == flags ? 0 : -EINVAL;

-- 
Regards,

Laurent Pinchart
