Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304F395DB8;
	Thu,  5 Mar 2026 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772712854; cv=none; b=Gf7VE6J42XtoTy65EvWPMvs1dIuaURDDcn6PEhjy+gcnxfjGZ63gaBKT35BAGGVOyxdnDDtzcM+QsQdq/LgHsr0n7dAs7iUBHMs0LdldELaj9J4kgMhSkuPg89aTuW2lxddVuQrgq6YTihgXakIrS5ayYAczVk2V2LJT76RHa9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772712854; c=relaxed/simple;
	bh=d7P3UBDfkNE3lbDPnmS11IFvwvW2sxYmXxuua2dcFHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZquMcGschyLN5UtLbN2tnxAq9wPyT0keHKn4fqNoSgluTCCGHpZ0rvm5nvWu+eMNqPkWrmUG22CcgQ1UhXGVxAZCTj/a2KfJS7XOAn0yxxmkJr5fy+ZirZE+z6eoLtuUdZiYYkq8VnMOm5QWwF4LoMC5nlliGivrw3E5Py0fls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E6qnQQKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E6qnQQKY"
Received: from killaraus.ideasonboard.com (85-76-15-90-nat.elisa-mobile.fi [85.76.15.90])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 159A7802;
	Thu,  5 Mar 2026 13:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772712787;
	bh=d7P3UBDfkNE3lbDPnmS11IFvwvW2sxYmXxuua2dcFHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6qnQQKYvTYRS+oPGK9LcXoQL/WXH4S9JOK3pOEoQFXPGd5G4z0CufYM+DPr/We9S
	 bo1iNMM4HsfndHTfWQhqRoHWwvt5JKKWUrlkG2kS0/0La6ItceTIZDGs+8MKDtN0DB
	 fM7GJKDVczdBwIq7FF/DMPtDIM/DaUS+JRMjYIGs=
Date: Thu, 5 Mar 2026 13:14:08 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v6 1/2] media: uapi: Clarify MBUS color component order
 for serial buses
Message-ID: <20260305121408.GA208179@killaraus.ideasonboard.com>
References: <20260217-csi-bgr-rgb-v6-0-064607effe42@redhat.com>
 <20260217-csi-bgr-rgb-v6-1-064607effe42@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217-csi-bgr-rgb-v6-1-064607effe42@redhat.com>

On Tue, Feb 17, 2026 at 09:38:57AM +0100, Maxime Ripard wrote:
> The subdev format documentation has a subsection describing how to use
> the media bus pixel codes for serial buses. While it describes the
> sampling part well, it doesn't really describe the current convention
> used for the components order.
> 
> Let's improve that.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst        | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index cf970750dd4c6ab32274f75453390eb8148ef3c6..6d57c325ffa506fd57dad0845c9a742fd199a6f0 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -157,18 +157,21 @@ memory.
>  While there is a relationship between image formats on buses and image
>  formats in memory (a raw Bayer image won't be magically converted to
>  JPEG just by storing it to memory), there is no one-to-one
>  correspondence between them.
>  
> -The media bus pixel codes document parallel formats. Should the pixel data be
> -transported over a serial bus, the media bus pixel code that describes a
> -parallel format that transfers a sample on a single clock cycle is used. For
> -instance, both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used
> -on parallel busses for transferring an 8 bits per sample BGR data, whereas on
> -serial busses the data in this format is only referred to using
> -MEDIA_BUS_FMT_BGR888_1X24. This is because there is effectively only a single
> -way to transport that format on the serial busses.
> +While the media bus pixel codes are named based on how pixels are
> +transmitted on parallel buses, serial buses do not define separate
> +codes. By convention, they use the codes that transfer a sample on a
> +single clock cycle. and whose names correspond to the order in which

s/cycle./cycle,/

I would write "bit orders from LSB to MSB" instead of "names", as in the
example below the "name" contains "RGB" but the described order is blue,
green, red.

> +colour components are transmitted on the serial bus. For instance, the
> +MIPI CSI-2 24-bit RGB (RGB888) format uses the MEDIA_BUS_FMT_RGB888_1X24
> +media bus code because CSI-2 transmits the blue colour component first,
> +followed by green and red, and MEDIA_BUS_FMT_RGB888_1X24 defines the
> +first bit of blue at index 0. While used for 24-bit RGB data on parallel

s/index 0/bit 0/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +buses, the MEDIA_BUS_FMT_RGB888_3X8 or MEDIA_BUS_FMT_BGR888_1X24 codes
> +must not be used for CSI-2.
>  
>  Packed RGB Formats
>  ^^^^^^^^^^^^^^^^^^
>  
>  Those formats transfer pixel data as red, green and blue components. The

-- 
Regards,

Laurent Pinchart
