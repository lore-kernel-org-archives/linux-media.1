Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729570;
	b=Whh/N9px5b1/dhCAY8G00EYRI0oPs3FT44KEgI4AHNfd/IHLduT3ClRbFXukMTbMzF6N
	 fkPijt2jgUEmvwRB/8RfoUbkAX0+GRIOZ1HGSqIhOWlCEjsYjQXnvM1NWuKbyDhef0M2x
	 /qsibmBqKxrMSzHMg1lFy8QVhRdvlW4r+eBqPl2PcwWde9JjeTC6cH1Kn95yJOwVlR1GU
	 U0tEv/G3d98GkXGYQc0IR0W3TyEaGuNU0NpGShU+1a4lLAxRx0ibUVNovD33+b6b91O4x
	 G7mAIayOKbzZJj5rR1OsdxG9XFqJrkV6IzT8TcJ6MaLtvi5TmN4wRNcsuyPqbC6UpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
	b=gMvh9lIGV0epcplwjJXBmpZJUjEj3CzZPz82caIaEBtB9wQoIFzvOK2y21o5xBe5MDhs
	 yuIFN0rRL3qb3ChhgcL4WZsit/Dx9BkWDpAdtvKoZnGW8yPRmgbFClZ9ZDk1tjrouXi0h
	 /E0WgI0lAcg0g2msXFPgbbBCCTZjO9yH/XgqQ4AMDYYZoYP6DSfo8SyqEWiRPnMvhCfW5
	 HQPfVuXju9wdaFdefniSGgAShL5Bcdbbctqntrzt8V8jdsEnd4syLzBlsuHA8zt+iEFvG
	 x1ZRhYEQpG5AqPf+DBcASj58iROVKzPMLf6GZzzTzXKnJx6ZhG5Zrcwc3xc7y9pf+5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mt67Vxcz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA1606A328
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 18:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCA1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mt67Vxcz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2301136f8f.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729568; x=1794334368; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=Mt67VxczMOvqPKQopALrxqQwM5X1LsyvwtR5oGuMOz37M8Fu4rHiUoBAq31FUhuNtE
         jgliNDn9RkN3r5CZ2CN+WzehJUuX+wK+fPSx3dHE/oqtlVy/woO8Vs5ozFYDOlOqhwrD
         w55K1ixsUhQ/qlgPgmLmsv2E/nfI7GX72tXw+kPFfdDjyrIy8jlHjvoCX8RgvIDFuU6H
         cPp2hoptrqvUpYXobecvGQfNNKp6vpHmtO/GHaY4vyopofrZ5x4ue+xalApa2SaXNrzF
         1akh9oUSZzfKVTQ1upC6PiIaG1XYifFvjEvIJzbKkETouKpc6xdd/qXSVB0f+adsS0pf
         GikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729568; x=1794334368;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axeQ5CIE2uW000DJFHLDIWC6PSnHJaM+7ICNLkjh1BE=;
        b=A1rFUulR/GYTmryzPsq5A1FAMNVnedrHDh/CtP1qNymFuC0SYATlhPIvM1jaRrWOp8
         s1HOAe9bRPjvI58TyVxa3U0h8I5rvc+H3leZBqLRa+EhAyOP/8/BEpkRuzyZ7U9UPsll
         R2ui/EHHgmqbZWIef/ng3rPypOvmMJyhPvZLZjz35b+g2ZqUIboWDu5DOKh/fc7cRwv1
         7yxAbbsTuvNRSvQSm/joDsRxN/vqXisCeOup+LFN014gkmy73e0jiX7nqVy00lBS2Eul
         p6DLbb5nmrYv3R8Z7tUnj7fBKfjXZ3iEZhP9MkYIUcBpRmpFtYu//kd27KYdbUcNnuPe
         KFNg==
X-Forwarded-Encrypted: i=1; AKwUvByI/13QaFaMf/vsJYikvQPeGF6MwRswhbYFdYhwAlqY9SoLN08lI1XielSUZhbuXBkEvy9xCYne80lB3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OGxGy3YQrcRIZtaaj0MsNGhuT2VWQbWBKsD4Gw6AnxdRxC9bD
	Gz+wH9GherSsnLk7GFDgP4TO9DgpgRkmIv5a0hQLcjgk7g2+WnkCBrjp
X-Gm-Gg: AYBFou3adfaQCYLpPgSl18ZAZgM6Xovws4Z2WWjaqGkdRVS0ERJII4d/AUFAzbCe1dX
	mjVHAYOzQ2JZdIMcGgrBwTYTJK8mBTW3wD40Og8HzDNIuNdW0MbaKMGIs5yGdYo6GshT+Qs9C1Z
	btn5IqTjfNIMAn5DGRbqOBbntMrqH5KKHNywUqJwBMnQ2i7AXYkLSx2ot/XY5doLRDHY5a4VJGk
	eRwv5CLKMZrFdev/eoCvL0/RMhFt+9NP+4QiUR4zSODaXPAOPgZe59LjAvZ9qApKDe1T/58oKn9
	/AeyCjQSyJILP/yvUpPmhBvBn+kcCO5+NeRiVaFc2bWlSNk3iFVHEEEIm6HqxMDAge4UtNGDTOK
	LUN71uvExa7pa/dHtsHc2cniR0faSXgnWe1tQJUxUSitYcu2MbhVU7IDTYMuDhEcoTgtqKxD6IU
	jUbdqmiFF0baNgtQqvq0vYYjt6uCJArzjkrfR8PHiUe9Vn5nM/HO7Pwt7XvcCVix/FHb70Y5jb5
	Mxk7h4kgB53Fi3wzYNI9nK+dYBYyxi4SzA5Gkhccot/zW31VFJkKMyqokFD64x/pG/RIdqhFPSv
	rJeSjd2oLlAxEMZhxJh9MwBOhY/GkPIIsaf7VoPAqKwXFWNWStAln32fZ3uRNwiZuqLrKLo2JX8
	hu8k6Pj3BBkh9dJnY3sVYKD4bqjY+EmsLevFD3E5qe/w33Kq6IC70weNodla77iXIotjCN/S7yC
	kY7aPa3gEI6vGLbaeV6fY4oLzMNh0jMx1/+jVq7vYOXzQRhNOYMM95+rUdmoXrVOrLItDs+SXKH
	ti6DoF3nd+PSEHZDDzXCJOq2UObKtjRHT/rsZpuKfoQynpdoU08tc2Aia6XlQ==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33769566f8f.46.1793729568150;
        Tue, 03 Nov 2026 10:12:48 -0800 (PST)
Received: from jernej-laptop.localnet (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm28261090f8f.26.2026.11.03.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:12:47 -0800 (PST)
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
 Re: [PATCH 04/10] staging: media: cedrus: mpeg2: use the field height for
 field pictures
Date: Tue, 03 Nov 2026 19:12:46 +0100
Message-ID: <vCPa4waZQ6-kwYC7OOX3Kg@gmail.com>
In-Reply-To: <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
References:
 <20261102170303.1973892-1-jernej.skrabec@gmail.com>
 <20261102170303.1973892-5-jernej.skrabec@gmail.com>
 <cd5780876274ab5aa73739f890a32ceacf2e793b.camel@collabora.com>
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

Dne ponedeljek, 2. november 2026 ob 19:56:52 Srednjeevropski standardni =C4=
=8Das je Nicolas Dufresne napisal(a):
> Le lundi 02 novembre 2026 =C3=A0 18:02 +0100, Jernej Skrabec a =C3=A9crit=
 :
> > A field picture covers only half of the macroblock rows of a frame, but
> > the driver programs the coded and the boundary size of the whole frame
> > for it, as for a frame picture.
> >=20
> > Program the height of a field for field pictures, like the vendor
> > library does.
> >=20
> > Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/driver=
s/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > index 10e98f08aafc..ca66a3c6b830 100644
> > --- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
> > @@ -58,6 +58,7 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *ctx,=
 struct cedrus_run *run)
> >  	struct vb2_queue *vq;
> >  	const u8 *matrix;
> >  	unsigned int i;
> > +	bool field;
> >  	u32 reg;
> > =20
> >  	seq =3D run->mpeg2.sequence;
> > @@ -108,13 +109,21 @@ static int cedrus_mpeg2_setup(struct cedrus_ctx *=
ctx, struct cedrus_run *run)
> > =20
> >  	/* Set frame dimensions. */
> > =20
> > +	/*
> > +	 * Field pictures cover half of the frame's macroblock rows; the
> > +	 * vendor library halves both the coded and the boundary height.
> > +	 */
> > +	field =3D pic->picture_structure !=3D V4L2_MPEG2_PIC_FRAME;
> > +
> >  	reg =3D VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
> > -	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
> > +	reg |=3D VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(field ?
> > +			ALIGN(seq->vertical_size, 32) / 2 : seq->vertical_size);
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
> > =20
> >  	reg =3D VE_DEC_MPEG_PICBOUNDSIZE_WIDTH(ctx->src_fmt.width);
> > -	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(ctx->src_fmt.height);
> > +	reg |=3D VE_DEC_MPEG_PICBOUNDSIZE_HEIGHT(field ? ctx->src_fmt.height =
/ 2 :
> > +						   ctx->src_fmt.height);
>=20
> I'm not entirely sure, but I see:
>=20
> 	fsize->stepwise.step_height =3D 1;

Where? I don't see this in Cedrus.

>=20
> But I don't think interlaced video can have odd height in the first place=
=2E But
> it also have an implication here as you are not rounding up to a multiple=
 of 2.
> Not sure what is the proper fix, but I have this impression something is
> missing.

Odd height shouldn't exist in practice, but I'll use
DIV_ROUND_UP(ctx->src_fmt.height, 2) in v2 if you agree.

Best regards,
Jernej

>=20
> Nicolas
>=20
> > =20
> >  	cedrus_write(dev, VE_DEC_MPEG_PICBOUNDSIZE, reg);
> > =20
>=20




