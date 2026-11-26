Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795704482;
	b=UhKORsj97HcjEkMTtEt5YZnCUJQvBEaNMAvz3UTJXQQzbH2oJJndXtmvtJWhC/kNr8gk
	 Ht8Z+hiUZq+OBOChQjviBfZUFscmwjIVeKy9F2sXc866xnE8ldrmGkiXbMRMXnE3kMPE3
	 mqO2b+aaOQikjgPlEZfs1ML7eKrtDPI4J6ByTX+/7csXL+UjEhv+RITJhayyqNGHK7Ejn
	 O+GhYHCr5/V9H+ijaX7UYk+X9SEaVdgVvC2/SKxu4fs8D+baw06uDcqlSf1CrX7syaSfA
	 CtZoD2UgmNg7/JRQoF5OdCIQKuwwMNjdLvWerclpCpu+SW0ZeoTGEZNVDOSJU+qoiBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704482;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:Subject:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CwSn3IxPnWQnNuEMWigXgquDOhOEOJkNnTuCOP0I400=;
	b=ngxTPmW4ksUOzAeKUPT5EUN534KOXkYZeDixmwXSUKD7YSjv3FhxqxOlzWfK8TkyM8u4
	 PI3qNjEZSWHTa1udiMeOKs+EqbTa7q3VK8mDHlXlZa0HZRCDkqN1m0gIjY6V7BQmaL9dT
	 1XTV8E/xf3CsETZThzbJ4Pihw/hucNCCNhMXZpvmpTCcP1dL5fwOqAdffxTuLNnz41T7H
	 fkJRtiiIymDBayNZDtTalpmbn4hnoFgG8HjOP83VkViAABuzhYp2lm+iS9rWYosFKZrME
	 S2Pk5lQQuYzAAolch7r4dJO1uUqzHsOeCNljKKKiorG6Y1nyw6OklxRS1Hnyp9knNGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b="bYajAI/I";
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09681606A31E;
	Thu, 26 Nov 2026 14:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09681606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bYajAI/I
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 150E7200509;
	Thu, 26 Nov 2026 15:47:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795704479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwSn3IxPnWQnNuEMWigXgquDOhOEOJkNnTuCOP0I400=;
	b=bYajAI/IsMcgPwVKbmzV1C2VEFHKncFPeMKWUYz3Fbzh+bPnqUDSzIzQhx7dBhYoN8B6HE
	w/avMgyXjGpbhljnE8DcRaSNgXUknPJW5//lJrWP2pTu9nwdgz9kD2VY+t/8oT7AaBZot/
	7sgWmZQxvmR75fWZFz9h6vOt9kld1KxZPkt35vucKNjZnaNHA/9OZ6zZqMNBTw/0POfEXO
	k8ITLZjERy6vnl4BcY1Lk6Omr7wyCmgdxucCDzABvviWnrJ40Lp1Fgzv6tUgbzwZCjozti
	O9cDr2EUlLz/jo3PmVL95YCRve7G5jSZBGHNwycbDoTxE6V522vATosrvvhBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795704479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwSn3IxPnWQnNuEMWigXgquDOhOEOJkNnTuCOP0I400=;
	b=bMxE2pAfkjuYOU8JXx17mkmz0Wpo1GrA1s0dSUR19VscEfYiqyEfs6Z8OMVLA59ELxCk47
	kHH+HDP7dPAKNpn9hkuQgNA6eHTGJ80GpC9SCkfv/Tsi7nAjT0AMHmZz3TdxDEfnoG8pOv
	FB2VPxi9i6NL2ODawYaqy8ZZJRW4vkBb0vE8dJjeunOp9vM3LLp/7PEcwFRsglmffmlTij
	J7SFHESrM7XzSZU5nnupDMPykTshvDJPQ2My8344MOIsAphZFSjBlaRGpEplmNsog92uhI
	AkDXSFg8wElO7Rt63paCm4b0J6bGcvmU5TGu6U8F0DxmHXey4P8decFnQNx1HA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795704479; a=rsa-sha256;
	cv=none;
	b=d2ILFSzrXVxsxurlL6rz4hrNp1SV0/ovD5q3PfTA+KoJX6TiY0vYZ1T3PZ4gz6hccwg1lt
	5HL2FEvlhtfjAcTHWofQTIg979QG8ApWapNB16xrAJtJIN9eTiPYF6+iy3xapW6iGfANjX
	6kBIf1BUV4WODK/IlV3LceA72Ai519c0N6+RL+7Qe7EroUEmSS2/LNSo5EbexE7ldXv00C
	UwjUW+aX3yhanFu+MlhXLHoNcaD2BmNYaCWH1NGRBONTgIR19UYnETL5a9Wfi/RDSCYhje
	D3JZQ+iCK1KHi83OMqBCdZ4WRKjr6M7H29DupVo1MxDHINW+SYrfWRyv44N1dw==
Message-ID: <2445b4e1-9aa7-46fa-bc97-5c0048532f05@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 0/9] media: synopsys: hdmirx: support an HDMI bridge
 in front of the receiver
To: "Hans Verkuil" <hverkuil+cisco@kernel.org>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Dingxian Wen" <shawn.wen@rock-chips.com>, "Shreeya
 Patel" <shreeya.patel@collabora.com>, "Gerald Loacker" <gerald.loacker@wolfvision.net>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Conor
 Dooley" <conor.dooley@microchip.com>
In-Reply-To: <3a633b4a-8b48-42d3-b197-05cad11f7f71@kernel.org>
References: <20261116-hdmirx-media-v4-0-7aee4a0a273e@pengutronix.de>
 <3a633b4a-8b48-42d3-b197-05cad11f7f71@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 14:47:58 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list

Hi Hans,

On 2026-11-25 19:47, Hans Verkuil wrote:
> Hi Sascha,
>=20
> On 16/11/2026 16:19, Sascha Hauer wrote:
> > The Synopsys HDMI receiver driver assumes the HDMI connector belongs to
> > it: the connector's +5V line arrives on hpd-gpios, and there is nothing
> > between the source and the receiver. On the board this series comes from
> > that is not the case. An HDMI bridge owns the connector, the receiver
> > sits behind it, and the two are described by an OF graph endpoint.
> >=20
> > Three things follow from that, and the series is arranged in that order.
> >=20
> > Patches 1-2 give the driver a media device and register the video device
> > as an entity with a sink pad. On their own they add a graph with one no=
de
> > in it; they exist so that there is somewhere for the bridge to appear.
> >=20
> > Patches 3-4 add the endpoint to the binding and bind the remote subdev
> > through a v4l2 async notifier, linking its source pad to the receiver's
> > sink pad. Such a board cannot provide hpd-gpios, so the binding requires
> > either hpd-gpios or the port. Without an endpoint in the device tree the
> > driver keeps working exactly as before, so boards wired straight to the
> > connector are unaffected.
> >=20
> > Patch 5 is fallout from the wait for signal lock, which was bounded by =
an
> > iteration count whose duration came from the 5V debounce it called
> > each time round. That debounce goes away on a board with no hpd-gpios
> > later in the series, so the wait gets a real timeout first.
> >=20
> > Patches 6-9 are the 5V state itself. Patch 6 stops probe requiring an
> > interrupt for hpd-gpios. Patch 7 makes v4l2_device_unregister_subdev()
> > wait for notifications already in flight. Nothing kept a subdev from
> > notifying a v4l2_device that was unbinding it; that is not new with this
> > series, as asynchronously bound subdevs sending V4L2_EVENT_SOURCE_CHANGE
> > race the same way today. Patch 8 adds V4L2_DEVICE_NOTIFY_RX_POWER_PRESE=
NT,
> > and patch 9 has the receiver set v4l2_dev.notify and take the state from
> > whatever is bound in front of it. The notification is only an edge, as
> > the 5V interrupt is with hpd-gpios: the hotplug worker then asks the
> > subdev through g_input_status(), so nothing is cached that could go
> > stale against bind or unbind. Without a det_irq there is nothing to
> > disable across suspend and remove either, so patch 9 disables the
> > hotplug work items themselves instead of cancelling them. Patch 7 is
> > what lets the notify callback read sd->v4l2_dev while the subdev is
> > being unbound.
>=20
> So I would like to merge patches 1-6, but take more time reviewing 7-9.
>=20
> So those may or may not go in in time for the next rc1. Would that be
> OK with you? Or do you prefer that I just wait with that?

I am happy with patches 1-6 going upstream now. I'll then send a rework
for patches 7-9 only next time.

>=20
> I'm not really happy with patches 7 and 9, but I can't put my finger on t=
he
> 'why' yet. Well, other than that it feels overly complicated. I think that
> AI did part of the work, since it definitely has that feel: long and some=
what
> rambling commit logs, use of rarely used APIs (scru), etc.

I'll shorten the commit messages, they are really too long and not to the p=
oint.

>
> Perhaps look into rewriting the commit logs for 7 and 9, and see if there
> is an easier-to-understand implementation for patch 7.

Patch 7 isn't grown on my own motivation, it goes down to a sashiko finding
here:

https://sashiko.dev/#/patchset/20260923-hdmirx-media-v1-0-ea3d77d4a5f3@peng=
utronix.de?part=3D9

An alternative approach would be to forbid calling v4l2_subdev_notify()
from unregistered subdevices. struct v4l2_subdev_internal_ops has
(un)registered hooks which subdev drivers could use to stop sending
notifications. That would require fixing some drivers though. Would you
prefer that?

> It might also be better
> to move patch 7 to the end since it is really independent of the other ch=
anges.

Ok.

Regards,
 Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

