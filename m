Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BE47DFA3;
	Fri,  5 Jun 2026 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645495; cv=none; b=CmMHxNn0M0xnvpvj8FyAdpADsGDG/UN7Qy1pYLRHPWjKrZlGAMiqfuLDk6kcO2Icrj/0kplMliTyrQgz1hGxRep61N2PloS+3M0bghbyAqrdRsyo2tp1miFJXzedcALUYf0SvO/ZUk9/IKqd3QFDCfezkII0AP9gdkPj89FxxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645495; c=relaxed/simple;
	bh=LZAWbIwQBwcwHTwBHwzYT3w1immcTj1YOZWFgudxjwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF69GWsGuppiTThkWlV0Y+1XwSQtPVcvCDkupGENsOFkWRDY/+/ekho5DCSPuiuQr2RA3QgkjBAtNTY3iZhHR8K014Yi3/oc9Q/Ov2Dn2I/gQGHPBrEGVu3l2U7fiyY+rwa6cMzjvOKK7L6J3fJgw5fd/g0obDn2cZ8U1l39YE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oqHeSE8R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oqHeSE8R"
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BA138E0;
	Fri,  5 Jun 2026 09:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780645467;
	bh=LZAWbIwQBwcwHTwBHwzYT3w1immcTj1YOZWFgudxjwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqHeSE8RKerDEHRAM/4FlPVypt7XVLuuD+fvAF25XCfS1xQK2GYP+8SAZBt0nYPq/
	 JLIoD8fF6goCE5qwDG4jZ78O4J7fM/Czrv2yMkFkdkIOXo1KifwODuPTQEmhnBdK76
	 B3pPB29kA3jShvVU+oqzxksZ9S1bnmN0VfC7xsdA=
Date: Fri, 5 Jun 2026 09:44:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Fix error pointer dereference
Message-ID: <aiJ-K9B9Eifcfg57@zed>
References: <20260217041055.88912-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217041055.88912-1-ethantidmore06@gmail.com>

Hi Ethan

On Mon, Feb 16, 2026 at 10:10:55PM -0600, Ethan Tidmore wrote:
> The function media_pad_remote_pad_unique() can return an error pointer
> and is not checked. Add check for error pointer.
>
> Detected by Smatch:
> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:414 rzg2l_cru_get_virtual_channel() error:
> 'remote_pad' dereferencing possible ERR_PTR()
>
> Fixes: d7d72dae81d5d ("media: rzg2l-cru: Retrieve virtual channel information")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

This really fell into the cracks and you've not been given any
feedback. Sorry about this.

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..bf7d96841c78 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	int ret;
>
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> +	if (IS_ERR(remote_pad))
> +		return PTR_ERR(remote_pad);
> +

As far as I can tell the link on the cru->ip sink pad is created with
IMMUTABLE flag, so we're sure it always is there.

I don't think the check is required.

Thanks
  j
>  	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
>  		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
> --
> 2.53.0
>
>
