Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA32931EF
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367564; cv=none; b=Yk4JBZvGpBk6zgu8Bes7tPAu7MXxp6E1H4t70826J0ksjxW3UBWGRKSLVZL+Gv7DyZdG6WS6/qXnLughl5JaPCwirQXsOudTgKgT73PypeaYs0a6Gx+1kWKMIMlRex5qvNF3KQqVVbvUSCnHe6temuN+3f2qlMWNrFY3fUq3Xhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367564; c=relaxed/simple;
	bh=ZD97jW+qTMf1XHytsJ8fcxFSw6vXpnVRfaF+67aDGT0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iI9zq11qUcHx6DIuv2yYiPjHQM9lfpHhaXrSw+l6WO9ig4eJciKP64L6rWHeVqs6euNhXxrM5hmZUQlH/JaQqru6PJH+g8JG5e6bQT8AAApatreinGzi4NGN7xaj2BFjnLIhXLIbD7I+9qM2KxCRAB6wJ7tWcfZ/esQZoErzO/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4zT2Brj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4zT2Brj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603091F000E9;
	Mon, 10 Aug 2026 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786367562;
	bh=d3W8mkH7N4yMsijWfA2VqHNvGBL/RyZ5jmSqjLEt6jg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Y4zT2BrjhFX1uERm9q4Ic/ZpH+URNHbr8tQcAljA8ZZ7kKH4jk6glnad1dy5A5wpe
	 jkOY8rEW0bZ3GW4V5EomS1LlLUaGkmTuYCsN5r38z4dtOjHAzD0xIvOOgBAiBuyc0D
	 AUEvhR0wAkKdNC4koXklbu4qLYNhUiJSNy+0+sYk+cEWvdOww5dMj7XwYyLhxfbFjQ
	 iftT6MmZrTk3kHgP8uKebRsYST2gbFKggFeDK36hGR3uys3ZoJuzpCwzkN2Nnq3m1F
	 KQ35760VoQwPRWvbnps3+yJmZRDIEQjoZkgE3Bc7JqRPgU6UodEpPKDfomBB49MaeJ
	 uEY82FpHXBO4A==
Message-ID: <8395398e-325f-4f8f-a2a5-8a23ce7d6eae@kernel.org>
Date: Mon, 10 Aug 2026 15:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 09/14] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
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
 <20260807122409.45807-10-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260807122409.45807-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2026 14:24, Sakari Ailus wrote:
> Many drivers implement set_fmt() pad op that simply returns the format
> just as get_fmt() would do, usually because the driver only supports a
> single one. As a driver should always implement set_fmt() either on its
> own or via get_fmt(), call get_fmt() in case set_fmt() isn't implemented
> by the driver. This allows removing a fair amount of boilerplate code as
> well as ensures that set_fmt() works whenever get_fmt() does.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index f53bac995822..58e50d9442e7 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -260,8 +260,19 @@ static int call_set_fmt(struct v4l2_subdev *sd,
>  			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return do_subdev_call(sd, check_format(sd, state, format), pad, set_fmt,
> -			      state, format);
> +	int ret;
> +
> +	if (!sd->ops->pad->set_fmt && !sd->ops->pad->get_fmt)
> +		return -ENOIOCTLCMD;
> +
> +	ret = check_format(sd, state, format);
> +	if (ret)
> +		return ret;
> +
> +	if (sd->ops->pad->set_fmt)
> +		return sd->ops->pad->set_fmt(sd, state, format);
> +
> +	return sd->ops->pad->get_fmt(sd, state, format);
>  }
>  
>  static int check_which_pad_state(struct v4l2_subdev *sd,

