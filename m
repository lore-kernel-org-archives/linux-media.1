Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2C33FBEA5;
	Wed, 22 Jul 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707241; cv=none; b=lbSlY7CnGiEOJTj/XM9IdeGpssU8IYg3lnT3mRRZhFnZ1O+zOGZpQgjw4XgnkBZl9ccG96wOBCCtAvHFdhx2d4OF0aFNkIM57JskT9uMdUQxP+BTm1zcRVsIVaoGtZvJF8yoanOuCYJM2ezNiKbs1fIzeLJ7ScAAKZKX1V8VexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707241; c=relaxed/simple;
	bh=jgW/3RhHS8gp860IxAyQfvVai2xKsVts9oiAiUAum+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mG7VTuExiD0i9TpsXm/k+SjbWKjwCwbAd+74VCNKZVx8vqVat/gTlAfVWunqRYhQ5Ze2k2nEmmwlWz5gzgfmIKDdJwTzGKWoZtPpaXk1LsVP/PyvmH76c5BtIxkogYqNE0IegrP7GGGyl0d/g+YTxGn14fQI/Tmlak2to+zv03s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=amkXkPl+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="amkXkPl+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mo3FPEmGwW4x/RiiT5UFGXNV1XFmuT6ZFSZsfmy/KDQ=; b=amkXkPl+pX5YEBxFScItm/FnDM
	N3E+G75PZVz/5ZKDjBes2Mbgx1U/sEjMOUbvGfnTiz01fUQcMltVqMEy3MyeH7OaQw1MiMIi3YbxN
	u7GYVXWU3UQhXdhadTgwDA1LH8RjiXT9pPsoBXDLx/BzHyRlcQQgRH+P2szi0KfGgzCMJa7CsNWCx
	wCMJbK1zc4EQ0F3nbffKAmOu9wFQqqNbBsu8ExyZxNJq6nspSwYLE4oXgR/rBPddMbvgCDr2at4Y2
	3SOV21K6Q9h8h+BqLKtcssrG5hDDe8QRmJU4JFxnQyielbVE48GUBdoxDuKwzc/OIfwnSmEWCODFQ
	O8PiftUQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmRsS-00078g-2R;
	Wed, 22 Jul 2026 10:00:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmRsS-000PCO-0D;
	Wed, 22 Jul 2026 10:00:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Richard Leitner <richard.leitner@linux.dev>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov9282: enable single-read I2C transactions
Date: Wed, 22 Jul 2026 10:00:27 +0200
Message-ID: <2275271.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260721153212.GP50424@killaraus.ideasonboard.com>
References:
 <20260721-cci-single-v1-0-8485171e1393@linux.dev> <al-Jw_O8faK3oqqB@bombadil>
 <20260721153212.GP50424@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28068/Wed Jul 22 08:24:50 2026)

Hi everyone,

Am Dienstag, 21. Juli 2026, 17:32:12 CEST schrieb Laurent Pinchart:
> Hi Richard,
>=20
> On Tue, Jul 21, 2026 at 05:15:06PM +0200, Richard Leitner wrote:
> > On Tue, Jul 21, 2026 at 03:38:26PM +0200, Alexander Stein wrote:
> > > Am Dienstag, 21. Juli 2026, 15:25:29 CEST schrieb Richard Leitner:
> > > > Some OV9282 camera modules, such as those from Vision Components, f=
ail
> > > > multi-byte register reads with the default CCI I2C regmap access pa=
ttern
> > > > and only work when single-register read transactions are used. This
> > > > results in the driver being unable to probe due to a chip id mismat=
ch.
> > > >=20
> > > > As the driver has no reliable way to identify affected modules enab=
le
> > > > use_single_read for OV9282 unconditionally when creating the CCI re=
gmap.
> > >=20
> > > What about a property in the DT instead? In DT it should be clear if a
> > > Vision Components camera is used.
> >=20
> > I've talked to Laurent about this topic (I guess a year ago or so...)
> > and he pointed me to his downstream work regarding the vc-mipi driver
> > (which I am currently also using):
> >=20
> > https://gitlab.com/ideasonboard/nxp/linux/-/commits/v7.0/sensors/vcmipi

Yep, I've also been using that one. And yes, this I2C access peculiarity has
been an issue for a long time already.

> > There is a new driver (and therefore DT compatible) for the controller
> > (without the sensor) on the Vision Components board implemented. This
> > separates basically the "regulator" part of the VC microprocessor from
> > the "forward I2C traffic to the sensor" part. AFAICT...
> >=20
> > Talking about that separation I vaguely remember he argued against a
> > new device-tree property or compatible for the vcmipi variants of the
> > ov9282. Therefore I went for the "easy" approach of just enabling single
> > register reads.
> >=20
> > Nonetheless if I understood this wrong or "things" changed, please feel
> > free to correct me.
> >=20
> > Just to be clear: I'm also perfectly fine with introducing a new
> > "vcmipi,ov9282" compatible or something like a "quirk-vision-components"
> > property if that's preferred.
>=20
> My main concern is that I don't want to see this being handled manually
> in drivers. Whatever solution we decide to implement (I proposed two in
> a separate e-mail in this thread) should not require modifying image
> sensor drivers to implement logic specific to the Vision Components
> module. I'm fine relying on drivers using specific helpers (for instance
> requiring drivers to be ported to regmap or v4l2-cci in order to support
> the quirk).

I had the idea of a generic property like 'i2c-disable-autoincrement' usable
on all i2c devices. This property might be parsed in regmap-i2c (or even
i2c-core) so it is enabled and available for all i2c devices without
modifying any driver.

Best regards,
Alexander

> > > > Tested on an i.M8MP system with OV9282 modules from Vision Componen=
ts.
> > > >=20
> > > > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > > > ---
> > > >  drivers/media/i2c/ov9282.c | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > > index 5b6f897a74fcd..8267a0a9c6f2d 100644
> > > > --- a/drivers/media/i2c/ov9282.c
> > > > +++ b/drivers/media/i2c/ov9282.c
> > > > @@ -1283,6 +1283,11 @@ static int ov9282_probe(struct i2c_client *c=
lient)
> > > >  	struct ov9282 *ov9282;
> > > >  	int ret;
> > > > =20
> > > > +	const struct cci_regmap_config config =3D {
> > > > +		.reg_addr_bits =3D 16,
> > > > +		.use_single_read =3D true,
> > > > +	};
> > > > +
> > > >  	ov9282 =3D devm_kzalloc(&client->dev, sizeof(*ov9282), GFP_KERNEL=
);
> > > >  	if (!ov9282)
> > > >  		return -ENOMEM;
> > > > @@ -1301,7 +1306,7 @@ static int ov9282_probe(struct i2c_client *cl=
ient)
> > > >  		return ret;
> > > >  	}
> > > > =20
> > > > -	ov9282->regmap =3D devm_cci_regmap_init_i2c(client, 16);
> > > > +	ov9282->regmap =3D devm_cci_regmap_init_i2c_cfg(client, &config);
> > > >  	if (IS_ERR(ov9282->regmap))
> > > >  		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
> > > >  				     "Failed to init CCI\n");
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


