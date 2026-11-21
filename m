Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286468;
	b=tReDHNtlr1FiQT2XTZ8UsEYbmK9zet1FiO5DCpjQIUgoCqf03Li8i0b12dZd/8m9h2aB
	 UaXT/6Q2equSG403oMuTTSQ38DzTiq/F+WxDGoL5eEG2SRdBlrnm+uSzCZKL1IXYw14z3
	 Jo2Hye9/X4zlfZPzGKj4wb1jrspMwh39Cf8MG0BWLfz20FD+paHqmaQCVmHsAQJA+MKFV
	 mAIdqfYSY8kN83VjaIoH9m1TVBz03SLMtc3tU1rV49z3xnqspXGdk+L+YbhR2i/ETw+sN
	 uijGwpE33m5XY4TlTThGwWoxB0sqE6p3JnUUFb1ubWjXu9GRYsKCbUD5eDrf32Sladg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286468;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=t755ruk+GPwH/DbGge5s/OjV62YwROsHmvKWJy2jAyI=;
	b=TwSAx+ehAav4JxxMmpO5VHnK25a7T+xJX7TsvjPtmwQ1rAiI6t/4nkJ2SWfBfnVTCHwk
	 8qY/bT/XmjldxQ3fFjM7V58rlc/08PnM+FLgKCrSH0SmkhfUOzMDDuD+DkRQrTYQGbN1c
	 B8auBYidRjkdJkMulZOTTBvngOsGa7fIUa6AqkwEuP9OrKrYvYj+QJF0YFLmT38FfW1u4
	 kfcNRJVM2FWRgrgqBABTb7+lRVzUN+kasrnRw+Lbx94gUzbmeplvtr5tE/3WwdNs7oQYe
	 Yg+v29JN6MxUdfttdwd3TNbRWKTiSoB+OSN1UswCdJmCAyiQFVYfUSZQoG3LnAIr+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TyGu8s5z;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035BC606A32C
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 035BC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TyGu8s5z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=t7
	55ruk+GPwH/DbGge5s/OjV62YwROsHmvKWJy2jAyI=; b=TyGu8s5zAplgD01xr3
	BbxxoyyzXnB3GCLNtde3M/0fcfr8e7uVYkY2lV4sKSFlWx7qxWWsWoEQvAMspgxl
	o/M/HM7NeomvJINIHKEDp3x7K2Md+Wl9DYVABGLSawvJAOM3mDRez3XE7PhWTWKj
	KPiT3uMKJFj+OlWesqwoeaKgA=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3__6h5QFrVG_OIw--.39085S2;
	Sun, 22 Nov 2026 02:40:35 +0800 (CST)
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
Subject: [PATCH v4 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 02:40:31 +0800
Message-ID: <20261121184033.429680-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3__6h5QFrVG_OIw--.39085S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyxJrW3GFWfXr47WF4rKrg_yoW8Kr13pF
	4F9w4akryxJFsxArnrJ3W7XF98Ja4fCay3Ww17Xa4F9a4fAF9rJw18ta40qr98Kr97Z34a
	vF1Yqry7Wa1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMSoXUUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7wO8EGsB5aPWMgAA3I

Changes in v4:
- Keep the user-visible format field unchanged at stream start. Resolve
  the actual field order into a separate stream_field so source order
  changes are revalidated on each stream start.
- Simplify the FIM external_timestamp callback to a single use_val flag.
- Document FIM allocation ownership, callback context, and locking rules.

The legacy_api mode remains enabled for the STD and frame-interval ioctls;
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
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  10 +-
 drivers/staging/media/imx/imx-media-capture.c | 335 +++++++---------
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +-----
 drivers/staging/media/imx/imx-media-fim.c     | 361 +++---------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |  11 +-
 include/media/v4l2-fim.h                      |  49 +++
 14 files changed, 599 insertions(+), 669 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

