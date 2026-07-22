Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0C4071CA;
	Wed, 22 Jul 2026 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784705672; cv=none; b=aUaQ7BJPk2zzebQLmrKZ6ghAyno0SPaQRVbaEX/Zt3eBLj7l+DQVbAV44Hp8XgmV8yyNCM140XAdjnj4gua95+6bFrBNqZXTR0XXsjxZzOg0GESXN9l9iwEHbWlHOvJFsyTvM24sC4Gn24Xn6hEtR4cHkQboaeoH0tRwdnBQdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784705672; c=relaxed/simple;
	bh=2ObVVlPTLgtwhjVeOmysor5wIwaB0MZ4VzNtQqF+6mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naudrSbwDjhZkwMgLLqpzEXlQMjtI33GBXBmLonsktigfq+5sxb8KkSmsoq7C9Be6fI9EEAQD/x0FHf+Cm/iB2b4sHfbpbbkxSCn6QjMrcFrTn+2ByDHzw0sLRi8VjvhOluk8T9XhsDFSCNCvJS4Z7ms5W++CBk5K0KH+VV+QHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gahingwoo.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=X4R5+NnK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hAp+KRjj; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="X4R5+NnK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hAp+KRjj"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id AD3A9130009C;
	Wed, 22 Jul 2026 03:34:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 03:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784705665; x=1784709265; bh=mL8afbJIEV
	bivI++LDqKDCSnrT+9HSwzh/VJgECEmYM=; b=X4R5+NnKpjr8SCtmlYsZcpcCE7
	OvXUUGXcdRJ1pqlt5OQcjgiDblWe8+MSMXCYgcRrsCqXgyeMNwR8XlIDgFxIc/yS
	XmUu7vlf4uk395wV6lqOIlHwUVOg+bhrD6qAmMrjcspaVy2mq+Y7HT6Ukef0HQsn
	LRi/mZNGWp4arKx4XETGevQBFW4LY1O2OBawZS5xVsGF0HQ40Jum39ihxEmZf20D
	oCxFJVCt6aau12F4akCo1hM0DkfVwg/TJ5Qj5YVwh7qsbN2WJ0k1Qh8KdT+9UvYh
	PuzlM2IKRMnMRu1alByXIQzQq561JqEttXX6XJC+6AlllYBQX065BGDzxRRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784705665; x=1784709265; bh=mL8afbJIEVbivI++LDqKDCSnrT+9HSwzh/V
	JgECEmYM=; b=hAp+KRjjWrZjLQG4ZK5qf22PLGC6rbQtRboCycfUHFBbGODcdZt
	il7suGjGl6kB6XAhnOiq2raZG3FLlgzRH4O+u85Zkw4J2Ej6u+K6IW/kAurFu+Y1
	6J+W/v6yX67/3djVbaFA1hlcv7CWYGLkzBrovgFwW3UjxVQSqomhGSE35jPpqESD
	iDQo8h4QGsNuAurF9NiNf706nm1d+qrcIhT9I37IBF5FEIcEGM2SUlcqt79FrLi8
	PAyoW80aMcKNtJET3HHYke4K4UHApiWuzq+UhKJgYIxL3sr+rDVXZfDHpirT4tnm
	ad/AOznwgHHEhJcX+OxbTZZnXOD6gqdYmKQ==
X-ME-Sender: <xms:gXJgahaqXmifA7A4U1ySUPjFulgrnusH0fZMtHmUbDg32e3vOMqHqQ>
    <xme:gXJgan9uhPuH4qKIouPBb9ucm1JkCjXXRUbs8ZSlVlHMVWoJKKxa9h3KSDsQzahpr
    yhNxigxTEUBKfRgxCQWMU27eJtKabtvrfhHiyKbM4Oh1IAV6s1jufQ>
X-ME-Received: <xmr:gXJgaoS5OPQxiqjevM1RmpkjZYyD6OECGgkKpeITf-pIcUrCvb_T-nDpI-oYM_Y4yz7o1MhytA>
X-ME-Proxy-Cause: dmFkZTEnr+Ic820deR54trKtaw3+ZMPYT0z62lQjtuu6UfAkjZ+uTHXJ6JAc3qBaopJ/VD
    y81AFwdddvH7jDoLvUS+TpqpNhXqqS3vkrDnUeH4Iciiof/VqnkaVhiIAEoC/MscM10Rey
    J2ydCEUZ4x8qvxl9a4qh9fbZCz3h00im/nDgXcLDCw4NXpybKjjfHigBxBYt0zC122SDri
    M7lg7lT7xWP0tBpUy03bU7YYu/sTa9s5FkbkBjHneQODLPttTe7Iy3yvPOjQ0S3nuWR0Yq
    GVUnV4Cr0zjLffjRGrcPSX0OY/6J60ZTr0w9dnFhg19yAo6cIus9+6Sllcn1FEoPoThdf2
    c3Aq9wCBck3PfoZJ5H4WBwsgfW8uci+ftgevpiSCpZQJWFbHAI0Y1zdVD7F2YBwDsN0fQV
    5onNEi0UsxpG/v1W7BB+1vYZ66KTBe3PIfjS/Y8Go3zNIXsD7+28+HLp/quh0Ry0pnbMMD
    vKCAPyeDIEXL3ctn152wqFe+FLad8bhZAxJqlMyYhhl41bep9aytMQZRfPfmvIjKCoip8E
    vqnh9u+ptls+Z7gD7VblxNDpERYDZhWAWVCuC/BE8oPlnfR2xM0WTrLu6dHWOvcCggqVqw
    Wjb14DCDwf1o1rWNoGRFMRCi2Nrh80TpN5uji0aiZh54q66Y3NeignjuPTyg
X-ME-Proxy: <xmx:gXJgaiIVZLFFJE01TKTGHRsZ9CiotLIGtx2Bd85IHKbSuh_i2c77Vw>
    <xmx:gXJgaqQcrazNbAHxv-S9ZapnXDLsQ9S_PSoH07O5G_ujR4ndtdMkYQ>
    <xmx:gXJgaqKe1TNZHndnd0AZ1tqo0Kmy2QNi_m8SqlNqexMW0NohwAbEbQ>
    <xmx:gXJgat-2mGTcM8b7rkI7htTw-mKQJhLdjK0Lrb5aynxUxuj1lZyPoA>
    <xmx:gXJgag-1z6GSFenfD9WruHXGj5aaTjSOOHh-8vLW1dxyE7WGiTEFxI8m>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:20 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Date: Wed, 22 Jul 2026 19:34:14 +1200
Message-ID: <20260722073417.2064667-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an RFC for a from-scratch mainline V4L2 driver for the H.264
hardware video encoder (VEPU510) on the Rockchip RK3576.  It is a
stateful mem2mem encoder (NV12 in, H.264 Annex-B out) modelled on the
verisilicon/hantro driver, not on the downstream MPP-service model.

I'm posting it as an RFC because intra frames work but inter frames do
not, and I'd like a second pair of eyes on the inter-frame problem
before this is worth a real submission.

What works
----------

Intra-only (I-frame) encoding is confirmed on real hardware (Radxa
ROCK 4D).  With GOP size 1 the driver produces a valid H.264 stream the
reference decoder accepts.  This already exercises the full path: V4L2
m2m, the register programming, the software SPS/PPS prepend, and the
hardware slice output.

There is no upstream userspace involved (an encoder needs no request
API); I drive it with a small ioctl test program that feeds NV12 frames
and writes the CAPTURE buffers to a .h264 file.

The open problem: inter (P-frame) frames hang
---------------------------------------------

Every P-frame stalls the encoder's own hardware watchdog (INT_STA bit 8,
~20 ms after the kick) and produces essentially no bitstream.  I have
spent a lot of time narrowing this; it is sharply localized but I cannot
close it:

  - The P-frame register writes match a real register-write trace of the
    vendor stack encoding the same content, byte for byte (I traced the
    vendor kernel's writes and diffed against this driver's).

  - The reconstruction the previous frame writes is *valid*: dumping the
    recon buffer after the I-frame shows correct reconstructed pixels.

  - If the P-frame reads its own (older, settled) recon slot instead of
    the immediately-preceding frame's, it completes.  Reading the
    immediately-preceding frame's *fresh* reconstruction as the
    reference is what hangs.

  - It is not FBC: storing the reconstruction uncompressed
    (enc_pic.rec_fbc_dis = 1) still hangs.

  - The first frame of a session always works; the first P-frame hangs;
    after a couple of failures + core resets, later frames sometimes
    start completing.  It behaves like a warm-up / settling problem on
    the reference-read path, not a wrong register value.

So the encoder programs identically to the vendor and reads a valid
reference, but stalls fetching the previous frame's reconstruction as
the inter reference on the first inter frame of a session.  My best
guess is that the vendor does something between consecutive frame
submissions -- a completion/drain wait, a cache/coherency step, or a
per-frame re-arm -- that I am missing, but I have not found it.  If
anyone recognizes this on VEPU5xx, or knows what the reference-read path
needs between frames, a pointer would be very welcome.

The shape of this -- the first operation of a power session works, the
next stalls, and a reset/warm-up sometimes helps -- is the same one I
ran into bringing up this SoC's NPU (accel/rocket RKNN), where the
second/chained submit in a session would not fire [1].  I can't claim
they share a root cause, but if this is a known RK3576-wide submit /
re-arm quirk rather than an encoder-specific bug, that would be good to
know.

[1] https://lore.kernel.org/all/20260718031146.3368811-1-gahing@gahingwoo.com/

Notes for review
----------------

  - The PARAM/SQI register classes are programmed from mpp's constant
    "default tuning" tables (not derived per-frame), as noted in the
    code.  They are required: leaving them unwritten stalls even the
    I-frame.

  - Rate control is fixed-QP only for now (the bitrate control is
    advisory).

  - H.264 baseline/main, single slice, 4:2:0 only.

  - Tested at 176x144; other resolutions are not yet validated.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Jiaxing Hu (3):
  dt-bindings: media: add Rockchip RK3576 VEPU H.264 encoder
  media: rockchip: add VEPU510 H.264 encoder driver for RK3576
  arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes

 .../bindings/media/rockchip,rk3576-vepu.yaml       |   94 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   50 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkvenc/Kconfig     |   14 +
 drivers/media/platform/rockchip/rkvenc/Makefile    |    6 +
 .../media/platform/rockchip/rkvenc/rkvenc-h264.c   | 1095 ++++++++++++++++++++
 .../media/platform/rockchip/rkvenc/rkvenc-regs.h   |  929 +++++++++++++++++
 drivers/media/platform/rockchip/rkvenc/rkvenc.c    |  892 ++++++++++++++++
 drivers/media/platform/rockchip/rkvenc/rkvenc.h    |  212 ++++
 10 files changed, 3294 insertions(+)
--
2.43.0

