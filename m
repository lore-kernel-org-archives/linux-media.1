Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A442DB798
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776356411; cv=none; b=IoOTBK4RGtHeX+s0ljNWAlFDqCg9Sh/G+rkXoU81zMXTqIwMq1GJqLJQ1eAL9ToS8M1Wz3mIrf2aV+AQz4TamtlVDfbkbGvkQV/O8uTTPShWvaDWzZzoDVo+DsBmqL6b94jCqRuzVC846rMVq5JvpXGysIyZLIQz7IO3/urYvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776356411; c=relaxed/simple;
	bh=CR6ZhYRAECNqtDvwyMbV4T7ZUQWurvEMkxkvDLZ6Ows=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMwU7yHW02AnHVI7U04DHNv7p8f3gYN9MnNByl0TFf/HFlCNLZjoS9IXMpUmG7Kcd9YhGfmoVOXBRKe/BwWSXTqVFW1WE7GyUuH7wB57atskmouMsjX2o3Z/9gFf9pB5qXMQGax1Ngh26i+nCc/Ya3Y6swdBj34N/ue1PSVDANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XEXD2UE0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XEXD2UE0"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A70ED132;
	Thu, 16 Apr 2026 18:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776356312;
	bh=CR6ZhYRAECNqtDvwyMbV4T7ZUQWurvEMkxkvDLZ6Ows=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XEXD2UE0aS3QQMdKINiZrrIo0nDERiS/DHThrdpPFIJj26TZEgXx8XoN0hTE3UMrf
	 VLe43TubCAcmcVeivWkEN37hrRp5ULlihBWD6IhIiVKdHAvRVZp/nvdi/gUee7saKc
	 7y1CWYDshPerny1cfIEUE+OYqKjEPf4Kooh7Al/A=
Date: Thu, 16 Apr 2026 19:20:04 +0300
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
Subject: Re: [PATCH v4 15/29] media: Documentation: Improve pixel rate
 calculation documentation
Message-ID: <20260416162004.GD1823068@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-16-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-16-sakari.ailus@linux.intel.com>

On Wed, Apr 08, 2026 at 06:39:24PM +0300, Sakari Ailus wrote:
> Improve documentation on calculating the pixel rate, by adding references
> to relevant functions and mentioning V4L2 fwnode endpoint instead of OF
> endpoint.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/tx-rx.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 7df2407817b3..9b231fa0216a 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -104,7 +104,11 @@ where
>     * - k
>       - 16 for D-PHY and 7 for C-PHY.
>  
> -Information on whether D-PHY or C-PHY is used, and the value of ``nr_of_lanes``, can be obtained from the OF endpoint configuration.
> +Information on whether D-PHY or C-PHY is used as well as the value of
> +``nr_of_lanes`` can be obtained from the V4L2 endpoint configuration; see
> +:c:func:`v4l2_fwnode_endpoint_alloc_parse()`,
> +:c:func:`v4l2_fwnode_endpoint_parse()` and
> +:c:func:`v4l2_get_active_data_lanes()`.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  .. note::

-- 
Regards,

Laurent Pinchart
