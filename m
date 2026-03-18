Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16223ECBD6;
	Wed, 18 Mar 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851088; cv=none; b=lLeom3djpQeZ/6rBOxFL8IC4R8Py505d6Mpfr1w6iYQRH+21/HW3+GYfw5YyUiiLQHF7YMASqQ09xsFPysuPasYJt63gzp2D31lVdH/DFZ2/9RhwDVdq0Jbs4TFui6x0o22JW29p21E8ZsF946+ro5Sf8tyuGjIzJFi6KK9oV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851088; c=relaxed/simple;
	bh=143qpALtFXxOoxHAxjVtAwjQX87oB5FgG4D6nrheHOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFh1icrYKk057Ya/AU+S6H/vPu80fVM5LGCqzc01YSgtJN/JwGyP17YVtPLtUTPkcTYiNsSIZKA7O4IsiusrtuYce3X4yfkiX5mdXhZ1kex9XvpTmvODYRjf78B8r6jx1fQcLh7Gte1+h/U9CoeRLskthc26mIPMjn3ULKDICx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ly0eri7S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ly0eri7S"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 379B8379;
	Wed, 18 Mar 2026 17:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773851011;
	bh=143qpALtFXxOoxHAxjVtAwjQX87oB5FgG4D6nrheHOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly0eri7SlU2SGL14BwS9dlE0qpeHSr383G2DXwU28eeP+QoDfEUPGdXMxL6f0+nD1
	 HXTC86ezUccuctGwSqwOVBJ53lF8n+NhMJR1IrnWOQ3v0gKuc0yaDb/XMfVeNQTgsB
	 Ok2bQm4Uinw2+h7IQ8D1gzirOD+bik+yANpGBYlc=
Date: Wed, 18 Mar 2026 18:24:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: subdev: Improve
 v4l2_subdev_get_frame_desc_passthrough() kdoc
Message-ID: <20260318162442.GD633439@killaraus.ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
 <20260317-frame-desc-passthrough-impro-v2-1-0c93b437d85d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-1-0c93b437d85d@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Mar 17, 2026 at 02:09:40PM +0200, Tomi Valkeinen wrote:
> Improve the v4l2_subdev_get_frame_desc_passthrough() kernel doc:
> 
> - Fix 'v4l2_get_frame_desc' operation to 'get_frame_desc' operation
> - Rewrite the body text to be more understandable and specific, and
>   specifically mention the frame desc type handling.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  include/media/v4l2-subdev.h | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index e754ed3421c5..23c03ba7f84c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1724,19 +1724,25 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable);
>  
>  /**
>   * v4l2_subdev_get_frame_desc_passthrough() - Helper to implement the subdev
> - *	v4l2_get_frame_desc operation in simple passthrough cases
> + *	get_frame_desc operation in simple passthrough cases
>   * @sd: The subdevice
>   * @pad: The source pad index
>   * @fd: The mbus frame desc
>   *
> - * Subdevice drivers that only pass through the streams can use this helper
> - * to implement the &v4l2_subdev_pad_ops.v4l2_get_frame_desc operation.
> + * This helper implements get_frame_desc operation for subdevices that pass
> + * streams through without modification. It can be assigned directly as the
> + * .get_frame_desc callback in &v4l2_subdev_pad_ops.
>   *
> - * The helper will call get_frame_desc on the subdevice's sources, create a new
> - * frame desc which contains only the streams on the given source pad. The data
> - * for each frame desc entry is copied directly from the data provided from the
> - * calls to the subdevice's sources, with the exception of the 'stream' field
> - * which is set according to the subdevice's routing table.
> + * The helper iterates over the subdevice's sink pads, calls get_frame_desc on
> + * the remote subdevice connected to each sink pad, and collects the frame desc
> + * entries for streams that are routed to the given source pad according to the
> + * subdevice's routing table. Each entry is copied as-is from the upstream
> + * source, with the exception of the 'stream' field which is remapped to the
> + * source stream ID from the routing table.
> + *
> + * The frame desc type is taken from the first upstream source. If multiple
> + * sink pads are involved and the upstream sources report different frame desc
> + * types, -EPIPE is returned.
>   *
>   * Return: 0 on success, or a negative error code otherwise.
>   */
> 

-- 
Regards,

Laurent Pinchart
