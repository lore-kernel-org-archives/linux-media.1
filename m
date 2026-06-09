Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51019374A04;
	Tue,  9 Jun 2026 19:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781033974; cv=none; b=gj4FiZN31hbXnSnxM7VVV4lAg8AXZ2pEWlLwOlZfsLcWYxZBxpd/VMidPgv0+cq8fOix01cNV6diUdU4lZ2fIUbiXNxKcSQV8doT9/5qIhygQ+IYk8R+roSEebTRneAfEjYGhlJSfnrl1a5nXl0H5b6w7ySU22mOUs/dJUYlhIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781033974; c=relaxed/simple;
	bh=57RZdRkZIFyD25VaAF3kemxhABhLiGaYTI7Ckv/IEBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pg41B6MTbfcJfFfT/mcvXUr2z163Y6DtrdQtBgXgnEwc0PmFcJHFypkLhrDY8zIsFq7Ky/B8U7ft+PXAMsmwUE97fLQXzKrPxWSSpal4pfzJvIU5HJxdI7AS0Jruxs2ZmimJswGc2fRBPjfUDubOS1g9ArG70Q6ULIxHdl6qy7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F7RmH0/L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F7RmH0/L"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365118CB;
	Tue,  9 Jun 2026 21:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781033942;
	bh=57RZdRkZIFyD25VaAF3kemxhABhLiGaYTI7Ckv/IEBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7RmH0/Lf4EOwZsOkln5Hl9Gjlx9vz+GWA8dXbVfXG6+ST0CwKh5houiOmd+0upq0
	 PTQVbL3mi90pl/MVS8Zc3+enQebZ6kBWyqVs9kWGo17efdkNgjT7k/E8XU8x9roSm5
	 5fZevTgQAtFm22K7EO0eswesQobqR6CjXfHEUlNI=
Date: Tue, 9 Jun 2026 22:39:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Fix asc leaked in error/remove
 path
Message-ID: <20260609193929.GC1132670@killaraus.ideasonboard.com>
References: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609-bcmpiclean-v1-1-23bdeb19caf6@kernel.org>

On Tue, Jun 09, 2026 at 08:05:23PM +0300, Eugen Hristev wrote:
> v4l2_async_nf_add_fwnode_remote() allocates the asc, which is freed when
> v4l2_async_nf_cleanup() is called.
> 
> Call v4l2_async_nf_cleanup() properly in the driver paths.
> 
> Discovered with kmemleak after rmmod:
> 
> unreferenced object 0xffff000084526b80 (size 64):
>   comm "modprobe", pid 185, jiffies 4295013512
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 e8 0d ff bf 00 00 ff ff  ................
>     40 83 bc 84 00 00 ff ff 60 83 bc 84 00 00 ff ff  @.......`.......
>   backtrace (crc ac584083):
>     [<00000000ffb081a7>] kmemleak_alloc+0x38/0x44
>     [<00000000d2fd9301>] __kmalloc+0x1b0/0x250
>     [<000000004dd5354d>] __v4l2_async_nf_add_fwnode+0x28/0x9c
>     [<0000000067587657>] __v4l2_async_nf_add_fwnode_remote+0x3c/0x64
> 
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..1508843ae58c 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2613,6 +2613,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
>  	return 0;
>  
>  error:
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  	fwnode_handle_put(ep_handle);
>  	return ret;
>  }
> @@ -2745,6 +2746,7 @@ static void unicam_remove(struct platform_device *pdev)
>  	v4l2_device_unregister(&unicam->v4l2_dev);
>  	media_device_unregister(&unicam->mdev);
>  	v4l2_async_nf_unregister(&unicam->notifier);
> +	v4l2_async_nf_cleanup(&unicam->notifier);
>  
>  	unicam_subdev_cleanup(unicam);
>  
> 
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-bcmpiclean-69a8ee3192b0

-- 
Regards,

Laurent Pinchart
