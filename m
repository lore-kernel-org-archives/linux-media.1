Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9CB37755C
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 17:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172080; cv=pass; b=RfozR0l8ndp7AnYoPcleLOVfaoocnuO2oAX1gTjl8RC00CQF4Ftbb5Rw4CKHx225FnlEclIgtrxsAN+dJ24w0Uc2Dr3uspwHZsjR+clARds+To+FHMY2YrtUi0jNzv3r0/J9EipONUQTwxbD74fmQDOdCEPiWZg8nUnYA2b04kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172080; c=relaxed/simple;
	bh=7zkR+mxSGu1Rzhid/4iN6baKVIj50TQJlaIiHYufais=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LtE91v8jpACES5qC16z5SQwDSmJZSphBA+wJ3cx683R1NC+cA4q5JBFTPs7EXYiy8rFxNlKKz0bMKI9HYgytcuBry5F1OMgNeT6BNabbqx7Df3fSVWdgthvCXAwrMsn9MmswURgnJamxYp9pg4A5lKT3vmjkRbyds0vGp/AChQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SByEctkn; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SByEctkn"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8080651d2cfso1574837b3.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 10:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785172077; cv=none;
        d=google.com; s=arc-20260327;
        b=n7lynlwgbxf384pg3E6kWuO8byyRTv3PspF2dc9Z5GWYzK2vE87V2GoKFtlHM1llTN
         +K0+5tRl9kmnKvpCN+k7o0EIb9pyK9oPvHZ8HT8X+Q/4xg738el4fUOYw3Jba1MjyqWr
         kqL41skIrw7ZFkXttA0gHKqzXQfCHO6/337Ee7jiif/P1TWn2mPvIwTVNP4n6UR6Yqqa
         SWu2EEdgS7KHDpiaWu5khqGug2l+0Vab757JLRCbVLfviaP5EtjcSHFGAKy3UfqJDUSJ
         YXtAChW5Uyg7IHu82pAaua1cYTmqh7DGsNohg1/sKLPudLOiLI80eHMV/5v+p8FD3Zfv
         /eyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        fh=rKpYu8oPXNRCzL3aSfS3Mwm00rpIZEhzM+Xq001a3gA=;
        b=bXtzI13npr6/FLjOow0GlXxVcW5ahZDUpI5LKBqKEs5FWRxgY2OvC6pdE1mJUecVs8
         3IUj2kSJkRd6z8WONOXMaxAPha3yeuLRbUWqSIXkfYI9pXlgHRQkmhSuvr05Wa2fMQ9c
         R4Zl7QgKJZ+lx8v25gff8WYL+JzI1nUgVmFdYrk2DsdeWhJPlIoUZlSCnYlQVAGhhBQB
         6JzQttp+duy2LOiEZI50rSxyYRc8+X7KeGB0pZidA5klirfw+QdlM9+kSERTVPnMJ+Oo
         1NqpEow6riMqrzhvxI1EogPP1twsKiG2RK5HNeSUIRfV12+y1AbNuYAa/ORUSCVWXk/7
         YA6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785172077; x=1785776877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        b=SByEctknst6Fv2v/W1k7cZHSxJXlgYJE8nD2ZMa/EayqhpviOanWQvjp0QiN4OfdtR
         G4ET5e8S8tbvgW0UQUBZPO95IX6o2C5dG2TCIOqcDSaghnmJYA7+yKaqpTfOtsYOYWPK
         7ts6KogcDm7EnSTz2y1xx/HDlacwtaHV3vHxONJWVqpH7y8DFIFnZZfs2AS1cvjw3V/W
         SSiyOmBC89pN1cYIuHC2AZIhCaWguaU+mQCcvmRcIkh3NhCdQslXjOc+Vr6JlsRAc3Wi
         OzT1XlGY2X7h0ecu1Uh2A5zzyw/g3iPKQ/qQTjckQK/JKGgCYbL2XSTBnxlvanNpf6je
         Y3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172077; x=1785776877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c21ngjJ5XlclNkcsiWl5J6SQ+KBmH0ZVxdFOlgqSkMo=;
        b=hEmoWflHH0fTN32zwJ803FucFW5D0MMsttQYgZpqBEUVvRB17FlZUDQUWV8D8P8ZZw
         YXNbVafCo+8dldGxJD22qTr4GO6eAOW1ISRa/79eTAT6qKpN9KqCZ/ZSPokh3dQhFirz
         Wj4KlkMqe8sUPt4I5i85e0q/HV4f5J+YXS2xDgLnHejZf648gnFLAGkwN3qsFxARzY4Z
         NiAnWP2OiQwpyKDoUqb3TEmU7hmmfoy2ye2j9nlrC8H8ttAhW5EQdbHUTXlvx94eyhM9
         GL4MFfSRvHGjtTLx5P17mou+oKBz4eFRoRj/so43QA/b8mCIKEOr6qUbUt+yS2UVS15r
         cVRw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9tOWkgV2CPEBfLNr7aARb0qmCmDqa4/XMUITlSuRFodz9kjTQoC454sdJIp14AYIqQPBEpD/nqagd4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg91j6bNNpHKwguR/LHi0MD7LzTpgJSTjTh0VY5zxmpkW94JWx
	GKdi1qElSGOjTLw9ETULzZQvcaHfb5e4+l1DZAcU+nZO650EtwKK2IM4+SpaORQv4FPfDpmXB8F
	NtgTabFrLN5nn2MJk8/ozSPxi1b3/X4rh10h/7Nc=
X-Gm-Gg: AR+sD11ZK9LN3MoCAkD/mwPYWuXm/RiHTMSDFMYZof5SIUxfxI6GgMwjyjOjwMTgtN/
	o+e6BV52v8uDVCN4mxwTZ6pbvq7kLaT8M34x3Pw0mUERR1Mxwm9VdTHO6/eNwwnlWnRpZTNFV/x
	DMdrrYXLrN2KbHI/IdXCl2sUS1h3FywATFHH3ttnyu6Ya7yxnV8nslnICxmf80W96mBiRm0CID6
	puJ9f2Cs/FUtfQsVkNpA1f5OLfO6gv2G+nlaGNIEqms0rFsVOZtJxAOAlfIuQiv0SQIbWSfzvdM
	98+2FqVzd5ljls+VECXQ
X-Received: by 2002:a05:690c:c508:b0:81d:a82a:a4fa with SMTP id
 00721157ae682-81f918e48e9mr3545747b3.5.1785172077323; Mon, 27 Jul 2026
 10:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com> <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
In-Reply-To: <cb8XVJu6RUmEjMZpl7NA1g@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 19:07:46 +0200
X-Gm-Features: AUfX_mwAp38CvxOzFNFIy663VRohFPhaabl-gVyS3Hkri8cjdi-61b1oibiQvGg
Message-ID: <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

> This shouldn't be needed. As you set step_width to 64,
> v4l2_apply_frmsize_constraints() should already do the alignment.
> Do you have more context as to when width is not aligned ?

You're right that the width is aligned -- step_width =3D 64 handles that.
This isn't the width though, it's the stride, and it only bites on the
10-bit (Profile 2) capture format.

For 8-bit NV12 the luma stride equals the width, so once the width is
64-aligned the stride is too and this block is a no-op.

The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
(bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
of 64 even when the width is: a 1920-wide Profile 2 frame gives a
2400-byte stride, while the VDPU381 needs the luma stride 64-byte
aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1,
so NV15 comes out unaligned and the decoded frame is corrupted without
this. I can show the before/after on a 10-bit vector if that's useful.

If you'd rather express it through the framework than with a manual
ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
height, 64) produces the same bytesperline and sizeimage -- happy to
switch to that in v2.

Igor


On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
>
> Hi !
>
> On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma Da=
rbha
> wrote:
> > From: Igor Paunovic <royalnet026@gmail.com>
> >
> > Ensure bytesperline is 64-byte aligned and scale sizeimage accordingly.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > <vdarbha0473@gmail.com> ---
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > 436bb460f04e..6ab6530b1cc9 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> >  {
> >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> > +     u32 aligned_bpl;
> >
> >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> > pix_mp->height);
> >
> > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordingly.
> */
> > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > +     if (aligned_bpl !=3D plane->bytesperline) {
> > +             plane->sizeimage =3D plane->sizeimage / plane-
> >bytesperline * aligned_bpl;
> > +             plane->bytesperline =3D aligned_bpl;
> > +     }
>
> This shouldn't be needed. As you set step_width to 64,
> v4l2_apply_frmsize_constraints() should already do the alignment.
>
> Do you have more context as to when width is not aligned ?
>
> >
> > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(pix_=
mp-
> >width,
> > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > pix_mp->height); }
> >
> >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_forma=
t *f,
>
> Regards,
> Detlev.
>
>
>
