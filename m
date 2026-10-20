Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507833;
	b=cMrW95jZFTKpGCTyitJ2bA0JVBZ5leGh7dQvugvEX4OcX1FXCyy9ShcPdFVsYzE6yS0N
	 dyXPYK+jUr1paXs2wz+m/hQVzqURsPUZtelzW0AZ7ytWSAt9P1XEYIN4/UfP6GdjwRoyF
	 grbJN8Fq+kmuY9wtFzwbGXD4SxcaoVlt2WDxWurp3HOMPX/kOEyC5JgaZwRkqg9RnJBiZ
	 VvdWU/rcaG1qUiGl9H0GaH/EjZ47io/6yjNSqgl+gcPsdPPr173C3sWfZCrtMdpbI7QuA
	 ZxZk2PgBG4S/Cki5FP4iOZP+ClVWCDZOdeTB6Z3bttnOptQcrNvJabKpNIo+1aUU5ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
	b=mu7EGsZiipCTR64iOv0Cjam341oWKad9s2fqiOpjJBQ5z4ensf4aXx7wq/UPCjcQxnOE
	 WDjYhOCoQiVeJ9JDir0i0aAB87w5nl9b32PTFj9935anOsetbO89OJFvVVQJjBV6e3x/N
	 KrhZ4ZgtvKgGvvgFnFsJ0qxI3oEJtT8VQGjpEj0NhIplWMZyT9e6JJCZ/a7mDD5LDDQCW
	 zfyxryXNj8pOsQfW1Xk/0jp0AJSdkmeQIK/vMtL7HUBmZW8tZUo5ts9KpZ1DUJfJuOUIz
	 KYmXu1VH+TuB48+q8Q7GwXlZBX2FzTigEf5uiV/Qrp09Enyqhx1IuAMYc6j+3oJ1zpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE94A606A319
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE94A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-48eee44b908so1736270fac.1
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507826; cv=none;
        d=google.com; s=arc-20260327;
        b=jf/PEpV82iCmyWin8ewSMQeLTA24+yrw/iSx2JSrBeCWft4DxxDYHuhj7MwWn2wYdc
         /HC2jbAMjag7+mtvYmWWo91grZSnzsL+p/BJU8Lof6NimxiVg67+OuBZyR3IS8Ba4+VY
         qmY63zCjNpuSkX44k6fqbJfkj1KppG3aw5WWJkl6YZKDVBR81NrIqI/fH7CskOPhhTph
         7l8Njvd4bKitcEd+N4dE+HGXn4y12rOd/LQhFqBtdMkjPYim+UoXyQ+Qkxnwp70FJ0a8
         Z9MHWcs+YnnsEYV2wOyRrYd0ez+C9mx5MuQGkAFIjDfBaK37SdPYUl0SJALo1SEByirW
         eLag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        fh=vBiobFKL5X3mA1A0ywYrpkduiIY6c1Y65o/ZWOGatpk=;
        b=WVHiGeH5EkC32U5ZcHf5LkucaxzpPhFLq0DDWxaSJ3LvJlfVTc28YJEhEN0QbrKXLT
         8XbTnohn2OqUovR/4DmpAFEV6VLHx/nODKESJjpNLhHQUnQMz5dqmYCT0Af46kHGX/1y
         f+7A1p8NWvRKMOl+5GwzZOrX1WtIri7gkj0cFgvEnCr8d5QQAVOtY+TSyCFwXuzOtKLg
         kdOzWlhAaB1utdI5B/M2V06qQjjePbAhznAffnj2oG61f+BkApmG7dFrrpSyEBomIAN4
         FmYvXByuHsgG+wsCCEvQNboJ9D2nu1UzUWlJ3CER/myBnb02jjwKL9OK7yfwFdZiMRcb
         v0Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792507826; x=1793112626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=DmCj1Mhln3zqO7y9erOlJM2Ywiu68q+JoJR/UR+crGO3/NhfvsvVsgGuvpXgKc+kUn
         p97Q+8zY/X0ls6r2ZJh+tYeJZ4CALYBE6akJTIIXLqsLg6WvmQd5HTOWcVkJhiaZRfLq
         lsYN2bSBEzuUvSk0s5Au3PVY9RgCxU6hrqOd83QM3rpUqbZX3NmfwvUV7odJZTfxtEFK
         3L+joEWHomj/v9GTLz8IJ8DkwwZ6Qc4ID7hctC6IBEXQUkd4H0/wIUi5SouTDnOFMNhV
         SYcpBNXsfPiN1/2FvWA2CB3lvq0h3UmKTkJLEsTtQ1oEiKaNiEyer0LDDRbnDPXlYc4s
         BcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507826; x=1793112626;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlkmGnexwUZqrSR6Z2ocUUR37fT6HoJKzxvPZMwVYqk=;
        b=TrRm+ape9+ZZB8PDHzyQoxnSnoj1hF94mdDmJsc+QoyJYzXLaJ6WKtqWmNnGMaBVkR
         jdb1vGG5kMMtTA5AJJHNUzaKiwv0FFB5ISCpg1FtHMn7jV3guY5RZiv+duwlkfWxTvBi
         Vw/UMwr5dIO8VrlxEykfS+mcFVZ1H1hVoP7jD37TiOZSlyEMcQAM7Tqw8Pch4q7pT24b
         vCH980aZ47tJkleUwGclF4Ack6Uy9EA/sRA23ruuwW71Es4TE7AVX1OrkmbbOESoBcj4
         MWMFtjXTaU470J7VbiPriBYrn98PX5DKFrXNOaeoAu8VEaW8ELBISriDNQIjD0gM3ode
         THsw==
X-Forwarded-Encrypted: i=1; AKwUvBzh3uk0/VhpUtiJWQcp7RDF0Fc2e2u50ak4YprmYb7M9JHnjbDnRL/hqf9Z6uc/ias5jC0AP8gVnlqHbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIW8lSxfwuGX6LhClEJKhi6badcSFI5go4Iikh/pWUi3EACDLip
	i4RSqQsS8t9jtgAYotVcAS0oh9XcLFpLPRZ0UbCIMYS3elwW6XuJTiup+9k2SNus0fRv3QEm1Oj
	vvhDkD1NCpQ5MAswnCJSpts0TmraTOIQjsDZQvd46J+QHuq6hQVU94sVqvg==
X-Gm-Gg: AYBFou1fn9z9UDoSup1iH0It1upbT15tiL58udzqDcTdjMeqNoKK7qgWzmZbw1IZYni
	MUhaCWsYea+55ehQo0LcKAojGQQ7QrxoNOFPshWbSXo0Uc8BYlCYn1RYCGbVR156IzWNvqTATET
	OTxsl7uQGfSj/rP2gX2NGU6EOoCf2HWviRTwNb2xuxhwWyinh/Q50z8f6MZqG5JV1pjGYogKbMi
	/j9IoDhZaXhnHNYt9i02Z1rUIUiVhGvkWXQCgc2TQbhvZ5zk/k4dZZYZGMLZazqFx6vyY1c4w2A
	bquMZlJvzrt2FnB9fbRSZ5ZuMtmvpA6cLebrzz7bwPzmBBmC133SU4YOic3XEtP/GNSILZ5PYaL
	UfIb8vzpjhUzDUg3/aTTq9E0NHaJLb343Vv+nGOQ/RSKOfPxBQkmcWwRCfaxiw3VlePZ9c+OK1E
	48c0vu3Lg=
X-Received: by 2002:a05:6870:b3e2:b0:4a7:424b:934 with SMTP id
 586e51a60fabf-4a75789dac0mr9577479fac.12.1792507826447; Tue, 20 Oct 2026
 07:50:26 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com> <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com>
In-Reply-To: <20261020125630.GA158670@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 20 Oct 2026 15:50:09 +0100
X-Gm-Features: AclHuK9jchI3nSC4JyaTIAm_0oNifQyoET0OAG28wvGpwbLI8WQ-9SbVDsLY7f0
Message-ID: <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari and Laurent

On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello Sakari,
>
> On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > exposure and analogue gain controls, image flipping, blanking controls
> > > and test pattern generation.
> >
> > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > 2, for which Dave (Cc'd) is working on a driver (see
> > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > The register defines in the two drivers appear to be quite well aligned.

Asked and answered at v1
https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/

> The current version of the driver implements very few features of the
> IMX908 sensor, as crop support has been removed pending the raw camera
> sensor model, and Clear HDR3 is being developed. I expect more
> differences to appear when those features will be merged, so I believe
> it makes sense to have a separate driver here.
>
> In the future, I expect the raw camera sensor model to open the door to
> more code sharing and more drivers supporting a wider variety of
> devices. We can decide then if the imx908 should stay a standalone
> driver, support other sensors as well, possibly across the Starvis 2 and
> 3 families. I'm willing to help with the refactoring at that point if
> needed, the maintenance burden won't be on you (and I'm sure that
> Lachlan and his team will of course maintain the code base).

Agreed.
I have compared the datasheet for imx908 against the Starvis2 ones,
and when we start looking at HDR modes they diverge a reasonable
amount.

Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
to the earlier ones, so adding Starvis3 would need some care.

  Dave
