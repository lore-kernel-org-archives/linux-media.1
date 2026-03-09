Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851803624A4
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060911; cv=none; b=G+K+d6VAcJoYmrAe34735xiqY5Sf24isFiLxi37A67o5jZdKtDstBmAX7ob1fFLwFXRWdN54BcbnBhkDn+msfLOsRyZjyqaP/XziqILu6zl5q55ZXe4HfdxWWwHc0QcyTezqIB2trJcPqNSc5ITchuTRc4b2359ULn1Zk5nubLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060911; c=relaxed/simple;
	bh=94IZlDlq9V9iORAfkNA4rHpMMZ0OSVYyZ2+T8K5S3OA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EuYwndV/QGnybslzl20vqpHeTomFujvskgdvULhXQzfSl8vJILKzFpJIAHJEgwXyhw4uBT20Sb+vqPGOaUumXOSZeWGUG8q1HaDG1kjyCoo/6pcVW2ffPS7tgTt8XxeIYWHj4SFd/tVYCYpEz5iJM8LZooutkgIb6hZZ8Lb9Xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vza85-0007G8-Oe; Mon, 09 Mar 2026 13:54:37 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vza83-004X7D-1f;
	Mon, 09 Mar 2026 13:54:36 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vza84-00000000Add-3GvA;
	Mon, 09 Mar 2026 13:54:36 +0100
Message-ID: <45f6c49c1e645423b9a9f955019e4be0a37a3a12.camel@pengutronix.de>
Subject: Re: [PATCH 3/8] media: i2c: ov08d10: add support for reset and
 power management
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Matthias Fend <matthias.fend@emfend.at>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jimmy Su
	 <jimmy.su@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Date: Mon, 09 Mar 2026 13:54:36 +0100
In-Reply-To: <215f5ff5-0751-4074-9353-dcb5d3c63833@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
	 <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
	 <6a63b27e567d854e8459bc3a31d99e2d01cd1dd6.camel@pengutronix.de>
	 <215f5ff5-0751-4074-9353-dcb5d3c63833@emfend.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Matthias,

On Do, 2026-02-26 at 21:30 +0100, Matthias Fend wrote:

[...]
> >=20
> > > @@ -1437,26 +1524,28 @@ static int ov08d10_probe(struct i2c_client *c=
lient)
> > >   		goto probe_error_media_entity_cleanup;
> > >   	}
> > >  =20
> > > -	/*
> > > -	 * Device is already turned on by i2c-core with ACPI domain PM.
> > > -	 * Enable runtime PM and turn off the device.
> > > -	 */
> >=20
> > The commit message does not explain why this comment is dropped.
>=20
> I didn't find the comment particularly helpful and since other sensors=
=20
> manage without it and there's now more than just ACPI, and "turn off"=20
> happens later, I thought it was fine to just drop the comment.
>=20
> If you think it should still be included, I'd be happy to change it.

That's ok, I'd just add this explanation to the commit message.
Or something along the lines of dropping a comment that's obvious.

I wouldn't have pointed this out if it didn't look to me like the
"device is already turned on" precondition had maybe changed with the
point discussed below.

> > > -	pm_runtime_set_active(ov08d10->dev);
> > > -	pm_runtime_enable(ov08d10->dev);
> > >   	pm_runtime_idle(ov08d10->dev);
> > >  =20
> > >   	return 0;
> > >  =20
> > >   probe_error_media_entity_cleanup:
> > > +	pm_runtime_disable(ov08d10->dev);
> > > +	pm_runtime_set_suspended(ov08d10->dev);
> >=20
> > Does this do the correct thing if v4l2_async_register_subdev_sensor()
> > returns -EPROBE_DEFER (for example via privacy led) and then it probes
> > a second time? It looks like the assumption pm_runtime_set_active()
> > doesn't hold then.
>=20
> At least it works as expected for me. But as mentioned, I don't have an=
=20
> ACPI hardware setup available. Does your point maybe refer to ACPI, or=
=20
> what exactly do you mean?

I confused myself, thinking that disabling the device was moved into
the error path. But pm_runtime_idle() is still only called directly
before return 0, so my point is moot. Sorry for the noise.

regards
Philipp
