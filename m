Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713755;
	b=z/+2PjN1at3L4MJd3GuihLz1YPx7fJebEoHKCjdqIpBogjqhjv2wsqEBcjaDS67s4a2g
	 CjvAdJ/g2J9+fAY6JNREsUbUA4AaNH8LUCmX0ddUQP4gpWTj/ZBe2wNA3E0ozzyPmREEG
	 aYu69KFfFe9CeXTb4WjYM6FKoaYgj4BacQw6dDhqztB1zZJ/v3lMTvF+BMBpDwflvWi1c
	 T3tu2cWmleb3GcUkgzInfExe+bwABhO4nV8YRyOpMOb8L+OWs2F0IZITWcYYpmCzBZSFz
	 5ir87y0CuQ+EsiPG6lIMhPs4G2+0kJEEC3olOZlUBCT4uP98HkrjduE/98gsLX2QOSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
	b=VwetSUm+2kpPcdf8/+dnW8LjaLrm73vlyKssYAtWNt6zO/qguXdHHHSW4wAmOElrSlUT
	 kNpKxzR2HIaGLrGASNK7oP7kK6SQ8L8GSCFZlSFOW/sW+RDwGnDlPSyr14lV79Y0k1zow
	 LLbowCxT2rZIrJrC5OqEY2Mj++LSKI0nBfIcIw5PdAc5YZmrLW3Cnaow6XshIQwuCGY2a
	 ghGg6Ve/tjBzMnJcb34/H5Ru6Wg4o/8vroL7AXmnnsOPrPHc2aX68P1qL/eb5e/f2d2af
	 mMNPrVTksSPOXHDNAedYx/6yBs7YqsYUAsfzhJCBUZL16f6kvIbUJrERpTVVTVvpRjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFFixd9V;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563B3606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 17:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rFFixd9V
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so58944285e9.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 09:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713754; x=1796318554; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=rFFixd9VFppWyskf83oFgo4ScA/+0HdVHjm4gjQNPa9yvLe3NJhTufUFggkkPT7cM7
         10tLKvi0MkT/q1cEyRG4rYZPFHOhgv5P6lOBct4QoVGRrxea0JM1Vg5EcAzFzXjwb34X
         ev/iDK1YFv27Fmc3etSuTokLrPXyq0OMc6taqqH2rL493j7VY6WJTXrsnf4Z34bxE16M
         n1XedJSwgz1fs7OeQ8RlKU2G7THvwJt689wgu9gYObUGEPpFX5Aw7sT7g7RLFT9T81Pj
         ea9NLITnMOFnY5M8YUhtO/uVnNRy1T0OTwnX9CV2BENhNBh0vAtWA9jxJVUrLPTPMsvg
         IcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713754; x=1796318554;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+o/+kD0PbzrgfqIeIyLt88wkMJdXcHeQPVqxrdmSlPw=;
        b=XO6HDc2Z8P1Yte0PnummETemJLwAwSLMjQgEBG8HL2IrW3LBqPxaG34Yl6T7rtHhFx
         FUgY39lvoOHNJfvoiT7WC7wEP1Kg293sbxCJdUw232VGQdQBNe5yHNjjinXVYIX9OpWb
         Vum2R65UV9Br/CHpO3J/FtQGzJXlD/igETn0SeUCX7OE50ybdNvhkXw6952IlbQDB5qi
         ELLDAsZpVjn4Gj1zc/+FZEDfiiJQQGrBtRstxxdsRsfW1SFEFxbNzItjEz9vPgfXY6wP
         inuuNmx3CBN9BRXbiRRVKyNgXYb6jtvVloKQHqlywhx2yY/7ftvZc0IR6mSqUeAQ+I/k
         8iDQ==
X-Gm-Message-State: APuU4Z+H7Sh9kwTIXQG5guXt7Ivx5WjeLmgu+GCJRN7LVYo5PYpvUPnQ
	23joO1QEgijZBChdwtBMCisy6fJYgi1VdH1x9g9fWQvCnf6J3u/MfecC
X-Gm-Gg: AZFdTZdFbAgsLqZWSaKmZSWQaQX7R6RBzleHCdohFCPfg0+mWcujN5bQ6D0QvdVMsto
	3RAbHwqCg6rV//e3TonIXV2i1SazfRSqDSWnj0fpM+4fwQrtXi+Ts0D2vK/GvZsApGzm57uMG/J
	JTGBL012tUubw//ea+wN0Y1DonobZctjhKpd6u1VpK7sE6H3cO6LUAoUcx6FJwxzUFSn5eqbdTn
	OKBPDPNifOk5lepXW7pSwuY0iFcYSJSZL9caOrPHfqoc9gwnXf/5fMegvSgtMeCuQsLgsLtgn/L
	YZpiIFRvHF1mCOb3VFrsYObWwU8Zn0m53a7UdxZBRndsFeW5R0HmWD2PF2ekgW90wafQ2qx5eUS
	ZekynGvWWQgQEtpwSw+3V8Sl6GmvwsSa++9VVe6/AodSafYyT3aXU2XtOwwDtCyrQSzaBsRcsgd
	8sY8cW+ecrdT7NoT5U90mUOdHgRDws/06bivyAzh0Oqfv2PeUSpI8r30PBvcb+8TyqWx1UVQH3f
	IrLvAdFS3GFW77m3TyoUchFWeuMbCOFGCCiLovFmi02jfD3KOvtZ1G3SQsAzgkmnz/HMKsqeHMc
	ToMtdBcMdWQCk9lVwp1rySe61oGLssdEKhRch3eWfSx4BJn61a+knBeRNCOiupKv7YYIKw1clEE
	s28qh1ZB1DbnJrLHpdV8zGUSugCEHsF1XtMZIg30V5+kYXzO8ZOd9IqRBjD/QDbPw87rQNfgCNR
	WhgBLQ+VNzuffaH7sLtzcC2NQzEcI4h/0BQfHkV1eXAzm1dqIrMQGhx0Qbc6sgBm2xjqT/GMP9b
	gghtQsyUcY/4BXh7PwlE0m7Squ+LnyG60+oM4O1FVOtXKcNeOcxywymNdevxrI=
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr450092465e9.25.1795713753675;
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm348317715e9.0.2026.11.26.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:22:33 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Hans Verkuil <hverkuil@kernel.org>, aiyengar1990@gmail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH 2/2] media: cedrus: report only the picture as capture payload
Date: Thu, 26 Nov 2026 18:22:32 +0100
Message-ID: <KjxG6AExQdOXUtc6OkeVCQ@gmail.com>
In-Reply-To: <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
References:
 <20261119-b4-cedrus-generic-fixes-v1-0-f9f50812c85b@gmail.com>
 <20261119-b4-cedrus-generic-fixes-v1-2-f9f50812c85b@gmail.com>
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

Dne =C4=8Detrtek, 19. november 2026 ob 17:34:48 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> For 10-bit H.265 the driver appends the low 2 bits of every sample to
> the capture buffer and counts them in sizeimage (extra_cap_size).
> buf_prepare reports the whole sizeimage as bytesused, so userspace that
> copies the payload gets the private plane as part of the picture.
>=20
> Report only the picture; sizeimage stays the allocation size.
>=20
> Fixes: 65429ba82572 ("media: cedrus: h265: Support decoding 10-bit frames=
")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_video.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/=
staging/media/sunxi/cedrus/cedrus_video.c
> index 9b2d24e77fdb..b7e0cbe548e6 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -511,8 +511,15 @@ static int cedrus_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		unsigned int payload =3D pix_fmt->sizeimage;
> +
> +		if (ctx->current_codec->extra_cap_size)
> +			payload -=3D ctx->current_codec->extra_cap_size(ctx,
> +								     pix_fmt);
> +
> +		vb2_set_plane_payload(vb, 0, payload);
> +	}
> =20
>  	return 0;
>  }
>=20
>=20




