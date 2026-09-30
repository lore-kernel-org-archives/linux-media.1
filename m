Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D273B71B2
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790805713; cv=none; b=W1IBaDuC/q8YgNJ/Fp3jx1OaFAYg5eZesiqvtbVaLk1hYY+Fx6TRg9IbjgXMIwwXkBRclgN0A+vt+TWiQMYAHEzpg8W9oLmup71XRbWaCOPmqdINZmVTE5BQtxbmBnu8UkHg0JLb6UxWal47sRzcobIsgN8xynMS7DJkcaz31aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790805713; c=relaxed/simple;
	bh=SbTqSD5dKQ7Ti5DK4wKeaqMWj9NkF5BcE4SuG4JTXnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpEHd7vpimGRjQeCk52kI/2cVsy3Gwbr/i121JNVDN8jdb/rV69qejXOqDXKzcb25rlKJUPhfEGbsCOMfobTybDsZSdExyU7VFWaHCwqI75vXTXB940ah9LZo93NldjJB96IDozPHujunkv5EDh5iw3/2ErLDPNWUSbEmkpILE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHWrlN6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHWrlN6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E3C1F00898;
	Wed, 30 Sep 2026 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790805708;
	bh=nKAZB5gN6YIssbjc7S3p/U6h9I8xNhHggajmPg7SAlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SHWrlN6jlLLKgvEcLAAmjZh1GbG36ruhzpscVj1EC/ZRwjNOl68QLfr/rQjyM7xe/
	 tnpVI84vK1LqEKs2aI1V93mdQiBt1HC0CJ9w/nhp9fPapctIP9PyTgn3LY3UoQVic9
	 IeSeTbopT5Gr9gT/fg5NpJHXIWA9UQaItC00xBGfnGsD9LDqYZJrTo6MOy9FE1hztY
	 lA9PrO3Z1QKmVOHp/uxPB2+cXQRxKRTGDHD+TYkWNieaEvA8MNFgPq4/rdhDTua1J2
	 FNyy2o1ZyppuxaxadsIoNpO3zCjpaCZY01Hzpz9OxiXqXwNv4hiSGgNkz1FmRd4BPK
	 HosTaFgPWmGuA==
Date: Wed, 30 Sep 2026 23:01:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org,
	Loic Poulain <lpoulain@qti.qualcomm.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
Message-ID: <20260930-boil-capitol-19514aea9236@spud>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com>
 <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZG8bUxuVkloVC8iv"
Content-Disposition: inline
In-Reply-To: <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com>

--ZG8bUxuVkloVC8iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey, just some quick thoughts I had, mostly to fish for more information
so I can be more informed..

On Wed, Sep 30, 2026 at 01:18:59PM +0200, Stefan Klug wrote:
> Hi everyone,
>=20
> On 15.09.26 01:38, Laurent Pinchart wrote:
> > Hello,
> >=20
> > As most of you already know, the Linux Plumbers Conference will host a
> > Camera & ISP BoF in Prague in three weeks ([1]).
> >=20
> > The initial proposal for a microconference has unfortunately been
> > downgraded by the program committee to a 45 minutes BoF. We have
> > therefore decided to limit the discussion to three topics at most. Two
> > topics have been approved so far:
> >=20
> > - RGB-IR support in V4L2 and libcamera
> >=20
> >   by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> >=20
> >   The Linux kernel V4L2 API does not support RGB-IR image sensors.
> >   While building blocks necessary to handle those devices are slowly
> >   being merged, RGB-IR support itself hasn't been tackled yet.
> >=20
> >   Rishikesh and Devarsh will also present this topic at the OSS Europe
> >   conference ([2]).
> >=20
> > - Camera module identification
> >=20
> >   by Stefan Klug, Ideas on Board
> >=20
> >   Camera tuning and calibration depend not only on the image sensor, but
> >   also on the lens and other characteristics of camera modules. While
> >   Linux supports identifying image sensors, it completely lacks the
> >   concept of camera modules.=20
> >=20
> >   Identification of camera modules requires coordination between
> >   platform firmware (DT or ACPI), the kernel and userspace. Discussions
> >   will benefit from the presence of DT maintainers.
> >=20
> LPC is already next week and we won't have enough time on the BoF for a
> full introduction to the topic. So this email summarizes the Module
> identification topic and contains the questions I'd like to discuss.
>=20
> To the device-tree maintainers: I added you to the invitation as this
> document proposes new device tree properties and I'd love to get some
> feedback and common understanding on these. So if you'd be able to join,
> that would be fantastic.

I'll do my best, there's some schedule conflicts with the RISC-V MC for
me, so we'll see how it goes.

>=20
> Most of this mail is introduction and context. If you are short on time,
> please jump directly to the last headline "### 4. Camera modules without
> data storage" which contains the most relevant questions.

>=20
> Q: Does anyone in this group have more details on which information to
> query and where to get more details from the system?
> A: ...
>=20
> ### 2. Camera modules with an embedded EEPROM
>=20
> To make use of the EEPROM data from user space we need to carry two
> elements: The EEPROM data itself and some identifier telling which
> format the data in the EEPROM has. This seems relatively straightforward
> and we could model it like this in dts:
>=20
> dts-snippet:
> imx283_0: sensor@1a {
> 		compatible =3D "sony,imx283";
>     ...
>     eeprom =3D <&eeprom>;
>     eeprom-format =3D "vendor-a-eeprom-fmt";

It's nvmem-cells you want here I believe, and the associated layouts
should cover the format?

> };
>=20
> Getting the link to the EEPROM from user space is something to
> investigate. Ideas are either sysfs or media-controller.
> The eeprom-format must be specified as well, to tell user space how to
> interpret the EEPROM data, as it is typically not self-contained.

If you have the format of the eeprom, is it not better to provide the
parsed version to userspace directly rather? Or are you concerned that
these things will contain such "random" and non-standardisable info that
it is a lost cause?

>=20
> Q: On a first discussion on that topic we were unsure if it would be
> preferred to expose the data directly in sysfs,
> or to symlink to the corresponding sysfs entry for the EEPROM. Any
> preferences?
> A: ...

FWIW, nvmem already has sysfs for this (first option in the nvmem
Kconfig menu).

>=20
> Q: Any input/things to consider from ACPI side?
> A:
>=20
> Q: What happens if the EEPROM driver is not loaded yet or is just not
> available? Should it block/defer probing of the sensor?
> A:
>=20
> Q: We are missing real-life examples for these cases. So input from
> vendors would be welcome.
> A:
>=20
> ### 3. Camera modules with a sensor that has an embedded OTP memory
>=20
> This case is similar to the previous one. The big difference is that the
> OTP memory can be handled by the sensor driver itself, so no additional
> driver is necessary. In this case a practical solution could be to
> expose the OTP data via sysfs. Handling in user-space is similar to the
> EEPROM case. So the device driver could expose an otp_data and
> otp_format attribute in sysfs for user-space to read.
>=20
> The property otp_format contains a name of the format of the OTP data.
> There are cases where the format is specific to the sensor vendor and
> cases where the format is specific to the module vendor. So it should be
> possible to specify that in the device tree.
>=20
> ### 4. Camera modules without data storage
>=20
> This is the most difficult and most controversial case. In this case we
> can't identify the module automatically by querying the hardware. It is
> also not possible to rely on the machine identifier as with example 1.
> Think of an arbitrary camera module connected to a Raspberry Pi - the
> machine identifier will not change just by connecting a camera.
> Therefore we'd like to supply all necessary information with the device
> tree.
>=20
> The difficulty is that the combinations are huge and there is no common
> denominator (for some modules one might be able to get an SKU, for
> others it will even be difficult to get an official name).
>=20
> This is quite contrary to typical device tree use-cases where we try to
> tie down everything as far as possible.
> A flat list of module identifiers (like compatible strings) won't work
> as it should be possible to standardize aspects of a module, even if not
> everything is know. Think of a Raspberry Pi Cam HQ with a screw-on lens.
> It would be great to be able to specify that module, but the lens is
> still up to the user.
>=20
> In [1] I proposed a possible solution to that problem. A tag-based
> system with a single device tree entry of space separated tags. Every
> tag carries a prefix to denote a category:
>=20
> Tag                 Example
> m:<ModuleName>      m:vc-mipi-imx296
> v:<Vendor>          v:RaspberryPi
> l:<Lens>            l:generic-8mm-ircut
> s:<Sku>             s:B030801
> u:<user defined>    u:my-selfmade-module
>=20
> This is a bit like the existing "label" property which carries a human
> readable label. So an example for a module could be:
>=20
> imx283_0: sensor@1a {
> 		compatible =3D "sony,imx283";
>     ...
>     module-info =3D "v:RaspberryPi m:camera-module-hq
> l:generic-8mm-wide-angle";
> };
>=20
> This leads to the immediate question: Should we split the tags into
> properties?

Yes, make use of the standard utilities before rolling your own format
please.

> imx283_0: sensor@1a {
> 		compatible =3D "sony,imx283";
>     ...
>     module-name =3D "camera-module-hq";
>     module-vendor =3D "RaspberryPi"
>     module-lens =3D "generic-8mm-wide-angle";
> };
>=20
> Pros: We could try to standardize on some values.
> Cons: We add a (possibly increasing) number of properties that have no
> value inside the kernel and will only be populated very sparsely.

What value do they have anywhere? ELI5 why anyone cares that the rpi
foundation made the sensor module, for example. What decisions can be
made on the basis of it? Not trying to be antagonistic, I genuinely
don't know what kind of things it affects. The lens type or some sort of
nd filter info I can understand being useful. That said, and I know very
little about cameras, some of these things could actually vary at runtime
right?

On the module name front, it quickly becomes compatible-v2 I think,
since you're gonna need standardised names for specific modules so that
decisions can be made on the basis of them. Makes me wonder if you need
sensors to have an endpoint connection to whatever sits in front of
them...

> Q: Would the dtb maintainers accept such a property?

I mean, at first glance the idea itself seems reasonable. The info isn't
discoverable and some of it seems to be valuable.

> A:
>=20
> Q: Are there other/better ways to convey that information?
> A:
>=20
> # Links:
>=20
> - [1]
> https://www.linuxtv.org/downloads/presentations/media_summit_2026/Stefan%=
20-%20Module%20Identification.pdf
> - [2] https://github.com/systemd/systemd/blob/main/rules.d/70-camera.rules
> - [3] https://github.com/systemd/systemd/blob/main/hwdb.d/70-cameras.hwdb
>=20

--ZG8bUxuVkloVC8iv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar2GxwAKCRB4tDGHoIJi
0ly+AP98SNbkJUghwneezpr+VJ+hxI/VRhEaEYalw5vR4q/wawD+O3eRRQXYMQuP
s2ac3HzZD+rqbtPnD143HS24aMDkdQA=
=2DDy
-----END PGP SIGNATURE-----

--ZG8bUxuVkloVC8iv--
