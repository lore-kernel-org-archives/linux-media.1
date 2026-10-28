Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217244;
	b=mmHXEOfLvVC80L9JJfxo9LP6kPlaJ36KjVHs1B0d+jJ0jvzHuDiFTSpunJOwytqkSgqK
	 fTZM8MvVQwFoSu7clQaCS7L0AsL3qgaytd2WDE6XAPT9zEEIqoOYpyVcifcv+PZOsxhH/
	 YcEFA1fnyzaxggabDVwE4qk8JQaVQHo34uLMx2fDuk11o4B6TOqDL3DMXkhNalIhJRBNk
	 Nvbox5zgWHVa3ZpbkPilQKck+AuYI8wGA/5E6SDuXsGdfI6fPWhEs+ignGfGi8obgMYZK
	 TxzVNLz8tuC0gnrtjB+JJIpwsiOFQhtvJsYlyCg+gyFyEilR9Ira1r2yl0Ei+hlUe6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
	b=J4rwb4Eb24ezyBmyEJFeTcJ13GOJu4lvofIRcmsAN86u/E8rGFGR1W8C9VD23W/StHbs
	 mXJqpaATbtm7MBt9wjkU+XkJ2X09SMS4naeud1f5fZ8AjbjKkqxqfi7uVFlXSxKMq6LzV
	 RWG4g6BFf/sOU19hqIIwt7TqJxJgZ+3x+gLu7tFpSVeR4rRcvETCG7qwDDax8+VGk2bAD
	 P9TkHejM2/4IER4HXteplDIGsXIgoJ1g7zP3LL97RGV8A+jV4Uywm8N6e3maqrUTtESjC
	 X5c4gVDK79HLRO+MoL4cIA/SJcZDlE+JAKNg3eeE0EQ7bGYqXGf3H4oLZjFwQIRaOHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gA8NHJ+U;
	arc=none smtp.remote-ip=74.125.230.193
Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F1606A31E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 19:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gA8NHJ+U
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-5332a0f6dbbso17566711cf.1
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793217238; x=1793822038; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=gA8NHJ+UM409Pb2djn7TARhTXL8Cvgm60g/OVah6ioaVdFYAw9AWWw5+4lTvqA+/41
         D3tAZxairdTiOAek/OnzQdDPfkMR9FgKyVvUYHpGhJp6RPvLJtc1YlXnynSwQomIktOa
         2/KoZ9qgHe0ePSfxYWHcNRO73O0clP/E+3XMwoNncVn4ITtF+9xs85IqlW9JnMaFh2pb
         6th30oqcaa3ixdINLDMT7JGLkuVhrjZBNBzF3bBY5a8W/rfDQnLmmmdQoEgIfxwMCqC1
         3dOJw4ViPrqKVIBnJ6Il6g8D5HaIGG6V0NQ24WTI/Gwd7wxDdW5lMwPH9N+F2xDzO7Qa
         2dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217238; x=1793822038;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Z20M5yrzVdkZ8pUfnazTFG6IRUwC17SyWpCdk396M=;
        b=XPXgoa8605ZdOSceT/oLSkB1S0+XbF+xvK65vsqrUGa7AJNuUVaSZW/7OCFW0p6UNu
         WCVbiZUhInqXb8j5qLq+/ZHjNnBkMV6/WC8gFYZzWMKex9AThQWW4kr1dGy7BzBPqYc9
         +7Hmrn3J9ZM3QjN8yh8SYcKmBlKR1Y107RS4wRzo221bJrAxMX9nzi663jHTRQVUK399
         VAKDT3Z6CWlbq12qzWA7vWAWdI4TcJOJTyJkNnLNaZO1aCIwwmEELuytK4m7Kq2+J4W0
         DQzXjsl7E7WSJr36ObJqVrxzmJuKFDBVDXNZZme/EZBrUCpLIpD2quSAPRR1f+H7QM6k
         WrpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG/NnRNPEb1tEFU7IDTAh/zlufc/yt/tZiuCgIErWMdDF/OR04nwl/y5xtyelE3tlZPRUKRmRGYNqpgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0VG4N701CtecVrjN4uVu9jewZwrtxBio6fWmJikwJ/xB3hPtO
	ETBCJQdekSO5M7FlAu3kk6MyBgQ6nvoC5hIxOVziX85dxl4KRp0uiXgEjyGWkmVzJmw=
X-Gm-Gg: AYBFou14HIHcq/wZvAReZLLrkZK5tGPtWtjZw18ifrwSZuf7mm6HGyHmrZQ19j5FAWK
	Pyf+hiKQAgYxrySEwUuNdTi7gCA5hIH1zyUUCxtq3NAdLk4VTx9RM/vph6oMD9J+5ScshTlQePR
	LlHWlkFH61KlgUTUdd2sIle19iEshLxGi8j/HQVOs7wCeQzddkZF5X/Numcc5IJE8mZNYXQLMaK
	YYEFvQWR7kNb1EEz7AVTs+PUHTAYnLlzPvgd0HTCesErYWZPUnuJDDixFIaVrLBLlDzSLHdUztc
	IloQKJ5/nxjn35Jm5qtlzI/noLd/YRwZqCk12PJoIWLhRkj5VRu95eeLrNG1t3own9B1erkOD1e
	2LjcvoXOnkicvnjzb2Hqets+dpHXctg5aX1IYZXLIX0fa8BTNWxLlN80Oq88J6EUAzezV+pzMPo
	8M9rD+3TopEK4Q4wVX5+W3SoRb+Vo/gVhdcomz6uWgYEcPm/qJYYhq1Pw6jrWpSf2F1D1lQZn99
	SO9AyqpUIutCesU+2I0hJ6SSTffBEn9zjum2LSFz5eWHOW8S0JPmwJtRBqwwbdtH31rfSnzqqm8
	6DqbRB8CUCHmsw4jGPwh0zeXCm83kDfO9RuU4Tl3gVp0sAJoD8W/iyJtIsLF2wnpD0Rud85B9a5
	I
X-Received: by 2002:ac8:5a50:0:b0:536:6abc:54b1 with SMTP id d75a77b69052e-53fcb509e99mr60729391cf.28.1793217237708;
        Wed, 28 Oct 2026 12:53:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53838cf49c9sm113417671cf.3.2026.10.28.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:53:56 -0700 (PDT)
Message-ID: <bfc4481a817e761ed9ccc265484dfbdfc1e59490.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: rockchip: Add JPEG decoder driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Torsten Duwe <duwe@lst.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Sinn <lucas.sinn@wolfvision.net>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner
	 <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 28 Oct 2026 15:53:53 -0400
In-Reply-To: <20261022190026.6cb0a534@rocky.lan>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
		<20261022-rockchip-jpegdec-v7-2-3fd7dd55f408@pengutronix.de>
	 <20261022190026.6cb0a534@rocky.lan>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-vP+iZzvr5GpVmxFar41J"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


--=-vP+iZzvr5GpVmxFar41J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Torsten,

Le jeudi 22 octobre 2026 =C3=A0 19:00 +0200, Torsten Duwe a =C3=A9crit=C2=
=A0:
> Hi Sascha,
>=20
> first: thank you for driving this :)
>=20
> On Thu, 22 Oct 2026 13:06:40 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
>=20
> > Add a driver for the JPEG hardware decoder Rockchip integrates into a
> > number of its SoCs.=20
>=20
> [...]
>=20
> > +static int rkjpegd_enum_fmt_vid_out(struct file *file, void *priv,
> > +				    struct v4l2_fmtdesc *f)
> > +{
> > +	if (f->index)
> > +		return -EINVAL;
> > +
> > +	f->pixelformat =3D V4L2_PIX_FMT_JPEG;
> > +	f->flags |=3D V4L2_FMT_FLAG_DYN_RESOLUTION;
> > +
> > +	return 0;
> > +}
> > +
> > +static int rkjpegd_enum_framesizes(struct file *file, void *priv,
> > +				   struct v4l2_frmsizeenum *fsize)
> > +{
> > +	/* The decoded format follows the bitstream, nothing to enumerate. */
> > +	if (fsize->pixel_format =3D=3D V4L2_PIX_FMT_NV12 ||
> > +	    fsize->pixel_format =3D=3D V4L2_PIX_FMT_GREY)
> > +		return -ENOTTY;
> > +
> > +	if (fsize->pixel_format !=3D V4L2_PIX_FMT_JPEG)
> > +		return -EINVAL;
> > +
> > +	if (fsize->index)
> > +		return -EINVAL;
> > +
> > +	fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +	fsize->stepwise.min_width =3D RKJPEGD_MIN_WIDTH;
> > +	fsize->stepwise.max_width =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_width =3D RKJPEGD_CODED_STEP;
> > +	fsize->stepwise.min_height =3D RKJPEGD_MIN_HEIGHT;
> > +	fsize->stepwise.max_height =3D RKJPEGD_MAX_SIZE;
> > +	fsize->stepwise.step_height =3D RKJPEGD_CODED_STEP;
> > +
> > +	return 0;
> > +}
>=20
> Can it do JPEG, MJPEG or maybe both? AFAICT the difference is minimal,
> so maybe try to be more permissive?
>=20
> [...]
>=20
> > +static const struct v4l2_ioctl_ops rkjpegd_ioctl_ops =3D {
> > +	.vidioc_querycap =3D rkjpegd_querycap,
> > +	.vidioc_enum_framesizes =3D rkjpegd_enum_framesizes,
> > +
> > +	.vidioc_enum_fmt_vid_cap =3D rkjpegd_enum_fmt_vid_cap,
> > +	.vidioc_g_fmt_vid_cap_mplane =3D rkjpegd_g_fmt_vid_cap,
> > +	.vidioc_try_fmt_vid_cap_mplane =3D rkjpegd_try_fmt_vid_cap,
> > +	.vidioc_s_fmt_vid_cap_mplane =3D rkjpegd_s_fmt_vid_cap,
> > +
> > +	.vidioc_enum_fmt_vid_out =3D rkjpegd_enum_fmt_vid_out,
> > +	.vidioc_g_fmt_vid_out_mplane =3D rkjpegd_g_fmt_vid_out,
> > +	.vidioc_try_fmt_vid_out_mplane =3D rkjpegd_try_fmt_vid_out,
> > +	.vidioc_s_fmt_vid_out_mplane =3D rkjpegd_s_fmt_vid_out,
> >=20
>=20
> You are populating only the *_out_mplane members and not the single
> plane ones? So a greyscale JPEG needs to go _mplane with 1 plane?

Drivers only implement one queue type, MPLANE is the recommended one. There=
 is
pixel formats for single allocation and multi-allocation that userspace can=
 pick
from. So a driver can do MPLANE and support both NV12 and NV12M formats as =
an
example.

>=20
> And for color, the colorspace on the decoded side should be
> V4L2_COLORSPACE_JPEG, not sRGB, I think.

Should actually match what the JPEG header says, RGB jpeg exist.

>=20
> Would you mind to give a hint about your test setup?

I believe Sascha has been testing with GStreamer, the element is called
v4l2jpegdec.

Nicolas

>=20
> Thanks,
> 	Torsten
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-vP+iZzvr5GpVmxFar41J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCauJS0QAKCRDZQZRRKWBy
9FbtAQDQq1LHLIEYGFdpJt3hiBBdUv17DM2qsOM4AzolcnZ4QQD/ber/FxSYvItX
/Z3gWh4nz808VmJqoajvRuATRpq4NQo=
=niJB
-----END PGP SIGNATURE-----

--=-vP+iZzvr5GpVmxFar41J--
