Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66A2C027C;
	Tue, 16 Jun 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618085; cv=none; b=TLnCv9jTfMuF/l4wtTkSAS2GEgqX4tiZ0Pt9xpRS+pmMtsxSXRR1AobtRNYuv2sXjsafICzffBAfyC21/4oyf/CKUZjr8Sm4+FlXjzjsOE7RD7gjJcB3LLbnqvfsrB9o7o//TyAI9RJ9flKEtkIoBba98KMs97F5KnsUogNBA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618085; c=relaxed/simple;
	bh=+MW+vQ5nA7GsZAVZWO1TUU2Fot68OlKs00yA0Jiy+Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATHNyoaJm83FULWeqQOGgga5bvd/gcHX+BDZUTDjZ2DlXU+p7HYbCXxvb7OfrdXtAgSkO7HaEeFuk7R61pDV4Sl2HBX33O6wfB+RwsXTfnTtM+fz3zHyq9m1Tl3fLIqedqTOyCcZZRuzGPkSR4NFQbQtNa9eytSSWNsXXXEsIqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=k4E/iYqv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="k4E/iYqv"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA49C1E6;
	Tue, 16 Jun 2026 15:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781618049;
	bh=+MW+vQ5nA7GsZAVZWO1TUU2Fot68OlKs00yA0Jiy+Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4E/iYqv7lu2x0g2DaN7ey859+FONqudRA1398uzZeWZzAirhiuP81yNVZd/N6/Aj
	 +axR1Gtn7NRycdZAE0x4H/VP7+i4bVZK2a4/RQkpFT77WpHtb8Vnn/1rCnYPCCxIIt
	 LbYqvJVn/pCVTKMYKuEf9hRF4mx1Ts/VtpFmiD+8=
Date: Tue, 16 Jun 2026 16:54:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: Fix Use-After-Free risk in fwnode
 pad matching
Message-ID: <20260616135441.GK2984510@killaraus.ideasonboard.com>
References: <20260616063754.42163-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616063754.42163-1-birenpandya@gmail.com>

On Tue, Jun 16, 2026 at 12:07:54PM +0530, Biren Pandya wrote:
> In v4l2_subdev_get_fwnode_pad_1_to_1(), fwnode_handle_put() is called immediately after fetching the endpoint's parent node. However, the pointer is subsequently passed into device_match_fwnode().
> 
> While device_match_fwnode() only performs a pointer comparison and does not dereference the pointer, passing a dangling pointer is a Use-After-Free violation. If the memory allocator immediately reuses the freed fwnode address for another node, the comparison will yield a false positive. Furthermore, static analysis and KASAN strictly flag passing dangling pointers to functions.
> 
> Fix this by replacing the manual fwnode_handle_put() with the __free(fwnode_handle) scoped guard, which guarantees the reference is safely held for the remainder of the function scope.
> 
> Fixes: 8fe784b9abb2 ("media: v4l2-subdev: add v4l2_subdev_get_fwnode_pad_1_to_1")

Why did you send a new version of this patch
(https://lore.kernel.org/linux-media/20260616092516.46339-1-birenpandya@gmail.com/)
that doesn't identify itself as v2, doesn't include any changelog, and
without replying to this version to tell it's superseded ?

> Signed-off-by: Biren Pandya <birenpandya@gmail.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 831c69c958b8..24c95082ded5 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -8,6 +8,7 @@
>   *	    Sakari Ailus <sakari.ailus@iki.fi>
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/export.h>
>  #include <linux/ioctl.h>
>  #include <linux/leds.h>
> @@ -1243,7 +1244,6 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
>  int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  				      struct fwnode_endpoint *endpoint)
>  {
> -	struct fwnode_handle *fwnode;
>  	struct v4l2_subdev *sd;
>  
>  	if (!is_media_entity_v4l2_subdev(entity))
> @@ -1251,8 +1251,8 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
>  
>  	sd = media_entity_to_v4l2_subdev(entity);
>  
> -	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
> -	fwnode_handle_put(fwnode);
> +	struct fwnode_handle *fwnode __free(fwnode_handle) =
> +		fwnode_graph_get_port_parent(endpoint->local_fwnode);
>  
>  	if (device_match_fwnode(sd->dev, fwnode))
>  		return endpoint->port;

-- 
Regards,

Laurent Pinchart
