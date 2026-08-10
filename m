Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B63DEAE3
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367609; cv=none; b=ePMslAErtL+wtWJXJtR38/iYVg4HDnjbo4KdNj2Ql9ZjiHLuPhV8r0+6anRoMfFz7B+fzG5TdvYjjJgzNW42ylb5/kWxAMLqbaTTN/0nZKxpNxyJNl5x8BdC7klSM/+ENBjVJZ7Zy1F3X6GzjAh571bmw1Ykukan/gy7LIoT0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367609; c=relaxed/simple;
	bh=tXJByu+Xd7n74ZTuuXo1T1ps3oGaI8a1Z2vH2+rzKr8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jW6UxQ5ltFTCJuSxzbFEe8IGGCBUYeQSW+RcpYV2I1OlG04Gp2X/223BZo8J9D505KBWuwFT4zWmLezuxtZBKOy5TiTkVVvmVAQRuYlOtR0537+jXITik2GzvCecbc2nWAy6DnJ6KLI7/id5PzMkR6aSpy67+hHoNh/1bhRCcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoQwcGXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoQwcGXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29131F00A3D;
	Mon, 10 Aug 2026 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367608;
	bh=a2iHlz1ipWxUd90WTnf60MhuLbFBE8foCRnaGVCSOyg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=QoQwcGXlFT142o3E63yEq+oTVxTlwFCeyELi0sKZB/a78XfH1If50K5XvgcSIebt2
	 aakeLH9wLwr6vRv2jQAN1a4GrvYbOgBXACcvgbVzkeNBT0upHhKnXIOtdumbOfKVOy
	 PZg5JP6HBDWnCGGqwfOlxzws/Kc+kLGu2pp44tFVl4YDYsqmtXeVJYhbqF3z+CSqAU
	 Ol8rkrsP7LD0+krb2fNR2GOKh26iFzlr1c98mNYSArVoM2vlMjuiE+IaTrvfIW2AWD
	 21U+vq+HtAN5RotrqdwQjrfCZNlg8h+Nbk+lknltXm2QHYhkJGzxXev1kZr1HL6YzZ
	 W7SMSGQz8cN/A==
Message-ID: <62eb44d3-815e-41fd-a2f2-b359e90ff893@kernel.org>
Date: Mon, 10 Aug 2026 15:13:21 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 10/14] media: v4l2-subdev: Don't assign set_fmt where
 it's equivalent to get_fmt
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Prabhakar
 <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260807122409.45807-1-sakari.ailus@linux.intel.com>
 <20260807122409.45807-11-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260807122409.45807-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2026 14:24, Sakari Ailus wrote:
> Do not assign the set_fmt() pad op where it is the same as get_fmt(). The
> get_fmt() pad op is called by the framework now in absence of set_fmt()
> op.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/i2c/ak881x.c                | 1 -
>  drivers/media/i2c/gc0310.c                | 1 -
>  drivers/media/i2c/rdacm20.c               | 1 -
>  drivers/media/i2c/rdacm21.c               | 1 -
>  drivers/media/i2c/tvp5150.c               | 1 -
>  drivers/staging/media/max96712/max96712.c | 1 -
>  6 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
> index cea46f01997d..4cedfc2d4136 100644
> --- a/drivers/media/i2c/ak881x.c
> +++ b/drivers/media/i2c/ak881x.c
> @@ -216,7 +216,6 @@ static const struct v4l2_subdev_video_ops ak881x_subdev_video_ops = {
>  static const struct v4l2_subdev_pad_ops ak881x_subdev_pad_ops = {
>  	.enum_mbus_code = ak881x_enum_mbus_code,
>  	.get_selection	= ak881x_get_selection,
> -	.set_fmt	= ak881x_fill_fmt,
>  	.get_fmt	= ak881x_fill_fmt,
>  };
>  
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index 754e82ad50ae..f2c381602d18 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -537,7 +537,6 @@ static const struct v4l2_subdev_pad_ops gc0310_pad_ops = {
>  	.enum_mbus_code = gc0310_enum_mbus_code,
>  	.enum_frame_size = gc0310_enum_frame_size,
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt, /* Only 1 fixed mode supported */
>  	.get_selection = gc0310_get_selection,
>  	.set_selection = gc0310_get_selection,
>  	.enable_streams = gc0310_enable_streams,
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 52e8e2620b4d..0179508626b5 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -442,7 +442,6 @@ static const struct v4l2_subdev_video_ops rdacm20_video_ops = {
>  static const struct v4l2_subdev_pad_ops rdacm20_subdev_pad_ops = {
>  	.enum_mbus_code = rdacm20_enum_mbus_code,
>  	.get_fmt	= rdacm20_get_fmt,
> -	.set_fmt	= rdacm20_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index ece8a410e7ce..68d2b9d83c3c 100644
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
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 9c204f38935d..5b92424a0148 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1724,7 +1724,6 @@ static const struct v4l2_subdev_vbi_ops tvp5150_vbi_ops = {
>  static const struct v4l2_subdev_pad_ops tvp5150_pad_ops = {
>  	.enum_mbus_code = tvp5150_enum_mbus_code,
>  	.enum_frame_size = tvp5150_enum_frame_size,
> -	.set_fmt = tvp5150_fill_fmt,
>  	.get_fmt = tvp5150_fill_fmt,
>  	.get_selection = tvp5150_get_selection,
>  	.set_selection = tvp5150_set_selection,
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 0751b2e04895..94ae304ac85f 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -264,7 +264,6 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
>  
>  static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
>  	.get_fmt = v4l2_subdev_get_fmt,
> -	.set_fmt = v4l2_subdev_get_fmt,
>  };
>  
>  static const struct v4l2_subdev_ops max96712_subdev_ops = {

