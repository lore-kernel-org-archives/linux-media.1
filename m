Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619658;
	b=STn/qGGSWSj0HrILhJkt/umP5L1CArNS6blx6TQNemIw+hta4XYQpL84exNECofZhWzf
	 2iCTvmuE4F7dGAbFids8R6Z4eN2Gp+p3MuguObCs7zkKTLDPix63IljAlRKv4EP5mg9cz
	 bYFwbBOL4AZp5Flq2lDzKkhcDWLIBKmw6emj7NGd+jDVfpLA6Jb+bmO+SA+9x62cucWI1
	 v9e3QjAVpxG1lBQZE4DGLd1Kx49ve36PspQqseCip01pPfV8dfBz8ohiufw6e7BmayRlC
	 Yp7Ux5oV+vyqc8m6HjA6Z4EK5fBYpbvxcr/qQ4CssLqY7GVgXZxE7M17QbzR/A83EWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619658;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=4H5rXupeXVelTv8cQfAQi5Pfe54OfJ2qxyIgFO6s3D0=;
	b=Xx0VV7/lRRyVtuu2SK+dUqxdO6oxusMRfjImOugAdvVLuvYcTy4ZycowjqMph9Duvrss
	 CqtpXFEMe8/eATBzd6EiiRRC3bWyrnJQXcZomkRHL+HHVnl+YWxV3hBjQicu6hYUOxdEO
	 qnw5YD2eMvL2hhGM7zkanDiT6eQLro+UItUhfj7srou4mry2DZTQFNVRUrU1qrLririgb
	 i2vOFT9qaD1UeRltEB1fuGGhD57M18Eh1o6ZOB5S8Ry/jlXIb5BA2Y2A0t+ev5Lvg3MlR
	 g6yxS+W8QmFBFmgzQWT98OHoDZoWVt03Fu/BB3KHiH7ezWDI8lW0NvCBzgdadU9d8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=evHh8rcC;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C655606A331;
	Wed, 25 Nov 2026 15:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C655606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=evHh8rcC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619655;
	bh=RaqDyMC8lJJL26aGZDAiBmWLdnQfQtaIC5pvpzawh1I=;
	h=From:Subject:Date:To:Cc:From;
	b=evHh8rcCs6Hsz2zemn7qsnsihPQ6u+yTrJxFKNa1fTqvQfi/f8BCyylT3Dy2PjvVH
	 nFmQ+afzJWPC5W2LVkXV+NLP5pPxVsbEP3OJQlLc8W+0ZYlsAY/zEH9DwI8ygHs2Vb
	 4Xkiyq41B9WF4BPGgp/BcYaWS6MTqHTjf3rQX1lDG2xKCJHbROHGQeWs2LbgQRV8ta
	 5bK8HQJBsoU46/JkCWkgUHZszwcCSUC4LSM5YbEdmKsX1HHELzx7wgeUkUPZHuQwIW
	 U/QnxvDWwOp7GxCQ6bzVHmv9iaZzfmuRxzd0TA/NfaC3hHYruOLwHkNnSWFTaVzYJN
	 DGVLo1Eb8pN6A==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC45417E0075;
	Wed, 25 Nov 2026 16:14:13 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v4 0/5] media: Add fdinfo support for v4l2 drivers
Date: Wed, 25 Nov 2026 10:11:57 -0500
Message-Id: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ7CIBQE0KsY1mLgYyl15T2MCwofxdRiQInG9
 O4WjdFYl5PMvLmThNFjIqvZnUTMPvnQj2E5nxGz1/0OqbdjJsBAMskZzcsOqLaWOut7F6iuG+Y
 M6lZAQ8bVKaLz16e42b5yurQHNOfClMbep3OIt+dl5qX31mGiZ04ZrUEA57o1SvK1CV2n2xD1w
 oQjKQ8Zvo16asBoWGgUNsogk/qfIT5GzeTUEMWoKllJZZxQ+GsMw/AAGGCulUwBAAA=
X-Change-ID: 20260610-v4l2-add-fdinfo-a790fceab329
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2

fdinfo is useful to poll information from the driver.
Unlike the ftrace interface, it lets userspace tools get a snapshot of
the state of the driver at their own pace, instead of getting events for
each driver status change.

This works better to get information like HW usage time or clock
frequencies, as well as memory usage.
This patch set focuses on mem2mem drivers that are per-frame based and
an implementation is proposed for the Verisilicon Hantro and Rockchip
rkvdec drivers, limited to main clock frequency and HW usage time, as
well as HW cycles counting in Hantro.

Even though it is not used yet, per core fields are appended with 
`-<core_id>` to support multi-core drivers.

To ease support in drivers, a v4l2_metrics struct is added.
It stores metrics information and provides helper functions to write
the fdinfo file in a standard way.

An example of usage of this from userspace is implemented in v4l2top:

https://github.com/cazou/v4l2top (Check the upstream branch)

checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
definition are kept unnamed to match with the rest of the struct
definition.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v4:
- Rebase on master branch
- Add missing documenation fields
- Fix missing indentation spaces
- Link to v3: https://patch.msgid.link/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com

Changes in v3:
- Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
  "metrics"
- Restructure the documentation to have mandatory and optional keys
- Add core ID to fields
- Add HW cycles count support
- Add ABI documentation
- Link to v2: https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com

Changes in v2:
- Simplify key/value pairs by removing repeated <eng> suffix
- Add media type support
- Add v4l2_stats helpers
- Add support in rkvdec too
- Link to v1: https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabora.com

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Christopher Healy (2):
      docs: media: add documentation for V4L2 driver usage metrics
      media: hantro: Add per-context fdinfo usage metrics

Detlev Casanova (3):
      media: v4l2: Add callback for show_fdinfo
      media: v4l2-core: Add v4l2-metrics interface
      media: rkvdec: Add per-context fdinfo usage metrics

 Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |  19 +++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
 drivers/media/platform/verisilicon/hantro.h        |   4 +
 drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
 drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
 .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
 drivers/media/v4l2-core/Makefile                   |   2 +-
 drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
 drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
 drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
 include/media/v4l2-dev.h                           |   2 +
 include/media/v4l2-fh.h                            |   3 +
 include/media/v4l2-metrics.h                       |  47 +++++++
 17 files changed, 464 insertions(+), 1 deletion(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20260610-v4l2-add-fdinfo-a790fceab329

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

