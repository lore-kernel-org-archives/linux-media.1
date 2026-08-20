Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C35D3B9933
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 08:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215499; cv=pass; b=hJY0OrwnVMBNnlfWAIOW1I3YzO6i/iqwe2KGXJJuRUyHRAeP80nqLD5o4u2JcHWPsLuO25FQn9MSBfUej80mi05E6JhQus1E0ezq/qmqk5TajGvVkshDjgjz/amqBMqFIwUUvKhff0J+7DegPf6AxfrOJEuUctxS8fIcgs00PMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215499; c=relaxed/simple;
	bh=6K0vXl+7XqVkMU05NyIWM3U6GOCf8fnZsVbnMubo6uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3hfQGZPgYNHGqtLijziXIICGA59hmDXHtif88rqiyueGApT5PkuP43rne0osIl87lZOJZbWLf0+OF8t5iM7Mj8iOF3pV2M5A0+Qzox0cF3RXVGDAgW42CZ53/sWWW9Ss1e4FZ877gxYuSGMI6s2l1KMQcAjpxi83Ks5jG0P6+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwDQzGj+; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwDQzGj+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482938466a7so1675985f8f.1
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 01:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215496; cv=none;
        d=google.com; s=arc-20260327;
        b=N6JBZp07m3QVR68cVYK+/MMthedOUP5Xg/CLiMYfNsR/hTsvr7nFLnHB4k2X7EjL8J
         b5GF8MJShppKvqeApcF24/JJoO5zBxBOQZ2TPbD+yA6tNjZbFV45QYtrcP6VISCh0rsa
         5/D+iiaYszamq3vrBvj59el454FOVclsPQnqtxOQlFhfNevFHBRyqCRQx/4KB/1aDj0I
         500A6ZyjXLNxJKGwULcn8M5kpo5IFMICPvh0CtVkx7pwyWXmYP1NPRjWswRzWc+ipZNn
         v/Ee4sPeZmqOZevp0bb4rmiZwEReTqAvtN1snuoXhn00DOBlKIXMT6KBAvnGhQ8Ttiu3
         v9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        fh=IePaipMbM7oWMirMvIvS9L2xiUNRZt2tMSSk9zHrH5g=;
        b=NsTCouXjUW4/oDttIEig5MDIQbirWAygCeC/w28X1Nx1hD7GFKzW0g1FWQDFD4Hl/1
         39XHBeiGdFO9snmjKVuhkouONZ5pT3nHREVz+soYyzsgvTu+c2xtqbuhqQZIxMxUc4if
         9o2dKkLAes95Q8jtKZ2RKrN/mA4f2q1ljYBz6YeWvFF0Nu1EbiaPqoH5LPR5CfjT5Kii
         tWHAndhXKe/P6qnnnFKDKZR3yKcZph6rkAoptqGez03Y84TunyCa7wXMn+SVMNe2csDs
         KVFFEJ74pJsUr0+cIjKHUAsZWuiBrIiJcNLpy8OKBXESo4pSvvabDkMnsF9TaZckFvwr
         sZ7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215496; x=1787820296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        b=VwDQzGj+tDYziDvS7hYtNjWlxmEs9V4ORJjegVifMMwEBX4goTRKIcVYGmIuf1SS+k
         l1tzrrB4O6kwrZKiINBqJ3nOzL8qgfwcyXRVXp7g19p5nXnlkHYJLxFGoofygKhiZRU+
         bwwlIi/YNVdK5NUNuB4rAqnSamn+fIkkz6W1zJmsW042ZnXCxshi3DxCfQLXG1HTvt+B
         hoMdspgLhR+yyZHY1d2NgFC1K+bpV702UzpYxhc1meVRiF+KgG1EIfYHr7NPDYwHsGe/
         8LZWL1TWN0mVF+SD8y7ov6PefyxZiK4Ssy0I3wioxH3s9sY1xp7X1BfSOQtykDqfLkL4
         bk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215496; x=1787820296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA2J8BLeP7iBIJb1HYoJPxBCCTSKciUwm8LMseHtCJo=;
        b=qbdTu2kPO+8Oq27PqNJLtQoOqhKisqtVQ83czS+stJTcGAi9VWIlH0e7BBLkYDEd+v
         7Ru1NnxM2SkFYqdJ8hb3SEXwtNFevBqRmvgS8GGjFU2dOMMQ5s1su5lvnOU/6FfZWVL0
         V8hbS6YOyrIWuKuPlQLihSRAHuP2cPLdNTzVQVw5iXbk5Cj7/Ua7cpkLD6NzMVt/TeTd
         yf2YTwhJPQ+Xn1c62oZofnwIU402xXaRHkCHtKQCSMeWf5tiPWBbF9DeDkfia47aAQR+
         5kUkj8TSJ+F5whZILbw1B6HfaWuHT6CmQLJGI4Ju0/nbjMrWU9k8omIrnig5u5aVH37q
         Ya9A==
X-Forwarded-Encrypted: i=1; AHgh+RqcMNZwKif/LmW2KZqY/SuDl5ioxL8l/haiaBeRYH9TgBHEYNjRlIb+KT3jTo8E2ukovyIiOfIWZ4PrkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kNntc8zqVSsdvT+dpOztAFqGP/CV0zX2AVdEiq1l9MCfVhP02l
	qNkoSEzPF/2yvROOTPyC1JnuYHf3Pd438C40wpaLWZC9oTmtKitUzApIR8VupgUUZekHyyTwUrq
	BOrvhxtjG6AqvMb//8+eXVPQUZPXi2FI=
X-Gm-Gg: AR+sD10LnYZvT1QEpxKFHtHQSP4TO3U4yTpRdBLaXfMupIXQkAg/xfoLROjn7kNizsi
	LsOGOsyZn/kvNV01l0KsfBlvXTE3mKHYA3sDIDvSkUpXGCewO0pMFFn5ZT1JXlZRSt49SyixSQh
	w43A7aqOzqoCeJN1A8ESlvei0vv4Tm8rT6vyackEFVk3R7bBFf/lJ9YFjr6bgSGnQpS083lLLu1
	K65pvXxnMxvnMtZq2YO/lFFfciQakTSlKr1uCQ14El90E1HMXjrXQbqo8oBKqj+Ws5Ws8qmvvyf
	uUvNNpIU3AUbTljsEv3qUMwgAZwgU4FSDKsycWZHbYAaSQMuQu9+6FkT+08sceiXYiquzLEZb+y
	nfyHCWacf0jZd3W7/Fb6bjqbV1VaYIcoLMbgY/xA20w==
X-Received: by 2002:a05:6000:401f:b0:47f:fb2e:f63d with SMTP id
 ffacd0b85a97d-482b1e94e3cmr15789665f8f.9.1787215495473; Thu, 20 Aug 2026
 01:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819102812.2592880-1-tommaso.merciai.xr@bp.renesas.com> <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260819102812.2592880-3-tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 20 Aug 2026 09:44:28 +0100
X-Gm-Features: AcwNN1XMZ7lCC002pbG1M_9Cx_PPFmWFHfCPDrQH9tCeK5pf760lbsCqYkAEQ24
Message-ID: <CA+V-a8v9nwvX7hpVu13Ryoo3Q5+bNEh+2Nwm1aMhCCinfG=PAQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: jacopo.mondi@ideasonboard.com, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Isaac Scott <isaac.scott@ideasonboard.com>, Paul Cercueil <paul@crapouillou.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 11:29=E2=80=AFAM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> Add v4l2_fill_pixfmt_aligned(), a variant of v4l2_fill_pixfmt()
> that accepts a stride_alignment parameter, mirroring the existing
> v4l2_fill_pixfmt_mp() / v4l2_fill_pixfmt_mp_aligned() pair.
>
> v4l2_fill_pixfmt() is refactored to call v4l2_fill_pixfmt_aligned()
> with stride_alignment=3D1, preserving its existing behaviour.
>
> The new helper is needed by drivers whose DMA engine requires the
> line stride to be a multiple of a specific value, such as the
> Renesas RZ/G3E CRU which requires 128-byte alignment.
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - No changes.
>
> v4->v5:
>  - No changes.
>
> v3->v4:
>  - Collected tag.
>  - Removed "." at the end of the function's brief description
>  - Removed "component" from @pixfmt->sizeimage line
>  - Removed wrong tab
>  - Fixed example (e.g NV12) -> (e.g. YUV420) into function description
>
> v2->v3:
>  - No changes, just moved to from PATCH 3/4 to PATCH 2/4
>
> v1->v2:
>  - Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
>  - Add v4l2_fill_pixfmt_aligned() helper documentation.
>
>  drivers/media/v4l2-core/v4l2-common.c | 12 +++++----
>  include/media/v4l2-common.h           | 38 +++++++++++++++++++++++++--
>  2 files changed, 43 insertions(+), 7 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 54995ba8c20d..2ce4f1c20fbc 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -537,8 +537,8 @@ int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_forma=
t_mplane *pixfmt,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
>
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -                    u32 width, u32 height)
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelfo=
rmat,
> +                            u32 width, u32 height, u8 stride_alignment)
>  {
>         const struct v4l2_format_info *info;
>         int i;
> @@ -554,15 +554,17 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
>         pixfmt->width =3D width;
>         pixfmt->height =3D height;
>         pixfmt->pixelformat =3D pixelformat;
> -       pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width,=
 1);
> +       pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +                                                       stride_alignment)=
;
>         pixfmt->sizeimage =3D 0;
>
>         for (i =3D 0; i < info->comp_planes; i++)
>                 pixfmt->sizeimage +=3D
> -                       v4l2_format_plane_size(info, i, width, height, 1)=
;
> +                       v4l2_format_plane_size(info, i, width, height,
> +                                              stride_alignment);
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_aligned);
>
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  static s64 v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 749fe38c134e..4e5c5ffaf651 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -554,8 +554,42 @@ static inline bool v4l2_is_format_bayer(const struct=
 v4l2_format_info *f)
>  const struct v4l2_format_info *v4l2_format_info(u32 format);
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>                                     const struct v4l2_frmsize_stepwise *f=
rmsize);
> -int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelformat,
> -                    u32 width, u32 height);
> +
> +/**
> + * v4l2_fill_pixfmt_aligned - Fill in a &struct v4l2_pix_format with str=
ide
> + *     alignment requirements
> + *
> + * @pixfmt: pointer to the &struct v4l2_pix_format to be filled
> + * @pixelformat: the V4L2 pixel format (V4L2_PIX_FMT_*)
> + * @width: image width in pixels
> + * @height: image height in pixels
> + * @stride_alignment: stride alignment in bytes, must be a power of 2
> + *
> + * Fills all fields of @pixfmt for the given pixel format, dimensions, a=
nd
> + * stride alignment. Only formats stored in a single memory plane are
> + * supported; returns -EINVAL for multi-memory-plane formats.
> + *
> + * @pixfmt->bytesperline is set to the stride of the primary (plane 0) p=
lane,
> + * rounded up to a multiple of @stride_alignment. For formats that store
> + * multiple component planes in a single memory buffer (e.g. YUV420), th=
e
> + * alignment applied to each component plane's stride is scaled relative=
 to
> + * @stride_alignment so that the chroma stride remains consistently deri=
vable
> + * from the luma stride. @pixfmt->bytesperline therefore reflects only t=
he
> + * primary plane stride.
> + *
> + * @pixfmt->sizeimage is set to the total size in bytes of all planes.
> + *
> + * Return: 0 on success, -EINVAL if @pixelformat is unknown or uses mult=
iple
> + * memory planes.
> + */
> +int v4l2_fill_pixfmt_aligned(struct v4l2_pix_format *pixfmt, u32 pixelfo=
rmat,
> +                            u32 width, u32 height, u8 stride_alignment);
> +
> +static inline int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,
> +                                  u32 pixelformat, u32 width, u32 height=
)
> +{
> +       return v4l2_fill_pixfmt_aligned(pixfmt, pixelformat, width, heigh=
t, 1);
> +}
>
>  /* @stride_alignment is a power of 2 value in bytes */
>  int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> --
> 2.54.0
>
>
