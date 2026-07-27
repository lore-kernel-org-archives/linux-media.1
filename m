Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673013ED11B
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174992; cv=pass; b=pkfBHNBva8K2j6gngrgigpd+hUM0IZsoLI7qQ4Jh4nIt+uwZFgsaWCnJ/Gur4J2qlQgy4h61f90Pxi+++YyUxPOIqoFBlRcmAA3lLJfSukGiLiAwVVzq642h+KuRa4Cgp972pqG3jRQ0UyjjvnDiEPUJ6o91rmVmc3lWgdEo0U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174992; c=relaxed/simple;
	bh=36a+icYuPtxhX89XSJnSF35Ol8QdFGpcoeJA2EXz8ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXcQzAO0kiELKrvSeM+KlqooVHicsxO7tt5iGRjx6CZlkgvtb78oQOsnxvsqOixHSSzl8iKQHmORSq8vBZgiL9zuWsmgq/f4QfI3Ch9vhyCzemBXcU3XmmlPD906lC3Hv1B3LHjOVRvbCdsg49C8iR/qKChxZWaB1G0cHubjndA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjKD187x; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjKD187x"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81e89f60620so2008927b3.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 10:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785174984; cv=none;
        d=google.com; s=arc-20260327;
        b=X3WC+8ec5+DT2qeghoFM78fYtVMLsema2fInPuSCHPdKEqur8g7sWNjQ7CugDubnzP
         vBLQoVDw7euXrGZib+N3jJPB6R/t9xY6HcNptMUPB3rFIN24VyvSeffhaE9igiWFfY6x
         WXU/N06CzxuGxgVjw1gP3xdK2zoeWYQiYgLYMyUeWo2tvoUbV9tsHbngnjLRqFMncjyX
         lmDrzC6k5ndSqBHGnJdoZjUrpcVlwrmHSVTwxRtiT9F5gbofUTInTw+JjWcp1PiwlcHf
         /COoEF9aVsjcff6G/Czoxgth+jSf3r4bSOUGxu1pJJ6xzBglsYoBZpQ2uWzDwCla73Vn
         ImaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        fh=KTDQLGac6a4ndBeZmKDkm1KOMsIgfBgWNoWjtoCYWjI=;
        b=KqpQ85j5Kmdyk9LkVXPIi+B+ZbXlVasiOEG0DM+oJ6Nf8GgwXERmFw7vyEqY51D7Um
         ogruH1y3JxHl7AGhzpp4b8B4k5uhG8kr5fcGEbx3AEr57is/4ZFUyLZLxnByP5gejEd9
         Tfk3Pzg1lFVRsWz5HtMkMbmVyihsw9y6/OpgaILULzQEIn+TZkDVPixbW8hC7yEikFIH
         i33Mc3T4boFDS42FBkEZijPB7AHLKc8lnSUDj9MefGwn8VtCtMxqoZnqxf2wDzWyFxeK
         K3OMShb1fH5HdSb2cAxfjPwh46XKrvXYM1f8xC5axZMZLDM4IsHysxey4kATD6G4GWS9
         913w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174984; x=1785779784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        b=FjKD187xjwqRZWSAi0QW2Tn3EYR0j1qz1MNbqRidNJXroZ18bNgrvfxtto4pGM91/M
         nt156t0ffnC3gT3brtC7sIC+Bz7BoSvc/rpMVlq6uL/FS3jcWmq0LCKiv9LLCjuBCzyw
         uqDr7ViRMY/FZcpFhtxAWYC4H9gbHa03OmlHWU1nsTDrx0oAcikDt5xli0YEcjAY8Cui
         Mm5nBN8S3v91VKaDx9cgJh/OuNzufpm509EH4qcwjGbib/KzJH1b7tzNVU7KBcHg1flT
         CHLPHzMS34jDL+Wz9bv/flXWU8GHwCV6jDFzb7QRyZlWjtvqclGH/O7j7YJTgSM3KsV3
         egcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174984; x=1785779784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i45AoIudLNwR9IAtBYltSG7m68RejbFO/2WAgFeL9Y=;
        b=NQGr0Wxij4YGZnCfJo/LMmvAKbvpFg75aXtvz/VoqdtgKoFYEnPm9wyFz3QMb+II9u
         zDzGfL5jpUMLS1gXyohzovjOjnODalctKkFPpkatWktNA5HZrEkBGGvd7FbY4yQgRUFv
         +AzPAvuwEiTP6j68c1CQJ00RBBcrJByoqdwiaerjTpqMwSaj2p3yJo7123nW9VRXftBt
         ZZLmdet69f8MPkO7p8k6k2y/7ToeKjX5gaVW8lo8sTKms0/ccb8o6GKHiNha7P8jKf9/
         KQyELI80VndrIVnZouzUrbEuhwUYCgQlyjp5henBDApeWnnq+bzS0uyALVKLEcZJoVJ0
         oF7A==
X-Forwarded-Encrypted: i=1; AHgh+RpGI3w8t89bICepbYVXLyv/AZdLZz/sNY1aN9aGBmyvSQbIgLajTHGZinaU0cpco6m7zcfc2xURyEQPWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKaJpTDkZuAZ6zYfZGFA0aloutCTbYiTMBximVZ1X/fknpR3G
	5AvCooArP6NoaZMsEflrei8l3f06BuhdhVfQ4IyTe/Iduw3WhSSlFwHXyCm2UsRh7wHkIyPJfG1
	cuVDZPmowS466pq3OOKNs8+5Bo0P0mPU=
X-Gm-Gg: AR+sD10cRwLwme9gF8b2XV90KU4Vk5AuKxVDrZwCbbf+A2nR+3B/sIGgBK+IvuDahUO
	ssWle9TATblyWCgV1hf9Bg67fdczxo1qDqLt5yMFLL1No9VhmL35IOYYE9G2C36LwkPpmR9J3r/
	3OwYfpA/PvKo70XOTpSp5yvmI4nn3FAIITb0KhkDvEF0s6FcXK1ugK78F37QnR3je4pTwJ5Ib++
	UzQsmL91wERxDtYj3uFDZt+Oms2NtvL9RMYLC2LCdO1n4qiv3iuucoAiCWLtP/b5iXLXR0+McdH
	VMnT3Vm80UryCDRq8geORceRe4F8yM8=
X-Received: by 2002:a05:690c:e3ea:b0:81e:ba71:2be2 with SMTP id
 00721157ae682-81f91933c4amr4863477b3.5.1785174983542; Mon, 27 Jul 2026
 10:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
 <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-4-180fb2d1f10c@gmail.com>
 <cb8XVJu6RUmEjMZpl7NA1g@collabora.com> <CAEWPSH7rQv-yZ+dL+mZi6Mt3rj6gUZhp3r7_Gpjy8=1OArqwUA@mail.gmail.com>
 <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
In-Reply-To: <CAMhzuboSqvGxV3C1YSRqtopGm=sTo9S9YD5fh7GVHjAebH2wOw@mail.gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Mon, 27 Jul 2026 19:56:12 +0200
X-Gm-Features: AUfX_mxKOCcJHgSDrqe3mSeA7IFNg94Yj5C1MqeSQXmQtWXKJTA5E3698nF-3fo
Message-ID: <CAEWPSH7rNrVEKFTUFMN4Pd08s=5+E2Bdb1hOXDU+A9hvNOOKEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()
To: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, 
	Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI

Thank you for measuring it -- that settles it, and you're right. The
byte-exact A/B on both the landscape and portrait shapes that reach
the ALIGN is conclusive: the hunk makes no difference to the decoded
output.

Tracing it back through the registers after your mail confirms your
explanation. The luma and reference strides are programmed as
bytesperline / 16 (reg018/019 and the VP9 lastf/golden/altref
hor_virstride fields), so the hardware only needs a 16-byte-aligned
stride, and width * 5 / 4 on a 64-aligned width is always a multiple
of 16. step_width =3D 64 already guarantees what the hardware asks for.
My "corrupted without this" was reasoned from the ALIGN constant
rather than measured against this tree with the pitch fix in place --
that was my mistake.

You're right that the real fix is taking the MV and reference pitch
from bytesperline instead of the bitstream width -- that's what makes
the register value and the buffer layout agree, and it's already in
the "Add VP9 support" patch ("Real buffer stride, not
display-width-derived"). I don't have a vector that fails with that in
place and the ALIGN removed.

So this patch should be dropped in v2; the pitch derivation carries
it. And thanks for the catch on v4l2_fill_pixfmt_mp_aligned() --
you're right it isn't in 7.2-rc5, so that suggestion doesn't apply
either.

Igor


On Mon, Jul 27, 2026 at 7:43=E2=80=AFPM Francesco Saverio Pavone
<pavone.lawyer@gmail.com> wrote:
>
> Hi,
>
> > The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> > [...] while the VDPU381 needs the luma stride 64-byte aligned (2432).
> > [...] so NV15 comes out unaligned and the decoded frame is corrupted
> > without this. I can show the before/after on a 10-bit vector if that's
> > useful.
>
> The arithmetic is right, the hardware requirement does not reproduce here=
.
> I built the same tree twice, changing only this hunk, and measured on a
> Rock 5B+ (RK3588, VDPU381):
> test with ALIGN without ALIGN libvpx
> 1920x1080 VP9 Profile 2, 10-bit 8f40faddd32e 8f40faddd32e 8f40faddd32e
> 1080x1920 VP9 Profile 2, 10-bit 68400b913caa 68400b913caa 68400b913caa
> fluster VP9-TEST-VECTORS 224/305 224/305 -
> Both clips are the shapes that reach the ALIGN: 1920 gives an NV15 stride
> of 2400 (2400 % 64 =3D 32) and the portrait clip rounds to a capture widt=
h of
> 1088, stride 1360 (1360 % 64 =3D 16). md5 is of the decoded frames conver=
ted
> to I420, same pipeline for hardware and software. The 8-bit control on th=
e
> same pipeline is byte-identical too, so the comparison is not hiding a
> conversion artefact.
> That matches what the registers ask for. The stride goes into the hardwar=
e
> as bytesperline / 16 (y_hor_virstride, uv_hor_virstride, and the VP9
> reference ones), and width * 5 / 4 with a 64-aligned width is always a
> multiple of 16, so step_width =3D 64 already guarantees the alignment the
> hardware needs. Rounding to 64 only pads the stride reported to userspace=
,
> for every variant and every coded format, not just the 10-bit case.
> If you did see corruption without this, I suspect the other hunk in the
> same patch was missing too. Taking the MV and reference pitch from
> bytesperline instead of the bitstream width is the part that makes the
> register value and the buffer layout agree, and it is the one I would kee=
p.
> My A/B has that hunk on both sides, so what I varied is only the ALIGN. I=
f
> you have a vector that fails with the pitch fix in place and the ALIGN
> removed, I would like to run it.
> One small thing on the v2 suggestion: v4l2_fill_pixfmt_mp_aligned() does
> not exist in 7.2-rc5. v4l2-common.h exports v4l2_fill_pixfmt() and
> v4l2_fill_pixfmt_mp() only, so that would be a new helper to add rather
> than a drop-in replacement.
>
> Sav
>
> Il giorno lun 27 lug 2026 alle ore 19:07 Igor Paunovic
> <royalnet026@gmail.com> ha scritto:
> >
> > Hi
> >
> > > This shouldn't be needed. As you set step_width to 64,
> > > v4l2_apply_frmsize_constraints() should already do the alignment.
> > > Do you have more context as to when width is not aligned ?
> >
> > You're right that the width is aligned -- step_width =3D 64 handles tha=
t.
> > This isn't the width though, it's the stride, and it only bites on the
> > 10-bit (Profile 2) capture format.
> >
> > For 8-bit NV12 the luma stride equals the width, so once the width is
> > 64-aligned the stride is too and this block is a no-op.
> >
> > The 10-bit capture format is NV15, whose luma stride is width * 5 / 4
> > (bpp {5, 10}, bpp_div {4, 4} in v4l2-common.c). That isn't a multiple
> > of 64 even when the width is: a 1920-wide Profile 2 frame gives a
> > 2400-byte stride, while the VDPU381 needs the luma stride 64-byte
> > aligned (2432). v4l2_apply_frmsize_constraints() only rounds the width
> > and height, and v4l2_fill_pixfmt_mp() fills the stride with alignment 1=
,
> > so NV15 comes out unaligned and the decoded frame is corrupted without
> > this. I can show the before/after on a 10-bit vector if that's useful.
> >
> > If you'd rather express it through the framework than with a manual
> > ALIGN() here, v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat, width,
> > height, 64) produces the same bytesperline and sizeimage -- happy to
> > switch to that in v2.
> >
> > Igor
> >
> >
> > On Mon, Jul 27, 2026 at 5:58=E2=80=AFPM Detlev Casanova
> > <detlev.casanova@collabora.com> wrote:
> > >
> > > Hi !
> > >
> > > On Sunday, 26 July 2026 16:25:37 EDT Venkata Atchuta Bheemeswara Sarm=
a Darbha
> > > wrote:
> > > > From: Igor Paunovic <royalnet026@gmail.com>
> > > >
> > > > Ensure bytesperline is 64-byte aligned and scale sizeimage accordin=
gly.
> > > >
> > > > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > > > Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> > > > Signed-off-by: Venkata Atchuta Bheemeswara Sarma Darbha
> > > > <vdarbha0473@gmail.com> ---
> > > >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 12 ++++++++++--
> > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > b/drivers/media/platform/rockchip/rkvdec/rkvdec.c index
> > > > 436bb460f04e..6ab6530b1cc9 100644
> > > > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > > > @@ -102,12 +102,20 @@ static void rkvdec_fill_decoded_pixfmt(struct
> > > > rkvdec_ctx *ctx, struct v4l2_pix_format_mplane *pix_mp)
> > > >  {
> > > >       const struct rkvdec_variant *variant =3D ctx->dev->variant;
> > > > +     struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0]=
;
> > > > +     u32 aligned_bpl;
> > > >
> > > >       v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->widt=
h,
> > > > pix_mp->height);
> > > >
> > > > -     ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> > > > +     /* ensure bpl is 64 byte aligned and scale sizeimage accordin=
gly.
> > > */
> > > > +     aligned_bpl =3D ALIGN(plane->bytesperline, 64);
> > > > +     if (aligned_bpl !=3D plane->bytesperline) {
> > > > +             plane->sizeimage =3D plane->sizeimage / plane-
> > > >bytesperline * aligned_bpl;
> > > > +             plane->bytesperline =3D aligned_bpl;
> > > > +     }
> > >
> > > This shouldn't be needed. As you set step_width to 64,
> > > v4l2_apply_frmsize_constraints() should already do the alignment.
> > >
> > > Do you have more context as to when width is not aligned ?
> > >
> > > >
> > > > -     pix_mp->plane_fmt[0].sizeimage +=3D variant->ops->colmv_size(=
pix_mp-
> > > >width,
> > > > pix_mp->height); +    ctx->colmv_offset =3D plane->sizeimage;
> > > > +     plane->sizeimage +=3D variant->ops->colmv_size(pix_mp->width,
> > > > pix_mp->height); }
> > > >
> > > >  static void rkvdec_reset_fmt(struct rkvdec_ctx *ctx, struct v4l2_f=
ormat *f,
> > >
> > > Regards,
> > > Detlev.
> > >
> > >
> > >
