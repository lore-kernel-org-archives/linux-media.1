Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EFC4446E1
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174186; cv=pass; b=IXuIZLgV6HinM4zrccYBGPdSzwbucqz3YV9Axlu5Ln0T8q6nF5eWyaca/xXeBqqEFArTvC7+V4gWiH5rLAw+DPXdCPXPTkjKS6ZKf85BzQtrgOkaRoMLvdi+FQ6TX9PgQMXNU9rZN85vUcZ92+xsP72ND9YYbh8A3/fraxpuCOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174186; c=relaxed/simple;
	bh=KFbjQeCgAvFIYBYVPJBi6VQkR1xYV2U5CDxvtVfbHtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3U9aPd1h90SW5pMMPaJqyEew1xXszORDx2dd5/xFWWsNWC77yqKIMJvo4nyAHqeUbKxnVloZi7EWJSQ7DeVWlBz3PEX8iOtFUmAqroHQn3tuBKLHRGNe0gSAlzaF8WGE7TmsRpGofUtqeczwBMX1RkzDWME9j850ZkhV/NQb+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKLGnyYM; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKLGnyYM"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84830c774a0so3086569b3a.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 10:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785174182; cv=none;
        d=google.com; s=arc-20260327;
        b=g++1N55+9Zg+cDpYGdLXKdBJkaRqMssYa3X6QSNfAXwCPWVDyJDcFphRIrELt4Y0Yv
         CV/PMs8HQhTiVNWk8G7wEkqvP/DZCMR5YUqb04IvjCfBcjOGzH4/2dErsRcVDoErfjAh
         b6N2qGE+HANBUtxlLb1EE9ZsP1nAIzog9lgVqYoYG8TER/ySBabABkci2eHlZlSY+KE9
         N0gvKTOczpgAf5AjTyIfxLNiAdrtVGKUy6z9/EGqPvXx6eRmxTqHsJj9khMTQqGdEYSd
         jS6hvS08NfqOzfbvy9aPXuy+Q/azZARgomsX1/QFAc8eu9o8UcWlOOPqtrgMN91Oo45u
         qUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        fh=G4t36znrehEA7F03mAgPp9j9XFUUi+pc9TkPab3gR6w=;
        b=Vijp06ChDEFyDDyENbPhxxtv/bPpo8tO6mOJUF2ClyamOq0vVlZPKkDzhjLvemoH+9
         au0G9+z/hlsrmqnuQ+qy7BzYPzVmmvtvNaQ1IyMfVu4C3hUh8jURRANrhi0SkqYiyYA+
         FXN9krjd1+jRTXZBpyi8nGJLmpeU/NmbeoeFlwTAgOWVG9hQJf9cPcwVVpGeLdDUZyE4
         EfuQ5Le9huYpGAXc+FcEUJob7sg5A1i3HE0s/uXlWHdyRnHDvmoqSU4OkXyVOjKcjIvt
         zd/SUkhcVMFm33ldPyYZCk+IIxgkAdAVs7hoJ9j9tT+eF0CL5XfflvgMkbcNDbJAzdnp
         AIrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174182; x=1785778982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        b=ZKLGnyYMTPUc8aAffqFC8z6rUi43nJb8uusf30W3+VjQRwGyrj8E9PhZZUaebnzN+q
         mkeQt/DTZC1mqvU+E+dlv2h1inug91jj9ESOHFuce3HcnutRg0EP/Eq+KdBy2p+GKESa
         GaaqMUHoJTURv0awY4yYPGACK5cEdtzJPf8lxO1McIfcdT0IplGIrSuT+uD85l1JkWQv
         WBzZ9b/XHmWGrepHw86zyqs+UFsfpRTvPp2beBPbhWfC49NEWGLXa87mrMNXbeXXbReH
         XR1SYDhem5dMDKOs42FaSXLZFVpABt+3e+nlMKHqRF0gX2xGEY9jEMhhzs/cB+CDgl27
         r+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174182; x=1785778982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GE2Gc7S3rQsVMvQ6VTSOfR/xqWu60Jvi8kVxQRl1IrM=;
        b=r8ztGJyJsY6FaK5Wq/tK6+vuYeKKTXjsDjb6FAbNq7j7v7na+Y7hKhkguEBWuwG8we
         nBM0J0eOuvAvckh9sfveqEWm1q4GSj2V1jpQbtmclC5bO4nuKXKhnglsCabDhIENWpEE
         siwGyLyEQzkTmirhdbOueeLSjmCB/lNNZhjl3IvCuCYYmzu9J43JL7iTvEo8oXLPXfCc
         U8FZPGvTH5HoOKvbRIUgjvJJ4IlqAPs0niTO2HiUCQVuSZAi6tR1IybNxqjIfEd67DEI
         z0UU7yyk4hFBmpuEkIyboVwNoHpNc7XrVACGa7L818wWRuEeYKH9P6omDX0DKM7p52pk
         jtkQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFMB6IpagaUw4RxCt5Mo+31I+//jaCcrq/Gi/k0CJwBGLjWR0/yaK4nZMF7XRT25KyeAWlfphdtz+q6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/yYw8pdkYYm0iRrJj4Ch8usUMEUUCQsjDmptplgiFuoTYy4CY
	HByLdW4+QeiTVKNT5szL5z+ZOQa/BUUE5sNqZzW3qo36yLL28Y+Rb+sg2ub1d+KuzD95tlo3z4w
	SNFo07X23//WLPBhMSh7t+zjDcCb9vg==
X-Gm-Gg: AR+sD11vQxRMrCyALe343k2Xfl7xh3PYjBAODp6/71bDLv+XkVqZPAE64WNGbWikJTC
	hphFDN58IsoPnW3aX1axOSwPZBF5BBKLsswxFdF+evn9UuaKjUybdP9NYVFICQWpQwRXXByetdx
	Jcb/fxPErGIgkGvlsTfTYbNeAwZZSqKthEhobgSnhSjqys6lC81AF6/VSVi4Tbia49H2Vl1GFxq
	+HrG7itwD7u7qZtxjeztYeAfvu1QmCNKkq8UNuwEYn36Ba1hmJMvIo5z0h5nYMLtu1+g35NnPTW
	Y1PwFhz9XQyo+Jk2tw==
X-Received: by 2002:a05:6a00:4285:b0:845:31a6:d84d with SMTP id
 d2e1a72fcca58-84e594050a0mr7460731b3a.7.1785174182279; Mon, 27 Jul 2026
 10:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
 <cb8XVJu6RUmEjMZpl7NA1g@collabora.com> <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
In-Reply-To: <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 19:42:49 +0200
X-Gm-Features: AUfX_mzH05lg1Xshmnhdl4MT0s8-l2--8m9czgeFTmnU7hUrCIbQUFu1WK57mGY
Message-ID: <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> [...] while the VDPU381 needs the luma stride 64-byte aligned (2432).
> [...] so NV15 comes out unaligned and the decoded frame is corrupted
> without this. I can show the before/after on a 10-bit vector if that's
> useful.

The arithmetic is right, the hardware requirement does not reproduce here.
I built the same tree twice, changing only this hunk, and measured on a
Rock 5B+ (RK3588, VDPU381):
test with ALIGN without ALIGN libvpx
1920x1080 VP9 Profile 2, 10-bit 8f40faddd32e 8f40faddd32e 8f40faddd32e
1080x1920 VP9 Profile 2, 10-bit 68400b913caa 68400b913caa 68400b913caa
fluster VP9-TEST-VECTORS 224/305 224/305 -
Both clips are the shapes that reach the ALIGN: 1920 gives an NV15 stride
of 2400 (2400 % 64 =3D 32) and the portrait clip rounds to a capture width =
of
1088, stride 1360 (1360 % 64 =3D 16). md5 is of the decoded frames converte=
d
to I420, same pipeline for hardware and software. The 8-bit control on the
same pipeline is byte-identical too, so the comparison is not hiding a
conversion artefact.
That matches what the registers ask for. The stride goes into the hardware
as bytesperline / 16 (y_hor_virstride, uv_hor_virstride, and the VP9
reference ones), and width * 5 / 4 with a 64-aligned width is always a
multiple of 16, so step_width =3D 64 already guarantees the alignment the
hardware needs. Rounding to 64 only pads the stride reported to userspace,
for every variant and every coded format, not just the 10-bit case.
If you did see corruption without this, I suspect the other hunk in the
same patch was missing too. Taking the MV and reference pitch from
bytesperline instead of the bitstream width is the part that makes the
register value and the buffer layout agree, and it is the one I would keep.
My A/B has that hunk on both sides, so what I varied is only the ALIGN. If
you have a vector that fails with the pitch fix in place and the ALIGN
removed, I would like to run it.
One small thing on the v2 suggestion: v4l2_fill_pixfmt_mp_aligned() does
not exist in 7.2-rc5. v4l2-common.h exports v4l2_fill_pixfmt() and
v4l2_fill_pixfmt_mp() only, so that would be a new helper to add rather
than a drop-in replacement.

Sav

Il giorno lun 27 lug 2026 alle ore 19:07 Igor Paunovic
<royalnet026@gmail.com> ha scritto:
>
> Hi
>
> > This shouldn't be needed. As you set step_width to 64,
> > v4l2_apply_frmsize_constraints() should already do the alignment.
> > Do you have more context as to when width is not aligned ?
>
> You're right that the width is aligned -- step_width =3D 64 handles that.
> This isn't the width though, it's the stride, and it only bites on the
> 10-bit (Profile 2) capture format.
>
> For 8-bit NV12 the luma stride equals the width, so once the width is
> 64-aligned the stride is too and this block is a no-op.
>
> The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> (bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
> of 64 even when the width is: a 1920-wide Profile 2 frame gives a
> 2400-byte stride, while the VDPU381 needs the luma stride 64-byte
> aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
> and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1,
> so NV15 comes out unaligned and the decoded frame is corrupted without
> this. I can show the before/after on a 10-bit vector if that's useful.
>
> If you'd rather express it through the framework than with a manual
> ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
> height, 64) produces the same bytesperline and sizeimage -- happy to
> switch to that in v2.
>
> Igor
>
>
> On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
> <detlev.casanova@collabora.com> wrote:
> >
> > Hi !
> >
> > On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarma =
Darbha
> > wrote:
> > > From: Igor Paunovic <royalnet026@gmail.com>
> > >
> > > Ensure bytesperline is 64-byte aligned and scale sizeimage accordingl=
y.
> > >
> > > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > > <vdarbha0473@gmail.com> ---
> > >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > > 436bb460f04e..6ab6530b1cc9 100644
> > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> > >  {
> > >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> > > +     u32 aligned_bpl;
> > >
> > >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> > > pix_mp->height);
> > >
> > > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordingl=
y.
> > */
> > > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > > +     if (aligned_bpl !=3D plane->bytesperline) {
> > > +             plane->sizeimage =3D plane->sizeimage / plane-
> > >bytesperline * aligned_bpl;
> > > +             plane->bytesperline =3D aligned_bpl;
> > > +     }
> >
> > This shouldn't be needed. As you set step_width to 64,
> > v4l2_apply_frmsize_constraints() should already do the alignment.
> >
> > Do you have more context as to when width is not aligned ?
> >
> > >
> > > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(pi=
x_mp-
> > >width,
> > > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > > pix_mp->height); }
> > >
> > >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_for=
mat *f,
> >
> > Regards,
> > Detlev.
> >
> >
> >
