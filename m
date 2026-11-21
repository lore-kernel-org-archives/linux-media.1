Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284078;
	b=kD6ZLP5aX4cpAD0+plvoaUjckrR3L4j5S2hhE0gpWLyhuHloi5E/IPXVuquaPMiHeCTN
	 IwI76Jp6ay5k7lCoMBlE71EKfRIc4NGMU1ifenoI+2eqIfHpMCPMuWNGc6U9D9fTQwTKr
	 TrrT18DXxbgFV1oSOLMq/vzyrozO3Ye6E8aMQKx+RlCn0lpU95ejFsImmXrY+Eyg6Alzh
	 4AhCE808+AN/AA4lTHsqUatiPevcRLk2O6fjxhSlOc1eFUfEBPy0qzkwGlF0DoYfzcLaF
	 o/cNbqReXySDu5ks/i/K45Zj2d4lscw7l6vb6cSd9lQAS14NRXFDYkJfpVvcTfBgemQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284078;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gD94HvPiLO8Y6Pw1MEfxnz4cRxg1ZVaiRR8Hpdtd62o=;
	b=KRyGXeFALXduKTErMK4/rzQACAD/HDOPaZ2C8euI0IiwMrd+DuO/9Au/K/mVG/kJq0b+
	 g+HoyVe9zwS/2We1S1iJS3oTW/aQQWSdbYPVFcd+LEZ6zv7CrJjnPJ39o5znZ2xXflegV
	 gvq1LfxeS/SZQJSg/SPJtOulLnsFFZHAf3/NPcVCzosa+OPow/V6zm3SEo2CBJJe5KdUO
	 DgaeBXR7YaYDwLYJxWzRwBRx+spXKJVsDd4K34Bcp4fKLLHxNGT4tn82ghGMWoILpt5sS
	 N9xQNT4viMollBXhuAvhSk4lQq2gtRe+PWYUF3NW3HaSURyeeS/szii2Le50zHeOdfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pEuRXVFq;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129DE606A330
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129DE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pEuRXVFq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gD
	94HvPiLO8Y6Pw1MEfxnz4cRxg1ZVaiRR8Hpdtd62o=; b=pEuRXVFqh1BDeCn2/b
	G54m7XRnJBtWRklbRPPiTI4gWv2CwBtxlPCWkViAqEPh/2G9pi9PZU+eH8BEeCtY
	HPx0wcWQHZzAAz8a1NV7gF2yam24nrxEzjJPX9DCl9B6sNxsMNh9htulvqYd6xeB
	/WivmrdOzakWGVKCFb/phIlgg=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3H6JM3AFrlIBEIg--.35728S2;
	Sun, 22 Nov 2026 02:00:45 +0800 (CST)
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
Subject: [PATCH v3 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 02:00:42 +0800
Message-ID: <20261121180044.424315-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3H6JM3AFrlIBEIg--.35728S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr1xAw18trWrCF1rGFy5twb_yoW5GF1UpF
	yF9w4akrWxJFsxCrnrJ3W7JFy5Xw1fGayYg3srX3409w1rAasFqw48Ka4UJr90k3s7Z34a
	vF15Xry7Wa1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMSoXUUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzg1luGsB3E056gAA32

Changes in v3:
- Add the missing struct v4l2_ctrl forward declaration to v4l2-fim.h.
- Validate exact media-bus-code/pixel-format pairs without falling back
  to another format, while preserving the intentional Y10/Y12 to GREY
  clamping supported by the CSI driver.
- Use 64-bit arithmetic for image size calculation and reduce the height
  when necessary to fit the 32-bit sizeimage field instead of failing.
- Sanitize ANY/invalid field values and validate field compatibility with
  the source at stream start, including IDMAC interweave field ordering.
- Default RGB formats without a media bus code to full-range quantization.
- Keep legacy_api enabled for the remaining STD and frame-interval ioctls;
  removing those interfaces is outside the scope of this cleanup.

This series continues the i.MX staging media driver cleanup by removing
legacy control inheritance and source-dependent format handling from
capture video nodes, and exports the generic Frame Interval Monitor to
v4l2-core while retaining the i.MX input capture controls locally.

Validation:
- allmodconfig build and sparse
- local FIM KUnit tests, not included in this series: 13/13 passed
- local white-box i.MX capture format tests, not included: 20/20 passed
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
 drivers/staging/media/imx/imx-media-capture.c | 326 ++++++----------
 drivers/staging/media/imx/imx-media-csi.c     |   7 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +-----
 drivers/staging/media/imx/imx-media-fim.c     | 355 +++---------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |   9 +-
 include/media/v4l2-fim.h                      |  41 ++
 14 files changed, 573 insertions(+), 664 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

