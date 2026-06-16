Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E472E7376;
	Tue, 16 Jun 2026 13:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617848; cv=none; b=Io1nnCQMQbjTVxvqAQ9m2N+BL9zpCKf9P9cKj7Pg+ZRFfVHdKjuc8KmKGN8hYxnjAY/IUk4taoMlk+6Y3XW6WMuvOvUiq6f6wOc/QmgUXsOe9wjXW09CnLzQY41vQjL3i9UJvwUCzzk7RShvOn52IPymcJNxhVmqIvFSv88vweA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617848; c=relaxed/simple;
	bh=AQKow0+x6QHmPVa5Tlph5jPa0ECUpffmLvCQXMJS8bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Utz6st5dot6ClKrsfZlrBCx8TO3xTkgnZHK5Khd1WFNlyvsCNS2q09ipX+CY7vZqhXs0UWMH9mlgkdGSWzkYbebPDyA3w69keihrA87nJKfsn1DHBl7PmURjgcRKDjREFLzFpJlylTrFQXB9PmMM8o8Ap9BdKXXBDyLsvn4a/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RiITLjdJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RiITLjdJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92CCD8FA;
	Tue, 16 Jun 2026 15:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781617812;
	bh=AQKow0+x6QHmPVa5Tlph5jPa0ECUpffmLvCQXMJS8bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RiITLjdJF6TrhpgO3wxb0FcLZcoSW5KtD0sthY52xtI98yFitkWq3m3pzZC+TF7Do
	 Qat5XZ9qTD/9h6OD9ymXUpw4xNasACkPY1ehbfqlopn7KXltGQAb9pAWQw3Y/fFYCS
	 D1tllUla/jXnCoieV8Ah+Gmf802YLmQ3jYMAyh0g=
Date: Tue, 16 Jun 2026 16:50:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: Fix Use-After-Free in
 v4l2_subdev_get_fwnode_pad_1_to_1
Message-ID: <20260616135044.GJ2984510@killaraus.ideasonboard.com>
References: <20260616092516.46339-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616092516.46339-1-birenpandya@gmail.com>

On Tue, Jun 16, 2026 at 02:55:16PM +0530, Biren Pandya wrote:
> v4l2_subdev_get_fwnode_pad_1_to_1() drops the fwnode reference via
> fwnode_handle_put() before passing it to device_match_fwnode(). This
> creates a Use-After-Free vulnerability. If the freed memory is instantly
> reallocated by SLUB, the pointer comparison could accidentally match
> the wrong pad or trigger a KASAN panic.

There's no vulnerability in practice. The code change is still worth it
in my opinion, but the commit message needs an update.

> Fix this by using the __free(fwnode_handle) scoped guard. This safely
> binds the fwnode lifecycle to the function scope, holding the reference
> during the match and releasing it automatically upon return.
> 
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..e6b133ef7850 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -7,7 +7,7 @@
>   * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   *	    Sakari Ailus <sakari.ailus@iki.fi>
>   */
> -
> +#include <linux/cleanup.h>
>  #include <linux/export.h>
>  #include <linux/ioctl.h>
>  #include <linux/leds.h>
> @@ -1243,7 +1243,7 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  				      struct fwnode_endpoint *endpoint)
>  {
> -	struct fwnode_handle *fwnode;
> +	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
>  	struct v4l2_subdev *sd;
>  
>  	if (!is_media_entity_v4l2_subdev(entity))
> @@ -1252,7 +1252,6 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
>  	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);

The recommended usage is to declare the variable where initialized:

	struct fwnode_handle *fwnode __free(fwnode_handle) =
		fwnode_graph_get_port_parent(endpoint->local_fwnode);

> -	fwnode_handle_put(fwnode);
>  
>  	if (device_match_fwnode(sd->dev, fwnode))
>  		return endpoint->port;

-- 
Regards,

Laurent Pinchart
