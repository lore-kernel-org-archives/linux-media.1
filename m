Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D330B50F
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351911; cv=none; b=ZCqYEWGt8qP8rEKh+Mu6RWxMIFKz8p1lXVGNg3XYgbR5/MrftaFGccqxKjmLdSe09SuSFaeAQz7a+jCNVA/ICpH3yNsD5A6FcbfchNP5KcfuPNiduuhOeXBo9JSSeu0JPhnnxwABCmDyuT+cf3gtgla35bHvfXu7ETMnHbHvUug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351911; c=relaxed/simple;
	bh=oAjPQQM3+iyT8s5grk53moXTQxqafCZUzbKXt63UFnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUfZ1u2fX3abX5r/X3HwZj905XE37oSF55wGvK2e26E+AO80pN3FVYuD8nS41M/N9+sQ5lwaSazYGIbchYKc4qH4ZzMZ5tULLwsPVd6yabFYEkZy5jqVDDVe/gq74i1BzWiwrj3dM+OhKU615gD1Jih1yHGevmkOqxPkG0FVJNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p9rWKFvW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p9rWKFvW"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 38CE2107;
	Thu, 16 Apr 2026 17:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776351811;
	bh=oAjPQQM3+iyT8s5grk53moXTQxqafCZUzbKXt63UFnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9rWKFvWbhmWcJmU0Z7ynvhIXgxd/hzUFbMcrY3c+WPdfC46P0JvJZ8BF9wByJq11
	 OGGdZeU4lrQJtBFwbkOqinT2uInlW/JxB8Su0UoGexOwsac7cVoJIF3MI0tM3XBWa1
	 +vfmxi9EcqwsuYQmPZlp7I3IlwbXQhE6rQjU/sYM=
Date: Thu, 16 Apr 2026 18:05:03 +0300
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
Subject: Re: [PATCH v4 14/29] media: Documentation: Improve LINK_FREQ
 documentation
Message-ID: <20260416150503.GN1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-15-sakari.ailus@linux.intel.com>

On Wed, Apr 08, 2026 at 06:39:23PM +0300, Sakari Ailus wrote:
> Add a reference to the LINK_FREQ control and clarify the meaning of the
> control as for C-PHY the matter is less obvious.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/tx-rx.rst                      | 3 ++-
>  .../userspace-api/media/v4l/ext-ctrls-image-process.rst       | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 22e1b13ecde9..7df2407817b3 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -93,7 +93,8 @@ where
>     * - variable or constant
>       - description
>     * - link_freq
> -     - The value of the ``V4L2_CID_LINK_FREQ`` integer64 menu item.
> +     - The value of the :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` integer64
> +       menu item.
>     * - nr_of_lanes
>       - Number of data lanes used on the CSI-2 link.
>     * - 2
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 6d516f041ca2..ee88933256dd 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -24,7 +24,9 @@ Image Process Control IDs
>  .. _v4l2-cid-link-freq:
>  
>  ``V4L2_CID_LINK_FREQ (integer menu)``
> -    The frequency of the data bus (e.g. parallel or CSI-2).
> +    The fundamental frequency of the operating symbol rate (serial interfaces

While this is absolutely correct, I think it will confuse most readers
more than the existing text. Do you think that mentioning that, for
CSI-2, the frequency is equal to 1 / (2 * UI) would help ?

> +    such as CSI-2) or the sampling rate (parallel interfaces such as DVP or
> +    Bt.565) of the data interface.
>  
>  .. _v4l2-cid-pixel-rate:
>  

-- 
Regards,

Laurent Pinchart
