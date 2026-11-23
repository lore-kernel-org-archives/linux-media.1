Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427953;
	b=W7FKL200ZV9G4s/CPQQ7jI82hUVco4utbkElST8poW/eiVaFjTzTFHtDxz51E8GORwTy
	 JDO6h9Q9Xp3HsJACuCgx7Wzwq/F2iP7Ks5Da2SHB07+2/Lbxm3hc6KeqHQjWBP3aRApjP
	 Ni4MRuK2LIBYp+Tbu73whKEWL2GCLOTsy01k7xCSnkj40vdXCVmEZuvno7AZ58yW8CbhZ
	 qN+zd8mMyrbgAQeRx45IEcTWH+HFamVZrGHqg1brVE6/4FI0stjWeesx1G7I/6wq+XLLi
	 ibPUSreMSq+0/fNAbOv9/ALDtiWD5B+aqfBhbmfUw1lvR8tA/VHPJDs2BREamFWkEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427953;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BvpwCecv2yjALaTpMP+UfsFuSzxVVgU4VeHTbBEp/H4=;
	b=tEeWIAfLRFjRPfha6Y9c3D4ZIrkP4+KEmMXRgoa23ITvMsvMi4qXuo6x2UUv4dYX5qgd
	 SJVnaLhc+89BHiOErVv07DRwAQ6MzoUiZVsQiTrvnIsWiq7UrIMSupxzlt1pghoxfLHg1
	 H42bH5/VuuPAeVsJb9BjxVuSVvTAygSHdH885O7nFOYJvWaFELCNmJEdIwfPDA1882CkY
	 ykD/pxZdUN0svPRW6NFejyU5yiNr7iF8ghZwWVbO1HJfXOPDjYroDQbZqO7HgmlR6laME
	 kC3YZrfwj51EIzmhyF2rgVOgZA/dRlJ+DZSQfSgoRhO+MOwsQVqG4mJq4wXUHT3HL/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ijmR6W82;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A1606A321;
	Mon, 23 Nov 2026 09:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC4A1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ijmR6W82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427951;
	bh=hIu4Io13bboxqzPRv7r5Z8rpPIQv75yL07z2+l+m2IQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ijmR6W82fP9Yo4I8xMkEtfnYQxbbL9bXqjKqZ7gxAUeSuPErflDUw/ff0DOWnsu+G
	 i8kxyup4CatGrpRmoFR5qG0uGmBquz3JLTER7lYRkSMSnf6elDeTNIfGs3g9H5QFJS
	 us0UM6pMLN0LYZm//DJTttu7HAq3vXmkbvBLtNJS6gOaMr6bH1ZnPnBih95IBtBer4
	 gB88dDHzcEsCG9Qzfli4qxjuVLsoaW65mW4GdyjQhZ7bGETvMnPsD7VRYthocryvw3
	 LxSGtZZMsCdXR5kHJTI7x809VtSvcY+EtJFd756Bpk92rEKQHC/d1v11ptDNwL6GDf
	 E0YXb6Keztkvg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D566717E00C4;
	Mon, 23 Nov 2026 10:59:10 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/7] media: verisilicon: simplify auxiliary buffers allocation
Date: Mon, 23 Nov 2026 10:58:58 +0100
Message-ID: <20261123095905.60622-1-benjamin.gaignard@collabora.com>
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

Verisilicon stateless video decoder driver allocates lot of auxiliary
buffers to decode bitstreams. These allocations duplicate a lot of code.
This series add helpers functions to allocate and free auxiliary
buffers. This simplify the driver code and will allow to implement more
easly incoming feature like disentanglement data buffers from mv and rfc 
buffers or adding reference frame support for more codecs.

This series has been tested with fluster on IMX8MP for h264, hevc, vp8 
and vp9 codecs, and on rk3588 for av1.

This series depends of this one:
https://patchwork.linuxtv.org/project/linux-media/list/?series=34366

Regards,
Benjamin

changes in v3:
- As suggested by Philipp do not mask hantro_allocate_aux_buf() returned
  value.
- In hantro_allocate_aux_buf() and hantro_free_aux_buf() only set vpu if
  ctx isn't NULL.

changes in v2:
- rebase on top of media: verisilicon: Create AV1 helper library v7
- tag reviewed-by tag
- fix patch 1 and 7 commit messages

 
Benjamin Gaignard (7):
  media: verisilicon: Add helpers to allocate and free auxiliary buffers
  media: verisilicon: AV1: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: h264: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: hevc: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: vp8: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: vp9: Use alloc/free helpers for auxiliary buffers
  media: verisilicon: mpeg4: Use alloc/free helpers for auxiliary
    buffers

 drivers/media/platform/verisilicon/hantro.h   |   4 +
 .../media/platform/verisilicon/hantro_av1.c   | 191 +++++-------------
 .../media/platform/verisilicon/hantro_h264.c  |  13 +-
 .../media/platform/verisilicon/hantro_hevc.c  | 133 ++++--------
 .../media/platform/verisilicon/hantro_mpeg2.c |  19 +-
 .../platform/verisilicon/hantro_postproc.c    |  21 +-
 .../media/platform/verisilicon/hantro_v4l2.c  |  37 ++++
 .../media/platform/verisilicon/hantro_vp8.c   |  36 +---
 .../media/platform/verisilicon/hantro_vp9.c   |  42 ++--
 9 files changed, 169 insertions(+), 327 deletions(-)

-- 
2.53.0

