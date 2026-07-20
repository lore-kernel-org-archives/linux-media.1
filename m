Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427853C3432
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532743; cv=none; b=uNaIqMJOkz3eRxYqF8Gop47UD6UFGdZGbFKRgd4PC5K0LtktnnA4y3mjRUlp65zOhTrsv47nhoWbF8bnL83TELpBC2VFfT8n0mS5cdC6nM99HFBCXE98Bf9TYfCvhC+H/t4TUuLzIsz0q33BEGfBJO0FfU8eK6qY+3KLPJgc6rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532743; c=relaxed/simple;
	bh=5Z93bxTsqYe9zVV2eoxtixL6RyKdlMh8nzy0pokNp1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9IjBtYa5dYeR7etSyYa6XP1k82r10w4xUzDDauLRZoPOFuzTQSEpqKtzZres2GMCNaK4g/KZtTlgp8e8MtivD8Ez2QO2GFDQcT/CtT7XcvW0OudnWdhYeMDKbOztcSZtfYj/jDpZluICddWAUfdM3ZCJJwQh9uPJwhIZ7PbyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FODGAD78; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FODGAD78"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33A93161;
	Mon, 20 Jul 2026 09:31:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532682;
	bh=5Z93bxTsqYe9zVV2eoxtixL6RyKdlMh8nzy0pokNp1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FODGAD78ZgSotSbiMlzYH/OvvqNqV6ZU6N1ERzcY0eycEpPWrZcCgpSOCWiansIhT
	 oO5eRvQ/Fy5chuvUuNqRQOYB/EBMvH4az4mO6owJh5ReWHtA6rCbKMLxi2PDaguoNl
	 eu7zJpRPkn2JzHImlX0j1hBK4wEdoLVStfN4kcKY=
Date: Mon, 20 Jul 2026 10:32:19 +0300
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
Subject: Re: [PATCH v6 12/16] media: gc0310: Don't assign set_fmt()
Message-ID: <20260720073219.GC2259915@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-12-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-12-sakari.ailus@linux.intel.com>

On Wed, Jul 01, 2026 at 03:26:29PM +0300, Sakari Ailus wrote:
> Do not assign set_fmt() as it is the same as get_fmt(), which will be

s/will be/is/

> called by the framework now in absence of set_fmt() op.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/gc0310.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index 7af4d66f42a0..19458eebfde2 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -534,7 +534,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
>  	.enum_mbus_code = gc0310_enum_mbus_code,
>  	.enum_frame_size = gc0310_enum_frame_size,
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
>  	.get_selection = gc0310_get_selection,
>  	.set_selection = gc0310_get_selection,
>  	.enable_streams = gc0310_enable_streams,

-- 
Regards,

Laurent Pinchart
