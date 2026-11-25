Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609720;
	b=Vnwx4sLLad2gwxvhLnTj7ZwuOhiU0sIcCXECz6KK+IGJrhA8sGxP8ClhKmpQ2T/wMTFW
	 4WlazSHcYbpLYTx3HVurT7dRLIhkA9CZ1dyX0xkosOuSApnMG+D9XDHtQwQRNJWfTDjLZ
	 yKI8ccDyMWKsDCwmw/eomdhmYtGuIVvETn0qwOeNkcxiVnZmbpwOX701cTHMmEVipE1oY
	 BtidlnnDl/3s5nb69Id3LHRPOUktKRnsjg4VG7FcIcSXxTLeSfeEEYw2XOvP3842YEmaf
	 hb9lBmedQtQMGWuTFnHGV/sPTaBQr0ktAkPN+laTiyE8hjqBGyni7L2wrVZ12ZRpSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609720;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=h9oz9ZX75jLl27zGMU0EZbwitthKgOAuL1pSdwkipY8=;
	b=wkS7W1hRGu8XNvQLhjjSMM4e7CaEBdLN2+Ta3+2uSY6zaZQ/baHSi57dPaLtyzUboRmw
	 MlPrzNK0Ml4R8cy69I5rqp6mMkep0dTkCF/DnMzmhWxSUXAF81+gE4G/il4EUuJE9FkVG
	 FwrulNWQ/HucQq74G+lmQP+h/Tzc/vaolThqvYYxZ5AMqs0KG0KdPvlQ47uZLg9pZeSzI
	 vrQTqx7IbcNDz3qbQTuHWUeCgTob/MsouIS6fF6RYcxF9RNF6VoWy83froKLFuFZvaolE
	 UpjjJdVLb0j0ztuO9QbhOf1wxSgnewMvFsvbJCtPXYQRpo7YXkv4tXzJVUsQpVPEVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="bvNh/6Sc";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AC606A326;
	Wed, 25 Nov 2026 12:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4AC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bvNh/6Sc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795609710;
	bh=kFutpMOmKxFZ0rBso9Z3YVADXZ3+qT8JE7mDNLDaUVI=;
	h=From:To:Cc:Subject:Date:From;
	b=bvNh/6ScYXMqD3WNN728ILpXI3U5edQ9ZwCqpfcT+IWC3a81qYKwtK5alP5bp/TmJ
	 6CMdN2fljaqvn/U6gElgn1pFHG3YtOZHZ8zFmCU3CuYp+E5OaM8NNdnRasmjTw55PB
	 QqIH1YbgyC9tr8gW/J7/OAROMJISq2FSg2lO9wcOy0fQjvbsMKl7sI7J0SZT5/AZVw
	 YXZskSn2IqNRcNfbpbJWfo71Jy0T1cpa0oGRywiXfDmK7C2Zg3yVdWJSjekcYIy6Ti
	 A1F/Lif4cKHJJNNfB19fHInuNNRUPSJUYEgVX5xdw2jv3zkduJpMc1pDiIKEk/zL7B
	 CUJiBEGBCHvyA==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A13217E0075;
	Wed, 25 Nov 2026 13:28:30 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v9 0/4] media: verisilicon: Create AV1 helper library
Date: Wed, 25 Nov 2026 13:28:21 +0100
Message-ID: <20261125122825.236422-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regroup all none hardware related AV1 functions into a helper library.
The goal is to avoid code duplication for future AV1 codecs.

Tested on rock 5b board Fluster score remains the same 204/241.

changes in v9:
- Split core changes and drivers changes
- Add V4L2_AV1_REF_FRAME_INVALID
- Rework checks in validate_av1_reference_index() to be sure that
  all values of ref_frame_idx[] are in the correct range.

changes in v8
- check reference frame index when validating the frame before
  calling the driver.
- add Reviewed-by tag and CC stable kernel.

changes in v7:
- prepend 2 patches with Fixes tag for backport
- rebase the series on v7.4-rc3 tag

changes in v6:
- include b84f6533a8ed ("media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer")
  and 367db8b23c26 ("media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity")
  fixes into the patch to not losing these improvements.


Benjamin Gaignard (4):
  media: v4l2-ctrls: validate AV1 reference frame index
  media: verisilicon: Use V4L2_AV1_PRIMARY_REF_NONE and
    V4L2_AV1_REF_FRAME_INVALID
  media: verisilicon: AV1: Fix luma size
  media: verisilicon: Create AV1 helper library

 drivers/media/platform/verisilicon/Makefile   |    7 +-
 .../media/platform/verisilicon/hantro_av1.c   |  807 ++++++++++++
 .../media/platform/verisilicon/hantro_av1.h   |   64 +
 ...entropymode.c => hantro_av1_entropymode.c} |   18 +-
 ...entropymode.h => hantro_av1_entropymode.h} |   18 +-
 ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  125 +-
 .../verisilicon/hantro_av1_filmgrain.h        |   48 +
 .../media/platform/verisilicon/hantro_hw.h    |    7 +-
 .../verisilicon/rockchip_av1_filmgrain.h      |   36 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 1082 ++---------------
 .../platform/verisilicon/rockchip_vpu_hw.c    |    7 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   30 +
 include/uapi/linux/v4l2-controls.h            |    2 +
 13 files changed, 1163 insertions(+), 1088 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

-- 
2.53.0

