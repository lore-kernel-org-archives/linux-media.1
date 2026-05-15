Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD642C326F;
	Fri, 15 May 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859128; cv=none; b=fDsV1bvf2RglLxKANvJ1F0kCfkDirGwqZjsHWIxArLvpcvM05ZwRY4bGNz+vAguDYfF6DIeIBVeWvHC4AogJZkHX660SzTNOXGxBzoZxk1bu2D5dhJAO/c4TIsxls+dYdsM87KCYCwo3/lf6ZhRALBQQtYnbUt/McVp/QqnvMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859128; c=relaxed/simple;
	bh=5Gxq9yMynSwJdjKd88FkdCTSrogJTTVnTUWClcg9h4M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dACnFbYa3+1DMC6SWTWDHI5x0vLIEJ9Q2ArcKZkAzkZE5Adipgd/mtKfIUT/rbT/jt7XliQnIM+wHDfql871bdjQs9sokwyGG1nPoZFBqQ74qt5tJZRDMIe2yFFKBc03LYRpxjB9KWLg1dNh6sfb+uk3UqkmcnWjNTcc6+GdhZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=SdU+snal; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="SdU+snal"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3e998b3a5;
	Fri, 15 May 2026 23:26:45 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: kernel-list@raspberrypi.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	stable@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>
Subject: [PATCH] media: bcm2835-unicam: fix dummy buffer double free when register fails
Date: Fri, 15 May 2026 23:25:29 +0800
Message-Id: <20260515152529.1007540-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e2c3f470303a2kunm2a038511b5e75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkwdVhkYSkIdGBhNQ0JPH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE
	5DQ1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=SdU+snalX6XbTgzVHEGABfiY0lcMHjp4/bBOPoOgQd6bkyf96v58DGrzuruV5vUDAEOeOOz1D+5NBOIEcbF2iKpX0+W5ijw4T4v1mxRsse9ULURc2xPkjKAmPxWCotldo1ThZGNEGl4YVk+kwUo2EvwtOPGLzfnKoJYF0tWSArM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=FL2Ht1pJWO26wflxEZyGX/gD0cNb1r33NP2jdahxIPE=;
	h=date:mime-version:subject:message-id:from;

unicam_register_node() allocates node->dummy_buf_cpu_addr before
registering the video device. If video_register_device() fails, the
error path frees the dummy buffer but leaves the pointer unchanged.
unicam_async_complete() then unwinds the partial setup through
unicam_unregister_nodes(), which sees the stale non-NULL pointer and
frees the same buffer again.

Set dummy_buf_cpu_addr to NULL after dma_free_coherent() in both the
local error path and unicam_unregister_nodes() so later cleanup skips
already released buffers.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1-rc3.

Runtime validation was not attempted because reproducing this failure
path requires fault injection in a hardware-specific driver.

Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
Cc: stable@vger.kernel.org
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index 8d28ba0b59a3..94c80601c50d 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2360,6 +2360,7 @@ static int unicam_register_node(struct unicam_device *unicam,
 	dma_free_coherent(unicam->dev, node->dummy_buf.size,
 			  node->dummy_buf_cpu_addr,
 			  node->dummy_buf.dma_addr);
+	node->dummy_buf_cpu_addr = NULL;
 err_entity_cleanup:
 	media_entity_cleanup(&vdev->entity);
 err_unicam_put:
@@ -2379,10 +2380,12 @@ static void unicam_unregister_nodes(struct unicam_device *unicam)
 			node->registered = false;
 		}
 
-		if (node->dummy_buf_cpu_addr)
+		if (node->dummy_buf_cpu_addr) {
 			dma_free_coherent(unicam->dev, node->dummy_buf.size,
 					  node->dummy_buf_cpu_addr,
 					  node->dummy_buf.dma_addr);
+			node->dummy_buf_cpu_addr = NULL;
+		}
 	}
 }
 
-- 
2.34.1

