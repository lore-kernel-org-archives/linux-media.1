Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC8B3BB57
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393094; cv=none; b=B4kgpDuhL+7flJyoBuuhKKKmjJtLM6H8s8YMvriZnkwTi7mIMU6lmfKVgnP9EtefS8re6QmvGtNxJr+WTymmyvn30v+OLa56zSNThdXZBtDYLcYjlNFmWEXml6GwKQsG7k6f9zQahedlQnphdp+op6wzr1ibHOQuq+7TWed4AXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393094; c=relaxed/simple;
	bh=isbAV8408AbzgxAXJoLEOtIhIbpGW3f/ik9pnihjI+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cM0gD+oZz+HqZO0IH7sIe0iOUTRVImnQ7hNcQ9iRG8hFPZI+Fr3MS7Gkp1efGJ0YfdZ8s0AhOE1COoEvAA1D70D1GrzH9zKoii+3cfQ84wQv++3sfytOU+agCx4R5sFdm6tAiJRvotfbw/j8bk1Eq7kJsJA5I9mNJt9OkRnsK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A/MXJ87r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A/MXJ87r"
Received: from killaraus.ideasonboard.com (unknown [89.244.118.114])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 80C85D0;
	Fri, 13 Mar 2026 10:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773393014;
	bh=isbAV8408AbzgxAXJoLEOtIhIbpGW3f/ik9pnihjI+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/MXJ87r8IGSEgYejf6I3jhT6AEyTrPs16NSKBiUpxzfmvE+qZ+EGYcplX4ulAXEx
	 wfw/JfU+2TzndHs1HVehd+T2BAMrYtOH5zXictl1tp7Nc6HA7XdHTXzuRrt4BVOgyk
	 kofKf/7qMvr8jVOTECCAByXSIEid8TQqwUNPtv0Y=
Date: Fri, 13 Mar 2026 10:11:22 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se, antti.laakso@linux.intel.com,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v5 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on
 parsing NULL endpoints
Message-ID: <20260313091122.GA333526@killaraus.ideasonboard.com>
References: <20260310141157.1186325-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310141157.1186325-1-sakari.ailus@linux.intel.com>

On Tue, Mar 10, 2026 at 04:11:57PM +0200, Sakari Ailus wrote:
> In general drivers get their firmware graph endpoints from system
> firmware, but on some systems this information is conveyed to drivers via
> software nodes. The software nodes may be instantiated only after the
> drivers are first probed, requiring drivers to explicitly issue
> -EPROBE_DEFER when endpoints aren't found.
> 
> Instead of doing this in all (or at least most) drivers, make v4l2-fwnode
> endpoint parsing functions v4l2_fwnode_endpoint_parse() and
> v4l2_fwnode_endpoint_alloc_parse() return -EPROBE_DEFER when an endpoint
> is NULL.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> since v4:
> 
> - Fix comment indentation.
> 
>  drivers/media/v4l2-core/v4l2-fwnode.c | 9 ++++++++-
>  include/media/v4l2-fwnode.h           | 6 ++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 03daa8c4ff7a..77f3298821b5 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -465,8 +465,15 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  	enum v4l2_mbus_type mbus_type;
>  	int rval;
>  
> +	/*
> +	 * Return -EPROBE_DEFER if there's no endpoint -- in case the endpoint's
> +	 * origin is a software node, it may be that the endpoint has not been
> +	 * instantiated yet, but will be with probing of another driver. This is
> +	 * the case with the IPU bridge; once we have no such cases left, return
> +	 * another error such as -EINVAL.
> +	 */
>  	if (!fwnode)
> -		return -EINVAL;
> +		return -EPROBE_DEFER;
>  
>  	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
>  
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index cd82e70ccbaa..d7abbd76a421 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> + *	   %-EINVAL on parsing failure
>   *	   %-ENXIO on mismatching bus types
> + *	   %-EPROBE_DEFER on NULL @fwnode
>   */
>  int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  			       struct v4l2_fwnode_endpoint *vep);
> @@ -276,8 +277,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> + *	   %-EINVAL on parsing failure
>   *	   %-ENXIO on mismatching bus types
> + *	   %-EPROBE_DEFER on NULL @fwnode
>   */
>  int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
>  				     struct v4l2_fwnode_endpoint *vep);

-- 
Regards,

Laurent Pinchart
