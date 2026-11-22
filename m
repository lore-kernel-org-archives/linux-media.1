Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347768;
	b=GXHN+rSSdmy9Wgfk2WTAP8zeawPP1YDjlttbnGPZOxDckX1NAvJCOTget5x5XcJ4lPth
	 u0xZWJ+dPfX1GWhUeuvExoXXHrrIk5sQHC/4jGEUujX35vLfaTLIgphFnfeFn9sWpYTbf
	 9WPjirJm/xlZiqAcrRKoAwUNrM6TnHtCze5xoTZIWj+8XEVcCKZwx3m7APih3sr06bhT2
	 MbTHtzOaji3eXk8Y6v3Upni/U80KpVdaV9zdW6XayusimMmOblkKQryx3ZvB2yPpNt//C
	 DGw1M0ZPBI5Og+BSrOiscRZOS9svSTHILB6qKUqFpe5GVci3sX2QQEKGL4krWza7uzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347768;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gohUQPM7rw2xA0lCUCOd6vhIwBrCwipEuEodVc6L4lA=;
	b=HVEsjKhalnNoT+qJVdxB/9QEubsL13Kfq/Azsi18omYEdvYByZyCInMV+WDm8uUehXZ9
	 F6/C4B4Z1yO6liq9b78LbP1SC7CSlI2OkueCxFXph3UrhVSwB4RPV4WfYCUbc/gNKoWQo
	 5ag+t4J4J35njcTNDFdT9gI7sQq5xXq7lGDNiutn0CIUk42884sdhYz/FJ7t/OKAEoEvD
	 EC88+lzQgPJIeKUwl50+4QIf8F8oO/ykzMTahCdejM+YT9KKfew2pE7F0snlxivMZx07m
	 Niy77CTHXL6e8pdyquk98wIZYNZKlJm2XfSQM3BnNDfekRZbEtqbzXjI/B/sHvs/OAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mP7HNCcl;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D4606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 11:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mP7HNCcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=go
	hUQPM7rw2xA0lCUCOd6vhIwBrCwipEuEodVc6L4lA=; b=mP7HNCclDkJ5dWMJo4
	GRhUVrfZjt39TuTYr0zTn6f9ypqx5LfeX0wdBXnpTk9xeqoGKfydeaOOCtqll4r0
	LetEdpEd2i1OBhk0BpOLeyHcoNEjsT6A1EQaVprZxTik5sCLJhqdEhHPFhA1C1aC
	sOPCTUiuE0HkgcaHIZFRRpcgw=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H6YN1QJrHreuJQ--.55539S2;
	Sun, 22 Nov 2026 19:42:06 +0800 (CST)
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
Subject: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 19:42:03 +0800
Message-ID: <20261122114205.494704-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3H6YN1QJrHreuJQ--.55539S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48uw1rtFyDXw1xZw4rAFb_yoW8tF17pF
	4Fkw4akrWxJFsIvrnrJ3W7XF98X34rCay3K347X34F9FyrAF97Xw18Ka4UXr90kr97Z34a
	vFyYqrW7Wa1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRBT5dUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzQ7TJ2sC1Q5-3AAA3m

Changes in v6:
- Apply the IC route format selection consistently to pixel-format,
  frame-size, and frame-interval enumeration as well as TRY/S_FMT.
- Keep the remaining STD and frame-interval legacy ioctls unchanged.

This series continues the i.MX staging media driver cleanup by removing
legacy control inheritance and source-dependent format handling from
capture video nodes, and exports the generic Frame Interval Monitor to
v4l2-core while retaining the i.MX input capture controls locally.

The new FIM files are already covered by the existing MEDIA INPUT
INFRASTRUCTURE entries for drivers/media/ and include/media/.

Validation:
- allmodconfig build and sparse
- scripts/kernel-doc -none on the FIM header and implementation
- local FIM KUnit tests, not included in this series: 13/13 passed
- local white-box i.MX capture format tests, not included: 21/21 passed
- QEMU vivid: v4l2-compliance 125/125, 30-frame streaming passed
- QEMU vim2m: v4l2-compliance 49/49, 10-frame streaming passed
- i.MX register-level and hardware DMA paths remain untested

Jiaqi Shi (2):
  media: imx: remove legacy video node control and format handling
  media: v4l2-core: add frame interval monitor helper

 Documentation/admin-guide/media/imx.rst       |  20 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-fim.c            | 385 +++++++++++++++++
 drivers/staging/media/imx/Kconfig             |   1 +
 drivers/staging/media/imx/TODO                |  13 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  10 +-
 drivers/staging/media/imx/imx-media-capture.c | 401 +++++++-----------
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +----
 drivers/staging/media/imx/imx-media-fim.c     | 361 +++-------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |  11 +-
 include/media/v4l2-fim.h                      |  57 +++
 14 files changed, 680 insertions(+), 716 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

