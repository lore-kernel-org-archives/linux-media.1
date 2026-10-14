Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECC32F75B
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 02:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946740; cv=pass; b=Z2mYzGozsVwA3CF/oyYsmu2LThm4fnM9xJu+oUDGg7wSE3/bEkwmZwIz0wH7W1XvAvN7mJ72dz0hriuKQ6lcag6G1SowBM92YD+Gwnq3OBYMO72MhTP92xUlIRXT3vcE2tewg6oIlPS4PjKNIaRMAku0Eo+IhRoQs5KISQErTXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946740; c=relaxed/simple;
	bh=FtvzHvr5fAr+v32w5qEw6tda9e9IJnKVXbFHxsikk2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmtbQidEa5AfJ8MW3Ee2rF/OK72jYHTyZy4+XUen0ImlZ59jLWkPbUHM2cdxACqDLcaffZVWgtDe3iOgR98f3QJLY+HWzeBwWlClvfk8df28E21ANqUJ3DyXiWDpuo9oka2RR8JqBJ8Ux6NsuYLn3sJSS2Fj8hG2m4OsANofSOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddg2LBQt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnpZgg/F; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddg2LBQt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnpZgg/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791946738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=THCiOXjGyA8Pp1KIAxUtsXxQUcCxEESCnQ1jajYHJoc=;
	b=ddg2LBQt0wD2nVCVActKH9FOTUb1DDOtw9MpPKdQusynXfqWg7KDSS8DdnXXYWk/pIDkJT
	JhqHu9879IWYjkrz4HpTT0b+x6VCmETfves8+rXzyjaq80mMGjTqLI5mjSnxVtscPTHLjI
	60z1XUOOmWQ/Swz8LktFIkKJSDHzV3A=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-pA4_2nnaPcW_fQDce7GG6Q-1; Wed, 14 Oct 2026 02:58:57 +0000
X-MC-Unique: pA4_2nnaPcW_fQDce7GG6Q-1
X-Mimecast-MFC-AGG-ID: pA4_2nnaPcW_fQDce7GG6Q_1791946736
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so3307861a12.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 19:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791946736; cv=none;
        d=google.com; s=arc-20260327;
        b=Eqmxhxez+uz4QWW3OaZGFnZrlOYlKssZs8yk4iR1sdxuVNlfNU+bu3uWUT1+9Waz2d
         Hw1mPDOundy7lKLjvj4piRNLiOLO4hrDqzf+VY3ZZsg2G/+ayuOtEp9rl/vArTu1tL7f
         oCoO+6NFVOz6hvog5k+YaPoO7iHh9TLZ3oLxR37lzKEEhFvG+tyVjrIR0wGAG9SwYyJS
         hG4LTRDkejTE7jHDeIjA/oWWcnoCx+FCKJb+bSGDYgkTANur0tFV+KFD0IuOysUo8Pwd
         +OzhvpkMPlRaZBI7CR5Q1OqpiH5QIrivqCvcDO+aySn9LjkBo60rHWpGlEtcn/JfKqTZ
         g9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=THCiOXjGyA8Pp1KIAxUtsXxQUcCxEESCnQ1jajYHJoc=;
        fh=Ph/Xz/3ZyO3xDtOCpMCRLv3qwwutEfGcDduABaUPKSE=;
        b=Mhw63IdZpGGDvrQmougPHPeNdpvI+8gPoViPFFoae7FueWe2jfvlpwUO0cUlEVGuFq
         AvwMiHQougK/dyzJt9I0xpDKCHMrFKh7FR5Bp23tHaUrtAOEKX9QyN6zkE3OnvNy1+7Z
         WuCleSewnGiwXMsUjaY6F0tOENtvYosvxRV7ByMb87NwM98aPaMh5Uh1Ap8CAxQcyxqz
         6qvyKF4TCMloMPoftSSIs+ry/65HpOHvUE69RaNI0IvRy8twRJEpTWN5CaS7raU2DAZB
         yvQxwtnGApYH6tauvOIgSD+lVjtNGohFXcnawGH31NH1iX5bjPNkBYxqx0iTrEOFwwzG
         sSCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791946736; x=1792551536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THCiOXjGyA8Pp1KIAxUtsXxQUcCxEESCnQ1jajYHJoc=;
        b=bnpZgg/FfVhvjvSaSn6bwMBP57GjQcoarafZrAx0XLM3VILAa2IJENrx8C5+rcm2So
         ukefCBWzg4ssDRwl3GMbbPRIQhSIcdFgK1Vw1y6HhWgnI8PVVqS6a1kwS1FwiCLOAIwf
         s4bitCyaFgRcFVvEW5qSs51RdUjwiIWUSch04VFWLsE9smauLOIWHynBqkCMG339feTD
         6fvDUIdDHJ3JytgR57ur3UObGAa+NsAwIedrzvsU7qOLlbsA0l75e6x8DE5RFSe5kl7+
         fRhJ83WsR/616dw7bZMmJZZ2Q4iJp0i5OSmyDOi8M4jvi6ld8RiwphDpBB8wXtjGr/KH
         5RMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946736; x=1792551536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THCiOXjGyA8Pp1KIAxUtsXxQUcCxEESCnQ1jajYHJoc=;
        b=MtAomUU8ti6W15v5H6kIy77FY2O+rRV5bNp+53PCOSPH2Nu/R/vHvy2J/LX9eYA+xr
         rAIUPg9+S1H95wGwNDvULWvdTQsJwoxUNMURN2i4kXHmJozdPMaa5wkR2dg/69oAUkhR
         UPQc6dOr9pp6qkuJLxe+YSwjwgP3ozJuxA18sgfDXT6405E8e6N042eX7418HsTQEeOw
         hkwJjQFbYX3ZfGXpqwPU9bmaE/FplbtV8rbvjrGMMhcQtmR1wNVdA5wiDaQSVsLYR9s9
         QqXgRxcjMKbrmDLS6/OTmVOAzkaxY/pkxCdSWj1iIk30CRp+IClQ2D2xOQyCbTbY9xnt
         PCKw==
X-Gm-Message-State: AFq9FYLlBAbDhzcFtZfa6tQLxU+t3fiZQbQ0dkINCgZcMyFiiyo0iuzb
	kpR+TBdEdc1PgyirkFmeKB0zn93GwHrp0vqP0/AfMVPTmZD00lA3FCo36fZUzUJNWaSqLChDWJH
	chU4ATCjzAHC5kiBr9mCHUAgkZYmP3/VL5L0+t8SycRgCcqlpxVD2kllf5oNQyzt6E+/lPWGTcF
	xq3sy20MvB7fpM/cc1rGQ/NODXkYoHRsmzD45l9/7cTH6cY3kO9g==
X-Gm-Gg: AYBFou2QWypMZzql8Zsim90AOTXRbhVdyadbDypH7/qP9DbkVKK5f2rwXF1WkCHYhI8
	pE6Utnz2548Rs8rWadTsUZlrsLDljRK0PpUG3CcphKGwRqvWOl25HPKS67+Dpq3V+i8DTVtZzHL
	pSyPfWEueZ/TE0geiCSqcVgduz76AQ8iVrIkrGJQyxhRKMJGxUqnzrANys
X-Received: by 2002:a05:6a21:e105:b0:3de:5302:e92a with SMTP id adf61e73a8af0-3e16bdf20admr11150366637.17.1791946735730;
        Tue, 13 Oct 2026 19:58:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:e105:b0:3de:5302:e92a with SMTP id
 adf61e73a8af0-3e16bdf20admr11150346637.17.1791946735110; Tue, 13 Oct 2026
 19:58:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816194259.151947-1-john.cronin@opcenter.com> <20260824123348.3761049-1-john.cronin@opcenter.com>
In-Reply-To: <20260824123348.3761049-1-john.cronin@opcenter.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 14 Oct 2026 10:58:42 +0800
X-Gm-Features: AclHuK_ME1G2adc9X3qycHErQJmLbFXF3nLJandyShLgTvoDtkZ6oFtWorGAG20
Message-ID: <CAEth8oEnYym3pq8TBu2Rkanv0-EoyAu0eeSs7PrhizJiZOt2kQ@mail.gmail.com>
Subject: Re: [PATCH v5] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: John Cronin <john@stromback.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hansg@kernel.org, john.cronin@opcenter.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Mon, Aug 24, 2026 at 8:34=E2=80=AFPM John Cronin <john@stromback.com> wr=
ote:
>
> libcamera issues VIDIOC_SUBDEV_G_SELECTION with target CROP (rectangle
> 0) during CameraSensorLegacy bring-up. imx471_get_selection filled the
> rectangle then fell out of the switch and returned -EINVAL.
>
> Compute analog crop in set_pad_format: 2x binning, centered in the
> native array, same idea as imx219. IMX471 2x2-binned 1928x1088 then
> reports CROP as 3856x2176 centered in 4672x3512.
>
> Tested on ThinkPad X9-15 Gen 1 (SONY471A / IPU7).
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2454119
> Signed-off-by: John Cronin <john.cronin@opcenter.com>
> Signed-off-by: John Cronin <john@stromback.com>
> ---
> v5: drop extra braces; declare crop/bin vars at start of
>     set_pad_format (sorted by line length); wrap to 80 cols;
>     keep only the bug/feature in the commit log
> v4: add Signed-off-by for john@stromback.com
> v3: rebase on media-committers next
> v2: compute analog crop in set_pad_format; return 0 after switch
>
>  drivers/media/i2c/imx471.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> index 4053aed84..0ea18fbb9 100644
> --- a/drivers/media/i2c/imx471.c
> +++ b/drivers/media/i2c/imx471.c
> @@ -421,6 +421,8 @@ static int imx471_set_pad_format(struct v4l2_subdev *=
sd,
>  {
>         struct imx471 *sensor =3D to_imx471(sd);
>         const struct imx471_mode *mode;
> +       u8 bin_h, bin_v, binning;
> +       struct v4l2_rect *crop;
>         int h_blank, ret;
>
>         mode =3D v4l2_find_nearest_size(imx471_modes, ARRAY_SIZE(imx471_m=
odes),
> @@ -431,6 +433,18 @@ static int imx471_set_pad_format(struct v4l2_subdev =
*sd,
>
>         *v4l2_subdev_state_get_format(sd_state, fmt->pad) =3D fmt->format=
;
>
> +       /* Analog crop: 2x bin, centered in native array (imx219). */
> +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> +       bin_h =3D min_t(u32,
> +                     IMX471_PIXEL_ARRAY_WIDTH / fmt->format.width, 2);
> +       bin_v =3D min_t(u32,
> +                     IMX471_PIXEL_ARRAY_HEIGHT / fmt->format.height, 2);
> +       binning =3D min(bin_h, bin_v);
> +       crop->width =3D fmt->format.width * binning;
> +       crop->height =3D fmt->format.height * binning;
> +       crop->left =3D (IMX471_NATIVE_WIDTH - crop->width) / 2;
> +       crop->top =3D (IMX471_NATIVE_HEIGHT - crop->height) / 2;
> +
>         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>                 return 0;
>
> @@ -468,7 +482,7 @@ static int imx471_get_selection(struct v4l2_subdev *s=
d,
>                 sel->r.left =3D 0;
>                 sel->r.width =3D IMX471_NATIVE_WIDTH;
>                 sel->r.height =3D IMX471_NATIVE_HEIGHT;
> -               return 0;
> +               break;
>
>         case V4L2_SEL_TGT_CROP_DEFAULT:
>         case V4L2_SEL_TGT_CROP_BOUNDS:
> @@ -476,10 +490,13 @@ static int imx471_get_selection(struct v4l2_subdev =
*sd,
>                 sel->r.left =3D IMX471_PIXEL_ARRAY_LEFT;
>                 sel->r.width =3D IMX471_PIXEL_ARRAY_WIDTH;
>                 sel->r.height =3D IMX471_PIXEL_ARRAY_HEIGHT;
> -               return 0;
> +               break;
> +
> +       default:
> +               return -EINVAL;
>         }
>
> -       return -EINVAL;
> +       return 0;
>  }
>
>  static int imx471_init_state(struct v4l2_subdev *sd,
> --
> 2.55.0
>

Could you please pick up this patch?

The patchwork can be found here
https://patchwork.linuxtv.org/project/linux-media/patch/20260824123348.3761=
049-1-john.cronin@opcenter.com/

Thank you


--=20
BR,
Kate

