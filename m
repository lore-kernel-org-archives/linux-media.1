Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73938D3FD
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180205; cv=none; b=M+WIuBpZhp1lLmtw+9jUzNCfIqC8MhWHlSNLNJN1dXSlJVh8PMAxDE27EV+Ozl7DHVvJN6np4RD83omuz0LQYRz+mRTj5jtMzJ7TWUEUPL/2jFnQ0CuOc1pIvB6aSwuOgOytAOkzZ9nJVA0vvDO0byEgsEzpxQLFqeHCbnIijq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180205; c=relaxed/simple;
	bh=BlJgm4Ox5mXgYlVTOvn9TyhP5PdeM0Albfwu9BKTLxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCN86Pmj0XrCluS6aSlzi+y0tIdCV3NRAAyOEtckWdLqw9349E/xGpdrfPoo7v7MZ7NnDNpt8eeGsQuRvMpNnRAn/CtY0QBOR/eBvgDXmD7Ia2vm5LVYmnEdYG6q1R+XmRrUfARvMeY29bzrEdmtqj0+ValmfqlIHP5D2z8AYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtVYdrze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtVYdrze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F65C1F00A3E
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788180203;
	bh=qfD2wglg1zJVWFRnmFn9Fd5OTW5ZvnIVQM+7AZu5RDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dtVYdrzeWMs8uLAXK10fy6OTpBW3HNK0+l1kxkvKDuV98ycfmwpOzwwriaMVnn5S5
	 MBis2XJI7kN0Frohk8r4/jevwVilm9GDSflFXJIahy1PO6vKTy4PrT/J7K0VGYjhFT
	 wAvQAcVMs/6RcZtfk2M/aljcCFzFiV1dv6KQL7n+U2RJK33dagGpCRClsZ1clLEDpo
	 zxLXoSNo56GegKgLEfBnNtRxAeQ8xxOnxbLVoFm4q7GwUdETrR2Svfg3BiAGd3J94a
	 W/HYYtvgMpgg/YRniFZ0gza/pcoDcO40uSWe7VRfsmAJ9Izw7asolDCdoVAG+xr1YQ
	 CTUUO4+/s3Lfw==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-467a6834028so1854086fac.1
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 05:43:23 -0700 (PDT)
X-Gm-Message-State: AFuF++lKLmz9ku55jLXNQoAeuOaBDVUFKiUdyopivj0hSvPxV2We3RR2
	m9GHo7nb1b6Ee9FxMbVJNLcxmFbYh6ae8Lk1x/gEF3sO/hkVMeXvz4I3tHtA2CXIwrfZ+6RxIhq
	QockXZlZuj7LRCtop+h6f9MkKAQCnoV8=
X-Received: by 2002:a05:6870:a0a2:b0:46a:d6a3:8c22 with SMTP id
 586e51a60fabf-46af568caa2mr443664fac.12.1788180203013; Mon, 31 Aug 2026
 05:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 14:43:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLniX0z41jCDZCpzE-LxuU3WPhDTWjYTAOeBGwmvAQH2uw@mail.gmail.com>
X-Gm-Features: AcwNN1Vq4fTVf7vyTrZsXmKVnMhX9HTpzrSQzVQTYUjMLEoIgNFXJIwzHtA_BFg
Message-ID: <CAD++jLniX0z41jCDZCpzE-LxuU3WPhDTWjYTAOeBGwmvAQH2uw@mail.gmail.com>
Subject: Re: [PATCH v3 03/29] media: v4l2-subdev: Prepare for changes in
 getting frame descriptors
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

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> Introduce v4l2_subdev_alloc_frame_desc()

The patch doesn't introduce this _alloc_ thing? Rather _get_ and _free_.

> and v4l2_subdev_free_frame_desc()
> to both facilitate implementing drivers that need frame descriptors as
> well as prepare for having a larger number of frame descriptors.
> If the remote sub-device does not support frame descriptors,
> v4l2_subdev_get_frame_desc() creates one (with a single entry)
> opportunistically, thus avoiding the need to add frame descriptor support
> to sensor drivers the device for which only generates a single stream, or
> managing the situation on the caller side.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
(...)

> +struct v4l2_mbus_frame_desc *
> +v4l2_subdev_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
> +                          enum v4l2_mbus_frame_desc_type type)
> +{
> +       int ret;
> +
> +       if (type !=3D V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL &&
> +           type !=3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +               return ERR_PTR(-EINVAL);
(...)
> +
> +       struct v4l2_mbus_frame_desc *desc =3D kzalloc_obj(*desc, GFP_KERN=
EL);
> +       if (!desc)
> +               return ERR_PTR(-ENOMEM);

I'm not used to this style of C where you declare variables in the
middle of the code, but I suppose if this is common in the media
framework I just have to get used to it.

> +       struct v4l2_subdev_format subdev_fmt =3D {
> +               .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> +               .pad =3D pad,
> +       };

Ugh even inline struct variables.

> +       struct v4l2_subdev_state *state =3D
> +               v4l2_subdev_lock_and_get_active_state(sd);

This can return NULL according to the definition:

/**
 * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active s=
ubdev
 *                                           state for the subdevice
 * @sd: The subdevice
 *
 * Returns the locked active state for the subdevice, or NULL if the subdev
 * does not support active state.
 *
 * The state must be unlocked with v4l2_subdev_unlock_state() after use.
 */
static inline struct v4l2_subdev_state *
v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
{
        if (sd->active_state)
                v4l2_subdev_lock_state(sd->active_state);
        return sd->active_state;
}

> +       ret =3D v4l2_subdev_call(sd, pad, get_fmt, state, &subdev_fmt);
> +       v4l2_subdev_unlock_state(state);

... and this call isn't gonna tolerate state being NULL because
it will directly dereference state:

static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state=
)
{
        mutex_unlock(state->lock);
}

Just some

if (!state)
    goto err_free;

?

Maybe you can just use v4l2_subdev_call() or v4l2_subdev_call_state_active(=
)
because they seem to be dealing with NULL already?

Yours,
Linus Walleij
