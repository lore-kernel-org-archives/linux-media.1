Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3FE37C11C
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791120529; cv=none; b=nYqFaashzLXInrz9RJQikZQ3wfhlk6tCnnZGa/tf5Yc9KmAo9hprtUq0ae4MTsBxzo3L61PlKbYnpaYaPnbbiafG4jekrJbWTf33MMU/Ezq7m4ubST0Ks3PWP/wdoEt9AiCgJr/0660V1FAbLO9mqCX+51ApGw6eH7fvd9gEVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791120529; c=relaxed/simple;
	bh=igtX11rznVNW40opqt1lr0gcUFnIz3IQHnzqrsrXH0g=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=KgrIJt74uEMvXnAHbjvUyat/LbLbCeQzQAuEmkhwEqNKz2/k+FXjKXHAPw3dtMrVB1U7ESO7VkvvJ72mJbQBMDIck/KKLkS62uqqUkTDs5aFDpQWBtsrbhzP2KpCcJbHq5VqeQo/5vAxKIptCPd522K91pcp7K67m+mGw+NvUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fzwD/+Vi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fzwD/+Vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791120525;
	bh=igtX11rznVNW40opqt1lr0gcUFnIz3IQHnzqrsrXH0g=;
	h=Subject:From:To:Date:From;
	b=fzwD/+ViqEuoHfiXuD/B1AYWvCyoesK6gIcmcKT3RPHjvPq68RIAXFu8Vkn9rOuk3
	 jxJpKv1V8BjnNS/jpGCyskBJULqo313pq1U7NzrmArbhcCF2UibJKnQ/tnaP36m/1e
	 XnRCsrInGEuq2j/LGzEvlYaYPejn1IuGvUvt2Sc/JTuDXRS5zUdY8KTP+3cUepFvZY
	 ZwHZlBXPL2YWxWutBqv9cR8Mt+J7nEBa74dujbRKKC4vbDe7R/PZzCTtkeuSawkZZE
	 d4C0/jUoTPKCjW41+8p7O7GUZczFsM4gpPpSjTw83vXC1mVDB5r2ydbzFPJaUYIZJx
	 oMbnZ2ReyBLsA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EBD817E09A2
	for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 15:28:45 +0200 (CEST)
Message-ID: <7159fb1d4cb629864162268b109924dcbd5f4902.camel@collabora.com>
Subject: [GIT PULL FOR 7.4] Media codec for 7.4 2026-10-04
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: linux-media@vger.kernel.org
Date: Sun, 04 Oct 2026 15:28:44 +0200
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
	protocol="application/pgp-signature"; boundary="=-p9tPhciFeFQwT4zdM3AJ"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-p9tPhciFeFQwT4zdM3AJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mauro, Hans,

I've picked all the reviewed fixes I had and added codec support for Allwin=
ner
H616 and JPEG support for Mediatek MT8189. There is a lot more (around 160
patches) in the queue, but most of them have had no review and will likely =
need
new revisions.

cheers,
Nicolas


The following changes since commit 9a4dd8147c7a45e8579e58c101c25604e51117b0=
:

  media: ipu6: Fix bus device use-after-free (2026-10-03 23:57:15 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/ndufresne.git/ tags/for-=
7.4-media-codecs-2026-10-04

for you to fetch changes up to 3b9b962a48fd5fe6b6d0267d903f96f98983b852:

  media: hantro: disable runtime PM before hardware teardown (2026-10-04 14=
:30:59 +0200)

----------------------------------------------------------------
Media codec small changes

----------------------------------------------------------------
Chen-Yu Tsai (4):
      dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count for H6
      dt-bindings: media: sun4i-a10-video-engine: Fix SRAM count for H6
      dt-bindings: media: sun4i-a10-video-engine: Add H616 compatible
      staging: media: sunxi: cedrus: add H616 variant

Diederik de Haas (3):
      media: rkvdec: Remove redundant dev_err()
      media: rkvdec: Switch to modern PM_OPS
      media: rockchip: rga: Switch to modern PM_OPS

Fan Wu (3):
      media: rockchip: rga: quiesce IRQ before releasing m2m state
      media: mediatek: vpu: free IRQ before destroying watchdog workqueue
      media: s5p-mfc: use timer_shutdown_sync() for the self-rearming watch=
dog

Frank Li (1):
      media: m2m-deinterlace: replace direct ->device_prep*() calls with st=
andard DMA engine API

GUO Ren (XuanTie) (1):
      media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX

Guangshuo Li (4):
      media: chips-media: wave5: Check decoder qbuf runtime resume
      media: rkvdec: do not destroy borrowed SRAM pool
      media: mediatek: vcodec: destroy core workqueue on remove
      media: mediatek: vpu: release reserved memory on remove

Jianhua Lin (3):
      dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible stri=
ng
      dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible stri=
ng
      media: mediatek: jpeg: add compatible for MT8189 SoC

Jiawen Liu (1):
      media: amphion: fix runtime PM imbalance on probe failure

John Keeping (1):
      media: rockchip: rga: fix rotation on rev0 hardware

Junrui Luo (1):
      media: vicodec: fix NULL deref on oversized frame

Kazuki Hanai (1):
      media: mediatek: jpeg: Avoid context access after job finish

Linmao Li (2):
      media: chips-media: wave5: Handle polling IRQ thread failure
      media: chips-media: wave5: Balance runtime PM on encoder close errors

Michael Freidkin (1):
      media: meson: vdec: size capture planes from the aligned canvas

Michail Tatas (1):
      media: verisilicon: rockchip: Fix leaks in init

Myeonghun Pak (2):
      media: amphion: drain message work before releasing core state
      media: amphion: prevent unbind while video instances are open

Nas Chung (1):
      media: v4l2-common: Fix P010 format info

Pengpeng Hou (1):
      media: mediatek: jpeg: retry HW selection after successful wait

Runyu Xiao (1):
      media: sti: delta: use unaligned accessors for MJPEG SOF fields

Tharit Tangkijwanichakul (4):
      media: hantro: Harden MPEG-2 control access against NULL
      media: hantro: release runtime resources when device_run fails
      media: hantro: use DEFINE_RUNTIME_DEV_PM_OPS
      media: hantro: disable runtime PM before hardware teardown

Thorsten Blum (1):
      media: imagination: Fix value clamping in calculate_qp_tables

Wentao Liang (3):
      media: platform: mtk-mdp3: Fix device reference leak in mdp_comp_init=
()
      media: mtk-jpeg: Fix runtime PM leak in mtk_jpegdec_worker()
      media: mtk-jpeg: Fix runtime PM leak in mtk_jpegenc_worker()

 .../media/allwinner,sun4i-a10-video-engine.yaml    | 45 +++++++++++-
 .../bindings/media/mediatek-jpeg-decoder.yaml      | 50 ++++++++++---
 .../bindings/media/mediatek-jpeg-encoder.yaml      | 38 ++++++++--
 drivers/media/platform/amphion/vpu_core.c          | 19 ++---
 drivers/media/platform/amphion/vpu_drv.c           |  1 +
 .../platform/chips-media/wave5/wave5-vpu-dec.c     |  8 ++-
 .../media/platform/chips-media/wave5/wave5-vpu.c   |  7 ++
 .../platform/chips-media/wave5/wave5-vpuapi.c      | 15 ++--
 .../media/platform/imagination/e5010-jpeg-enc.c    |  4 +-
 drivers/media/platform/m2m-deinterlace.c           |  3 +-
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 65 +++++++++++++++--
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 14 +++-
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   |  2 +
 drivers/media/platform/mediatek/vpu/mtk_vpu.c      | 14 ++--
 drivers/media/platform/mediatek/vpu/mtk_vpu.h      |  4 +-
 drivers/media/platform/rockchip/rga/rga-hw.c       |  8 ---
 drivers/media/platform/rockchip/rga/rga.c          | 13 ++--
 drivers/media/platform/rockchip/rga/rga.h          |  1 +
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 16 ++---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c   |  4 +-
 .../media/platform/st/sti/delta/delta-mjpeg-hdr.c  |  7 +-
 drivers/media/platform/verisilicon/hantro_drv.c    | 84 ++++++++++++------=
----
 .../platform/verisilicon/hantro_g1_mpeg2_dec.c     |  5 ++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 68 ++++++++++++++----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  2 +-
 drivers/media/v4l2-core/v4l2-common.c              |  2 +-
 drivers/staging/media/meson/vdec/vdec.c            |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c        |  4 ++
 28 files changed, 366 insertions(+), 139 deletions(-)

--=-p9tPhciFeFQwT4zdM3AJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasJUjAAKCRDZQZRRKWBy
9BuMAQCiXbIOhqvaOy8AKQRqg3Jgw4S9j0B/qFc85JRjJ56PJgEAswzig74md+HC
k44Amuzr00IohE1tdJZJLP1CG3FiaQc=
=VvJO
-----END PGP SIGNATURE-----

--=-p9tPhciFeFQwT4zdM3AJ--
