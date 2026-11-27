Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805115;
	b=5ELShrnyH1ZGJYNaDccIkOcadkjfX2IYobE0JEolEbmYzQBfm80Vo7dRZG0t3mO6Ec+y
	 9Ixpt3KLgURgpaSIuYMMTA5Ez/s1VEoH6+TnoPC/OlV8zHveQm1Zno6sSs+/5E/ImMv+y
	 PMzoxBHOKjTelOezgVLAjIaaV9jDCKKDUlyLJwN4J6Iesp+kbfyiWTX4kQ5j/RA7dlthx
	 hatwpLqkflKFjQKvijheQT8Xlf7OduEyqTs/yUnGP2rg3bAUjURc8ulW/rhElmw6zheuc
	 uwkfucSsfCc/Cc451SqgFMg5mDSaJuljBWR7vS2ss1hJe7jIwWKjh37fgnx2j6ClgCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805115;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ZohoMailClient;
	bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=;
	b=s7/o44sG+xTeE5nh7MZAyLDhmB6Sj2bUWvEjQB2gSV/PqdpGIdSeuxrHqwR1ulM3XvSo
	 ujq5h8cNbsCOvqPicY+KgPPkq4dglUgMjMlJcNCU1qDeyZNpA8XHaeY3kUaQCmTBUrImU
	 mdUGHXsM4f2dg6YqW5SBPHpjOgVbGBKwHGKxS8smy1j/pkgJGTkfQK5PWMSrFoRUK9LK9
	 c46ljY45S18f2XACYrNumdl/jKk/AqDBd3oY3AkTit+MgjNZ6UncNBSrjUemNWaO7ukQu
	 wgY1yluTzFqDLLiBn9LZyzbgK6veMbq1AgrUL5GR/iL2rmflhWYLjX/0CKCL8t82d3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PQ2Uriou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4C606A326;
	Fri, 27 Nov 2026 18:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE4C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=PQ2Uriou
ARC-Seal: i=1; a=rsa-sha256; t=1795805070; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UtGoH5zyybqW5YigDWrywq5xysoqrasgDxXL9JEz0ellMRdYBFUsZGwp+pYRVgp/u4zxpa10sl9s839bFJ7aMZn5NVlT3SwltpCh26iMkcYSKRoUmhf98aTgqTlLVY+e06VV6IcJyP4+ImtCbBPlajG/KqPag4cAlSh3fXbw6qM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795805070; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=; 
	b=mWgaGrSi92+Dnd9S5b6TWvbFQiXEoZkCt63aPbS/vXiGbJmXPPwpi/J+aqJL5n3dX2blKGhVfDAOZeTTYd56HyLW+y1IwS+9Pz2NiyS49GRSKVXEQKjWZhuSr4MFQsE+3tgePe/aMGRXJaxo/LpLHA5Tbjhnl7KP5IlsI3M/Eq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: a=rsa-sha256; b=PQ2Uriou7khkZGh8nS+1xv5VhQfZJN47Cg9sVWnJe/fmoprMEJpzQk7ivHLNLktg0TauVtssr7qVoTm/LG5Q+Bb9zEWj4gIdc/a28GoijhgFw5NP55dfprxhwJ8kk1QpLXAijYWVC0jt6O1w1h5UlO5pVWpmqLhKVgOYmeI0g8M=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lFuWskwWRql2Fhx97LXOZZIB1aolGuDk0+v/5Jmc32Q=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795805068935159.32844594948233;
	Fri, 27 Nov 2026 10:44:28 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sven =?UTF-8?B?UMO8c2NoZWw=?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] v4l2: export v4l2_m2m_set_max_parallel_jobs
Date: Fri, 27 Nov 2026 13:44:26 -0500
Message-ID: <g30LShJ-QraPMSjey2r1Hg@collabora.com>
In-Reply-To: <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
References:
 <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
 <20260810-rkvdec-multicore-v2-3-986f89d22cdc@collabora.com>
 <d3eccd8c04656a46287a221b3b4f22427b21a74c.camel@collabora.com>
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
X-ZohoMailClient: External

On Thursday, 19 November 2026 12:36:36 EST Nicolas Dufresne wrote:
> Le lundi 10 ao=C3=BBt 2026 =C3=A0 11:22 -0400, Detlev Casanova a =C3=A9cr=
it :
>=20
> I know, its straightforward, but its not even signed off.

I voluntarily left it out because this is fixed in the latest RGA patch set=
, so=20
this is just to make sure the rest builds.
This patch should not be applied.

> Nicolas
>=20
> > ---
> >=20
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > b/drivers/media/v4l2-core/v4l2-mem2mem.c index 14ac9c85803d..f6f8864f23=
d2
> > 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -128,6 +128,7 @@ void v4l2_m2m_set_max_parallel_jobs(struct
> > v4l2_m2m_dev *m2m_dev,>=20
> >  {
> > =20
> >  	m2m_dev->max_parallel_jobs =3D max_parallel_jobs;
> > =20
> >  }
> >=20
> > +EXPORT_SYMBOL(v4l2_m2m_set_max_parallel_jobs);
> >=20
> >  struct vb2_queue *v4l2_m2m_get_vq(struct v4l2_m2m_ctx *m2m_ctx,
> > =20
> >  				       enum v4l2_buf_type type)




