Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F33501F4A
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788554298; cv=none; b=PiOoOZFswGFYrRrsgfBiZtsQbQcyz7SZlrJW9Lkmy+ONHwHGJLgwQQ+/ernPlJARGkGVa96nnp6TPb0PotI3RaWF7g5mg0XzMSR+SRmyYp69fgFjCcCH8ObZahyT0y6oYVgq+OCWiMNXGxdKF0LFWgGcr9xqjDx+LwuWQBYkJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788554298; c=relaxed/simple;
	bh=Sm+nsaIoMdwJPZGr1pwvWe1IQo9GOjSo93c4ajeLXkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGU8zixw+OzB9SW7KU8njuY478/AJsdHUbuycOnHmrx46w9DZ6qzOBcbQdIZ5Vup/JkyqVyDCO8OxDyHrGMAbDK1PL3Mm7rNn7hupq1vRL+ANUnjQcx/oBzODH7H3zpHA0UFsLtUdqW+e37DMPuniqEAc+cluJOzPByoyjk5LsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bR/dPiA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bR/dPiA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBD71F00ACF
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788554293;
	bh=RXfuEhJ7qPiVYlIoZEPBFCTendNKWHaPNeGIXBasekU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bR/dPiA32Cl/A+VZxsWwwgvcCiaAvGaHvE0I9pfKQkLV3of+IG1hjTSXnRpvXq0Tv
	 eJa9NvtKLJsXH3Q4PCqNo65nPr83OvNy9a9nMl4gzfE/+QItwtZrXNHi6D2KvpmNCq
	 fIH8HC45oMfmqsY5n25Blm8WuqvkHnR2i8o+Zy0Y2kyUh82BqsJqBC6CvKUBNddhXs
	 gV4a1JLIjaVhl2Wu547DoufUQ9IrNaX8BlqtyLjFBZf2BL0PVkD1k8LIfvpFC3a6ws
	 aQE8Rk+FXC8jueZapUHZb3jTYGM5uUT/KTqeMx20A/iB4x+9WvoDt/bbvUiacDAyb4
	 D9nsZHHDjytnQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4af4be667so1431741e87.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 13:38:13 -0700 (PDT)
X-Gm-Message-State: AFuF++m/5ANsH9b6F59pEDSCDjUL8pHCAOqsDGgLwYswhvXaXGpUera5
	MtnO87NwE26XK5YrxJl3dcjgyCFsZ1g9lHhFsLpiAa2DRdF6JDsZ3z9rtstWCChKijoC9g/fZCo
	HraG+UV1CE/jmnaFNRkOaPVoY4xubzAk=
X-Received: by 2002:a05:6512:2352:b0:5b5:e71a:d333 with SMTP id
 2adb3069b0e04-5b616ee9625mr1399416e87.7.1788554292378; Fri, 04 Sep 2026
 13:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-29-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 4 Sep 2026 22:38:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8jN+JoDue=0+R_EvwoPSpxOsa1RN9HYHWP7+AZ5X3wA@mail.gmail.com>
X-Gm-Features: AcwNN1U1qA1thftlAWXa2s0ehfnsJBJlyrDzK2cm3xyBxNNE74YhhtdwxFSC1SM
Message-ID: <CAD++jL=8jN+JoDue=0+R_EvwoPSpxOsa1RN9HYHWP7+AZ5X3wA@mail.gmail.com>
Subject: Re: [PATCH v3 28/29] media: v4l2-subdev: Use v4l2_subdev_get_frame_desc()
 for passthrough
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

thanks for your patch!

On Mon, Aug 24, 2026 at 2:15=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Call v4l2_subdev_get_frame_desc() to obtain the frame descriptor in
> __v4l2_subdev_get_frame_desc_passthrough(). This is preferred over callin=
g
> the get_frame_desc() pad operation directly.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)

this caught my eye:

> @@ -2558,6 +2558,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct=
 v4l2_subdev *sd,
>                                              unsigned int pad,
>                                              struct v4l2_mbus_frame_desc =
*fd)
>  {
> +       struct v4l2_mbus_frame_desc *source_fd =3D NULL;
(...)
> +                               if (IS_ERR(source_fd)) {
> +                                       ret =3D PTR_ERR(source_fd);
>                                         dev_err(dev,
>                                                 "Failed to get frame desc=
 from remote subdev %s\n",
>                                                 remote_sd->name);
>                                         goto err_free;
(...)
>  err_free:
> +       v4l2_subdev_free_frame_desc(source_fd);

Here you end up passing a source_fd that contains an error pointer
to v4l2_subdev_free_frame_desc() and that seems wrong.

Maybe a separate label err_nofree: right below that statement
could be better for this error path?

Yours,
Linus Walleij
