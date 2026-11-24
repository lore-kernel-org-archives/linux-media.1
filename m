Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526306;
	b=NMhMycUQDW2Nkk3tf2q0rd9vHwg9hP30hMVBacmSnUGObu1iudjzCvIJWoD+E8rLzTPm
	 eamXA+ADYvsz5bbOJSJxNGLrZ5cPgdyw0W0BcarPbqU4Y1b2jBtNls/Clao5qZEhtPa83
	 vfD+LKH6PABcbJpIHGs7kXEYlGCCxZFlxzpdEgrI6M4Ap/kqOvAbSU1Hy/zyRIomIzPvm
	 xSCMwlqyDSLzYWjG64q9CrJzTqyLOA7WFG4PNZVk/ysfmck0pibGCOYbejVyqfpcAdqZK
	 dEzwV7Pif+YGwBMu6fHx3/NFUPW69Q+BcpplIn/Q/2w6i44uDdAEX4pn8ia23Agalrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526306;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hWtVYr3EPFbm5FPt/2PvWHxmtKWC1YaK9F5RGTOmkh4=;
	b=UIIUU1SaZhb80nnciR6EXpocqyuRKvrzrWerKyvAP2ZP3RUCVhi866VPbKEJs3XmsU9T
	 eGaG2m9TEHWAPfZ8WGpgOnhurV/n3tHZ6wy2GFSaC+pfI1rVk4pUDeVW+1BkeHNtv6OYG
	 NNw5oo8G0nJx/K+8NH/3eROmNhbKXDARQYJvq4EPoGtg2nVo+MUtCPW25hgplX7JVxeac
	 VerS6U1aEKqRZepPqnPh21Yva9qMtu+PCMtXUtGyiWVwp0UWjODqHTWIi8OW/gIcbiiCz
	 8yrIcmLEU5ngBgsVRYysQ7qgmLtiJVdmzeeNoDejtMb6rhfYPtZCWqGuc93wPnrD61w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gyDidKN2;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5729B606A31E;
	Tue, 24 Nov 2026 13:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5729B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gyDidKN2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795526303;
	bh=moP8vv2wP7RX1Y1U0tW7Ss00Ce8Mu0E7W8FXoYpANng=;
	h=From:To:Cc:Subject:Date:From;
	b=gyDidKN2dOXtWDmMtA66VdhSFhW038OZigyRLYV2d8xzwxrQlBL7yoITK8W116gd+
	 JAoNypsTpA9khgIBOjCUidPXbdmjIcTn7sYkEYLM3mxqhCUFckfcXkXyK/ggnP7Y34
	 jedo0lyuC9yvHg6digpCBqswyzZ/1UaqH/dirMoRo/rrb+vLt1jkGDleBVzoNKoqkp
	 Ivsf7AA64RmevAi49t4na1IsS26v5VQLj/R93EwNXp97xFXgqwE6bCGbgcItlxh+ac
	 PTxuDdrPhMv85Kf05RX/a4q6gmoicjwi23URi8+KU+Y0kAHcuKhRH83VTDDArhfISf
	 xg1LiPLTS20cg==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D11617E09ED;
	Tue, 24 Nov 2026 14:18:23 +0100 (CET)
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
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 0/3] media: verisilicon: Create AV1 helper library
Date: Tue, 24 Nov 2026 14:18:13 +0100
Message-ID: <20261124131816.115131-1-benjamin.gaignard@collabora.com>
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

changes in v8
- check reference frame index when validating the frame before
  calling the driver.
- add Reviewed-by tag and CC stable kernel.

changes in v7:
- prepend 2 patches with Fixes tag for backport
- rebase the series on v7.4-rc3 tag

changes in v6:
- include b84f6533a8ed ("media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer")
  and 367db8b23c26 ("media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity")
  fixes into the patch to not losing these improvements.

Benjamin Gaignard (3):
  media: v4l2-ctrls: validate AV1 reference frame index
  media: verisilicon: AV1: Fix luma size
  media: verisilicon: Create AV1 helper library

 drivers/media/platform/verisilicon/Makefile   |    7 +-
 .../media/platform/verisilicon/hantro_av1.c   |  807 ++++++++++++
 .../media/platform/verisilicon/hantro_av1.h   |   64 +
 ...entropymode.c => hantro_av1_entropymode.c} |   18 +-
 ...entropymode.h => hantro_av1_entropymode.h} |   18 +-
 ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  125 +-
 .../verisilicon/hantro_av1_filmgrain.h        |   48 +
 .../media/platform/verisilicon/hantro_hw.h    |    7 +-
 .../verisilicon/rockchip_av1_filmgrain.h      |   36 -
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 1082 ++---------------
 .../platform/verisilicon/rockchip_vpu_hw.c    |    7 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |   20 +
 include/uapi/linux/v4l2-controls.h            |    1 +
 13 files changed, 1152 insertions(+), 1088 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
 rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (85%)
 create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
 delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h

-- 
2.53.0

