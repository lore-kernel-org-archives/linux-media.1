Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CB33A03F;
	Thu, 19 Feb 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491577; cv=none; b=cNa+2XM9BimHLcCJTmS7kbsv9VEmvtYtyxClJuoStH88N2CKsecWbgKGm/9VbWvB0ZGZ7adLsowJlMbYMB+PbRmwJFVIK5Nui9NyoMQTa17KopZgG9xFT9rlw/ZjO8Ec2MM6d/YhgWaij4E5alfGtRiWlRznVEQkhTI9cuQRY/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491577; c=relaxed/simple;
	bh=b5K/gbcGtyvJQgG3vG1TMw0SZscoHgIelRRIjJgYPdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rS77dO+teU/7Kgy7bZpXPJzdTLEMTek0dFiKzQ7QVITIldmdOhM92xJlRJUCEMju0ZMNNrklqdA2w31SzkT+rH3eJR46aW48N9snShPmCOYafo0CnQhyio/hXhDLSVgDM28vTdn4z8lRpcsEP/M1UePiNokFKiT5hEPEFuwxiQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qC3UO7c6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qC3UO7c6"
Received: from killaraus.ideasonboard.com (unknown [83.245.237.175])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 652264D3;
	Thu, 19 Feb 2026 09:58:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1771491521;
	bh=b5K/gbcGtyvJQgG3vG1TMw0SZscoHgIelRRIjJgYPdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qC3UO7c6qI6lGhJYv8D/YkWIHBgKGFjqSixPo0iZ5OvRUUZnfSM9ZUPAOEqhaDFc0
	 QMRt03olBaEvs4qdct9aUNPcFxiEzQ5yeinCkvMMw6Rew8O+xgHRmZJspqDMvClXcj
	 ebIA7DMilYPiu099RFPt5ZaROeF0h4C8K/mldxpI=
Date: Thu, 19 Feb 2026 09:59:31 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: michael.riesch@collabora.com
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Collabora Kernel Team <kernel@collabora.com>, stable@kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rockchip: rkcif: fix off by one bugs
Message-ID: <20260219085931.GE520738@killaraus.ideasonboard.com>
References: <20260216-rkcif-fixes-v1-0-b16db20b6d68@collabora.com>
 <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260216-rkcif-fixes-v1-1-b16db20b6d68@collabora.com>

On Mon, Feb 16, 2026 at 02:49:56PM +0100, Michael Riesch via B4 Relay wrote:
> From: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Change these comparisons from > vs >= to avoid accessing one element
> beyond the end of the arrays.
> 
> Fixes: 1f2353f5a1af ("media: rockchip: rkcif: add support for rk3568 vicap mipi capture")
> Cc: stable@kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index 1b81bcc067ef..a933df682acc 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -489,8 +489,8 @@ static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>  
>  	block = interface->index - RKCIF_MIPI_BASE;
>  
> -	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
> +	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON_ONCE(index >= RKCIF_MIPI_REGISTER_MAX))

While at it, I'd write

	if (WARN_ON_ONCE(block >= ARRAY_SIZE(rkcif->match_data->mipi->blocks)) ||
	    WARN_ON_ONCE(index >= ARRAY_SIZE(rkcif->match_data->mipi->regs)))

Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		return RKCIF_REGISTER_NOTSUPPORTED;
>  
>  	offset = rkcif->match_data->mipi->blocks[block].offset;
> @@ -510,9 +510,9 @@ static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
>  	block = stream->interface->index - RKCIF_MIPI_BASE;
>  	id = stream->id;
>  
> -	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> -	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
> -	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
> +	if (WARN_ON_ONCE(block >= RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
> +	    WARN_ON_ONCE(id >= RKCIF_ID_MAX) ||
> +	    WARN_ON_ONCE(index >= RKCIF_MIPI_ID_REGISTER_MAX))
>  		return RKCIF_REGISTER_NOTSUPPORTED;
>  
>  	offset = rkcif->match_data->mipi->blocks[block].offset;

-- 
Regards,

Laurent Pinchart
