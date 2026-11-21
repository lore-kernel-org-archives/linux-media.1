Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270502;
	b=gZzJznZYI7FpPRIlv8jlh163MgTrGlvXwJcClsROs5AKIyH0Dbg150DHVrTkRVr2Zpxx
	 dfrkTj0O61Mo/NmiWfVUIPvYYv2bfzb3XzKASyIkowSmUrYMcd/viYSwbOK6itsf9oq9p
	 YaZsswa3D8lKy9wcItEbrjjSdIu62gWq5kRPt1TCcGsBK4EaaxcxXPhikk2A8yf9dyfJO
	 znZCpNzLRP6yZIqy615OFhAyajqelb3VF0pGhjby8rZbV4O3FtV0UVm7zhSLFyyjPSbn0
	 Kq1NbxLOtDx25NnXIuXQ7cER1Q1jIuk+YU4sNyueSTXL+ofTyldnxrdwCap9PLH0sUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270502;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=AvcQggFeGzVd6zbCaHTEubX5fGzVYA93etBsWo9CzOA=;
	b=qHy3IcmrvzvG475aqbeyScAdnVizbmQj74GmTPYYNt7BAeNDpP/5agB/KJOtxIZ4xqL6
	 w5311bD80F9LCndVht6zuq8+iD51TxmGoSYEWYIirJsiTiXocnUUWPf/7sXNS0X+XAolv
	 oSTkvdP/TnonGu8U4J25nmq58dhBMAVqzv33fceoeFlXL+v3Xb7rlV1ZDbYsR3FEJabS+
	 BCeTcqBPxIMw2zd18LAVW9ynil2q3TPzYcQj8UgRbWuyw/Tq7cU3ixSHqtldVeew3oi7G
	 J4Qir9zjJRwo5rh/loluCJf+IV6k+udzCr2NiC/AAvaZquKk2k/MVNmogAVYAtO4/Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UdTZb7eM;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6A7606A683
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 14:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA6A7606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=UdTZb7eM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Av
	cQggFeGzVd6zbCaHTEubX5fGzVYA93etBsWo9CzOA=; b=UdTZb7eMNcJ5KGK48V
	H6psN7mz8efuMOX6YYs90cdeN+AYyGoxYYwSTiFe5iXRNyRtDrGpragFYmK2XItP
	wsghiUZYvxO0h4zdYH3AXejzeSJBJYEPLlObNlc15f/poTp3fEgWCcTPhHwL2byw
	Q9MnlJRpv2hJhS0cUp1oaX2Y8=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3B5c2pwFrJohbJQ--.61736S2;
	Sat, 21 Nov 2026 22:14:15 +0800 (CST)
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
Subject: [PATCH 0/3] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sat, 21 Nov 2026 22:14:08 +0800
Message-ID: <20261121141412.319802-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3B5c2pwFrJohbJQ--.61736S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1xCw4DZryDtr48urWfZrb_yoW8ZrW7pF
	Wrta1akry7JFsxuwnrJ3W7ZF9xXw4fCan0gw17X3409a4rAasFqw4rta4UJr98Kr93A34a
	vFyYqry8Wa1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRceOdUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7xgTZmsBpzj+HAAA3V

This series continues the i.MX staging media driver cleanup by removing
legacy video node handling and exporting the Frame Interval Monitor to
v4l2-core.

Patch 1 removes control inheritance and source-dependent format handling
from capture video nodes, as both are deprecated in favor of the
subdev-based userspace API.

Patch 2 moves the generic FIM implementation to v4l2-core so other
drivers can reuse it, while keeping the i.MX-specific input capture
controls in the i.MX adapter. The error calculation uses signed
arithmetic to avoid underflow when the measured interval is smaller
than the nominal interval.

Patch 3 allows the FIM input capture channel control to be written,
which was previously rejected with -EINVAL.

Compile-tested with allmodconfig; checkpatch.pl --strict is clean.
No runtime testing due to lack of hardware.

Jiaqi Shi (3):
  media: imx: remove legacy video node control and format handling
  media: v4l2-core: add frame interval monitor helper
  media: imx: allow setting FIM input capture channel

 Documentation/admin-guide/media/imx.rst       |  10 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-fim.c            | 324 ++++++++++++++++
 drivers/staging/media/imx/Kconfig             |   1 +
 drivers/staging/media/imx/TODO                |  13 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   5 +-
 drivers/staging/media/imx/imx-media-capture.c | 192 +---------
 drivers/staging/media/imx/imx-media-csi.c     |   5 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +-----
 drivers/staging/media/imx/imx-media-fim.c     | 355 +++---------------
 drivers/staging/media/imx/imx-media.h         |   7 +-
 include/media/v4l2-fim.h                      |  40 ++
 13 files changed, 444 insertions(+), 626 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

