Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2EB3AEF50
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182345; cv=none; b=Wb+V8fKZyZd2pRyUoyWmIjePUTWfYOH8GidUHS9To71A9UQ3v2a+JxulCbvycHgaTow24Klfbs9qPEXIE2oOZ37KaKrqcFPlc2o3TRwIiOlmd3innPAFkvTZdIvriai+t1818B/kIeXIGCV/UwOba2+t+WZuHQUiAi7O+xNyor8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182345; c=relaxed/simple;
	bh=jSXBkQ6yldqvMxZ/GngCvYd4HqPv7Zb9ljzGQsmqhiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGPk9ZsXdHguWsk9CChryV3/SDYGe+RQ1Zj+MyQslbwAZQ7zhcUNPmf2v0B+8uia2C0V84ViQkK9HxsO62aAuQbZC0uklDJpKAe6decYjpXaAf8Ts6mnuJI4/NRSvJ9ySGEhXy6wFfiR3AVrXF4LbrYvpoAmy9gH1IQNV3Kt3b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0kkK/nO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0kkK/nO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF19E1F00A3D
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788182343;
	bh=k8t042o1yC4ElfBPcJTMwK7jPK3dOYd/KY+02Vg1WbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=g0kkK/nOCkZGW9zlkrEmqtELFMbvz+AiPcqpdHyAO8hSh1v1BoXQovYtMKIhxnbO+
	 oLCeAONi4bClIvif/95NRi+USy3ys3TKxXlNHrOc8mOhIoMqERGCx/VLmK0MfucVr1
	 +4LULck7QovDXj9kTNOvWW3jVTDgBachZSUJuHgMVbRLqidn1nHT6QzeEhWTr1GRHO
	 Vewg+2Yws6vZS+WbWtj8gcy482hPRODGPvlo6lJK594wn072rccaNYvtXif1rMjdTF
	 HQXLsRYFCmQ5NUr9+EflPY8+XzEi4yrwcTBEbUpiqBa0XK8skACQA0oVGSv0V8JWGS
	 TwCYwG+SNZQzA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso2704695e87.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 06:19:03 -0700 (PDT)
X-Gm-Message-State: AFuF++nZzI4aWs8dJcoERJ66bnicQaRq/Fwf9gpjP/6kQt45L5xlWyKY
	AJEZIvTK+62lZzRLY4GNoNz+DMjN+PLztoUd10M3UBuFZbBZIGijWM4pmjb/IcV7rpqh1weqanM
	E32uRU7e/fFsxNSupWiP7uN8xxYhs/HY=
X-Received: by 2002:a05:6512:691:b0:5b3:f69:fef7 with SMTP id
 2adb3069b0e04-5b5e68b1b40mr7332468e87.4.1788182342572; Mon, 31 Aug 2026
 06:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-6-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 15:18:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VmFnpO6xH5uU0vxWvAgul5tfdrBmzGSLUt4rCe-Mpb62GcGBHeJhjRvVU
Message-ID: <CAD++jLnruxXqtgm2ckQQhKvuNQvawH0xZpq8ipYSjFLKDbpnyQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/29] media: v4l2-subdev: Allow allocating frame
 descriptors based on the need
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

> Frame descriptors entries require a small amount of memory per entry (20
> bytes), but if the number of entries in a frame descriptor is large, an
> unreasonably large amount of memory would need to be allocated in the
> stack. Therefore the number of entries has been limited to 8.
>
> Support larger frame descriptors by making the entry field a pointer that
> by default points to a pre-allocated array while the get_frame_desc() pad
> o may allocate as much memory as required, up to V4L2_FRAME_DESC_ENTRY_MA=
X
> which is changed to 64.
>
> The caller is also responsible for releasing the allocated memory by
> calling v4l2_subdev_free_frame_desc().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
(...)

> @@ -63,10 +63,6 @@ static bool v4l2_subdev_enable_streams_api;
>  /*
>   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a=
 set
>   * of streams.
> - *
> - * Note that V4L2_FRAME_DESC_ENTRY_MAX is related: V4L2_FRAME_DESC_ENTRY=
_MAX
> - * restricts the total number of streams in a pad, although the stream I=
D is
> - * not restricted.
>   */
>  #define V4L2_SUBDEV_MAX_STREAM_ID 63
>
> @@ -354,6 +350,7 @@ static int call_set_frame_interval(struct v4l2_subdev=
 *sd,
>  static int call_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>                                struct v4l2_mbus_frame_desc *fd)
>  {
> +       unsigned int type;

This is again an enum, right?

> @@ -362,16 +359,26 @@ static int call_get_frame_desc(struct v4l2_subdev *=
sd, unsigned int pad,
>                 return -EOPNOTSUPP;
>  #endif
>
> -       memset(fd, 0, sizeof(*fd));

So passing an unititialized or re-used struct v4l2_mbus_frame_desc foo
used to be fine...

> +       type =3D fd->type;
> +       memset_after(fd, 0, type);

...and is not fine anymore.

I guess later patches in this series fixes up all users so no-one
passes in some garbage here?

> +               if (desc->num_entries > desc->len_entries) {
> +                       dev_dbg(sd->dev,

When you get to this check, isn't that after this loop:

for (i =3D 0; i < fd->num_entries; i++) { (...)

so you should check num_entries agains len_entries before this
loop?

(I might be misreading the patch, maybe I should actually apply
it and inspect the result.)

Yours,
Linus Walleij
