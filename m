Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A53B8BD9
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 16:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466351; cv=pass; b=sU60TQLkk8zmbqJz4S1K50BK0xf9Y5AQ5EBDhb9yScOwsnKCZhaSDspNJ5JTfQ39GgFDNA/GgGgfY9i40rs9ONbtR7Va5LnNZAH9tSQQ89MWas2l5aMtWQKsNLtRHLpWPeJhTB2C5z0UnEWuoOrKjcZl4RDKBtdu2eFLWzxW7fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466351; c=relaxed/simple;
	bh=hvftE3gW+EeAfsf3Zx0Bp0RTxgvmF7fWDRfmyNP2yNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQ2ZAyID0vPx+D7Yvwv6O33rBmPid+/49lkH2+prTB45QJtbo9cuYxX0N5qmeKBeAV85SkCsKjbemTr+tsvrRYmrzvN2pA/kbhTY83+tsIe9WnzSGF7RY0O05INyx+tAd/MlIgwtNk7pKYO8p7JG5kYkoQIk5Ytea+EzddDtTtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nw++Wwyq; arc=pass smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw++Wwyq"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e65e18969so6181285a.1
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 09:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786466348; cv=none;
        d=google.com; s=arc-20260327;
        b=bB7NGUJzhLL1DLM6P9XCpTYCL4fl1QgUpFDqJRvcLsqjr+JE3QwVc43anLGMRUZoK7
         7LWQ5cpHqz8VJKa8DsqzSSK6QmB55rmzN8IfFpnNDE3UAUT1NXcmpmDsjTt/o2h1pp5A
         qqe06dbrPwXvSUsJK9p8L243YmqtrJhl2alQfdXZNRBODC0ms5cVg7mvO/5TZe3XZIFe
         v1vd0eeWG0n+Wyo7AcWIPyKX53uAr0z+thIXGj9ppOHSO50fA+2UMJAhCeROZwiz+sdk
         q9UzPhIxTZEcIK4BEpDEgOWC8ggzNTrFHOGDvJHP1Um6vzQ3ifMAU35beTtAraX9d3JS
         kxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        fh=/SANWMck3OM4/EgVtrquFKlp7jn7O79m8GgzBLYYyLo=;
        b=ToJ6VUvKo3IxWQtbBfFuccgb27celZfVeshJ5kh/UduonULGQz/A+yCIdwEWvs3A3a
         C8rDO3iGmNSiEjMNUXSLcdo6VxwrqTrYawY+Ivqj/mTOwQDh81s9sG18NoShrZWdNS8n
         +QWTT96L/+OfusRMHfaw1BV0dbBIAQKBDrnZCX427huIaX5hLogLRJKOoobXfUpOWd+d
         IrftfUnhtSjlG2tTK0DADcrPqxMsimSz6R4EBzT3VcfWkYhnaz8Ei/rebTPEyPTFY16V
         t7dMtK9fcr6SwuCcV2tgiIeK5rkROHThv1+SYfRWuBJex4w4CfM8dzGDVfbSalLJopMo
         siHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786466348; x=1787071148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=nw++Wwyq0mc23O+LY8rEQz4GVDS7JupUXRrywE/Byc5lr4n21VbAaB5Qw9dDPwxSXQ
         Z10NQf1KqKrhUcXTDfoqhpltpD+rP+tTlZZVqaCJu2wswKlmUquvyRIlNvSw73edyIAq
         Z6sqzaQRKnhsyM4Oc6lmlx0bxF6fFrpF7PoJtupOF+wJldjH/STMNHRcmqFGZAF/I1kq
         npJOfo8FudlppWU5mIOgJ054EE4M5MJACFMWi57msEGvhyp/fDmamDJenP5gxlIBXtkt
         k0fvkv/qKJnSVHf2OwC5TQLtn1EWPkYw8Of1dOoNTuB7Vm8ZyWzivTfRK4MnC2KMVuck
         eG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466348; x=1787071148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bcFHmkU9nSJ0MDbVyrPBqiYyAs1hPGT8G7FVHkOHZ4=;
        b=ctBgiBXqLq+qGHFmyKRJDV8B3pGgBiNGux5TxWb9d76GNdcBxKOuimUwHst/nWvUVv
         nLVhMG9ev9wx1M8t0J52woaLegq0il1T0Uhy2pPp9WA6o0X4waUVS+CTBnJnXDteb8Hv
         QmmhzivJIjBOEzHmNGQGQ1DrXDGPoGpFFFCc1+hIYtxikS/9s5Lghe2WUnz8lNZUQ6S0
         GsNaCXHub6idn6vbhIKhPs5ZHpfxO58rJ2aFyhscYL2LoAqlvJKCPjtIr1dtuPJJoNQo
         K+M6rZReAbMtHWKkQjnEhCSFw8otRPBxf5VUBUNLuLX10GvG1H8yD9E8cSyDVkbX/g8D
         iRbg==
X-Forwarded-Encrypted: i=1; AHgh+Rryfv8cqGAJlAErxXZm5yiiC3lvpRgg1h8XnUrV4Bk3GlY9bDFPZCGunF4x2hRWflfduf+f/kar2jbUUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgSL5lk+vC2CbOCaJ6LLU/k4nDgQtXBFIT6JVazzaLoyzs1Bn
	UApJjcAJamhWSZntiQpY89h13HDGZphAmJE7WqMc8YI5AJOs4VLQ8N/FQASGhZPfiDmCYqJI/ZU
	JiiMyA5r8wr8/gkOYALi3b0aauQnyrGA=
X-Gm-Gg: AR+sD10k3MgCei8pJCUYr0MlpoF7OHKaudMqiAGV9AM8CD5y36U0bTee5KnzIOZBTuK
	ChLZkM/3ieruVYGIy45HVJo4w6wYTiI6RzFe4ao17hBgQegYTjX86VF2TFrBIyJr/APyKYT9yg+
	Y00ik6r6k2D2sacc4S90gzi9SUydP50Kln/X24mFuwz4rc9HdYDOYbresqh6z+LCkdeEqjJfRcN
	n2IAlYvlod+g4OXzeqwotyvpJZZnTpOFnJkASjgBhRmA3dIyOzXXg0A8siIQqfg7EP+rq7nnaWU
	Ewx6IFkHHQ01Jsz5FpO1LRhKKe8qq0GqZLYpQdD1ZZKysDPp8udZqINFNjueLoBKuFAImCrJiqt
	VIuBUZ4SGsqOh5P1KcsmYDjnVBEjszom54uk=
X-Received: by 2002:a05:620a:6018:b0:936:9f49:69ca with SMTP id
 af79cd13be357-936ae1b6195mr122622585a.21.1786466348494; Tue, 11 Aug 2026
 09:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730153603.5721-1-tharitt97@gmail.com> <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
In-Reply-To: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Tue, 11 Aug 2026 23:38:56 +0700
X-Gm-Features: AUfX_mxbavY404ZnMz9OyorTzYiN16EACxukLGAUaARpCgqkofGP15kHe_8MlHk
Message-ID: <CACak8wPrEJ6hj2hL=5yQVY1oUPcJV0GwZChbVGT+n0C924jR6g@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: fix v4l2-compliance failure
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the suggestion.

I moved the default out of rkvdec and into the common V4L2 compound
control initialization, making V4L2_CTRL_TYPE_HEVC_SPS default
chroma_format_idc to 1 (4:2:0).

I'll send this as v2.

Thanks,
Tharit

On Mon, Aug 10, 2026 at 9:05=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le jeudi 30 juillet 2026 =C3=A0 15:36 +0000, Tharit Tangkijwanichakul a =
=C3=A9crit :
> > rkvdec fails v4l2-compliance in two tests related to
> > V4L2_CID_STATELESS_HEVC_SPS. The Control ioctls test reads the control
> > with GET_EXT_CTRLS and writes the same value back; TRY_EXT_CTRLS then
> > returns -EINVAL because the VDPU38x rkvdec_hevc_validate_sps() rejects
> > sps->chroma_format_idc =3D=3D 0, which is the value returned when the
> > control has no default.
> >
> >     v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
> >     v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
> >     Control ioctls:
> >         fail: v4l2-test-controls.cpp(942):
> >       try_ext_ctrls returned an error (22)
> >       test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> >     Buffer ioctls:
> >         fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
> >         fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_=
q)
> >       test blocking wait: FAIL
> >
> > Provide a control default via p_def with chroma_format_idc =3D 1 (4:2:0=
),
> > which is the only value the VDPU38x SPS validation accepts.
> > This fixes both the Control ioctls and the Buffer ioctls failures.
> >
> > Tested on Radxa Rock 5B (RK3588).
> >
> > Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 v=
ariant")
> > Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
> > ---
> >  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
> > index 1d1e9bfef8e9..37603f049788 100644
> > --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> > @@ -236,6 +236,10 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls=
 =3D {
> >       .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
> >  };
> >
> > +static struct v4l2_ctrl_hevc_sps vdpu38x_hevc_sps_default =3D {
> > +     .chroma_format_idc =3D 1,
> > +};
> > +
> >  static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> > @@ -243,6 +247,7 @@ static const struct rkvdec_ctrl_desc vdpu38x_hevc_c=
trl_descs[] =3D {
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> >               .cfg.ops =3D &rkvdec_ctrl_ops,
> > +             .cfg.p_def.p_hevc_sps =3D &vdpu38x_hevc_sps_default,
>
> Thanks for your patch. Have you considered setting this default in v4l2-c=
ommon
> instead ? Monochrome is rarely supported of implemented in codecs, so set=
ting
> the global default to 4:2:0 seems like it would be valid for all drivers.
>
> Nicolas
>
> >       },
> >       {
> >               .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
