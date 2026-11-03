Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728961;
	b=0wrLkWPZpNjSJW1REQLyVhI4qUp0cfgDhVYyLli6FsilCDrrtoUOShX+VemB/qTYuEu5
	 /2q6c4JXUnwr6gSqqL3kORa1N42IQY/pWr7ji5yVehwqrPmnGbaP5wttm1BWdNLRc4jKq
	 uB6JEUMMZsvrtYzaPtwRZYQAwoSkNRkavbX4+T+nKyFJ7avsvFXx4rfjdkcZBEodZu1Td
	 w0irxWqYcmAeAONcrBRNHwwwDUK/HhKHXjVw4Zh3REP5WG8f1WtTBfQChLqQVeDV39MDG
	 v7pPRL5uxRXG246kCBwdDjxxzHEX2A83uy8gEgai6Xz41GYOGX4fyGk3yDy93bCAlPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
	b=cqln09oHrw7ZbIrjpHPr3+ZtVlZs+SnYRKf7lnssW4t6rtJawicnsqSRUuLEelL7K4pO
	 zRIygnjrmKp/GxE+Kq35+MLQUPFgBvYRKFfH0eeM52xIf9qBGVCeSpVAN8ApoZE99ACH3
	 f+0ijud/pSf9o9TCg5LT55fp0l52g1ejMS8FRfikoIUNMVJY2cxFK+E7546vTpqPmTAsy
	 o+1Ch/SymAQ3NOkeVMuG+LtcucpbewV0CPQcxI7tAhnSH1/9ykewL170b5mHeruC8Hnpt
	 e3U4TTWrzfjOqkVX+pLCiW7deuTsTXPxPP0oCjJkRB+SX80dRYAJUsCjw4ghyjUnvyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixe7eYE;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EF7606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 18:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73EF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zixe7eYE
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e10a70540so2591401f8f.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728960; x=1794333760; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=zixe7eYEIAo6pYA5hGapPWS9JIrz8VzDcWpZSJ4uqdqvvbHwt3+4tSH1i6SzHV8UZP
         aCJz1RMX9zP+eQr2rNd88dUTs2is6rBmnKw9QhpqfHGpKj0ube3MGc2nBCeMn3SJxSkC
         rxi7JHjE+k1+V2paeicDVne2ZzCI86kCrTPqfl8OgEcTrtVaQ5urF4fCGF6I/HyehDei
         LddWMNAXGipyA9ffOZKlUV6Uju8/3ho5mmTxsnc+aB7F6zLJVdAVBX+NB3lVQdwy2DH3
         EA4mjFfPR2G8V9BZgu8PK39YwiE/H0U2Ja7G9drNAT52PXhfbHf5axP35JAves1y78AG
         VzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728960; x=1794333760;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhokGCOTWniwqQcXW8/zbSxPkJmQW6og4OZKMkNPbC8=;
        b=PdrR1lQuE0ORNdIT9Wzh/bo12OfC3XOpU2sblt8Ph6skPwRAs8j/auuptOGqm6ql5S
         ASrIzgL9TQhAqo6OFigFJyQ1xJAps2lHpAqOh84MwDZ6hB1BbfDWGzuLMkURfFOifzm9
         5MKlJXW7UwVpQtwQqxrJHbvO5P+MXNp3lcZAthZ4GkayPXi0Kt30lw/3PhiscNWKkqfV
         3/FdWOCp18Ir+c71GObLulse1LJe4KS6ibW8hwQJ8puqYZFwG9D236j+v1y03xrnUDZ4
         yoZcQVq5qiRItw8sgBWjuZ0/+1SUhrJQ7gn53UJAA6bwAoKOcvi0DTgJwLMcDLPF179X
         7pjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdTKqU5YwbWzAkfktyynPypdoqi3lFOTerGL5AE3jc1hLcD0s8d+mlc1V0CWNAUlAqnbaw34C1Wdv2nA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0qCNuTS/jADVAG7tn7GPYgC5szX7+seQiH9bhv9H9b3BF1GnO
	9pHwtdRviNjLyNdiDehaRfAjT6Q18nuASgwuhoHXJGdenEy2Kscac86i
X-Gm-Gg: AYBFou1OyPU5xnMeR7CkmAwNL77a2HGVYqsnAbDbRMw6E5djG7Y3YuQX4tD1YQpJbYi
	a2RpeQPb6c7RPqBnLIoEt+JBJrVL+ZTK7fVS03j/UY+1ZiZNVa5WJSCsQ3lJfCGoY+xdJCH6TZ0
	M+QCBHdBZq7vDvJAqYWO0Z+deiDkJ9156GXY73+cJ76ni6uMMftEd67isNNEgR95dlwX3E5vUc1
	L/p/3Z+a0aeDUc3quomsXZy8u6uKeMuaQQ+D5I/bd4lUKjmu9jGt2eCVp47Gi8pXZvtXTtqBlKH
	F5J7py1G9yANpAtHLJxjYnWYpS9eHJqxdOujN7oJI+V0N6E/OBTYzKOwxrkjIe91Kt3nBNu2ar8
	w6Y0A2mHULbs4QCm9hcjxUWpxzYrkshGjcLOVX390TzYte+i1hAIoE2z2nApdmWegg8apxegFlA
	XnoyWk7E35Ri5eSlDkUkEa7W2iPzL3EazlYt+4HVMlxx2j87Jub4bBiSFEsOGVlCcuL7+dV+JTe
	/pcKVELg5ICMGFivMccomgIBxV+c/MbjqiKBznGiehVAEFD2nUcPcDUpSSGdQu7GCFRgrLAfv56
	vHolt9I6hlutsC7f01MLdp+NYwN+EaB9qMKL5kKxsKj83iV/A8bggBMQ9f6BXa+vJscTX5jD+ap
	kwvMxV6onGFG+va8WNvq6+gMdry1pyV5kkjt4nd5ErTJCdXO19bq8zvzeoSYIAyf3pdv9jPHsJO
	3c0jwz4D5Q3BlMhibY8j0BUbqm5G41mhktz0Qc/sZepO/bylf32ZVYGxUkwxPWE8E6QiFSpwBzT
	HAde3JlPnDfuwThlHUUnJQbUzvGtpiZoEjhQNlY5fC/IuadszVMxIaaNOY9Pw==
X-Received: by 2002:a5d:5d09:0:b0:48e:4835:de5f with SMTP id ffacd0b85a97d-48e6e4fcf2amr28751210f8f.47.1793728959547;
        Tue, 03 Nov 2026 10:02:39 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b964desm26248330f8f.46.2026.11.03.10.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:02:38 -0800 (PST)
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
 Re: [PATCH 02/10] staging: media: cedrus: reject too large H.264/HEVC SPS
Date: Tue, 03 Nov 2026 19:02:37 +0100
Message-ID: <P3FCc6YrSeexw_Zto5zS4g@gmail.com>
In-Reply-To: <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-3-jernej.skrabec@gmail.com>
 <0cecac8706862ea7410be0553d942539f0d53c06.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:44:38 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > The hardware decodes whatever picture size the SPS describes. An SPS
> > beyond CEDRUS_MAX_WIDTH/HEIGHT, or beyond the capture buffers once they
> > are allocated, makes the hardware overrun memory and hang. On H616, the
> > JCT-VC PICSIZE_A..D streams (1056x8440, 8440x1056, 528x4216 and
> > 4216x528) leave the hardware wedged, so that every following job times
> > out until reboot.
> >=20
> > Validate the SPS picture size in try_ctrl. Move the size limits to
> > cedrus_video.h for that.
> >=20
> > Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> > Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus.c   | 40 ++++++++++++++++++-
> >  .../staging/media/sunxi/cedrus/cedrus_video.c |  5 ---
> >  .../staging/media/sunxi/cedrus/cedrus_video.h |  5 +++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stag=
ing/media/sunxi/cedrus/cedrus.c
> > index c3331b4f3f02..45deebddb630 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> > @@ -28,10 +28,38 @@
> >  #include "cedrus_dec.h"
> >  #include "cedrus_hw.h"
> > =20
> > +/*
> > + * The hardware decodes whatever picture size the bitstream headers de=
scribe.
> > + * Reject sizes beyond the hardware limits, or beyond the capture buff=
ers once
> > + * they are allocated, instead of letting the hardware overrun memory =
and hang.
> > + */
> > +static int cedrus_check_pic_size(struct cedrus_ctx *ctx, u32 width, u3=
2 height)
> > +{
> > +	struct vb2_queue *vq;
> > +
> > +	if (width > CEDRUS_MAX_WIDTH || height > CEDRUS_MAX_HEIGHT)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The hardware decodes whole 16x16 macroblocks, and all capture
> > +	 * formats pad the buffers to at least 16 pixels in both directions.
> > +	 */
> > +	vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
> > +	if (vb2_is_busy(vq) &&
> > +	    (width > ALIGN(ctx->src_fmt.width, 16) ||
> > +	     height > ALIGN(ctx->src_fmt.height, 16)))
> > +		return -EINVAL;
>=20
> If my memory is correct, Hans rejected this kind of construct in try_ctrl,
> because if you are only doing try() it shouldn't fail like this. Instead =
we can
> validate in the real s_ctrl, but I believe the downside is that it makes =
the
> error asynchronous when a request is used (perhaps that's actually wanted=
 ?)

You're right. This is not the best place to check size, since it can be
bypassed as sashiko bot find out.

My suggestion for v2 is to split this to two stages. Max width and height
check stays here, whereas buffer size check is moved to setup() callback.
=46ailing there it will mark buffer with V4L2_BUF_FLAG_ERROR.

What do you think?

Best regards,
Jernej

>=20
> Nicolas
>=20
> > +
> > +	return 0;
> > +}
> > +
> >  static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  {
> > +	struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus_=
ctx, hdl);
> > +
> >  	if (ctrl->id =3D=3D V4L2_CID_STATELESS_H264_SPS) {
> >  		const struct v4l2_ctrl_h264_sps *sps =3D ctrl->p_new.p_h264_sps;
> > +		u32 height;
> > =20
> >  		if (sps->chroma_format_idc !=3D 1)
> >  			/* Only 4:2:0 is supported */
> > @@ -42,9 +70,15 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  		if (sps->bit_depth_luma_minus8 !=3D 0)
> >  			/* Only 8-bit is supported */
> >  			return -EINVAL;
> > +		height =3D (sps->pic_height_in_map_units_minus1 + 1) * 16;
> > +		if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
> > +			height *=3D 2;
> > +		if (cedrus_check_pic_size(ctx,
> > +					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
> > +					  height))
> > +			return -EINVAL;
> >  	} else if (ctrl->id =3D=3D V4L2_CID_STATELESS_HEVC_SPS) {
> >  		const struct v4l2_ctrl_hevc_sps *sps =3D ctrl->p_new.p_hevc_sps;
> > -		struct cedrus_ctx *ctx =3D container_of(ctrl->handler, struct cedrus=
_ctx, hdl);
> >  		unsigned int bit_depth, max_depth;
> >  		struct vb2_queue *vq;
> > =20
> > @@ -52,6 +86,10 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
> >  			/* Only 4:2:0 is supported */
> >  			return -EINVAL;
> > =20
> > +		if (cedrus_check_pic_size(ctx, sps->pic_width_in_luma_samples,
> > +					  sps->pic_height_in_luma_samples))
> > +			return -EINVAL;
> > +
> >  		bit_depth =3D max(sps->bit_depth_luma_minus8,
> >  				sps->bit_depth_chroma_minus8) + 8;
> > =20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.c
> > index adc7f255d7cf..2521315abdb7 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> > @@ -29,11 +29,6 @@
> >  #define CEDRUS_DECODE_SRC	BIT(0)
> >  #define CEDRUS_DECODE_DST	BIT(1)
> > =20
> > -#define CEDRUS_MIN_WIDTH	16U
> > -#define CEDRUS_MIN_HEIGHT	16U
> > -#define CEDRUS_MAX_WIDTH	4096U
> > -#define CEDRUS_MAX_HEIGHT	2304U
> > -
> >  static struct cedrus_format cedrus_formats[] =3D {
> >  	{
> >  		.pixelformat	=3D V4L2_PIX_FMT_MPEG2_SLICE,
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.h b/driver=
s/staging/media/sunxi/cedrus/cedrus_video.h
> > index 8e1afc16a6a1..367e52158f01 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.h
> > @@ -22,6 +22,11 @@ struct cedrus_format {
> >  	unsigned int	capabilities;
> >  };
> > =20
> > +#define CEDRUS_MIN_WIDTH	16U
> > +#define CEDRUS_MIN_HEIGHT	16U
> > +#define CEDRUS_MAX_WIDTH	4096U
> > +#define CEDRUS_MAX_HEIGHT	2304U
> > +
> >  extern const struct v4l2_ioctl_ops cedrus_ioctl_ops;
> > =20
> >  int cedrus_queue_init(void *priv, struct vb2_queue *src_vq,
>=20




