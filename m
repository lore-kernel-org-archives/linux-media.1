Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CD3B0AF1
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773414678; cv=none; b=pCR79Y/p2Q1lZuWLUn96pi/dLgcqTvaydKooV4Yzk6Nz75s4uF7aCx8aP6GTF83dN/ESRFxdtINPNwWMSrnUZfe7oppvDE4kQ2YaR6II9QhUwj07qCM/9jfBGF7wnDwIn0jNdQNEE7F+qzGJ4B68+iDLFRSi/XnlKSvawqq1uQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773414678; c=relaxed/simple;
	bh=mYbDzFdk0p7QtHw2lzQ4NvSYW82kE/aTlc6x/WJCODw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxJdFKfr0dIRemN2i2IEx+wsDf2lQHeP2UdmAO88kTnK997E6d9oThL4Z3z4kRk59Wz09MZwo9H1WHeFIQ4uujR8gj4PekDlD3xpPcpcGLOCR0L2H4YAV3CYVYgYU8j72KSkikrrp9PihfD56/PGW3Bptd2rUKlI/fk9ChwkEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V5Qx60IH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V5Qx60IH"
Received: from ideasonboard.com (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E507B379;
	Fri, 13 Mar 2026 16:10:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773414606;
	bh=mYbDzFdk0p7QtHw2lzQ4NvSYW82kE/aTlc6x/WJCODw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5Qx60IH+XcwAFpwWGvfSl+n0n9pZVnAGGK02QLnfCMY/goBKjIRueC6xzRjy0s8S
	 kFq6SV/rbsBkdz2GrQJWn4hoAtnr4DubHTTyAcy8NCt5djeRJppmghHJcpN+KaSEsq
	 9ZqtqNYkuDe1gKQ1P9OI2srOekZjdlGKcjm19q8Y=
Date: Fri, 13 Mar 2026 16:11:10 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, 
	jacopo.mondi@ideasonboard.com, tomi.valkeinen+renesas@ideasonboard.com, kees@kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix error check in
 v4l2_subdev_get_frame_desc_passthrough()
Message-ID: <abQogNke5pjfdmWP@zed>
References: <20260313063946.3220962-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313063946.3220962-1-nichen@iscas.ac.cn>

Hello Chen Ni,

On Fri, Mar 13, 2026 at 02:39:46PM +0800, Chen Ni wrote:
> Use IS_ERR() and PTR_ERR() to properly handle the error return from
> media_pad_remote_pad_unique(), which returns ERR_PTR() on failure but
> never NULL. The previous code only checked for NULL, leading to invalid
> pointer dereference.
>
> Fixes: a564839e630c ("media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Seems like a bug indeed, thanks!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9efd14d4026f..7cb17e0a5617 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2585,10 +2585,10 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>
>  			if (!have_source_fd) {
>  				remote_source_pad = media_pad_remote_pad_unique(local_sink_pad);
> -				if (!remote_source_pad) {
> +				if (IS_ERR(remote_source_pad)) {
>  					dev_dbg(dev, "Failed to find remote pad for sink pad %u\n",
>  						local_sink_pad->index);
> -					ret = -EINVAL;
> +					ret = PTR_ERR(remote_source_pad);
>  					goto out_unlock;
>  				}
>
> --
> 2.25.1
>
>
