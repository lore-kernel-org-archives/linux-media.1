Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163CC3C198D;
	Mon, 10 Aug 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375344; cv=none; b=Bz3/eY48KY3iCBsuFvvL6Fl9AbIyY8/rn1+LjJPCdpFJUnVbcOOv2kv9y7WDLMIN43zSqCv7oq14fDUX0JLlfNmZAblj3i0hPYiCsGglGt2UUtpr+FsBgbiweamvSuZwwu7kjLiu7f8UXvjv3rgMGJIfQn3TxegvK8P/M//aEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375344; c=relaxed/simple;
	bh=d+X5GDQs24wp15ngCdEhSn7ILQk6GDzdOiR/b9+G638=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pgq8dEPq1XBZ48m3kEWrR6Y7iJF8TOznOh/VjcWgMfYcMcDebPkKjEJVVWR327TFZpTTFy/VHAOJ/8jiaUc/StqvUorXZIIn2a1bD+L/oNJqOiPdtDmA2TY/PL4YFrOcg9LiP6TchjxEOz2K3U1lO71iCEPKqxFPM10n0CLo6cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g33q2kkT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g33q2kkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786375341;
	bh=d+X5GDQs24wp15ngCdEhSn7ILQk6GDzdOiR/b9+G638=;
	h=From:Subject:Date:To:Cc:From;
	b=g33q2kkTUw1CQ9jtfB7XtxdmuB+gcw21rG43az8KL1xRzlpcV2xbOvUKGQsKcI6ab
	 TNG+UGmI+LUBGYdjtUlhd4v+mM1asjazyRESvyRawNYgrwu7Fg/tWYKaP4pogaHf6R
	 Pqp02abp1WPBTx12Y+4BTAEjJh+QluNEWs54hP7bLix823PjjB/LNRXf2JCm9DxSul
	 J0/5XOxVMUNeOrpL2vnCmq7zPGlz9oTciHoM0C66ChdznSve0woO1y4n6mJMcB1CBa
	 iHWY8bYjobMlJAieLNxaC72v3klJ60a5X16O1AhNqkzYLVCyHTtEX1PwG0+6c4aJnP
	 Xt1HmRNGhu6Cw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7669517E0749;
	Mon, 10 Aug 2026 17:22:19 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
Date: Mon, 10 Aug 2026 11:22:10 -0400
Message-Id: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02O3w6CIBSHX8Wd69jgoIi+SusC4WhUpgG6tta7R
 9lWl9/2+/M9IFLwFKEtHhBo9dFP1wy4K8AezXUg5l1mQI6Kl1yzcF4dWTYul+TtFIg1WkvhTCV
 4jZBrc6De3z+T+8PGcelOZNN755sIdFvyV9pi0JlIzE7j6FNbKFNXJF3ZqxJ11/BeNlpWJQoka
 ZC4qFFXwin4d8zKb0PFkcV5YWEw8qdoSFttTc8FNe0q4PB8vgClQzzM+QAAAA==
X-Change-ID: 20260408-rkvdec-multicore-98831da51072
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
 kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2

Since the driver is used for decoding on rk3588 and that the SoC has
2 identical decoding cores, enable support for it.

Instead of exposing 2 v4l2 devices to userspace, the driver will only
expose one and handle the 2 cores transparently.

The 2 cores are able to work in parallel, but only contexts are
parallelized: 1 stream, that uses 1 context, will only be able to use
1 core as it usually needs previous frames already decoded to use as
reference frames.
To avoid complex scheduling, only different streams can use cores at the
same time.

The implementation is based on Sven Püschel's RGA multi-core support[1]
(and this patch set depends on it).
It uses the maximum parallel jobs implementation in v4l2-core and also
uses the same components mechanism to handle core probing.

A fix for the RCB (Row and Cols Buffer) size computation is also provided
as it was causing issues with some fluster tests.

The v4l2 commit is not signed as it should be part of Sven's patch set
v2.

Performance-wise, fluster doesn't seem to run much faster, but I tested
with an HEVC test video from Jellyfin and observed that frames start
dropping with 6 concurrent gstreamer instances, instead of 4 without
multi-core enabled.

[1]: https://lore.kernel.org/all/20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de/

Changes in v2:
 - Remove job_finish/buf_done dance and use Sven's max parallel
   implementation instead.
 - Rework history to have a working driver at each commit.
 - Remove the 2 cores limitation, any number of cores can be used now.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Detlev Casanova (5):
      media: rkvdec: Keep RCB to the correct size
      media: rkvdec: Remove unused need_reset
      v4l2: export v4l2_m2m_set_max_parallel_jobs
      media: rkvdec: Split into core and master platform drivers
      media: rkvdec: Add multicore support

 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  17 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  16 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  77 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.h    |   8 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  24 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  26 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  27 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 625 +++++++++++++++------
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |  31 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c             |   1 +
 12 files changed, 596 insertions(+), 304 deletions(-)
---
base-commit: 6a75e3d4f6428b90f398354212e3a2e0172851d6
change-id: 20260408-rkvdec-multicore-98831da51072
prerequisite-change-id: 20260602-spu-rga3multicore-ae8c8caf01e9:v1
prerequisite-patch-id: 57496def46f4b8bf13d70a6f73dd9005b59d9ede
prerequisite-patch-id: e89e8a899373aaaa8cd1242d30f86a957b4d7e27
prerequisite-patch-id: d1f2bfc2a3ca3aef12a9678fe15bb93f346caf95
prerequisite-patch-id: f46ff26bb00afaf45122256d30f68464589d9943
prerequisite-patch-id: cd802c9f5c1106d08738f92a0a7c3d74fe2c89c1
prerequisite-patch-id: 1ec6b5db4df41bbe96f4ab8e83feeff1392a622f
prerequisite-patch-id: cb6a14d144c4efa77ad6396b005fa1f97d3a834e
prerequisite-patch-id: f8d48c1836f2287305d93af37a8c2fdb13c8a1d9
prerequisite-patch-id: 125ab4c4cc472f7a47f1ef41182d751b17056bf4
prerequisite-patch-id: eec4c1acdf5754b2faae9c8b18b93b8fb6b3aea3
prerequisite-patch-id: 4b4d935e09abc95aeb7e8aedffd3eb179b36d5a0
prerequisite-patch-id: 01df8a8e2a7d25a098483c03b18b6da425f63361
prerequisite-patch-id: 9a9071eca6bce3f693580756d5077d4bc8968a95
prerequisite-patch-id: e3f5d215b7207701cb331e720aada3fe504a0f8b
prerequisite-patch-id: ec44f51ffb6beb8c2b7854debc1b0b8be127d30a
prerequisite-patch-id: 14dad2504e1293cd4c5dc215ae99b2c6fc5e5877
prerequisite-patch-id: 10c6c977c0f71400931941b42da73adcaf63e810

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>

