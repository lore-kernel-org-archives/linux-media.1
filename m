Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91978395AD1
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532792; cv=none; b=DCbN5jXF5QhjkFMcFs3BVPBI3VI1MT2JMjso75V2ar2bjHR441tBRa5lZkVHEmG8Lkfw3+BpMasV3oEuV8GIscxYxFQ19RaUkJGuKeIaQfW02gpeOkbkeAUSTWTPmAu4ZNCkW1yz6BQXTvLOuxzY9eP3ERclrgvjgVjKCyn11eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532792; c=relaxed/simple;
	bh=pBffIhNgnw+uIq+ZtN+HRGBnOXq7GxbzAUXKD/On4Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUDJ72AdbgI57+m3Xw+hZ6+hemGOeO/bCMA7+HYtF6WTFxREUZRbSkbDrY6ZgmrgNS0eQIn0gvwY4xoJCMvx61mYdjICPqKuWXV0tOYLohe7bhrz3s/lo7HsxVq5+9ErgR6J4h+rWWJ8lGQ8mz4NVObcl7DmRtl1B6ajYH1UzYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lEeJLgAF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lEeJLgAF"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79AC3270;
	Mon, 20 Jul 2026 09:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784532730;
	bh=pBffIhNgnw+uIq+ZtN+HRGBnOXq7GxbzAUXKD/On4Yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lEeJLgAF8R7Z0IbNZQso8cmyte33J6jpeyHxTiMKTx8oZd4ekhw07HFr5qUXdZh50
	 /e/1c7IDpIoqKi5EYjMg4p6+W8wxe6QpTc8BQ9ckaaDv0UREu89irRy2w7m2qyYOZy
	 mgAdlTcpzi9MXVWBHvwLqC3gD8cdFPv7y01mXnLI=
Date: Mon, 20 Jul 2026 10:33:07 +0300
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
Subject: Re: [PATCH v6 15/16] media: cvs: Drop comments on sub-device
 operations
Message-ID: <20260720073307.GB2218925@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701122634.1728782-15-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Jul 01, 2026 at 03:26:32PM +0300, Sakari Ailus wrote:
> The sub-device operations are well documented in the V4L2 sub-device
> framework already. Drop them from the CVS driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/cvs/v4l2.c | 82 ------------------------------------
>  1 file changed, 82 deletions(-)
> 
> diff --git a/drivers/media/i2c/cvs/v4l2.c b/drivers/media/i2c/cvs/v4l2.c
> index 3a1ec0059ef7..32e4bf74aa1d 100644
> --- a/drivers/media/i2c/cvs/v4l2.c
> +++ b/drivers/media/i2c/cvs/v4l2.c
> @@ -70,19 +70,6 @@ static int csi_set_link_cfg(struct icvs *ctx)
>   * Streaming
>   */
>  
> -/**
> - * cvs_csi_enable_streams - Start streaming through the bridge
> - * @sd: Sub-device pointer
> - * @state: Active state
> - * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
> - * @streams_mask: Streams to enable (bit 0 supported)
> - *
> - * Runtime-resumes the bridge (triggering cvs_runtime_resume() to claim CSI-2
> - * link ownership), fetches the link frequency, programs the MIPI configuration,
> - * and forwards the enable request downstream.
> - *
> - * Return: 0 on success or negative errno.
> - */
>  static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
>  				  struct v4l2_subdev_state *state,
>  				  u32 pad, u64 streams_mask)
> @@ -129,19 +116,6 @@ static int cvs_csi_enable_streams(struct v4l2_subdev *sd,
>  	return ret;
>  }
>  
> -/**
> - * cvs_csi_disable_streams - Stop streaming through the bridge
> - * @sd: Sub-device pointer
> - * @state: Active state
> - * @pad: Pad identifier (must be ICVS_CSI_PAD_SOURCE)
> - * @streams_mask: Streams to disable (bit 0 supported)
> - *
> - * Disables the remote sensor stream then drops the PM reference acquired
> - * during enable. After the autosuspend delay, cvs_runtime_suspend() will
> - * return CSI-2 link ownership to CVS firmware.
> - *
> - * Return: 0 on success or negative errno.
> - */
>  static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_state *state,
>  				   u32 pad, u64 streams_mask)
> @@ -167,15 +141,6 @@ static int cvs_csi_disable_streams(struct v4l2_subdev *sd,
>  /*
>   * Pad operations / formats
>   */
> -/**
> - * cvs_csi_init_state - Initialize pad formats in subdev state
> - * @sd: Sub-device
> - * @state: State container
> - *
> - * Sets all pad formats to a minimal 1x1 default.
> - *
> - * Return: 0.
> - */
>  static int cvs_csi_init_state(struct v4l2_subdev *sd,
>  			      struct v4l2_subdev_state *state)
>  {
> @@ -186,17 +151,6 @@ static int cvs_csi_init_state(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * cvs_csi_set_fmt - Negotiate pad format
> - * @sd: Sub-device
> - * @state: State
> - * @format: Desired / returned format
> - *
> - * Mirrors sink format onto source pad. Accepts many media bus codes, falling
> - * back to Y8 if unsupported. Normalizes field setting.
> - *
> - * Return: 0.
> - */
>  static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
>  			   struct v4l2_subdev_state *state,
>  			   struct v4l2_subdev_format *format)
> @@ -319,17 +273,6 @@ static int cvs_csi_set_fmt(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -/**
> - * cvs_csi_get_mbus_config - Provide current CSI-2 bus configuration
> - * @sd: Sub-device
> - * @pad: Pad index
> - * @cfg: Returned bus config
> - *
> - * Fills lane ordering and number of lanes; retrieves link frequency from
> - * remote entity.
> - *
> - * Return: 0 on success or negative errno.
> - */
>  static int cvs_csi_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>  				   struct v4l2_mbus_config *cfg)
>  {
> @@ -385,17 +328,6 @@ static const struct media_entity_operations cvs_csi_entity_ops = {
>  /*
>   * Async notifier
>   */
> -/**
> - * cvs_csi_notify_bound - Remote sensor bound callback
> - * @notifier: Async notifier
> - * @sd: Remote subdev
> - * @asc: Async match connection
> - *
> - * Locates the source pad of the remote sensor and creates a media link to
> - * the CVS bridge sink pad enabling it by default.
> - *
> - * Return: 0 on success or negative errno.
> - */
>  static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
>  				struct v4l2_subdev *sd,
>  				struct v4l2_async_connection *asc)
> @@ -415,12 +347,6 @@ static int cvs_csi_notify_bound(struct v4l2_async_notifier *notifier,
>  				     MEDIA_LNK_FL_IMMUTABLE);
>  }
>  
> -/**
> - * cvs_csi_notify_unbind - Remote sensor unbind callback
> - * @notifier: Notifier
> - * @sd: Remote subdev
> - * @asc: Connection
> - */
>  static void cvs_csi_notify_unbind(struct v4l2_async_notifier *notifier,
>  				  struct v4l2_subdev *sd,
>  				  struct v4l2_async_connection *asc)
> @@ -438,14 +364,6 @@ static const struct v4l2_async_notifier_operations cvs_csi_notify_ops = {
>  /*
>   * Controls
>   */
> -/**
> - * cvs_csi_init_controls - Initialize V4L2 controls
> - * @ctx: CVS context
> - *
> - * Currently sets up a read-only privacy control placeholder.
> - *
> - * Return: 0 on success or negative errno.
> - */
>  static int cvs_csi_init_controls(struct icvs *ctx)
>  {
>  	struct v4l2_ctrl *privacy_ctrl;

-- 
Regards,

Laurent Pinchart
