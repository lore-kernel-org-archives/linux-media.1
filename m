Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122801AAE28
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343140; cv=none; b=IQAKVeit2yF++k4Ar+Hy7P20DIDh4mNe5X/UUgBlAZVDPM0E7uPvr9s+gV8N/W3pQC1inpfuRgSLmr2PK6BwJBXcP6zKciVNtEz2VWspFFzXCr4IEKuVrwuDdNNXJ2bP2z1xoBISk7X+5zyoLkqZHQcSX3+kQ5jnserS3e5A5fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343140; c=relaxed/simple;
	bh=II68ycjz1nQ/E4fomySwRBEgaqnw2HhCSWBJVYb8Gbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EMLRfQeoyWl8R3hrSKwQUlWw19aMJ9JvvQ4uQGyUtepNB3zPM2mUBvjrczIBDtBgN6RJ8fVvyuIyL4JbOaJZqqHYcLoz5jaN5xc/srEN3zykKgaALHud5Q2gYG7y1xHUYe+hFI7zzZKTKHC1gdwKLFRz+3tGH3nBBMLsx9YIqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGXD7Gk9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGXD7Gk9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc61541f8cso43322335ad.0
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 23:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343138; x=1786947938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=HGXD7Gk9A7YDinJPXGNqqPt810v8As6z4HHRvUBbRocB7EN2WTADSR8+VOgN8Zv9VL
         IgQd5HkQrUBByRO0Mf/eiWHDPsh4Ka/f4LCZneyVSYW1eFMEr6XTj0k0KBuyJ1Wjc2ob
         EP03Feo6V/nbX4/P+kLf+yZj/lUbim7CVQSZIhvojS0C1AfC4aWaD7Bmlk3aT31hTbiB
         Ya7UJyna+gE/6r9YVav8HFcf2aP4RzVQRjT6TPwPHlEPJmiJ+RBUFeLvWoR/81tgMFvH
         DnxPr56nnWs0WfhT/0p2NHRAebKN8mjF347KOoTdTgklOY9TUTNJTLW5i9a3I9YlNKFf
         FSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343138; x=1786947938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEmwjKRPxWjvxM9agZBy10ArpaTDJu1wZiUuC9YJp84=;
        b=j5xI4oVPRaN1njlbUywKQH0HdlMhl48/hpQa7GFQWSGEVLBsQrdvz68WWi1SSyMCNw
         HCXJ6oDc4RF1GkyzLwkbRRVzNHOazDPNneNWgk+HsS48U14KYGxA/yKnVFf+KMaHlQsT
         LR2uID8l/TDnV0UzgdEr8RvyoTGPfRE/CnGIEDjd8v/NkmMyPg+dDWl/c1oQDx2bWKjj
         b0vQRMhgLK0Rp4YclhGi3+ZeFcBB0MLIuiap76mrk96VWiIHbIywkjAWvdFCXXTQI8Pa
         xC2M3Hf7SKL8oUv41P+RuYLIU2B9zdMwMLpY+BQC8/b1sJ6xDh/tm6wceawJQ+W0TDBX
         OYQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGChzgXbuycfRKjegT/lmJzQ3JF3h6Zneecqvp+NvVo1yX08LNHSQYF/35XLx8xtIgauHdnjhO1tW10A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMjeZozoaQUTGUVVcC0kcYa4WQSHqu6k+lVfz+AHatFcrQoCCT
	iXcIyarFSLDYhXAWjXpZEl1Vc77S5XbyMMk0HpG7X0rfzhyxVpwxFGKF
X-Gm-Gg: AR+sD12FofbK/Q4WK55aCegg3JyrXPgXvviOAyxniqS/aNqdi4st2iBjWBXKVmZ8mDn
	uzMX7K5SRL2q0hD8zudWwIBrAu8A559hLU28IuB0qHJTdaErTiOc4ePUH71oRjlWIMFm8bH0Wp2
	FX+iZOklmlsTuF/6LhQ9CmyTLehF16cX5eUrMVpiDIXVgzqx2z8QXx5hauvxKENLtIaSFu+fYF1
	htFDK+JMvfOdLIGQw0Hbs7QWbrUkHFT66D6NAzLrjF4tr2yMZHKa2vpH8bOJ7SSL18gBcAaoaiD
	zWKOCk3EH1nTahkNskHgrbzCyn4MylqMoqMOgwdkR2vzsRLykuXs9bfPW31pUzxlPK+yyA/MZse
	rzNhojpYKbC1Cb1Hn2cfgeal0gyH+jeLoWDdHw8yIbzVpQqCMrejLq14CTiay2WNZFKoX/Q0iED
	UvrYmkXNsIAvszMHdYTgQ6Bm2YyiL9r1kmcxjovBQLLiJRiZxGAjf5AMtEch+YOjiNFB6jZWBNp
	2hsLN6QSd1EW0IN
X-Received: by 2002:a17:903:37cc:b0:2cc:ac15:ff4c with SMTP id d9443c01a7336-2d2b2e1b741mr165459175ad.8.1786343138312;
        Sun, 09 Aug 2026 23:25:38 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: sun4i-csi: disable interrupts when stopping streaming
Date: Mon, 10 Aug 2026 13:25:20 +0700
Message-Id: <20260810062521.1709379-3-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260810062521.1709379-1-congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
 <20260810062521.1709379-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sun4i_csi_start_streaming() enables the frame-done interrupt in
CSI_INT_EN_REG, but sun4i_csi_stop_streaming() only stops the capture
engine (CSI_CPT_CTRL_REG) via sun4i_csi_capture_stop(). It never disables
the interrupt source nor synchronizes with the handler.

Capture stops at the end of the current frame, so a frame-done interrupt
can still fire shortly after stop_streaming() returns. If userspace then
closes the device, sun4i_csi_release() calls pm_runtime_put() and the CSI
block is powered down (clocks gated, reset asserted). A delayed interrupt
handler would then read/write CSI registers on the gated block, which can
hang or crash the system.

Add a helper that clears CSI_INT_EN_REG, reads it back to flush the posted
write, and calls synchronize_irq(), so no handler can run past that point.
Call it from stop_streaming() before returning the active buffers and
freeing the scratch buffer.

The start_streaming() error path (err_disable_device) has the same
problem: the frame-done interrupt is enabled and capture is started
before the s_stream call that can fail, so a handler can run while the
error path frees the scratch buffer and returns the queued buffers.
Apply the same teardown there. Store the IRQ number in struct sun4i_csi
so it is available in both paths.

Fixes: 577bbf23b758 ("media: sunxi: Add A10 CSI driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 4e0c2df45d4d..51173faea871 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -112,6 +112,7 @@ struct sun4i_csi {
 	const struct sun4i_csi_traits	*traits;
 
 	void __iomem			*regs;
+	int				irq;
 	struct clk			*bus_clk;
 	struct clk			*isp_clk;
 	struct clk			*ram_clk;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index e911c7f7acc5..fd83dbd1a3ff 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -43,6 +43,23 @@ static void sun4i_csi_capture_stop(struct sun4i_csi *csi)
 	writel(0, csi->regs + CSI_CPT_CTRL_REG);
 }
 
+static void sun4i_csi_disable_irq(struct sun4i_csi *csi)
+{
+	/*
+	 * Disable the frame done interrupt and wait for the handler to
+	 * finish. A frame may complete right as capture is stopped, so an
+	 * interrupt can still be pending here; without this the handler could
+	 * run after the device is powered down (pm_runtime_put() on release)
+	 * and access registers on a gated block.
+	 *
+	 * Read the register back to flush the posted write so the disable has
+	 * reached the device before synchronize_irq() waits for the handler.
+	 */
+	writel(0, csi->regs + CSI_INT_EN_REG);
+	readl(csi->regs + CSI_INT_EN_REG);
+	synchronize_irq(csi->irq);
+}
+
 static int sun4i_csi_queue_setup(struct vb2_queue *vq,
 				 unsigned int *nbuffers,
 				 unsigned int *nplanes,
@@ -328,6 +345,7 @@ static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_disable_device:
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 err_disable_pipeline:
 	video_device_pipeline_stop(&csi->vdev);
@@ -353,6 +371,7 @@ static void sun4i_csi_stop_streaming(struct vb2_queue *vq)
 
 	v4l2_subdev_call(csi->src_subdev, video, s_stream, 0);
 	sun4i_csi_capture_stop(csi);
+	sun4i_csi_disable_irq(csi);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&csi->qlock, flags);
@@ -438,6 +457,7 @@ int sun4i_csi_dma_register(struct sun4i_csi *csi, int irq)
 		dev_err(csi->dev, "Couldn't register our interrupt\n");
 		goto err_unregister_device;
 	}
+	csi->irq = irq;
 
 	return 0;
 
-- 
2.25.1

