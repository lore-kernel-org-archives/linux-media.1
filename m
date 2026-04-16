Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A233DEAD0
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349597; cv=none; b=mW5NURPM+OFkIkMQ9qAXu+M2BSkie+NgmpCV7nzp40I6BKz3WtPRQpzi/97qE+x3/RccZjsRGOGEKw/noh6MBkxVURBFVGVFb7fTsfEXhp2Pp+ZJSkq+tkpTJ7TQx7UNTREDHAaEKPBtqvahumbGnRQnR8pVvMYgNafAuMsh5J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349597; c=relaxed/simple;
	bh=liMcROrd+XfFb0OfzlTVB2CZpEnUjFm8/p7/s2mNc3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGC6TQHDlg2So8DjG/pmsa0C33XCIMnqP1Ft3gCu0sSENwoF76b+XDSTkbQ8YFg/ANbKf2fwLtzDTR+42Vms0SzbBOI/GAL47Sn8OJs1Po1I8e+C44on4V/TRRkFMSqYiD1lvvx6N74aR9WYv/ylvv1ZtZLL+HdbvKAOuRiu8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ep6CdnXB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ep6CdnXB"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06818BB;
	Thu, 16 Apr 2026 16:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349500;
	bh=liMcROrd+XfFb0OfzlTVB2CZpEnUjFm8/p7/s2mNc3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ep6CdnXBOuCHoU9O/yvjpPwlFCzQjajsp8ytY3YC48vyh1yyzl5FJuXpu/Cyh4uug
	 dJ1nmtXp9xhW7xMmfc+yZ0amMJvST3bd0ls+P4Ojs1bhBEL7+sFziCCdTrzDKFYZjD
	 t2BFgyJuXFYNO1ebuuCbddx1h9yoYk1U7i1P1mMY=
Date: Thu, 16 Apr 2026 17:26:32 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 08/29] media: imx274: Remove redundant kernel-doc
 comments
Message-ID: <20260416142632.GF1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-9-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-9-sakari.ailus@linux.intel.com>

On Wed, Apr 08, 2026 at 06:39:17PM +0300, Sakari Ailus wrote:
> Remove kernel-doc comments from  regular callback functions. These
> comments have no information value.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx274.c | 38 --------------------------------------
>  1 file changed, 38 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 8ec78b60bea6..241821572e03 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -897,14 +897,6 @@ static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
>  					imx274->supplies);
>  }
>  
> -/**
> - * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> - * @ctrl: V4L2 control to be set
> - *
> - * This function is used to set the V4L2 controls for the imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -1059,16 +1051,6 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  	return 0;
>  }
>  
> -/**
> - * imx274_get_fmt - Get the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state structure
> - * @fmt: Pointer to pad level media bus format
> - *
> - * This function is used to get the pad format information.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *fmt)
> @@ -1081,16 +1063,6 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * imx274_set_fmt - This is used to set the pad format
> - * @sd: Pointer to V4L2 Sub device structure
> - * @sd_state: Pointer to sub device state information structure
> - * @format: Pointer to pad level media bus format
> - *
> - * This function is used to set the pad format.
> - *
> - * Return: 0 on success
> - */
>  static int imx274_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_state *sd_state,
>  			  struct v4l2_subdev_format *format)
> @@ -1423,16 +1395,6 @@ static void imx274_load_default(struct stimx274 *priv)
>  	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
>  }
>  
> -/**
> - * imx274_s_stream - It is used to start/stop the streaming.
> - * @sd: V4L2 Sub device
> - * @on: Flag (True / False)
> - *
> - * This function controls the start or stop of streaming for the
> - * imx274 sensor.
> - *
> - * Return: 0 on success, errors otherwise
> - */
>  static int imx274_s_stream(struct v4l2_subdev *sd, int on)
>  {
>  	struct stimx274 *imx274 = to_imx274(sd);

-- 
Regards,

Laurent Pinchart
