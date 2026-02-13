Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A515A247295
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994204; cv=none; b=UjlRPiuG39GtabzOvwyWUUxlqUZ7ums72nTIkW9Qg+mooPXX4Q3pql6UUpVdgZl3BcYRsXgwn3LiWnV8HVDKwO09+O48JCw5AhZkuwRh9CPwyoKyWUeDGKT918ZBC3gDR25W2H8bdRg5EkbYwJJKQgSvBfNo0i0g7dPdcNMuf8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994204; c=relaxed/simple;
	bh=eb5f+4tsQn+cgO+FTJH63pnWIchcY80adadyBxr5NQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwN3R+fyBOg26oYSEZVu+eRjJoIdRSzctxk5GlHA6Y9S+cn48eK3VF8Q+807fsTbbRKXZvNjZjodphfDEW+d3n7X2Ufma4E8pt1KZHyzn1BJhB9QpSo4TW4RUOQsi0kaOB7RfjEiPn7cn4FAV+1WyTL03KUa9sy3Rlv/Of94imM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tMAdTX5d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tMAdTX5d"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3366348;
	Fri, 13 Feb 2026 15:49:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770994153;
	bh=eb5f+4tsQn+cgO+FTJH63pnWIchcY80adadyBxr5NQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMAdTX5d+XRTRSr+z2XTjrU9XUHWtYJGKgbWRQzGzr3CRZQ+rnPyu++8MEhfNQgcN
	 3GDnwSI7mueQ1Utk8z1spsh/kth1rxyaPD7eu9YHZxpLEWW/nSwXu4jGzxP5a9kJaU
	 InSjPHkPFpqHtXUQACaHh1fJS6v8+7A3jBvGxh4k=
Date: Fri, 13 Feb 2026 15:49:59 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 04/14] media: Documentation: Improve pixel rate
 calculation documentation
Message-ID: <aY86CWrtgTp7hq2n@zed>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-5-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211090920.1851141-5-sakari.ailus@linux.intel.com>

Hi Sakari

On Wed, Feb 11, 2026 at 11:09:10AM +0200, Sakari Ailus wrote:
> Improve documentation on calculating the pixel rate, by adding references
> to relevant functions and mentioning V4L2 fwnode endpoint instead of OF
> endpoint.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

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
>
>  .. note::
>
> --
> 2.47.3
>
>
