Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E03C0630
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366230; cv=none; b=gpoaP0TeqyVdE6CXl0WTcrJFCveGXdsxUV/SzHs52+Vi52cMOjjo2MlIBaRJS2/scTEEnn4ALvPh56qKnJmNyszBHeGY3Xm5glMacaiFsKH9T8l3E0zELy2GoX4sW4Dl/MNgnDPXXW8fmn6qUti8eetnIiMsZWIO7NbCvvBmVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366230; c=relaxed/simple;
	bh=2Ca4c6JhbUhObXxK45OX5E/BGcmEtmnbf8+3sn3jJZg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q3t8vtUe/m6wgpJG84uaTFu5Q5yE74Cvs5iz8gtFbZJtNxFVXYGOtdFoVq3kVXrroPTBuxzko/7Rft6W7u+hw37eia04ZcWwAVu4h35FVSkzv7nHzCwRdyAimKIfb0dGVksMrxALcNOrkvFIPPIjSxC4Etv4dbKZTsvj5QNaB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRV99i5I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRV99i5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F601F0089B;
	Wed,  7 Oct 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791366222;
	bh=rew8+mN/mRA6btRgXvptfYblVa4h98O6Rp7e//4KBlc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=bRV99i5I7+mgq4n5NX9/D2Z7fqCShc8qXZ77WY17kY2+WHZfuhvISnkrd0KI8thd/
	 3CzoBVtfREFFj3YVTfQrMUiEZIttt0vpr7IofVBQjsEuXAClxhnNBvzMl9wFuuPbAW
	 YnQ3XXLF6Xu/ElJpbOU9tH4na+IRUBvPFQV0gpxMbTNCJmzhwJKZvQ7T4Ljxg4qi23
	 yFmrQd/H2W3AFSyIV9ETGw0+IrmqZo+g1w+uG4FBn/6gAdKk8t/uVV4Xtid3eMAzRf
	 LUKJIZdllFkc5QltZQp8fKxcGATBiKUhO9bY8aI7Xklc71v+txGnrdPToCC62LMpXE
	 Ab+kYcUJd62Mg==
Message-ID: <ae109b76-67f8-456d-a233-796f50cadcb1@kernel.org>
Date: Wed, 7 Oct 2026 11:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/1] media: subdev: Make get_fmt on INTERNAL pads without
 STREAMS an error
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
 Rishikesh Donadkar <r-donadkar@ti.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Antti Laakso <antti.laakso@linux.intel.com>
References: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261006092950.690101-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2026 11:29, Sakari Ailus wrote:
> Internal pads should only be accessible to file handles with
> V4L2_SUBDEV_CLIENT_CAP_STREAMS flag set. Return an error otherwise.
> 
> Fixes: 49cdf56876d3 ("media: mc: Add INTERNAL pad flag")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a07d77e584c3..7cb5a40f0f8c 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -854,8 +854,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  	case VIDIOC_SUBDEV_G_FMT: {
>  		struct v4l2_subdev_format *format = arg;
>  
> -		if (!client_supports_streams)
> +		if (!client_supports_streams) {
> +			if (format->pad < sd->entity.num_pads &&
> +			    sd->entity.pads[format->pad].flags & MEDIA_PAD_FL_INTERNAL)
> +				return -EINVAL;
> +
>  			format->stream = 0;
> +		}
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> 

There is no documentation that I can find that says that MEDIA_PAD_FL_INTERNAL is only available
if V4L2_SUBDEV_CLIENT_CAP_STREAMS is set.

I think this needs some more thought: if internal pads are only available if that cap is set,
then I expect that a lot more ioctls will need this check. In that case the check should become
a helper function.

But how does this affect e.g. G_TOPOLOGY or ENUM_LINKS? If the cap is not set, should internal
pads still be reported?

And you need checks in v4l2-compliance, ensuring that trying to access internal pads without
that cap will indeed fail.

Ideally you would like to have this emulated in vimc as well.

In other words, I think this needs more work, both in the core and w.r.t. documentation.

Regards,

	Hans
