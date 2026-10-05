Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAB37473A
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182815; cv=none; b=G6Xqu/r+u/TKX6J/glhfouJYmrPkHrVDP5dU/iKP/ATOtfT0W4kEsE+6BrmCB9dEuFv+iTLOxaSKxhg/ZKTWm6TCNxcoeIQ99UUsoz3HB3SAm8y4YceadhkQpumM+SXGrMqQsiq/NZvQmNt7MqpzZaBsspGegKbbKGmu6n92n/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182815; c=relaxed/simple;
	bh=pPxWjPgoC5ZIds9yfuD0Hb2xgEd3s6+PhvxvqEZ957Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i9yi8x42UwJAW+Rtdfia3t5jOpo02r/rrWgZGmFk4ExG3dntcJjVWRSelJYprekudfbjXToPvhsPWQrCROHmW6rVj4bhyi3weCuH84jDOuQedbKXRx2KUU4vz62FmlFpjprZm8hwTb4rpjtgxgcd+LbhW3ipMR2RHbpeCFGljGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbxG+bzT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbxG+bzT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso12938955e9.1
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791182812; x=1791787612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14533aMWhAmVs8SNCRLlWVRuMICBt1zkdaHBPEpaQzs=;
        b=HbxG+bzTD+p+rn9qx7izKiqwLaK7HHFf5ZJq9kycITHZIq0dorjbM+urbpJWvZv4Wr
         bKe74GiBudMJhH5CYZaDBWQrtTCJzS3PC2+lkcrls3xpXTTWUQc5YOtwGNvGiZLyEqRk
         kNMRSYd3hIit+5Ecyf2nQBIiaKfco7OOQkaSXAlFrKx/JPEGCJsuljTkcsfSQ4+DgnGJ
         sv/ztOo5NZrW8who/qyaOiLnbbZLTfkuu4aQroGY4YN2eLm7IHNzf4TCKBgDGZl4ZMvI
         8Raz+AqCGqLJUktZCNIAQQ8a4E1Xht3vlDe8kvgPUj86thdjkzchBoa3ZTUXZGmfKVDW
         JZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182812; x=1791787612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14533aMWhAmVs8SNCRLlWVRuMICBt1zkdaHBPEpaQzs=;
        b=HeZUbmqClv5Jpafnty67lAfLARGomgql4hf+oYZbMiBRExAEapezjL3BmwLN+lT6no
         AgZDTIKslDWqFMWl8U8lftZRVnBaPWE0rwqDOcCpJrEH9uXCGrywqQMYmGGwZqHUT8j7
         e+dt1CwdNH3TbWc6jPkDilNiuxxn/NcJqmOH2nDcAOxkV+5NE728L5ASw1KUsTISVE6T
         YU92HydXf991X1xRs9Wd3U1NLJTqJONRPdicaEBNzhvTzQtOm1fWlo1okh0kOLaN3694
         cWVG/2vAz8BE3ArRwOk8pkx3SIDEQD7+PK6sF0ML73wJelcBmPt/dbBnUUVb1HQ/yK/f
         vZ+g==
X-Forwarded-Encrypted: i=1; AKwUvBxaExz11utOUCz5iGi8P7UErPAx/9MAPbzdQpw+ETClKU79KLqELXv3KC+1AgZ1zoLKmJgMv8RNjTXgGw==@vger.kernel.org
X-Gm-Message-State: AFuF++lhm+5bDuWXaMapvXQtUcOxLDNi4F0sXJIT1C2miCvfmjAOcKrx
	OwT/7oyvDW076ILolSpl4MoGfLshfYtTCyRyGW/NtD3gZlOe7k0LNsm0
X-Gm-Gg: AYBFou1rgyzanUJgxItrTcqO5yhSWv3ygRzxRp1dVeLGSyZP9mZOiMiuAaG5OOPOAd5
	ff8RffM3D+UVlfWUNTrgcHTe2ui9LTeGVV16a0lciizaVyqPb3a4XmrsnLNYujAwhmZS6dfiAoJ
	+qO+yG7+1VehjeGB8eY8h+bZFpVpdL78To5eCIQGxVdgqAE2jBijkNiMz8mdd5mGhJJlCECb0Xm
	F4SxmTCtw0R004b+8hBy/FoSOd5uiyZ+kbIhQcaOMKLU/lA7OuPjX4PPk4ViC1WVnQJDhT0S81a
	Cb7j8ibUiUSM1+4IO164+oboPQZX2HiVC9aMULQ97M647hBwTGKEn7n/vueGpXgSY2aQi8XJ6kF
	RviYK9JL1BzrxmFB2qngHpu0muz/UWTJ949xXqQTnepnsgezuQwh9ESDaSnB42tNG/IGlMRm1MT
	NK3e52yuJOBVOy1dCPG/oXcvvpfCIfctdeGAONDpRA9xuu4BrwAMsEKynB7oIP+WXbLvrDo6PZW
	0JaDefCrsoUJSXMFc9h6K1/byAN9NIL0Razn60A1g/9MSj0XcaCFzCFC8PpKrIncV0sUKxDMpX+
	HE5qwb280IgLovtUEzvg477GDZkXdsz1yAYeWGjZZUPVLyobn7gXDocMCf4RxEMw5HM44ECthuQ
	sa1Rfe01SgwZW
X-Received: by 2002:a05:600d:82e4:b0:4a1:71af:cbc7 with SMTP id 5b1f17b1804b1-4a171bc2193mr44005545e9.13.1791182811349;
        Sun, 04 Oct 2026 23:46:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315273615e9.14.2026.10.04.23.46.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 23:46:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/armada: set an unlimited DMA segment size
Date: Mon,  5 Oct 2026 08:46:39 +0200
Message-Id: <20261005064640.7776-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261005064640.7776-1-kmehltretter@gmail.com>
References: <20261005064640.7776-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never sets a maximum DMA segment size, so the device claims
the 64 KiB default. With DMA_API_DEBUG, importing a larger contiguous
dma-buf reports:

  DMA-API: armada-drm armada-drm: mapping sg segment longer than
  device claims to support [len=1228800] [max=65536]

armada_gem_map_import() also needs the buffer as one entry. An exporter
that respects the 64 KiB claim has to split a larger buffer, and the
import fails with "dma_buf_map_attachment() returned an (unsupported)
scattered list".

Set the maximum segment size to UINT_MAX.

Verified with a QEMU stub. Not tested on real hardware.

Fixes: 96f60e37dc66 ("DRM: Armada: Add Armada DRM driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 with DMA_API_DEBUG on QEMU's
    xilinx-zynq-a9. The LCD controller probed from a stub device tree
    node, so all registers read 0. A test module registered the
    armada-drm platform device, because nothing in mainline registers it.
    
    Creating a framebuffer from an imported 1228800-byte CMA heap buffer
    works before and after this patch, with one segment-length report
    before and none after. With patch 3 alone it fails. With patches 2
    and 3 it works.

 drivers/gpu/drm/armada/armada_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index cae25ad66c74..42498fc77e54 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -6,6 +6,7 @@
 #include <linux/aperture.h>
 #include <linux/clk.h>
 #include <linux/component.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -101,6 +102,8 @@ static int armada_drm_bind(struct device *dev)
 
 	dev_set_drvdata(dev, &priv->drm);
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	/* Mode setting support */
 	drm_mode_config_init(&priv->drm);
 	priv->drm.mode_config.min_width = 320;
-- 
2.53.0

