Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713897;
	b=uULLCm0yns6tDj4n7ikxz4+cYrvjX2sIpyZ0ET9OYGDZKmL+/0aMLvbjlj4NuegFlA2w
	 PHr7yyUFj14zWi2WlxIMhjN7Qj71GWe2D3iLz7qHXxQ/po0kOTkX3Obm9cyweld9jaAFv
	 1qPtf56s0YUboDg93S5ETE7EN/cDakW9RgiZdW2JKIf9opkVEpdCKhkzpCpzVDynViuNN
	 meVjp+czTx+xjZH4FemCaH/pX2y64UvOXIRQh7O8HqYSEhWpfgnWHzMEIkrHLLL9mysV1
	 W0gMJUZ8xHlh/uo5lxmkBvewOvgWx7IPdYdKyzm3o+rmcKbj2g1gRM6qWyvYE+RaXFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=;
	b=h4KBMfuKcS5UkkfEzEXGg6KFyVSw7dj15NFRraVgVs86wzdZG02RDP8ZYTMbGVH2igMR
	 2QdMCbngKrm1tJlssFCoeIeEis8BIAImaFNc6tIFlpXOZVGc4urPrJH4EJSYTm0iOE3Za
	 oRXHXOmGZJdY5KD9BL0K7y1zVoYSDEyw1lh+PoqlFbGTbBAxoChhSiHfce+bcpOvArcW4
	 OGr6DQfo3fek2QrrSZbkkkOCA8gGhoui0R4+eft1AAyg3QPlhufMUFPUP1nhyta4vwCAW
	 cUmyMSIETaGjEd4zmwWKDDXr4a8P/tTTtSSu1B4fyPPchyIwVmGeXWAjTMmSQJivlxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VGaCKTaC;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5C606EE8C
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 13:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F5C606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VGaCKTaC
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c76540d0bso48434536d6.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 05:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1793713896; x=1794318696; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=;
        b=VGaCKTaCk6uL/wh1SDi3Nz5vx+/lxarWHbdqXXogZ825/O6x7V9NiG7gdaoXdgE6w9
         9zQ1Vi8u1LBaN3U1L7acE7pqWnbyPXbdE9aVEyo6NaPhdgo6Nr5Uue0hbgnJRwDnB4pJ
         jyHZ+jD7A8sCgYE33q6Kp8BlJdDaNLhloGj6L+Jwx3/l3sQ1P16uIypQdewkokyDTRmq
         e5qJBpgvnDO0VO9WooyNx85KF9yjdmOR+9GbHqB0bYmr677al/D09YwYia806x5cSIKM
         g6EQaFW6tjsSynoi//7N0o3yaedeSxoce+9o5gJvUA4TewvyFADcIe4t4ztm27lxCF+w
         OHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713896; x=1794318696;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KCQH9pBfu/03JDVFZw+VQK2tSFgTeFnNL5J25b5rmB8=;
        b=gJH1+Qp/5s3MIwLcfgdC8isb1Euf5Zz9/mGfY133sELRQmFzUECFAHG5Jq5Iu3m7H5
         TiOUFpF5DLkecyE3Vo1QCLh/cvlqKtm7Hc24MdTrbDLR11qZQF22f+iHBXkJuueEXWGH
         4qPAYK886tv7ZCS8rjeO7bA8oAGBW8h/jc7ECjEwp9x/OEVT5/jCa5CIcM7IkchjKgiD
         3bzDg4f75T2Qib9F0XlfH2FJax0cwF+RAQLEmil3ZOEpqA4smURit10OQXScj0QXh+lx
         OJ8gLJEMo+ru1OiIqiaCP3ZSLU6BKExeBN3xY0EpKjzMzyYxPv4n3cAq3tyTMMsAQISo
         Hp8A==
X-Gm-Message-State: APuU4Z/tsIhRulaKsb1MxG6OzmLBxZMnxA63W7wdw5VysK4Ema1VlA6l
	oth5jq/ogNMgM1qNkv9vgUfhNASD3M9rqCrwBMCk7ExqA07dZWIfN28J0JZLfYT3aB0=
X-Gm-Gg: AYBFou0K3NMDxLH9juktQtWX64hmABSvgepPyQ0YCbuBrK3dTZcyUqObUrShba5t9pK
	QGSoghKknHXIUaIbNCV7Jo4xIO/ExKfrERkty1cwQR5PpowILgJ9ieph0kRmM+Fk2CK2N6BBTVx
	jW7VV9HyqmZ/W98sAZpw44XhtTB1CDCFLCDcZ1ZTMm7S1QeO8EzC2nrhwRb1ZS35saYML3vYbiX
	8qVAfR/+aggJijj76r7+fCpBDgGTYQLd6YkhwxCCEl0s9MxGhuOMULnrEWIsviamNjSvTvnNtzv
	BLZCsXUEs+YkvAxsXBjiZ7VFIlmTduaRY/aYF0OsYvel3xMC2bYxiS+NYD4eT4Q/a+ouQtUGE6C
	wS9RmMp++bDaAjd1vTh+mJZ9/zxvhDickrzoXm2TtdmhlyYM6jkJL2x+GNUibhAyme1dUtcbVa8
	0KZ9VdQhIS3nxi3NrrmUcJCZO1dRLjDdt6hll+kUyf6HamYlqfrtoUNXEfZjPvYxT2eIDPXhJ8N
	CMxKjqn3xji6gYIrUkxnIHAqmDJZS0q7OMB0aKZ7PZW2H5jxBL4tkt2G/a5kC5Dh06/7VHk94xD
	/eWNoyXYMlhSoMVRFpogeUttBxr68ol3s486qD1Qqo3siNsPwn3Dwzo=
X-Received: by 2002:a05:6214:c67:b0:91c:914c:8a5 with SMTP id 6a1803df08f44-91ca4bae657mr223491536d6.36.1793713895531;
        Tue, 03 Nov 2026 05:51:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:bf53::5ac? ([2606:6d00:11:bf53::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7376f703sm8113986d6.16.2026.11.03.05.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:34 -0800 (PST)
Message-ID: <3478043661b8d89ba5089f56383926785570b7b3.camel@ndufresne.ca>
Subject: Re: [PATCH 02/16] media: v4l2-device: Add struct v4l2_device.flags
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,  Daniel Scally
 <dan.scally@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Dafna Hirschfeld <dafna@fastmail.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner	
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 03 Nov 2026 08:51:33 -0500
In-Reply-To: <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
References: 
	<20261103-rkisp1-suspend-and-resume-v1-0-08f863b6fdc5@ideasonboard.com>
	 <20261103-rkisp1-suspend-and-resume-v1-2-08f863b6fdc5@ideasonboard.com>
	 <25952c4c-36db-4361-9ab6-0ca1b1f960bf@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="=-76jfQUMM/m0hKvtz6q36"
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


--=-76jfQUMM/m0hKvtz6q36
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 novembre 2026 =C3=A0 10:09 +0200, Gjorgji Rosikopulos (Consulta=
nt) a
=C3=A9crit=C2=A0:
> Hi Daniel,
>=20
> On 11/3/2026 9:40 AM, Daniel Scally wrote:
> > Add a flags field to struct v4l2_device, along with a single flag
> > value that is designed to tell v4l2-async in which direction data
> > flows for this v4l2 device so that it knows how to set up device
> > links between subdevices connected using the async APIs.
> >=20
> > Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> > ---
> >  include/media/v4l2-device.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >=20
> > diff --git a/include/media/v4l2-device.h b/include/media/v4l2-device.h
> > index 25f69b1b8db03d077f7570471d5c6910fcafe110..9b17916d63641ba637cf8c3=
7aa925749bd4e2134 100644
> > --- a/include/media/v4l2-device.h
> > +++ b/include/media/v4l2-device.h
> > @@ -15,6 +15,9 @@
> > =20
> >  struct v4l2_ctrl_handler;
> > =20
> > +/* Set this flag if this V4L2 device is an "output" rather than an "in=
put". */
> > +#define V4L2_DEVICE_FL_IS_OUTPUT			BIT(0)
>=20
> Just for the clarification do we change the meaning of output->capture to=
 input->output?
> I know that output is confusing for everyone including me but somehow i g=
et used to it.
> However to clarify what this means will be helpful :-)

I agree this is confusing. To avoid all the legacy, we could use PRODUCER /
CONSUMER, or does anyone has a better idea?

Nicolas

>=20
> ~Gjorgji
>=20
> > +
> >  /**
> >   * struct v4l2_device - main struct to for V4L2 device drivers
> >   *
> > @@ -30,6 +33,9 @@ struct v4l2_ctrl_handler;
> >   * @ref: Keep track of the references to this struct.
> >   * @release: Release function that is called when the ref count
> >   *	goes to 0.
> > + * @flags: device flags. Can be:
> > + *   %V4L2_DEVICE_FL_IS_OUTPUT - Set this flag if this V4L2 device is =
an
> > + *   "output" rather than an "input"
> >   *
> >   * Each instance of a V4L2 device should create the v4l2_device struct=
,
> >   * either stand-alone or embedded in a larger struct.
> > @@ -54,6 +60,7 @@ struct v4l2_device {
> >  	struct v4l2_prio_state prio;
> >  	struct kref ref;
> >  	void (*release)(struct v4l2_device *v4l2_dev);
> > +	u32 flags;
> >  };
> > =20
> >  /**
> >=20
>=20
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

--=-76jfQUMM/m0hKvtz6q36
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaunm5QAKCRDZQZRRKWBy
9O0hAP0dfaZa5N9pPcTMgeBjbwcAE6/VonHJ3BzLUQ1GAOGwGAEA/GCL+sGEcnnV
KMm1Iw/XizTAFH2FDtOYSIYlMgS6OgE=
=/H6A
-----END PGP SIGNATURE-----

--=-76jfQUMM/m0hKvtz6q36--
