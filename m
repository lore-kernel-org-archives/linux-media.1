Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C3F2D29C7
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532695; cv=none; b=GYxC8TFxLbFMhXcOTOggaSQzDIbAdbHzG7dJdhKs760sI2ogsJb69SumJVzqin3gt7vQLfAkbxwkbjICKYJq0TPfisQlddZkazsOi3sSPWxODM31ZcmwWPHelL/pxZj7E3P3uJNqbviyvEutJOatIZia2002NhjkQ1hgB4ld2jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532695; c=relaxed/simple;
	bh=nbO91ENHFLuw/6fbtSgkbWwnrFrpL1fWybtG23+Vvmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wdtu5rMEnmkyLWuMXDY4La55Dp0/E9+BB6xplNjVBasltlJT+wsETvl/WtO7dd3SeHChpLFNpXG0vpK+CWlzlAKpNp4OKLrsRKBWr4lbsrJMkkbFJh39kpNV1yPBgGJ7rXY9S0gIaieL3Ksb/RhsPI4GpO+ex2cszNFSH1jvk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pSRq7RS0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pSRq7RS0"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0C4F161;
	Mon, 20 Jul 2026 09:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532634;
	bh=nbO91ENHFLuw/6fbtSgkbWwnrFrpL1fWybtG23+Vvmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSRq7RS0ecC8ri+lmkpCCD+rdMiVAqZagM6nvVTTA1hvYeGJqgwihDyFuYIhGW/m9
	 mWJXlec7DeTgoZVmugXe4OUCyyxzKn4QfWSKL2EX/1cLTQ/FWP6uk/XfunTYma/afq
	 J2t0Vrc9n16qZHJq3r7eDcCB5Lpiu2DcNihA+zLo=
Date: Mon, 20 Jul 2026 10:31:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 11/16] media: rdacm20: Don't assign set_fmt()
Message-ID: <20260720073131.GA2259915@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-11-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-11-sakari.ailus@linux.intel.com>

Incorrect subject line, s/rdacm20/rdacm21/

On Wed, Jul 01, 2026 at 03:26:28PM +0300, Sakari Ailus wrote:
> Do not assign set_fmt() as it is the same as get_fmt(), which will be

s/will be/is/

> called by the framework now in absence of set_fmt() op.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index bcab462708c7..c7d2bb1cbe48 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -322,7 +322,6 @@ static const struct v4l2_subdev_video_ops rdacm21_video_ops = {
>  static const struct v4l2_subdev_pad_ops rdacm21_subdev_pad_ops = {
>  	.enum_mbus_code = rdacm21_enum_mbus_code,
>  	.get_fmt	= rdacm21_get_fmt,
> -	.set_fmt	= rdacm21_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rdacm21_subdev_ops = {

-- 
Regards,

Laurent Pinchart
