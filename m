Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754170;
	b=Z/4DA3vo8uMbKRvRq2j2uMi0fdy1mwEp34oWusEo9SAjuXfua7MVrnjkOwyJhLNAvQVm
	 HFmAFQWFS8Jf7L2r6DJT4KIf+Lg/fWotM5WSwEFVy9RZPmQkhgof1vYKKITXbCPdgxn8O
	 e/sS1yuRy/ts/DEapyJSZ1B73dihHW9vb4BIRIQlBUkFvKK4544+wyIuU/Vvucp256Cpg
	 LxmPy7jONvI9Z8EVaoTTGJefqGjCnPx3aQlVK9oeVsSckicg/H95HjSVMsC/1KqSneQuz
	 QfZeb9+NurFrEwUCrhqQj7Hbfyi6YL9hVCgRin60HExx5c6BI6SQP3Jbr9J6DtUVCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754170;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Date:
	 Autocrypt:Organization:Content-Type:User-Agent:MIME-Version;
	bh=UshF6kxXrpkdFi3N77M4KUaNziETcSmXK18Pvgta7bs=;
	b=k3gljnmBpVSkTTHYxDO0sNO0CuHj+GoKGoFtqnsaTqZEEKPJeoag1Ys+MKtWNvTOaZ0k
	 TDPDsr/RabhQU0dRQ4/GDRNA3Yrb93/AIbVcjt2jHUdhFeScmB4MJm2OBp9F5HvbEzRV6
	 7/VScFftZCBT29ev+TOeymIN50ZpGycu3HOUhxNOGauNF7gwkrOma/I8/i8f2t5w6VVVi
	 3RvkoyKXbbdwuR3489hzOPBEVw+oMhr8OAjUEG55+tdlVHoiorM1HlWcSKJpmRHkus0C1
	 0VyTQxgfqGBzG1n9aM5UM2CFb3EugajTIiMj1TG7KghW6Dc6BnlwT+TKd4Ac6FpvBdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="kUUfHbT/";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C453606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 04:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C453606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kUUfHbT/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795754168;
	bh=T+8C+sXRiyVkg2wOeEbJm+6GKjP5lEg47RoxXXenqLA=;
	h=Subject:From:To:Date:From;
	b=kUUfHbT/JDJKxX/Tmzf8s00tCAYhNIL7AIXNX+LgnQdLQ9exgoJTQ5mwVFmvxxGKs
	 rC4anSne6LMNwoqzQvPjhnGksF5nDOX45baCowLC88Pa2LrLE2WN4tAcHO+TFn8E2+
	 Qub1U+XNl3LivFXnpV1KinsLSpRZrH9jdKmHgd6JwADMiSrVPlx7iYTIpqbxHrAscW
	 +DyrqosX0VHStpct9wesAjGhhKLE+JPe+V3ZT2Hv6o1qm7QdyzkGLX0oJ9OvebYrKE
	 or6Yq/rMFbcNgdZ7g5An0TE6eA6J7DJZ3wNSvpKqkQTmHDlNhNktu4z0Mb7gx7gV1V
	 3uqh68C4TZq1A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6A3017E005B
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:36:07 +0100 (CET)
Message-ID: <2d28cd895d4a61025b2bcd198751b8f3a45f27da.camel@collabora.com>
Subject: [GIT PULL FOR 7.5] Media codec for 7.5 2026-11-26
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Thu, 26 Nov 2026 23:36:05 -0500
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
	protocol="application/pgp-signature"; boundary="=-ltWEsewMUovkmOOMxMH/"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-ltWEsewMUovkmOOMxMH/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

Here's a batch of what I'm managed to collect, it includes mostly
fixes across all codec drivers plus some cleanup and refactoring
in the Hantro driver. I've managed to process about a quarter of
my queue, I really need people to do more reviews.

cheers,
Nicolas


The following changes since commit b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4=
:

  media: v4l2-ctrls: set handler error if array allocation fails (2026-11-2=
5 11:31:43 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git tags/for-7=
.5-media-codecs-2026-11-26

for you to fetch changes up to e71589c6a44e5c1dd03eeaf93a9c4fd9de4f3bab:

  media: verisilicon: mpeg2: Use alloc/free helpers for auxiliary buffers (=
2026-11-26 22:37:42 -0500)

----------------------------------------------------------------
Media CODEC and M2M fixes

----------------------------------------------------------------
Alex Kazinsky (1):
      media: rkvdec: Handle interrupts without a current context

Alfie Varghese (1):
      staging: media: meson: vdec: propagate devm_clk_get() errors

Arun Iyengar (7):
      media: verisilicon: Limit the i.MX8MM G1 decoder to 1920 pixel wide p=
ictures
      media: verisilicon: Support holding the CAPTURE buffer for MPEG-2
      media: verisilicon: Find the second MPEG-2 field without top_field_fi=
rst
      media: verisilicon: Don't offer VP8 above 1080p on the Rockchip VDPU2
      media: verisilicon: Check every VPU981 AV1 tile column buffer before =
reusing them
      media: verisilicon: Reject AV1 frames without tiles
      media: verisilicon: Reject AV1 frames larger than the CAPTURE format

Benjamin Gaignard (14):
      media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
      media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
      media: verisilicon: Remove useless internal fields
      media: v4l2-ctrls: validate AV1 reference frame index
      media: verisilicon: Use V4L2_AV1_PRIMARY_REF_NONE and V4L2_AV1_REF_FR=
AME_INVALID
      media: verisilicon: AV1: Fix luma size
      media: verisilicon: Create AV1 helper library
      media: verisilicon: Add helpers to allocate and free auxiliary buffer=
s
      media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
      media: verisilicon: h264: Use alloc/free helpers for auxiliary buffer=
s
      media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffer=
s
      media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
      media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
      media: verisilicon: mpeg2: Use alloc/free helpers for auxiliary buffe=
rs

Brandon Brnich (4):
      media: imagination: e5010: Fix clk never enabled without CONFIG_PM
      media: imagination: e5010: Update e5010_init_device Call Sites to Ens=
ure Proper Device State
      media: imagination: e5010: Enable autosuspend for runtime PM
      media: chips-media: wave5: Account for sizeimage 0 case

Caio Vinicius Ferreira (1):
      media: cedrus: fix typo in comment

Hyunjung Ko (1):
      media: coda: fix out-of-bounds read when parsing H.264 SPS profile

Igor Velkov (2):
      media: rkvdec: Do not keep the clocks enabled from probe
      media: rockchip: rga: Keep the clocks enabled without CONFIG_PM

Jernej Skrabec (12):
      media: sun8i-di: Don't sleep while waiting for coefficient access
      staging: media: cedrus: free MV-col buffers in buf_cleanup
      staging: media: cedrus: reject too large H.264/HEVC SPS
      staging: media: cedrus: h264: mark long-term references in the frame =
info
      staging: media: cedrus: mpeg2: use the field height for field picture=
s
      staging: media: cedrus: mpeg2: derive the field order of field pictur=
es
      staging: media: cedrus: mpeg2: fix the references of field pictures
      staging: media: cedrus: validate VP8 frame size
      staging: media: cedrus: vp8: use the vendor probability table size
      staging: media: cedrus: h616: use the 256-bit DDR mode
      staging: media: cedrus: h264: clear the DRAM buffer sizes on start
      staging: media: cedrus: vp8: support frames wider than 2048 pixels

Jiale Yao (1):
      media: mediatek: vcodec: NUL-terminate debugfs input

John O'Callaghan (1):
      media: meson: vdec: reset the VLD before H.264 decoding

Lukas Splavec (1):
      media: rkvdec: Use dma_map_resource() to map RCB SRAM buffers

Marco Felsch (1):
      media: hantro: use hantro_decoded_buffer only for dst_vq

Mariia Nikitash (1):
      media: verisilicon: Replace strlcat() with scnprintf()

Ming Qian (1):
      media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION for VC1L

Mukesh Ojha (1):
      staging: media: cedrus: Use devm_of_reserved_mem_device_init()

Myeonghun Pak (1):
      media: imagination: e5010: release m2m device on probe failure

Rob Herring (Arm) (1):
      media: dt-bindings: mediatek,vcodec-subdev-decoder: Fix child node if=
/then schemas

Runyu Xiao (1):
      media: mediatek: vcodec: Initialize context lock before firmware setu=
p

Sang-Hoon Choi (1):
      media: coda: store context ID before error cleanup

Sascha Hauer (3):
      media: verisilicon: Fix the cleanup when a codec ->run() fails
      media: verisilicon: Complete the request on the ->run() error paths
      media: verisilicon: Allow the EOS event to be subscribed

Sergei Khomenkov (2):
      media: verisilicon: postproc: fix the G1 input height extension
      media: verisilicon: suspend the device before unregistering it on rem=
ove

Thomas Fourier (2):
      media: coda: clear m2m_dev after releasing it in coda_fw_callback()
      media: ti: vpe: fix double free after video device registration failu=
re

Thorsten Lannynd (1):
      media: chips-media: wave5: Add system suspend/resume support

Valerii Bokov (1):
      media: rkvdec: vdpu383: configure the reference read cache

 .../media/mediatek,vcodec-subdev-decoder.yaml      |   77 +-
 .../devicetree/bindings/media/nxp,imx8mq-vpu.yaml  |   10 +-
 drivers/media/platform/amphion/vdec.c              |    2 +-
 .../media/platform/chips-media/coda/coda-common.c  |    4 +-
 .../media/platform/chips-media/coda/coda-h264.c    |   17 +-
 .../platform/chips-media/wave5/wave5-helper.c      |   12 +-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |   30 +
 .../media/platform/imagination/e5010-jpeg-enc.c    |   91 +-
 .../media/platform/imagination/e5010-jpeg-enc.h    |    1 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c      |    5 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c   |    2 +-
 drivers/media/platform/rockchip/rga/rga.c          |    5 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |   30 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |    2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |    2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-regs.h |   16 +
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   78 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    6 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |    4 +-
 drivers/media/platform/ti/vpe/vpe.c                |    6 -
 drivers/media/platform/verisilicon/Makefile        |    7 +-
 drivers/media/platform/verisilicon/hantro.h        |   14 +-
 drivers/media/platform/verisilicon/hantro_av1.c    |  762 ++++++++++++++
 drivers/media/platform/verisilicon/hantro_av1.h    |   64 ++
 ..._av1_entropymode.c =3D> hantro_av1_entropymode.c} |   18 +-
 ..._av1_entropymode.h =3D> hantro_av1_entropymode.h} |   18 +-
 ...chip_av1_filmgrain.c =3D> hantro_av1_filmgrain.c} |  125 ++-
 .../platform/verisilicon/hantro_av1_filmgrain.h    |   48 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   93 +-
 .../platform/verisilicon/hantro_g1_h264_dec.c      |    4 +-
 .../platform/verisilicon/hantro_g1_mpeg2_dec.c     |    8 +-
 .../media/platform/verisilicon/hantro_g1_vp8_dec.c |    4 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c      |    9 +-
 .../media/platform/verisilicon/hantro_g2_vp9_dec.c |    2 +-
 drivers/media/platform/verisilicon/hantro_h264.c   |   13 +-
 drivers/media/platform/verisilicon/hantro_hevc.c   |  133 +--
 drivers/media/platform/verisilicon/hantro_hw.h     |   17 +-
 drivers/media/platform/verisilicon/hantro_mpeg2.c  |   51 +-
 .../media/platform/verisilicon/hantro_postproc.c   |   23 +-
 drivers/media/platform/verisilicon/hantro_v4l2.c   |   52 +-
 drivers/media/platform/verisilicon/hantro_vp8.c    |   36 +-
 drivers/media/platform/verisilicon/hantro_vp9.c    |   42 +-
 drivers/media/platform/verisilicon/imx8m_vpu_hw.c  |  175 +---
 .../platform/verisilicon/rockchip_av1_filmgrain.h  |   36 -
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c        |    4 +-
 .../verisilicon/rockchip_vpu2_hw_jpeg_enc.c        |    4 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c       |    8 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c         |    4 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 1085 +++-------------=
----
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |   15 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   30 +
 drivers/staging/media/meson/vdec/codec_h264.c      |    8 +
 drivers/staging/media/meson/vdec/vdec.c            |   10 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   40 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   49 +
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c   |   66 +-
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c   |   34 +-
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |   23 +-
 drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c  |   74 +-
 drivers/staging/media/sunxi/cedrus/cedrus_regs.h   |    8 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c  |   15 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.h  |    5 +
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c    |   72 +-
 include/uapi/linux/v4l2-controls.h                 |    2 +
 64 files changed, 2034 insertions(+), 1676 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c =3D>=
 hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h =3D>=
 hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c =3D> h=
antro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain=
.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgra=
in.h

--=20
Nicolas Dufresne
Principal Engineer at Collabora

--=-ltWEsewMUovkmOOMxMH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawkItQAKCRDZQZRRKWBy
9LEwAP9/H/WDmZbtq9yygOJSIGdaRXhOqARUgSJfCgtLCm0IWAEAiDbRlaX40U9R
3SR62YkaEKU6Pdx7xfXCamfXTqyG4gg=
=KjsR
-----END PGP SIGNATURE-----

--=-ltWEsewMUovkmOOMxMH/--
