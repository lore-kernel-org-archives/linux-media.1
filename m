Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187633;
	b=Iof95XUlSb8VBbB281muqMqHtnqbeivUEbL0QCc/Qjk96kX0v+eZvTj9v8GQMWE6Wyr8
	 rfirq6QEjfYG3YkXf50Oo6uYlECaMCsHcOGN8bjBDCgME9cWpLLxi4XIdAj2UjMKrQqYL
	 VTsLIzMBkaV0l7/FDtLzi4kI5rDOjKG63kRFLWhgb8KLQhaa+VE37W8ghaVMGJjqTReyY
	 npIQKuaZuMd3wU2jwnRcmdUqZTIi32X07LUUcUApXKEADqkUKZ+wV8yBq/KnWX/Xa3Qct
	 V5YVK96jfsrj9IKA8TjuxVQid8eUaKgY4AQpNWKtXtju0Xq0+/b3+co1cmCVjz3b3XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187633;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0+tmjCH3xL5E5zUd/6av9csMKhDwXgfxqqZQVouDtqM=;
	b=yvSqBnEcDZq/dsm06LditoEC97phZf5duM3KV7+ohn90oHtBgHi8RHFb3wRNaCiiOYCD
	 6FsKnEh9KiN6ooc4r8oUSvRPchvDcMJm4f6a7wsbBtVpvg9DU/2OwpoVxp3zuYtZzP4Q9
	 +CQC0JDKF2hgUEjHbY1HG6gjz2ZDwJxnEhGKMOc/I2r5trTfv5vBYgL5VEkKYaqggGHeP
	 k/36/c6n780RyVfrPSnfffXAznLTFF8ovUhDGRuzxqZPycSGHxE+uBEEPu2Sr6Pigxzyq
	 9Iq6H8cnipxOWY+brPvzczNum5O31XI3cHpeQVewC39bjwYdzxotn1zOG6RKs0ED0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="N59oeb/K";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC93606A320;
	Fri, 20 Nov 2026 15:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=N59oeb/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795187631;
	bh=lc7lSdZ0kvgi9PP7LqxFG+a4jIPdcDAHagfNuu8Jlfw=;
	h=From:To:Cc:Subject:Date:From;
	b=N59oeb/Kitj4/Q1/dqkrMkecZ9zz9QfopEsRaVZ/rJtCt5DxfYY4IKN4OrCoaRiMY
	 WDoaVyaW+xFbughkyXdBzOFJmcY4sfzLQCtiCUc4kByRGZkj4Clyl+GpMScCyyC1sl
	 LoiD4OFGn5V9HDEpGsXFzC8+6qy65seI9ZS8TN4CDMRbDtCUunVYKtkW26+6yabXr5
	 cLIzRjpwGFeEGjlJhkATBQMVU6coW2goyTlknBQOpxwDl1TlT1ZvTHxZQqxSHnAAWB
	 GzenhRhl+wRIJgxmJtHP6QiiOVg/gmFkUug9hlMJKU+MjfhyB3mb4BXL0yhl7a4T0A
	 zie2N6GgpKbwQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D849817E047C;
	Fri, 20 Nov 2026 16:13:50 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 0/7] media: verisilicon: simplify auxiliary buffers allocation
Date: Fri, 20 Nov 2026 16:13:38 +0100
Message-ID: <20261120151345.88802-1-benjamin.gaignard@collabora.com>
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
 .../media/platform/verisilicon/hantro_av1.c   | 177 ++++--------------
 .../media/platform/verisilicon/hantro_h264.c  |   9 +-
 .../media/platform/verisilicon/hantro_hevc.c  | 130 ++++---------
 .../media/platform/verisilicon/hantro_mpeg2.c |  17 +-
 .../platform/verisilicon/hantro_postproc.c    |  21 +--
 .../media/platform/verisilicon/hantro_v4l2.c  |  35 ++++
 .../media/platform/verisilicon/hantro_vp8.c   |  37 +---
 .../media/platform/verisilicon/hantro_vp9.c   |  37 ++--
 9 files changed, 139 insertions(+), 328 deletions(-)

-- 
2.53.0

