Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795240882;
	b=xNlyBhwVljONXlk/c1n8SFQqf7XzbQwgc+X2Fs9siKlk5UD2lReSHQAqKWltLyMSBOPJ
	 8VF6gT+589NL+RoHLYgTBoBQfmXNfcmXLTDCU0Xv8PnODIqjUU9331QiAjgtUe9W3tH3/
	 WKQd7nmpvQPYGReJe+izw5MopTyOKXQj1zTjjv6FNZDQCcthFz2DkVZfj0SmQj0ALYFj9
	 ZbCDKxSEJc6SV+G9O7Aqc/AmB6ERhClHgMREbUSQCCe+5GhXyUbKX2/TQh3ZMrdTaZ/ge
	 QC5A80YBU/Y/Ax5DsYz6X+NLSMWdSnXrsqzKkJ9FfLsrvPnchRazM9DAoCF6rw1VCdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795240882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
	b=kzriOvQ2jC/4sNG3mWrfjFCNpAA6sINJ9ckoUx8X4tu7jAAL8j+Z1cA5u1Rxy5NHNoqI
	 05ljOIFu3AVdrwBsDFPT4ntCHSWzmqPx4tW9pUIKB7oTBCAgqz2ZHcszozp4/KYcIgugO
	 15mnglDwvsQWAT9mQybaNu7T8VCFPBqnKDGDI3vCkG0s7D4Zyj+nqfqZ5BXGGGwBXV8JJ
	 I3Nv4iST96mB+Q1M5z1jrtrLSxAicPxpfnliOgoY1YsCDrxAkFO7KSM9GsUPc2/bNb5xU
	 QgBdkZpPM0lgmjXk1JRQg775voolY3ihpc8llPQE8jTGFxLgGCzavDcXQ8BCjp3Prwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEOIXF8z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCD606A33E
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 06:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FCD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEOIXF8z
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38190551625so2960127eec.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 22:01:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795240880; cv=none;
        d=google.com; s=arc-20260327;
        b=nVCnv+7PRt6F3HChBzJYS4uBDv+2FABVWSoTrZZLa+xg+4R2DV4zpm81vte/WYZU5h
         G57qUc6oMYPLSKMviYsWRvgHBjlRR4AaYmV1aENVIhfyDo1xFh9wcurGIiVzZqgZ+96y
         GrHuNOUidMGpiXWr5MiEZYL+34krc3RN8YqrMnc3FtcFEwmmnLV6uYDzauj53oWqidCK
         bQ/q/WH8zWdOKhUHP+49sHjFBcGPDd0uocFR5m+FklNh5n/eklgfTOpJqVFadSCNoPRa
         6Lon7TmWKkB/2MuWEXUfkZTWQ3DExaBARaJLvvDLUIfRsYqNt7pbRkQjXXIA8oUAFVx+
         RlNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        fh=iFcfhCNIVsRFKFZYZ6QS7erqiN2Ip2aFR+2Br1ry5R8=;
        b=rStK6kZikPhHsRdAmPJ6pCK4L8wrKz7yZgse9h2HhKBggx+tVqkOVRbMzAvtksou3T
         iWCD/xD/xZmTxapjoqtGgjCeiIYG1RGXSDraWLnNTA5Sa0V5zRDcwDQ+U+QhtwdP+Ipj
         mKC30W9etqj9R6iMJsa7Phh2F/do5Q/drnPbvjiORgQ75YQVG0LQ3DKw0peQvsG2wXRD
         p07FXkp23a3owWOqlj/Ue1jA1cqrA4KyOKaxXfLb1o8bDTImRUn54EXnbaThIf6EyRpf
         vvPZXJnf4WzlqUYWb5uEP3Cbi6uCYk/F+7bFSXQEHvXluATJLGksnWKBj84/3Ri05v0u
         mNhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795240880; x=1795845680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        b=tEOIXF8zOT6TI59P3S2WZoDI/6toupXQV8ZU4vDjAcNY4bFymszFVbIMTLD7pFZFPy
         4+iO1icqTU9Q8PnntX9zdO3c+m5DoK4TLr+qTd7EB3Nfd5FcXVq36ekjRu0TWTJCBV0X
         en0v8AvWU2lkMgfW6x0Bfd82ThtEd6WdbKsu2sXoolWpFr7+1ICTK05JIuHCtO0HDjkt
         HzMMECkfCO9k0M56Xp+pVlFGD5ONQIHmo2VtVbrQuAZsQcGexQuITTaEgsQJM4BU8Cg0
         4CCI/gpZ72EwLqpfFgr7C7bMTZY2zi+Ycsc9CBbJxEe0lAcFRB93+lAbLmrFnotqDGY6
         AaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795240880; x=1795845680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=224Uc4tdGl14OHpe8I6uXHMDyRc5b/bC6BZG730xv28=;
        b=yO8nGqDhAkCqJMX5pfQ/Z0loHVsmkI+tHoCiO5gFvVqvojSJoh2k9Y5VjT2tg6rzbD
         uKp7VVX37PnQVH6HAix+AxUCw9DGhSSTUmxJGQpfOj7iVPerYXf57K0rAqeV3Tr8aEJ7
         2OCXDf1rbH1EuMHqf+4rDDlvILqr/y6WArQm6o0hEU5WYt+DIoBh3lcNxATRhwQq34rZ
         ZFRbNMGMsp9ejr2S8hs6jPHdH++omY40/F3aU35LR5rI3cPh+zK6ez8mFO+7Y2RoW/tl
         nvhr0y6VxbcE9Z/XaVLGn1YNysnsZs/SS4/KSjA8++I1Iw4ycPWHIrUjhPhfLC67XKF5
         Moqw==
X-Forwarded-Encrypted: i=1; AL+hErGhm6oKFj3oooaeamX2k7K0ef2HZRsRx5c+uIhlIWL050gGtYNQYM7FmSdjpgFaWqHdeWPGFNI4CUL5rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bu8rbH/DpqHcMt42GeQfmLgtmYpyJt6Ym6Bx86M/1gcBpG9Dk
	jvW+uvhR3yxm4JMUiSrIN2d6a6E3g/7HPhfeUlE69kRBeLyFwEtDeKTGktfx6FhX1lsYVJ92/uA
	xBhvVhxeUJoP7XNsuICKnlSliQ6GQkgQ=
X-Gm-Gg: AZFdTZdij3uC611C3F/7Amg6bjmCoz+cjk+UM87trl4kGMLhxL6PKTaXiavVUDR3sSq
	FjOq2E2zqGX2iXMM2yXdYuP2DUvPQJGT4PgJAK9XIXpL3VnLHD+U06VItUyVsJ/QLRaqrvfvQPC
	GSDjG6rdJmKuGh0USb1EdwDdrg6SxpJ/HFcYlzTpmwsg8tSF0SvS3glh5Uknx96hr0QOEbQ1wGk
	yY4wcUcUkgfss4tJaFd2gt4KAPMNL/4+XNEMynYcsUpRt/DIHr0QOZFOzkoFllcy5Yx+0lWef7Q
	LkF9z522c9+HADbkgev9UV+8vf9zGfPKZSt6j2OoO60CMCR0XzKQ8RWggfPa9/kEQbU0Zl0yjOa
	mGA1p9K4S5DWRWIxD1bkseNCFG8Ogswis2JP3hB8n7qiDHpq+BGl+36YhSufQBTfM+0fPzGnTv9
	dpkLRgBLROZWoiMcSEC5PoumeewCVVsA==
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id
 5a478bee46e88-3856f65eccamr4973269eec.14.1795240880388; Fri, 20 Nov 2026
 22:01:20 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006153619.304520-1-clamor95@gmail.com> <20261006153619.304520-2-clamor95@gmail.com>
 <20261120213147.GA2510168@killaraus.ideasonboard.com>
In-Reply-To: <20261120213147.GA2510168@killaraus.ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 21 Nov 2026 08:01:09 +0200
X-Gm-Features: Aa3M54qqRu5YpD_M-B645oU2wUp9Zhi2TFYXGvcBEXy6Ngu-pXKdX4X0B0Y-q1c
Message-ID: <CAPVz0n3-+m6ke=RmjWtTtDChBi6n695ndYsyQ7XN4WwNQtQUtw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] media: i2c: mt9m114: Add get_fwnode_pad operation
 for IFP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 23:3=
1 Laurent Pinchart
<laurent.pinchart@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 06, 2026 at 06:36:19PM +0300, Svyatoslav Ryhel wrote:
> > Currently, the driver's binding exposes only one endpoint, which maps t=
o
> > the IFP subdevice's SOURCE pad. This configuration causes failures for
> > many devices using this camera because both the DT binding and the
> > one-to-one pad mapping logic map the endpoint to the wrong pad. Fix thi=
s
> > by implementing the get_fwnode_pad operation for the IFP, which correct=
ly
> > matches the endpoint to the corresponding IFP pad.
>
> The discussion in the review of v1 died out after my last reply. Let's
> continue it there.
>
> https://lore.kernel.org/linux-media/20260721103845.GJ50424@killaraus.idea=
sonboard.com/
>

Yes, sure. Mt9m114 has only one fw endpoint which co-responds to pad 0
of IFP, pad 0 of IFP is sink. Implementing get_fwnode_pad() allows to
map endpoint to source pad (pad 1), the sink pad is linked to PA
internally.

> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
> >  1 file changed, 29 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> > index c6c950d5c8f3d..583cf47aa652e 100644
> > --- a/drivers/media/i2c/mt9m114.c
> > +++ b/drivers/media/i2c/mt9m114.c
> > @@ -9,6 +9,7 @@
> >   * itself based on work from Andrew Chew <achew@nvidia.com>.
> >   */
> >
> > +#include <linux/cleanup.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/errno.h>
> > @@ -1019,14 +1020,6 @@ static int mt9m114_stop_streaming(struct mt9m114=
 *sensor)
> >       return ret;
> >  }
> >
> > -/* -------------------------------------------------------------------=
----------
> > - * Common Subdev Operations
> > - */
> > -
> > -static const struct media_entity_operations mt9m114_entity_ops =3D {
> > -     .link_validate =3D v4l2_subdev_link_validate,
> > -};
> > -
> >  /* -------------------------------------------------------------------=
----------
> >   * Pixel Array Control Operations
> >   */
> > @@ -1383,6 +1376,10 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_pa_internal_ops =3D {
> >       .init_state =3D mt9m114_pa_init_state,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_pa_entity_ops =3D =
{
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> >  static int mt9m114_pa_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_ctrl_handler *hdl =3D &sensor->pa.hdl;
> > @@ -1405,7 +1402,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor=
)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_pa_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 1, pads);
> >       if (ret < 0)
> > @@ -2097,6 +2094,23 @@ static int mt9m114_ifp_registered(struct v4l2_su=
bdev *sd)
> >       return 0;
> >  }
> >
> > +/*
> > + * The IFP has only one fwnode endpoint, which corresponds to the pad
> > + * linked to the PA (PA SINK), while it should be the SOURCE for the
> > + * next media device in the pipe.
> > + */
> > +static int mt9m114_ifp_get_fwnode_pad(struct media_entity *entity,
> > +                                   struct fwnode_endpoint *endpoint)
> > +{
> > +     struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(entity);
> > +     struct mt9m114 *sensor =3D ifp_to_mt9m114(sd);
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(&sensor->client->dev)=
;
> > +     struct fwnode_handle *ifp_ep __free(fwnode_handle) =3D
> > +             fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +
> > +     return endpoint->local_fwnode =3D=3D ifp_ep ? 1 : -ENXIO;
> > +}
> > +
> >  static const struct v4l2_subdev_video_ops mt9m114_ifp_video_ops =3D {
> >       .s_stream =3D mt9m114_ifp_s_stream,
> >  };
> > @@ -2124,6 +2138,11 @@ static const struct v4l2_subdev_internal_ops mt9=
m114_ifp_internal_ops =3D {
> >       .unregistered =3D mt9m114_ifp_unregistered,
> >  };
> >
> > +static const struct media_entity_operations mt9m114_ifp_entity_ops =3D=
 {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +     .get_fwnode_pad =3D mt9m114_ifp_get_fwnode_pad,
> > +};
> > +
> >  static int mt9m114_ifp_init(struct mt9m114 *sensor)
> >  {
> >       struct v4l2_subdev *sd =3D &sensor->ifp.sd;
> > @@ -2141,7 +2160,7 @@ static int mt9m114_ifp_init(struct mt9m114 *senso=
r)
> >
> >       /* Initialize the media entity. */
> >       sd->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> > -     sd->entity.ops =3D &mt9m114_entity_ops;
> > +     sd->entity.ops =3D &mt9m114_ifp_entity_ops;
> >       pads[0].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[1].flags =3D MEDIA_PAD_FL_SOURCE;
> >       ret =3D media_entity_pads_init(&sd->entity, 2, pads);
> > --
> > 2.53.0
> >
>
> --
> Regards,
>
> Laurent Pinchart
