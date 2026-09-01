Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8A43C09EC
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297538; cv=none; b=lQtGdF9Po5jKVwZfy+MXh5irZDzbLdS2Z40cEPl4x6q2S9AkSTFUUWJUp3epY11uvodcxnMujGMC1npINAEc2eIGpgOCT/8vEBDHhGjzs26xB+/vrCC+nmmofUX+qJR6696396F9WCf/EBWI6RRRhDqKrxWCp+JWZmWl8ZpsQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297538; c=relaxed/simple;
	bh=pmm1+1I6/hrYubLLx03yAaDvP3DfsqdW7AnivD9WWwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhBA7XLpKJxRB8/uEymwsEa71IrU4qwL9rOGL+Wsx5A9gq9qafYBREcjYD4BfaI3LlCN1to3yFrfRyJ+KQpeSnXNfULAn2K7PLL0qBgySGl+6L5mOQEm/ZKAByrJWA/94vCEZtdYL4vGI4KdVDZSpUmJ7/l0rld7ntYjUH5QJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Trf5x5ta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Trf5x5ta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366E31F00A3D
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297537;
	bh=qvCtEMEjjIFOf1AwSi8fasSv2VJHfi2xEevhR1rVeAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Trf5x5tayIi/BEuRlMDmjyM2ppRqqfrtnL7u38jD30YH4qG1z8AEJ9puKuV7bEzAs
	 6BeC6gdJRCvC9E7lA9pgSZ2lmmEyxpYoAkVT1AgJ2P+5zBtcoGr4FhrdIqgj7SLEmh
	 2I5yIZ2Uzp0xvDW7TS0Vg9e7+u5axnBCtm0AGDu8RsxUfz74tp3owKiyMsMiWj6Q8l
	 8xyEK24zDzcIIOrvQGYVFC/etE3tHSBrvQWHc/hU4z7v8pCbWwCxXlZ7J8fDLRrX7c
	 ugLifc52Sk+T0vZ8LP1MGZWr5kWyO8oYkoCqutlkKtoBNDBWBfYZ44Hw0mISb/IatJ
	 MQYfyaNHLaKBg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b5e41fe5a4so140321e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 14:18:57 -0700 (PDT)
X-Gm-Message-State: AFuF++nPUG6JdbLFfYk/uLvlqWDd0yAGDuACBkD9evcW+PedqeSKOjHv
	so02DY25uGeC0OqrSyDL3/EoqBQXjiSD39zeYuHhCR7CQIFN52mmS8bNVz8oT8RnCcjPnRKIDic
	F3KXZj54pSGdiveh4fdn6uIOmRM5yq6g=
X-Received: by 2002:a05:6512:1286:b0:5b6:6b8:1fc5 with SMTP id
 2adb3069b0e04-5b608694758mr177808e87.17.1788297535729; Tue, 01 Sep 2026
 14:18:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-12-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 1 Sep 2026 23:18:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1HUxGjjNa4WMJhV558ME4vMbCSRwPd2kASENDRi5W3Q@mail.gmail.com>
X-Gm-Features: AcwNN1XuZjO3Z15IGL2aO36JBNT1wWVBdsVo2jmroZIMACv1jn-GjvrFbSbDbNE
Message-ID: <CAD++jL=1HUxGjjNa4WMJhV558ME4vMbCSRwPd2kASENDRi5W3Q@mail.gmail.com>
Subject: Re: [PATCH v3 11/29] media: rzg2l-cru: Use v4l2_subdev_get_frame_desc_passthrough_csi2()
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

> Switch to v4l2_subdev_get_frame_desc_passthrough_csi2() in order to set
> the frame descriptor type in the get_frame_desc() callback.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
(...)

This looks dangerous, you remove this:

> -static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned in=
t pad,
> -                                    struct v4l2_mbus_frame_desc *fd)
> -{
> -       struct rzg2l_csi2 *csi2 =3D sd_to_csi2(sd);
> -       struct media_pad *remote_pad;
> -
> -       if (!csi2->remote_source)
> -               return -ENODEV;
> -
> -       remote_pad =3D media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2=
_SINK]);
> -       if (IS_ERR(remote_pad)) {
> -               dev_err(csi2->dev, "can't get source pad of %s (%pe)\n",
> -                       csi2->remote_source->name, remote_pad);
> -               return PTR_ERR(remote_pad);
> -       }
> -       return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> -                               remote_pad->index, fd);
> -}
> -
>  static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops =3D {
>         .s_stream =3D rzg2l_csi2_s_stream,
>         .pre_streamon =3D rzg2l_csi2_pre_streamon,
> @@ -752,7 +733,7 @@ static const struct v4l2_subdev_pad_ops rzg2l_csi2_pa=
d_ops =3D {
>         .enum_frame_size =3D rzg2l_csi2_enum_frame_size,
>         .set_fmt =3D rzg2l_csi2_set_format,
>         .get_fmt =3D v4l2_subdev_get_fmt,
> -       .get_frame_desc =3D rzg2l_csi2_get_frame_desc,
> +       .get_frame_desc =3D v4l2_subdev_get_frame_desc_passthrough_csi2,

And replace with this callback, despite the driver just sets:

        csi2->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;

I.e. it does *not* set V4L2_SUBDEV_FL_STREAMS and doesn't have
any .set_routing, so it's not using the streams API. The other drivers
you changed so far in the series had this flag set.

Yet it now shall support multiple streams?

I don't get it tell me what I'm missing here.

Yours,
Linus Walleij
