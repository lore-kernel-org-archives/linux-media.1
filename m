Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC8411F83;
	Wed, 22 Jul 2026 18:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744996; cv=none; b=rGC0Bvg9qAEwYM8hckiJGuZ6NVbm8xdylN95Hf51trQwLVFvlaueTCbmP9Z173Ef929GEH32l+QxWrOA3RerZ4SE6rlXAQmFeZvrL3aZm+GBSBG9tglzP89VBRJ3pF6XMsknBDkoan2qnv1vuV57KEFiHeOI+HLpc1yQMWICmpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744996; c=relaxed/simple;
	bh=7ogeBpkIocufNIb27LJFBqBwT824xovj4Eifj30yY0Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuv5jqNmT9lpB60EVnpsM1276R7PjS4RKGA7Nd+t8vt5z/fCwNsTSPpmXqJJQqC9CBLMifRNnYs58F0Dn29bNLFnVzijFDCz9xJRJaj5ZhJHBDLlTbqNb05PcF2CR3qIlKx/CH7ijZfQZjaXtVXL0FJq++EVLjh/3GHYPkSNoMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MD0hlhNh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MD0hlhNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784744991;
	bh=7ogeBpkIocufNIb27LJFBqBwT824xovj4Eifj30yY0Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MD0hlhNh0kzaDVirBstMFJJqiPKP3u7RE58b3bqXK9LK6RiDXgYq0gmYuM3beXUlt
	 gWWNK8+Ke3Sll/fARMdSz+KT3iwdNAWA1Ng9VvEPaO4MNJRtkP11HGKna6sXOVZKH+
	 k5f7Lhk0ZAnB8M55FDqD3jN/bvgn+y64fbGOzGf4KDSWWyswj1a+57uzaAIDTaD5Zy
	 gGYHLn87tjPq3gFR/Hmaystd/XeaDxn/ugiWufVVfP7hF99lEshu6DBU/UQs+1nXRr
	 2ktIKQeSG5wsRfaevym+RXqsI+H+PNfGIE49t6sep0C66+tfj9WnxQ6Q2qGloN5ch7
	 TTEYjqrDTuhbg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AA8517E09AA;
	Wed, 22 Jul 2026 20:29:49 +0200 (CEST)
Message-ID: <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jiaxing Hu <gahing@gahingwoo.com>, mchehab@kernel.org, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 14:29:48 -0400
In-Reply-To: <20260722073417.2064667-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
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
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XXWEcMDbT8lXfd6RB4xN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-XXWEcMDbT8lXfd6RB4xN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 juillet 2026 =C3=A0 19:34 +1200, Jiaxing Hu a =C3=A9crit=C2=
=A0:
> This is an RFC for a from-scratch mainline V4L2 driver for the H.264
> hardware video encoder (VEPU510) on the Rockchip RK3576.=C2=A0 It is a
> stateful mem2mem encoder (NV12 in, H.264 Annex-B out) modelled on the
> verisilicon/hantro driver, not on the downstream MPP-service model.
>=20
> I'm posting it as an RFC because intra frames work but inter frames do
> not, and I'd like a second pair of eyes on the inter-frame problem
> before this is worth a real submission.

This is really nice to see interest in enabling encoder for this chips set.=
 I'm
adding Detlev in CC here, as he's actively working on RK3588 encoder, which=
 is
quite a similar chip. But there is quite a twist his approach which I'll ex=
plain
shortly.

What I believe I've seen walking through your RFC is an encoder based on V4=
L2
Stateful encoder interface:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-encoder.=
html

While this isn't invalid, specially for encoders, for this type of hardware=
, the
community agreed direction was to introduce V4L2 Stateless Encoder
specification, using the media request and compound controls to maintain a =
lower
level interface for this HW. See Paul's proposal for IMX8MP Hantro VC8000E =
chips
(H.264 only for now):

https://lore.kernel.org/all/20260522101653.2565125-1-paulk@sys-base.io/

The downside is that we need a new spec document for this class of driver t=
o
reach upstream (not part of Paul's series). Plus, for each codec, appropria=
te
encode parameter controls needs to be designed, and they must be proven to =
work
across multiple hardware (generally at least 2). I still think there is a n=
eed
for V4L2 drivers like this. Being high level, they offer a great interface =
to
protect against HW actions that would be harmful to the Linux operating sys=
tem.
Specially when you don't have an IOMMU like the IMX8M Plus. But at the same
time, V4L2 memory model often clash with modern graphic stack, making the
integration quite painful.

Here's the twist to Detlev (and myself) approach. In order to make the kern=
el
module even thinner, and to avoid having to specify new V4L2 interfaces, we
decided to look into making drivers similar to how we do GPU drivers today.=
 This
is possible today thanks to the Vulkan Video standard. So Detlev driver, wh=
ich
finally got P-Frames support few days ago (he'll explain why this didn't wo=
rk
initially for him), is split in two part:

- The kernel module, which expose hardware specific interface (he decided t=
o
implement it in Rust)
- The userspace driver, which he's implementing in Mesa project

What I really like of this approach is that the kernel driver is much more
stable, as it expose the HW at a lower level in a codec agnostic way. For t=
he
final application, the interface is the same regardless if its a GPU attach=
ed
codec or a standalone codec. Its even the same interface if you are on Wind=
ows,
except for the low level zero-copy interop. The rest of the development can
happen in userspace, which is a lot faster to develop and easier to debug.

One thing we notice, is that for performance reason, keeping rate control a=
s
close to the IRQ as possible is important. Its impossible to batch any work=
 if
you have to constantly wait for the previous work to be done in order to co=
mpute
the next set of QP values. For that reason, we plan to eventually share the=
se
in-kernel implementation with V4L2. In our imagination, eBPF could also be =
a
usable option.

I will leave to Detlev to share some early code once he's ready, but consid=
ering
you both are working on the same family of encoder, it would certainly be a=
 lot
nicer if both endup with the same type of drivers. Offering two interface f=
or
the same hardware would impose a lot of extra effort that I would rather av=
oid.

regards,
Nicolas

>=20
> What works
> ----------
>=20
> Intra-only (I-frame) encoding is confirmed on real hardware (Radxa
> ROCK 4D).=C2=A0 With GOP size 1 the driver produces a valid H.264 stream =
the
> reference decoder accepts.=C2=A0 This already exercises the full path: V4=
L2
> m2m, the register programming, the software SPS/PPS prepend, and the
> hardware slice output.
>=20
> There is no upstream userspace involved (an encoder needs no request
> API); I drive it with a small ioctl test program that feeds NV12 frames
> and writes the CAPTURE buffers to a .h264 file.
>=20
> The open problem: inter (P-frame) frames hang
> ---------------------------------------------
>=20
> Every P-frame stalls the encoder's own hardware watchdog (INT_STA bit 8,
> ~20 ms after the kick) and produces essentially no bitstream.=C2=A0 I hav=
e
> spent a lot of time narrowing this; it is sharply localized but I cannot
> close it:
>=20
> =C2=A0 - The P-frame register writes match a real register-write trace of=
 the
> =C2=A0=C2=A0=C2=A0 vendor stack encoding the same content, byte for byte =
(I traced the
> =C2=A0=C2=A0=C2=A0 vendor kernel's writes and diffed against this driver'=
s).
>=20
> =C2=A0 - The reconstruction the previous frame writes is *valid*: dumping=
 the
> =C2=A0=C2=A0=C2=A0 recon buffer after the I-frame shows correct reconstru=
cted pixels.
>=20
> =C2=A0 - If the P-frame reads its own (older, settled) recon slot instead=
 of
> =C2=A0=C2=A0=C2=A0 the immediately-preceding frame's, it completes.=C2=A0=
 Reading the
> =C2=A0=C2=A0=C2=A0 immediately-preceding frame's *fresh* reconstruction a=
s the
> =C2=A0=C2=A0=C2=A0 reference is what hangs.
>=20
> =C2=A0 - It is not FBC: storing the reconstruction uncompressed
> =C2=A0=C2=A0=C2=A0 (enc_pic.rec_fbc_dis =3D 1) still hangs.
>=20
> =C2=A0 - The first frame of a session always works; the first P-frame han=
gs;
> =C2=A0=C2=A0=C2=A0 after a couple of failures + core resets, later frames=
 sometimes
> =C2=A0=C2=A0=C2=A0 start completing.=C2=A0 It behaves like a warm-up / se=
ttling problem on
> =C2=A0=C2=A0=C2=A0 the reference-read path, not a wrong register value.
>=20
> So the encoder programs identically to the vendor and reads a valid
> reference, but stalls fetching the previous frame's reconstruction as
> the inter reference on the first inter frame of a session.=C2=A0 My best
> guess is that the vendor does something between consecutive frame
> submissions -- a completion/drain wait, a cache/coherency step, or a
> per-frame re-arm -- that I am missing, but I have not found it.=C2=A0 If
> anyone recognizes this on VEPU5xx, or knows what the reference-read path
> needs between frames, a pointer would be very welcome.
>=20
> The shape of this -- the first operation of a power session works, the
> next stalls, and a reset/warm-up sometimes helps -- is the same one I
> ran into bringing up this SoC's NPU (accel/rocket RKNN), where the
> second/chained submit in a session would not fire [1].=C2=A0 I can't clai=
m
> they share a root cause, but if this is a known RK3576-wide submit /
> re-arm quirk rather than an encoder-specific bug, that would be good to
> know.
>=20
> [1] https://lore.kernel.org/all/20260718031146.3368811-1-gahing@gahingwoo=
.com/
>=20
> Notes for review
> ----------------
>=20
> =C2=A0 - The PARAM/SQI register classes are programmed from mpp's constan=
t
> =C2=A0=C2=A0=C2=A0 "default tuning" tables (not derived per-frame), as no=
ted in the
> =C2=A0=C2=A0=C2=A0 code.=C2=A0 They are required: leaving them unwritten =
stalls even the
> =C2=A0=C2=A0=C2=A0 I-frame.
>=20
> =C2=A0 - Rate control is fixed-QP only for now (the bitrate control is
> =C2=A0=C2=A0=C2=A0 advisory).
>=20
> =C2=A0 - H.264 baseline/main, single slice, 4:2:0 only.
>=20
> =C2=A0 - Tested at 176x144; other resolutions are not yet validated.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
>=20
> Jiaxing Hu (3):
> =C2=A0 dt-bindings: media: add Rockchip RK3576 VEPU H.264 encoder
> =C2=A0 media: rockchip: add VEPU510 H.264 encoder driver for RK3576
> =C2=A0 arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes
>=20
> =C2=A0.../bindings/media/rockchip,rk3576-vepu.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 94 ++
> =C2=A0arch/arm64/boot/dts/rockchip/rk3576.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 50 +
> =C2=A0drivers/media/platform/rockchip/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rkvenc/Kconfig=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 14 +
> =C2=A0drivers/media/platform/rockchip/rkvenc/Makefile=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0=C2=A0 6 +
> =C2=A0.../media/platform/rockchip/rkvenc/rkvenc-h264.c=C2=A0=C2=A0 | 1095
> ++++++++++++++++++++
> =C2=A0.../media/platform/rockchip/rkvenc/rkvenc-regs.h=C2=A0=C2=A0 |=C2=
=A0 929 +++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rkvenc/rkvenc.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 892 ++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rkvenc/rkvenc.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 212 ++++
> =C2=A010 files changed, 3294 insertions(+)
> --
> 2.43.0
>=20

--=-XXWEcMDbT8lXfd6RB4xN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCamEMHAAKCRDZQZRRKWBy
9IQsAP97F8TiDvCpd8MPCAYppalOLVR+6bo5YculruVs2yACqwEA73InRBRrajrb
Y+bYUq3c5TeCggPz7SXo053SFuZqswA=
=I3ME
-----END PGP SIGNATURE-----

--=-XXWEcMDbT8lXfd6RB4xN--
