Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7047B36215A
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 14:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994089; cv=none; b=gRXV4T5rOywXfJ+8LhvG5/5Ze41bwhVkU3fcgXkf9TOxYVJoboDLEJdSFEr/dHRTLiBaU2lfEy6qoACFKyx59HDseEqMQkXsnYbjGYHdCnI59RmGmVKvTmFZ1OfTv23/2zzVTbZbUp8Wj+50WmOecIrolthCnzTDPNyK1W1UKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994089; c=relaxed/simple;
	bh=2rEUV161fBiQEBsM13ji0n4JdKFrzVuX/Z2m3wrZYWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2sqy93sDmY1Xx7V4yhnrBjPCl4ks5T1whPQ1P6vIDAzsO+sAM0MVDkEpEmnfkFq+vn7J6R3rZEqS0TYxoI24JahJc4BnTW6gx4TeyKPmSPFhmP1Z6TLq/i+msxq9kv/Y2bHyBsymMBU9tJzc0LGS78Q6/pUGVCNldoOCuIUM2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gTpD8ACQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gTpD8ACQ"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC68B348;
	Fri, 13 Feb 2026 15:47:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770994037;
	bh=2rEUV161fBiQEBsM13ji0n4JdKFrzVuX/Z2m3wrZYWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTpD8ACQvxoWX0Ry4jTc6KDWfvs9jXwvavP7MTmWenvx8bMccsj3DcbBvIDBulj0D
	 MdrpiYm7WPOKOrfOYS+7ep23PC1+sinZ7fcemql99/0E2qa0nIZtMklzBiV3bpwfwd
	 9xmkCRUNV4MjzlK5uPgTmYLU7A1ZAyl5WPoaxMqE=
Date: Fri, 13 Feb 2026 15:48:02 +0100
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
Subject: Re: [PATCH v2 02/14] media: v4l2-subdev: Allow accessing routes with
 STREAMS client capability
Message-ID: <aY85lNf8Ky9QwTZK@zed>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211090920.1851141-3-sakari.ailus@linux.intel.com>

Hi Sakari

On Wed, Feb 11, 2026 at 11:09:08AM +0200, Sakari Ailus wrote:
> Disable access to routes when the STREAMS client capability bit isn't set.
> Routes aren't relevant otherwise anyway.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 66842b975f91..b2105c34478e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1008,6 +1008,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>
> +		if (!client_supports_streams)
> +			return -EINVAL;
> +
>  		memset(routing->reserved, 0, sizeof(routing->reserved));
>
>  		krouting = &state->routing;
> @@ -1035,6 +1038,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>
> +		if (!client_supports_streams)
> +			return -EINVAL;
> +
>  		if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>  			return -EPERM;
>
> --
> 2.47.3
>
>
