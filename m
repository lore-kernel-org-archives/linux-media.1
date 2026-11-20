Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185109;
	b=ewq3zPVnBVFp6LArdffG3dxSQZezgkm8qR6om8qKF+grWgWJGpxAln2TXBEMPNA8Zpou
	 sTO3EdOxlDxdATm2lv/UU2yoWVVch7hwFFGoV1To+6pZpUXRG9eX4+RVBDufa3gNEWCd8
	 O0iIxUhNd2W79hLnvypPTX5nnbnoSrPx6Hu2BL5EOCibsv7Xskj40DHv+lELFIACeahK5
	 oOCGhZ5XnMaRkkOr5TGAd8o72XCnUudEoXsvfalWri3xFd/gY/JsBeW8R7YYCSKzS0WGG
	 pEqxZjSBy1q2FK6NTwoYpF2zoJsU2k1nRZJ0l8DVwYEXaHbREC1HObsUipdzbrcJzmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185109;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qeSV50MaSU+iyhOl0Vb1DARytM9FU5E2qW3hVo6dkMc=;
	b=lB9OXwKgdJoDslIe9VZtVMfa4KbzQGriUwwrvDfZXvdm29eafBAW0xzQGZbUoiaF/v2o
	 zx/AL26ToPyAi0usTwhO9DCWOJT5BdeALnJg1nvEhNeT8oqWE4cvjxYorkvo5oK57QDt6
	 n0eFFYzHdmGUDgYa7WdNEYfMochAfYNKXDfgqp4HJqSSPY+SQSoSN6OYH3OMAYC8MDAyU
	 K26Zya1ShT9FmuwuI1pmPNp5kfiEvrDoGwofFAfmfMLgwS+rhksnhnk3GwzCkxEtQYbC/
	 ouI8kF3/H787aNR0XbQB5hv03qWUE1aeMgCs6wkwi+uGRK+ih1XFthvEP7645HMFW2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gO3j9UtD;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7097D606A32C;
	Fri, 20 Nov 2026 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7097D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gO3j9UtD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795185100;
	bh=fLUDwS/CmgzKzoOh763ZvkLPyeWPXEYNDmM6HTXl89g=;
	h=From:To:Cc:Subject:Date:From;
	b=gO3j9UtD2hKaRgQohdoedrFvnXcn5GntHIk+5slrwe5gTuIkD2lWsYTf7UPqJLOVz
	 RF/NXyB3Xge6aamqulnUSqjgNJZLFL96sIApuXH/CtQH7dDXREcesLVKTr0WWEF/9+
	 8A190t9s7newIF/Vbq4WPh+/pNUyh8U/JCSFPdXdQCdaIxEtY1OWiMVcCNpcyxvvjX
	 Gthm8udkHvzGeWE/3uaosFIvuq7VPPfYF4dIlxydsbVV101tekTc5EJbdlxgW8QsGt
	 LEAyu5zcxEq+8Nl+YaxHiyK6cok3sHyRFzPssQUUyl5aLOEChEl4MP0vvI3TEavJqY
	 aOx0M0JiYxB2Q==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A8A317E0630;
	Fri, 20 Nov 2026 15:31:40 +0100 (CET)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v7 0/3] media: verisilicon: Create AV1 helper library
Date: Fri, 20 Nov 2026 15:31:32 +0100
Message-ID: <20261120143135.71134-1-benjamin.gaignard@collabora.com>
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

change in v7:
- prepend 2 patches with Fixes tag for backport
- rebase the series on v7.4-rc3 tag

change in v6:
- include b84f6533a8ed ("media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer")
  and 367db8b23c26 ("media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity")
  fixes into the patch to not losing these improvements.

Benjamin Gaignard (3):
  media: verisilicon: AV1: Check reference frame index
  media: verisilicon: AV1: Fix luma size
  media: verisilicon: Create AV1 helper library

 drivers/media/platform/verisilicon/Makefile   |    7 +-
 .../media/platform/verisilicon/hantro_av1.c   |  816 +++++++++++++
 .../media/platform/verisilicon/hantro_av1.h   |   64 +
 ...entropymode.c => hantro_av1_entropymode.c} |   18 +-
 ...entropymode.h => hantro_av1_entropymode.h} |   18 +-
 ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  125 +-
 .../verisilicon/hantro_av1_filmgrain.h        |   48 +
 .../media/platform/verisilicon/hantro_hw.h    |    7 +-
 .../verisilicon/rockchip_av1_filmgrain.h      |   36 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 1082 ++---------------
 .../platform/verisilicon/rockchip_vpu_hw.c    |    7 +-
 11 files changed, 1140 insertions(+), 1088 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

-- 
2.53.0

