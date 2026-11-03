Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729174;
	b=scwyepuT/RD09md9Prw1RxaEx/EY9KSoghxY4iCzD4DpG/C84+ELNwvmLiKXY4H4qXrC
	 giuV5MAyN/sJXMxLQfsPnMksCyKon4R9LwJxjN3sKyF6rLxLrfczXzg/WMeQaCltPlrKx
	 4Q5tVeDpxhVy8Hpj30cot1Z4ZHA24BQWTF4UUAFbDiiEnJbkI2iQqtkCbXnJSGtAdiYJr
	 Iv2y1Z2xun9UxxSo3PxkJ+q4UnAgJ/KepOGiPXuGeNnyXP1qGw4gSA3cbQO1WQO7zEkcy
	 v/4CC14nOjrjeFn53nYwkLrlvWCUztUZAhYH3b5u7c3e9YKsm+MYibYD8NDsHg4NpAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
	b=SGvW/Me1edYZgITnN2CTMAcz29jPnjCzxJAjv7+mAZsXDjK2XIkyRfeQF7wsvye8XETM
	 uRp+Zh3swbhKs3Uv9gVN79js7kPZJGTY0TB0Vy3k+mN9QdbWyS1FQSsZhXCn9MxDDt30u
	 9rlBNY8xNvufZ6iR2Li8vBj0N0/obTGcEJglQJsU7NXCZR2i3r0pRLIXo5rCtkQeiLpVl
	 rjgYTHIrkmHaSCjs/SrQmjtWICqibuopFzkL2Ln9S8y9vmORljK+a+hfOlJqthCbfiS+N
	 fLQ0Jda3AVcx8A3HzJVL41iUoiLCaDdT9ncCHkcqOPF5PGVxenzSwKb7o91WD+EUcEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idNvEbbb;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ABB606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 18:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05ABB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idNvEbbb
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so36482925e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729172; x=1794333972; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=idNvEbbbZpJyK0/FZ5PKq6vZIUwUCRUMAt2Qm1csJy31sLm4GXNKwGoQz3qgo4Wntm
         TmJ3Cw1XVYSYscnxrd4ofDDx6MpIrZaMvzSLvk+OY/9fRhrVtMLBQyJRGtjCt3ZBIhd3
         2fb8GTxGgHOuDi4Fx6NxVplGElDpt3+8M9zzoevPmrtslJw+ugANd8l0KF9/zkLhobjN
         DbGePUSxW6WWTgXx45fyepLWOPu8JVrVQMOK0a1cmtg27RcaPwxZXn1c8EDQK1xCk2ES
         YHUGYQ+OJat/IPqtWQZCa28odubgCZiqF1db3FnJC4QhuKlFFoAZzzFIhMLO/1uSXKIV
         UbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729172; x=1794333972;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dRBcMfZeipH0bf8lHSiASOZP3cat5iGjHJj/5kyYjE=;
        b=YJwzyJsRtpIug0QTfe6Kkw5lK2xexZ/L9Cwqb1ajXf2U86+bqNU3GR8lyWaamPCfnt
         KSMzxnqlpfkPBN6Kw/aECMHdQxu/X1T+goNAtpVElLJAdwXmFyrPXPiQsM+J9Yg/5yPB
         +prMadKoyxM47uWXj+SoA7jVHqVAYwQ+v/cwQ5C46ztr73d1m+4mBow+qCg34xFW3kGx
         6BzhRqMqENB12m6bMTLhyqbyXNmz56U0F0eBMDQxnQbDk0Zj9o9R/Iwg4tKSlhSBXNfi
         2kOyKOEgc0tmlWl1zzzQZra2y3a21yvIiegl8XLhz4ns34jtdqC/1QNRu9aCDyH2WksD
         5l+w==
X-Forwarded-Encrypted: i=1; AKwUvBwA/brwlCrfc53n1HBvly20iXsiuAuTQBAHjURXzfTn8dQ3fa46gBghnOxnpWYa3BGBHdkK60g/V44FHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/t5E5dPDfBZVvB7UTibADvIYLaKKsF/84LFBYf8iUK6Z3A123x
	vKK0Gc/MOvrVcLrQygyUtB0+0LHGF8apcYHGrVgFphJ0Xse60gQHHhDO4Vd1Ew==
X-Gm-Gg: AYBFou307Hb32/KdQ00WuDme8YMaGsHRH10Havj4v6m0tvO6jk7AO2Ld/je2r5yrYDQ
	5+26f2w83/KGTpZELs/xDKjxAj86SudqHL4y0Tt94eOrO9+IeeCkdLHYLVTbfhEu4Ax8I/E/eSv
	N29BBKnnileIHrAuXMW5hgomVcV69BiRZMgpwpZGlrkhGuGqIH2NlVcG/Z0RGjPMPnK2QFMqHPH
	bmueIxXRg7FRbK2gUWY6zCTMVq8KvosWpGxLp87jrVb3i+jKDav3mBLS9PxtmrA8M9NVnfiz/1N
	N2koY35KyE5MpCCybmV2GKxXHICz1vl1pUzNYGyN/criy+T4akQ7Q/kxMahhmDQjd29r205ErNz
	kjuf4vGXpaX2V+Rm0BeiCoiq75IhNYFT3Yd24tcznIpTg4JSUL7ddz5GiQCEtSPXdJVVrhPTAMW
	jL0wo3yJs2Ja3wTS3GxFh/svt00h4JQYb+rihxSJdyeczGyJt6iI+q7hUu3omMAz5c1IKdXR+9m
	fcCE8DoNYn0gn4RXnMN+xDLdyAOJ//bJXSsSZchXRFpO+4FfH2RqlBxRsF0hedKSiEf+PNcvzpf
	pzz2BqKick3cPM764HsU/BW6xufh7lPuzmojy8kJkyfUb7uPMegMJ4qV9sJy9D37kY/NFbJp7Df
	z0H1eiW6t9CQ7lkI5I6CVHSV7OHhVufwoifdpOsKO300Ule/WS6PZtxtuZCtGmPw+CQP5AnA3Bw
	9oYi+4eH2S+4XZ6ij4IQfo0/EXSPb186JQU5BnOa9PjmQnEHKc4hABrMdGtIPaZ3RO41EU378Gt
	cnJ3MPUPrgz/Qn0XJtjebsbBWWNZSTpwEMZ225h1KDDIQA30TR4KH5g8/kuO75O2Zjov+5ltDFD
	sSy6v6A=
X-Received: by 2002:a05:600c:6095:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4ac18b7e1c1mr284061485e9.23.1793729172136;
        Tue, 03 Nov 2026 10:06:12 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm82769945e9.4.2026.11.03.10.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:06:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 03/10] staging: media: cedrus: h264: mark long-term references in
 the frame info
Date: Tue, 03 Nov 2026 19:06:09 +0100
Message-ID: <zYI0QcxKSEeu6sHIbu0-3w@gmail.com>
In-Reply-To: <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-4-jernej.skrabec@gmail.com>
 <29e72b15007592f98dd000f5f62a85367c590347.camel@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 2. november 2026 ob 19:50:44 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Hi,
>=20
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The frame info of a reference has a reference type for each field, in
> > bits 1:0 for the top field and 5:4 for the bottom one, which is 1 for a
> > long-term reference. The driver never sets it, so the hardware handles
> > long-term references like short-term ones, also where they differ, like
> > in temporal direct and implicit weighted prediction. The vendor library
> > sets it.
> >=20
> > This fixes MR8_BT_B and MR9_BT_B of the H.264 conformance suite.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 12 +++++++++++-
> >  drivers/staging/media/sunxi/cedrus/cedrus_regs.h |  8 ++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers=
/staging/media/sunxi/cedrus/cedrus_h264.c
> > index 892193c12b2f..a716955655f7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > @@ -69,13 +69,21 @@ static void cedrus_fill_ref_pic(struct cedrus_ctx *=
ctx,
> >  				struct cedrus_buffer *buf,
> >  				unsigned int top_field_order_cnt,
> >  				unsigned int bottom_field_order_cnt,
> > +				bool long_term,
> >  				struct cedrus_h264_sram_ref_pic *pic)
> >  {
> >  	struct vb2_buffer *vbuf =3D &buf->m2m_buf.vb.vb2_buf;
> > +	u32 frame_info, ref_type;
> > =20
> >  	pic->top_field_order_cnt =3D cpu_to_le32(top_field_order_cnt);
> >  	pic->bottom_field_order_cnt =3D cpu_to_le32(bottom_field_order_cnt);
> > -	pic->frame_info =3D cpu_to_le32(buf->codec.h264.pic_type << 8);
> > +
> > +	ref_type =3D long_term ? VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM :
> > +			       VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM;
> > +	frame_info =3D VE_H264_FRAME_INFO_TOP_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_BOT_REF_TYPE(ref_type) |
> > +		     VE_H264_FRAME_INFO_PIC_TYPE(buf->codec.h264.pic_type);
> > +	pic->frame_info =3D cpu_to_le32(frame_info);
> > =20
> >  	pic->luma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, 0)=
);
> >  	pic->chroma_ptr =3D cpu_to_le32(cedrus_buf_addr(vbuf, &ctx->dst_fmt, =
1));
> > @@ -128,6 +136,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  		cedrus_fill_ref_pic(ctx, cedrus_buf,
> >  				    dpb->top_field_order_cnt,
> >  				    dpb->bottom_field_order_cnt,
> > +				    dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM,
> >  				    &pic_list[position]);
> >  	}
> > =20
> > @@ -174,6 +183,7 @@ static int cedrus_write_frame_list(struct cedrus_ct=
x *ctx,
> >  	cedrus_fill_ref_pic(ctx, output_buf,
> >  			    decode->top_field_order_cnt,
> >  			    decode->bottom_field_order_cnt,
> > +			    false,
>=20
> nit: Not a hard objection, but I really hate boolean parameters. It could=
 be a
> simple as:
>=20
> +			    false, /* short term reference */
>=20
> Or using an enum. My preference being documented here, its yours to decid=
e.

I'll use VE_H264_FRAME_INFO_REF_TYPE_* as parameter. I have to fix sashiko
issue anyway.

I'll keep your Reviewed-by, unless you object.

Best regards,
Jernej

>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>=20
> >  			    &pic_list[position]);
> > =20
> >  	cedrus_h264_write_sram(dev, CEDRUS_SRAM_H264_FRAMEBUFFER_LIST,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h b/drivers=
/staging/media/sunxi/cedrus/cedrus_regs.h
> > index 05e6cbc548ab..961fe023bb43 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_regs.h
> > @@ -616,6 +616,14 @@
> >  #define VE_AVC_SRAM_PORT_OFFSET		0x2e0
> >  #define VE_AVC_SRAM_PORT_DATA		0x2e4
> > =20
> > +/* Frame info word of a frame buffer list entry in the AVC SRAM */
> > +#define VE_H264_FRAME_INFO_PIC_TYPE(v)		SHIFT_AND_MASK_BITS(v, 9, 8)
> > +#define VE_H264_FRAME_INFO_BOT_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 5, 4)
> > +#define VE_H264_FRAME_INFO_TOP_REF_TYPE(v)	SHIFT_AND_MASK_BITS(v, 1, 0)
> > +
> > +#define VE_H264_FRAME_INFO_REF_TYPE_SHORT_TERM	0
> > +#define VE_H264_FRAME_INFO_REF_TYPE_LONG_TERM	1
> > +
> >  #define VE_VP8_PPS			0x214
> >  #define VE_VP8_PPS_PIC_TYPE_P_FRAME		BIT(31)
> >  #define VE_VP8_PPS_LAST_SHARPNESS_LEVEL(v)	SHIFT_AND_MASK_BITS(v, 30, =
28)
>=20




