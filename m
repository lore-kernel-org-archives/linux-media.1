Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280594;
	b=k555LgeacbvmAf87toZVcO5UrUKnoI1AXCeH2gWyPg8/FmGDvoJr1t48YssnrBSoZFli
	 5odJ0SEgnC8FLFkILpgS227ic/KQmxd6501xaUB/HNKDU7A3Ny5dqfYTyCS9+6r9gtpwc
	 DLcIXCeAeRyn+dRraQPducqf/fQR6zGBzBZ2Nut7LJwRiNn6AM5bcIes1CNSZaP2L12Tg
	 EeZ2wb6pB8CvoKIIKd0oIp98WxmRKhND7yW0q8DyINURz3Qp2SYt5NCXF53D34bQwlh5s
	 ThbFQQXZjSrcg07jhdo6o4RucozLTTVozjGS8KdV6toa6efWq/VohFXeYvwFsgeKv1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280594;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=E7zw4OvfJS9WxxRydc8gjWSqNO5VuBv0ubtJ7RVhPKc=;
	b=brRuRGgeAosaeOSKDKyphriTEBalOGKJF440RK5GcvavzX6XL/jTKvMUWxo92oqdgLFw
	 /ueVQ+AIM83ZlvAYKelkgH1Cp7ovsR539soajOen35sNuROo7b2mkWxRI3LYLEv6kXpwV
	 /bhOwXqzkpKbk1LtdZkuTDnSfqc+5P9bzp8RGNlbltEVUn3030b5tNCkRyhgbZ/MxWzm8
	 OCX1dJa3c9+HofjX/e3z+s/gW66UI88ZjuFnvYYehGKVH9AQv/Z3qUqg9wV/f5n1oYWq2
	 yuU977bUjc57coIxfbR1edTIWqSOwrsdCEtW5Or0mlQRiKxTaScaYeKnwXbYWo14OYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="kdyZgZ/V";
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF153606A320
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 17:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF153606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kdyZgZ/V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=E7
	zw4OvfJS9WxxRydc8gjWSqNO5VuBv0ubtJ7RVhPKc=; b=kdyZgZ/VzLZ5DMWTQ4
	eG8+n1vpAcCQ1h5VE9VziRd68x631SbgUzVspV9WgBiYhlKRjOk1XQJXsAv6Ybex
	biwuPjFPZtyiqMMVl18lmjgYpLlYFaY0MwGfnLKRkEiWFI4w37DeAox7ik0SYw9c
	MfeGIGaK28KT98jCVMCyJPXaM=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXDkKozgFrr_GYHQ--.15432S2;
	Sun, 22 Nov 2026 01:02:33 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH v2 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 01:02:30 +0800
Message-ID: <20261121170232.414316-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:PigvCgCXDkKozgFrr_GYHQ--.15432S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr18Wr15Jw4rAF15tw4fKrg_yoW5Wr1xpF
	4Ska1akrWxJF43CrnrJw17XF98Zw1fGa9Igw47X340vFyrCas7X3y8Ka48Zr98CrZav34a
	vFyYqryxWa1jyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pico7tUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzQn4TGsBzqkeBAAA3n

Changes in v2:
- Drop the ICAP_CHANNEL s_ctrl patch. The ICAP controls are clustered and
  s_ctrl is always called on ICAP_EDGE, so the added case was dead code.
- Initialize the default field and colorimetry with
  imx_media_init_mbus_fmt(), and resolve try-format colorimetry using the
  selected format's media bus code.
- Clamp dimensions to non-zero values and reject formats whose image size
  exceeds the 32-bit sizeimage field.
- Validate the selected pixel format against the source media bus format,
  including an exact match on non-IPU passthrough links.
- Update the v4l2-ctl examples to specify width and height explicitly.
- During FIM control updates, read new values only from the active
  cluster and committed values from other clusters.

This series continues the i.MX staging media driver cleanup by removing
legacy video node handling and exporting the Frame Interval Monitor to
v4l2-core.

Patch 1 removes control inheritance and source-dependent format handling
from capture video nodes in favor of the subdev-based userspace API.

Patch 2 moves the generic FIM implementation to v4l2-core while keeping
the i.MX-specific input capture controls in the i.MX adapter. The error
calculation uses signed arithmetic to avoid underflow when the measured
interval is smaller than the nominal interval.

Validation:
- allmodconfig build and sparse
- local FIM KUnit tests, not included in this series: 13/13 passed
- local white-box i.MX capture format tests, not included: 15/15 passed
- QEMU vivid: v4l2-compliance 125/125, 30-frame streaming passed
- QEMU vim2m: v4l2-compliance 49/49, 10-frame streaming passed
- i.MX register-level and hardware DMA paths remain untested

Jiaqi Shi (2):
  media: imx: remove legacy video node control and format handling
  media: v4l2-core: add frame interval monitor helper

 Documentation/admin-guide/media/imx.rst       |  20 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-fim.c            | 331 ++++++++++++++++
 drivers/staging/media/imx/Kconfig             |   1 +
 drivers/staging/media/imx/TODO                |  13 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   7 +-
 drivers/staging/media/imx/imx-media-capture.c | 230 +++---------
 drivers/staging/media/imx/imx-media-csi.c     |   7 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +-----
 drivers/staging/media/imx/imx-media-fim.c     | 355 +++---------------
 drivers/staging/media/imx/imx-media.h         |   9 +-
 include/media/v4l2-fim.h                      |  40 ++
 13 files changed, 490 insertions(+), 641 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

