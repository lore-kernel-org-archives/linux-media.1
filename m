Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7BC25B0B8
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255364; cv=none; b=EyO8IIqN99qWJ13261k1KjHqocejOjP8HH1hQfrb3F/G1uGX7UosjFPzMfc86s+jPs0ab6ddq497EVjaPI88Lz8mRqhHULVjgYrXY7NCi6Pa5LjatGStrD+qTyvtWqRnPFZaQdVVZEQ0Cnvy+3S/Bz61BL2LWPU8P5lPjWMGAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255364; c=relaxed/simple;
	bh=SZFO+VczdZ215XdPuWayizGlDoFxBQ57VTOTtFjDFN4=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=XbvvDl8cHTLgYPDVxEFaU9iHNTYcsWcxld9X333a//LtNRNX4hbt6zhdTOKgED/g0ewlIlelCLNri6d+6fotSlrQ/NoY8+Kp0UGK/xNhYILJkA2L3aPuaEbuEiHLcm30Q7IWRzrKZ8zM8oDbqwtrdONzZj6dcWmSZtgWF2V7CeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O5rJE+YB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O5rJE+YB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784255361;
	bh=SZFO+VczdZ215XdPuWayizGlDoFxBQ57VTOTtFjDFN4=;
	h=Subject:From:To:Date:From;
	b=O5rJE+YBuKXzB65wFIwiOqMWE5X/P228o/pTI1UV4getbWbJcZH1bXbTskhe3cJF1
	 qHFqjTdRngtHaNfqD8muc5+PIeXtjAKZ+pLbrBuq84xd6yH+USrdun/wBWxQTZf7+p
	 I0M3aS1ykjlaIOFgPuF7BsVHXN5LRGH3fPoqIEBETM40wOgDNQxcQ1qIrjv+bbxafh
	 DO7U41fdVLtyqBnjgLyUPA/wrwBJ/aTG991qZbjux/5aVg3V9iwVTbMjfPAP47fNEf
	 w+QX2PFXPce7L6AxqLQEGOO71R6dUjFQ+WQGMBPP2/m4RW0Vl3wpzeQVQb6BsmtEsa
	 8NE4jEyNB22ug==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B2FEC17E010F
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 04:29:20 +0200 (CEST)
Message-ID: <bc418ee4db84949cd0c78a729d46e35cc65282de.camel@collabora.com>
Subject: [GIT PULL FOR 7.3] Media codec for 7.3 2026-07-16
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Thu, 16 Jul 2026 22:29:19 -0400
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
	protocol="application/pgp-signature"; boundary="=-braSvAXfnsNE9O2A+wPL"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-braSvAXfnsNE9O2A+wPL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

This PR cocntains a collections of fixes across codecs and m2m drivers.

cheers,
Nicolas

The following changes since commit 42f83a32259a82c4481d3cccf560c3bfeb32c892=
:

  dt-bindings: media: i2c: Add Sony IMX678 (2026-07-15 23:16:20 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7=
.3-media-codecs-2026-07-16

for you to fetch changes up to 6fd034a6bca8c00aeab914c22cc6f3553bbdb719:

  media: chips-media: wave5: Resume device before setting EOS flag (2026-07=
-16 22:21:27 -0400)

----------------------------------------------------------------
Media codec and m2m fixes

----------------------------------------------------------------
Biren Pandya (1):
      media: platform: hantro_drv: Add missing media_entity_cleanup()

Christian Hewitt (1):
      media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common

Dawei Feng (1):
      media: cedrus: fix memory leak in cedrus_init_ctrls()

Guangshuo Li (1):
      media: platform: mtk-mdp3: Fix SCP device refcounting

Haoxiang Li (2):
      media: mediatek: vcodec: remove redundant return value of vdec_vp9_sl=
ice_setup_lat_buffer()
      media: mediatek: vcodec: remove redundant return value of vdec_vp9_sl=
ice_setup_prob_buffer()

Hiroki Nakajima (1):
      media: rkvdec: use DIV_ROUND_UP() for CTB counts

Jackson Lee (7):
      media: chips-media: wave5: Guard bit depth check with initial_info_ob=
tained
      media: chips-media: wave5: Set inst->std during default format initia=
lization
      media: chips-media: wave5: avoid skipping device_run while VPU has wo=
rk
      media: chips-media: wave5: Add timeout while stop_streaming
      media: chips-media: wave5: Defer job_finish() only when a DEC_PIC was=
 queued
      media: chips-media: wave5: Fix pipeline stall when queuing fails
      media: chips-media: wave5: Resume device before setting EOS flag

Jason-JH Lin (2):
      media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
      media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to cmdq_pkt_jum=
p_rel_temp()

Johan Hovold (1):
      media: platform: mtk-mdp3: fix NULL deref on failed SCP lookup

Michael Bommarito (3):
      media: rkvdec: hevc: tighten EXT SPS RPS control dimensions
      media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
      media: rkvdec: hevc: guard INTER_REF_PIC_SET_PRED index underflow

Ming Qian (1):
      media: amphion: Remove obsolete frame_count check in venc_start_sessi=
on

Narasimharao Vadlamudi (1):
      media: rkvdec: Propagate platform_get_irq() errors

Sven P=C3=BCschel (1):
      media: rockchip: rga: don't change RGB quantization

 drivers/media/platform/amphion/venc.c                                     =
|  2 --
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c                  =
| 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++------------
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c                  =
|  6 ++++--
 drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h                =
|  2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c                      =
|  6 +++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h                      =
|  6 +++---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c                      =
|  6 +++++-
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c =
| 29 +++++++++--------------------
 drivers/media/platform/rockchip/rga/rga3-hw.c                             =
| 12 ++++++++----
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c               =
|  3 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c                      =
|  4 ++--
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c              =
|  8 ++++----
 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c              =
|  8 ++++----
 drivers/media/platform/rockchip/rkvdec/rkvdec.c                           =
|  8 ++++----
 drivers/media/platform/verisilicon/hantro_drv.c                           =
| 12 +++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c                                 =
| 15 +++++++++++++++
 drivers/staging/media/meson/vdec/vdec.c                                   =
|  4 ++--
 drivers/staging/media/sunxi/cedrus/cedrus.c                               =
|  4 +++-
 18 files changed, 131 insertions(+), 68 deletions(-)

Nicolas Dufresne
Principal Engineer at Collabora

--=-braSvAXfnsNE9O2A+wPL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalmTfwAKCRDZQZRRKWBy
9KjcAP9j3AUnO24E9gpV1yr4gBKJqn/XGVj0OdYRkQTphiGkbQEAkIA0m4dMdX9s
UvuVPBJ4TlkNHdc8bILJQrqAV7u0JQ4=
=GocE
-----END PGP SIGNATURE-----

--=-braSvAXfnsNE9O2A+wPL--
