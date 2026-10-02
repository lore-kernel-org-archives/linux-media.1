Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6E2233D9E
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 16:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957652; cv=none; b=ExJ7eTYGxPfq9m0g2W1LRe4DCAtNg/jNhTz6Fl+hXs711orY9yJKbwaibGGIjNBKpwxY0eg9H9fNHx+L5XmCrHlXjAJqx/lGbIGz2COq5j1dmlvaKsaAdr3tfmJ9rdgJ9q9+XU75C9CegVh+t8XMOyaV7NJXc6vztkst7JClpw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957652; c=relaxed/simple;
	bh=TuILmkj6p4SrybxIo6pAqvu9WLt9qKfShvZOf+31YpY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gZ/Nmi+Ra0lf6NoO+GUtOhC6OMIWbHisb8c6thmtWOxiPJav+ikFrQNaybRFKKZ+zJegg18vTBCcGH2DbYsiykL+PHfBDwJEyJdzUfd9kDs7Q8h5I5TBhiZtqnOBzYvQe9xKMUgvJx8bJmcQpyB4HbvVCeyNI2hV0qW3eZ6ccbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PBwZq9M6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PBwZq9M6"
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:6c1f:355d:1c19:aba6])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63C595E;
	Fri,  2 Oct 2026 18:12:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790957535;
	bh=TuILmkj6p4SrybxIo6pAqvu9WLt9qKfShvZOf+31YpY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PBwZq9M6r+Grr9eCWYFtirAhXLMoCF4cWmG6iKA1FfMOfFsE4xNGCB4UV1rCcAIn5
	 SnLaIK3qUByYsu9j0KisUWWgI/K+yQpzE62H2eFMPacqhkkohYgKmKIdVPk0n/vqZY
	 59SKLi9i9JgUw44ScufV/tYMqfuu3s+depnT03Uo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260930-boil-capitol-19514aea9236@spud>
References: <20260914233810.GA2796257@killaraus.ideasonboard.com> <93b0e5fd-5570-4418-8bbc-4b18ef5e419f@ideasonboard.com> <20260930-boil-capitol-19514aea9236@spud>
Subject: Re: [ANNOUNCEMENT] Camera & ISP at Linux Plumbers Conference
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org, Loic Poulain <lpoulain@qti.qualcomm.com>, Michael Riesch <michael.riesch@collabora.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
To: Conor Dooley <conor@kernel.org>
Date: Fri, 02 Oct 2026 18:14:06 +0200
Message-ID: <179095764618.1027537.15476078497656119934@localhost>
User-Agent: alot/0.12.dev43+g2cacc0d03

Hi Conor,

Thank you for your fast reply.

Quoting Conor Dooley (2026-10-01 00:01:44)
> Hey, just some quick thoughts I had, mostly to fish for more information
> so I can be more informed..
>=20
> On Wed, Sep 30, 2026 at 01:18:59PM +0200, Stefan Klug wrote:
> > Hi everyone,
> >=20
> > On 15.09.26 01:38, Laurent Pinchart wrote:
> > > Hello,
> > >=20
> > > As most of you already know, the Linux Plumbers Conference will host a
> > > Camera & ISP BoF in Prague in three weeks ([1]).
> > >=20
> > > The initial proposal for a microconference has unfortunately been
> > > downgraded by the program committee to a 45 minutes BoF. We have
> > > therefore decided to limit the discussion to three topics at most. Two
> > > topics have been approved so far:
> > >=20
> > > - RGB-IR support in V4L2 and libcamera
> > >=20
> > >   by Rishikesh Donadkar and Devarsh Thakkar, Texas Instruments
> > >=20
> > >   The Linux kernel V4L2 API does not support RGB-IR image sensors.
> > >   While building blocks necessary to handle those devices are slowly
> > >   being merged, RGB-IR support itself hasn't been tackled yet.
> > >=20
> > >   Rishikesh and Devarsh will also present this topic at the OSS Europe
> > >   conference ([2]).
> > >=20
> > > - Camera module identification
> > >=20
> > >   by Stefan Klug, Ideas on Board
> > >=20
> > >   Camera tuning and calibration depend not only on the image sensor, =
but
> > >   also on the lens and other characteristics of camera modules. While
> > >   Linux supports identifying image sensors, it completely lacks the
> > >   concept of camera modules.=20
> > >=20
> > >   Identification of camera modules requires coordination between
> > >   platform firmware (DT or ACPI), the kernel and userspace. Discussio=
ns
> > >   will benefit from the presence of DT maintainers.
> > >=20
> > LPC is already next week and we won't have enough time on the BoF for a
> > full introduction to the topic. So this email summarizes the Module
> > identification topic and contains the questions I'd like to discuss.
> >=20
> > To the device-tree maintainers: I added you to the invitation as this
> > document proposes new device tree properties and I'd love to get some
> > feedback and common understanding on these. So if you'd be able to join,
> > that would be fantastic.
>=20
> I'll do my best, there's some schedule conflicts with the RISC-V MC for
> me, so we'll see how it goes.
>=20
> >=20
> > Most of this mail is introduction and context. If you are short on time,
> > please jump directly to the last headline "### 4. Camera modules without
> > data storage" which contains the most relevant questions.
>=20
> >=20
> > Q: Does anyone in this group have more details on which information to
> > query and where to get more details from the system?
> > A: ...
> >=20
> > ### 2. Camera modules with an embedded EEPROM
> >=20
> > To make use of the EEPROM data from user space we need to carry two
> > elements: The EEPROM data itself and some identifier telling which
> > format the data in the EEPROM has. This seems relatively straightforward
> > and we could model it like this in dts:
> >=20
> > dts-snippet:
> > imx283_0: sensor@1a {
> >               compatible =3D "sony,imx283";
> >     ...
> >     eeprom =3D <&eeprom>;
> >     eeprom-format =3D "vendor-a-eeprom-fmt";
>=20
> It's nvmem-cells you want here I believe, and the associated layouts
> should cover the format?

Oh, that looks good. nvmem-cells seems to be the right thing here. I'm
not completely sure how the format would map, but I believe that would
resolve itself on the first practical implementation.

>=20
> > };
> >=20
> > Getting the link to the EEPROM from user space is something to
> > investigate. Ideas are either sysfs or media-controller.
> > The eeprom-format must be specified as well, to tell user space how to
> > interpret the EEPROM data, as it is typically not self-contained.
>=20
> If you have the format of the eeprom, is it not better to provide the
> parsed version to userspace directly rather? Or are you concerned that
> these things will contain such "random" and non-standardisable info that
> it is a lost cause?

As the data is of no use to the kernel, I don't see the benefit in
standardizing it. On the other hand we are missing practical examples. I
feel it is a bit of a chicken and egg situation. There were some
EEPROMSs, but it is difficult to correlate them with the camera module
so no one really used theme even though everyone would like to have
them.

>=20
> >=20
> > Q: On a first discussion on that topic we were unsure if it would be
> > preferred to expose the data directly in sysfs,
> > or to symlink to the corresponding sysfs entry for the EEPROM. Any
> > preferences?
> > A: ...
>=20
> FWIW, nvmem already has sysfs for this (first option in the nvmem
> Kconfig menu).

Thanks for that info. I need to toy around with that.

>=20
> >=20
> > Q: Any input/things to consider from ACPI side?
> > A:
> >=20
> > Q: What happens if the EEPROM driver is not loaded yet or is just not
> > available? Should it block/defer probing of the sensor?
> > A:
> >=20
> > Q: We are missing real-life examples for these cases. So input from
> > vendors would be welcome.
> > A:
> >=20
> > ### 3. Camera modules with a sensor that has an embedded OTP memory
> >=20
> > This case is similar to the previous one. The big difference is that the
> > OTP memory can be handled by the sensor driver itself, so no additional
> > driver is necessary. In this case a practical solution could be to
> > expose the OTP data via sysfs. Handling in user-space is similar to the
> > EEPROM case. So the device driver could expose an otp_data and
> > otp_format attribute in sysfs for user-space to read.
> >=20
> > The property otp_format contains a name of the format of the OTP data.
> > There are cases where the format is specific to the sensor vendor and
> > cases where the format is specific to the module vendor. So it should be
> > possible to specify that in the device tree.
> >=20
> > ### 4. Camera modules without data storage
> >=20
> > This is the most difficult and most controversial case. In this case we
> > can't identify the module automatically by querying the hardware. It is
> > also not possible to rely on the machine identifier as with example 1.
> > Think of an arbitrary camera module connected to a Raspberry Pi - the
> > machine identifier will not change just by connecting a camera.
> > Therefore we'd like to supply all necessary information with the device
> > tree.
> >=20
> > The difficulty is that the combinations are huge and there is no common
> > denominator (for some modules one might be able to get an SKU, for
> > others it will even be difficult to get an official name).
> >=20
> > This is quite contrary to typical device tree use-cases where we try to
> > tie down everything as far as possible.
> > A flat list of module identifiers (like compatible strings) won't work
> > as it should be possible to standardize aspects of a module, even if not
> > everything is know. Think of a Raspberry Pi Cam HQ with a screw-on lens.
> > It would be great to be able to specify that module, but the lens is
> > still up to the user.
> >=20
> > In [1] I proposed a possible solution to that problem. A tag-based
> > system with a single device tree entry of space separated tags. Every
> > tag carries a prefix to denote a category:
> >=20
> > Tag                 Example
> > m:<ModuleName>      m:vc-mipi-imx296
> > v:<Vendor>          v:RaspberryPi
> > l:<Lens>            l:generic-8mm-ircut
> > s:<Sku>             s:B030801
> > u:<user defined>    u:my-selfmade-module
> >=20
> > This is a bit like the existing "label" property which carries a human
> > readable label. So an example for a module could be:
> >=20
> > imx283_0: sensor@1a {
> >               compatible =3D "sony,imx283";
> >     ...
> >     module-info =3D "v:RaspberryPi m:camera-module-hq
> > l:generic-8mm-wide-angle";
> > };
> >=20
> > This leads to the immediate question: Should we split the tags into
> > properties?
>=20
> Yes, make use of the standard utilities before rolling your own format
> please.
>=20
> > imx283_0: sensor@1a {
> >               compatible =3D "sony,imx283";
> >     ...
> >     module-name =3D "camera-module-hq";
> >     module-vendor =3D "RaspberryPi"
> >     module-lens =3D "generic-8mm-wide-angle";
> > };
> >=20
> > Pros: We could try to standardize on some values.
> > Cons: We add a (possibly increasing) number of properties that have no
> > value inside the kernel and will only be populated very sparsely.
>=20
> What value do they have anywhere? ELI5 why anyone cares that the rpi
> foundation made the sensor module, for example. What decisions can be
> made on the basis of it? Not trying to be antagonistic, I genuinely
> don't know what kind of things it affects. The lens type or some sort of
> nd filter info I can understand being useful. That said, and I know very
> little about cameras, some of these things could actually vary at runtime
> right?

I think the difficulty here is that we want to identify something which
we can't even name precisely and we don't yet see the full spectrum of
possibilities. Regarding the question who cares if the RPi foundation
manufactured a module: It is just a way of identifying a specific piece
of hardware. So there are many modules out there using an imx477 sensor,
but they could differ in the geometry from other ones.

A compatible string works well for devices we know. But then you can
quickly come up with cases, where only an aspect or part is known.

- Raspberry Pi Camera Module HQ
  - Lens is unknown
  - So we could start to unroll that
    - rpi,cmarea-module-hq-8mm-lens
    - rpi,cmarea-module-hq-9mm-lens
    - ... that doesn't scale

So we could introduce a module-lens property:
- vendor-a-8mm
  vendor-a-8mm-ir-cut
  vendor-b-8mm
  ... 1000 vendors more

That doesn't scale as well.

I tried to further reason about the underlying targets and why my
gutfeeling doesn't like the compatible.

I see two main targets:=20

1. Finding a solution for well known devices like laptops or phones.
Upstreaming a compatible string per module could work, but we will often
just not know the vendor of the module. So they would be named
(incorrectly) after the manufacturer of the device.

2. Upstreaming overlays for well known camera modules like the ones from
RaspberryPi.  I don't expect that to gain too much traction quickly
because of missing specs for connectors and therefore no way to model a
camera module in dt in a way that works for multiple processing boards.
Still it would be very helpful to be able to write dt overlays for these
modules that work with an upstream kernel without the need for nasty
hacks (like abusing the label property or so).

3. The same applies for full custom solutions where upstreaming
compatible strings will never happen, but we need the overall mechanics.

So in summary I'm looking for a place to put a blob of information
regarding the camera module that is not of any use to the kernel and
only passed on to userspace. Defining a separate node and maintaining
compatible strings seems like a lot of maintenance work for little gain.

Looking for other places to put that information doesn't lead to really
good candidates. One could store it in the software image itself, but
that is a pain as a user would loose it when flashing a new image.

One could put it in a extra partition with the same issues as above and
a huge technical complexity for use cases like the RaspberryPi.

So the devicetree seems to be a good location for it, just that we're
lacking a place to put it there.

I hope that makes a bit of sense.

Best regards,
Stefan

>=20
> On the module name front, it quickly becomes compatible-v2 I think,
> since you're gonna need standardised names for specific modules so that
> decisions can be made on the basis of them. Makes me wonder if you need
> sensors to have an endpoint connection to whatever sits in front of
> them...
>=20
> > Q: Would the dtb maintainers accept such a property?
>=20
> I mean, at first glance the idea itself seems reasonable. The info isn't
> discoverable and some of it seems to be valuable.
>=20
> > A:
> >=20
> > Q: Are there other/better ways to convey that information?
> > A:
> >=20
> > # Links:
> >=20
> > - [1]
> > https://www.linuxtv.org/downloads/presentations/media_summit_2026/Stefa=
n%20-%20Module%20Identification.pdf
> > - [2] https://github.com/systemd/systemd/blob/main/rules.d/70-camera.ru=
les
> > - [3] https://github.com/systemd/systemd/blob/main/hwdb.d/70-cameras.hw=
db
> >
