Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201201;
	b=0wlai9nqux6yVhzHcBJbV1dXZIrH9tA1BKDIDtDjO6pKZXLs1PYVBbve3gpahCHQ1KiF
	 VAF607apr47BU14SD0Dx2/szpmd+hrBFrPiqbt5YTubEe4ZvMGdWmHMzCJwXyopyCGurb
	 0CkU/AeCTkiwnfZyXA07VWpH4/JYrfQkOg7G0P2Yzlaqh+wT8ci1n/puCMfxEV7kfNz4w
	 THun8BK/L2Je1DkbHKItglNHKCWm/05FEJT0gydXaMr9KZ1WS3KNdSUwCmHBqy99O+uP0
	 +dtLdeoRc7RemRUjDiAIilLxMMgGomSD7xc+ej4WJ2f48yz15xTirjGocy8L0HyLQjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=qZzqOZMHjh3060GmVtwACfTN6uo2AblJxld9EvhqTEA=;
	b=464ejVVgSpMR3sijOx2rEGB3YVKPhq/kMrAQgWfDsin3PTog5SIKIkO8BzookQmrGQH3
	 PMPRMGkE4tC8Cgsx9M6rkv6p7gamaE4Af46Fs50YP6bPEbi9c4BHAAxRgEvkWmd9Y040V
	 uBjl0RwHc8riLo/uObvcCi8W+TBpkO2o6C8vMRfMA8oVEGbgk9rFQaGAvxbJZiCD9iKod
	 VrP+B9kwpfd7NvC66MUCcWj/6aUkL4YmtJo8kH17nzEaQT6J9aHk8ca2D+iOaihpBwemJ
	 J6FulBYUrnqKCCHEzDhwgH5Ta6g84Oxcy9jlD90idTcX1fN92qx2urlukavNpfK9xOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxw9BZnw;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992F60A260A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 18:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D992F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxw9BZnw
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso220897866b.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201191; x=1795805991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qZzqOZMHjh3060GmVtwACfTN6uo2AblJxld9EvhqTEA=;
        b=oxw9BZnwiV3EigbV/QVmoOiC/vTTe0gez77Iv6H1mF7RXK+iFM0Eip4Pi5dppRcfT+
         4H/DGJ+X16riOz6J95S/aaDQ97XtxsS7z0XbG0P+4mcBFvM9z1etZx1YDQGkO0Srgb4P
         9zvTLKWMRPrNNViAFJEu4hHz9iUMMdTQyrFqnl0cNiGxCWbeGMM4RPym/s/+QSWWrZO/
         kpyKIXOHz5JsBzNdjxXdQ/2wUUL3BVvJdWCNbZ2zmX2egAylPNR97Ij54WwDsyAPL7tA
         9z7SYPSvDWArH4OlOOzQ7jEnkyvO1lXTiA3my8kx1kVcQ2aG4gO3udNsTFIbzW7toF7L
         ewwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201191; x=1795805991;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZzqOZMHjh3060GmVtwACfTN6uo2AblJxld9EvhqTEA=;
        b=ljTlpI8cZc19Op2sGVr97pN9UdsRMPd2gmVHBpxwx6RWebVq4M7rOUjGTYVmcfylWu
         DtY2Bwz0Mi1akYidOaYXOlYo/ICFwF+bgMvlsjI/L3tE/3E/uTFnn1KVcCht5wOTB5CY
         53l1GU9JQMagHSZv64VJ8Fm3ihGg7FISX8CYbttIoCTszsdJSvCN9S4ODEm0Zt3GT61W
         V6WqxwtuyeNDg7RCzRPSKWjKqAOJ38fFh1yFFtiXJKylBx0YtgFZ5M2pyAldl42zeGXk
         4uO0MkK6sURx/cjPV/+eWWQKW/JRAmxBjx6RtYOgVsqpWxrT3fa8GC9TzvYnQJEytaBS
         gNAg==
X-Forwarded-Encrypted: i=1; AL+hErGJ4hnN6p6eNO8b7Xg0gMu86I6kdSorsGPInUD297qgJeZ95prva72PhPzc8RVW8bBiW9hKVn1b1/SzNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+OLl0iZ2MIITpGdoWRyS1VJdzkWW7DNmXikJcWOnF5ZykFrNDI
	jZWc4dNqQIdxr3wSt/8MH7KQF4C4JPzB1C/hEQo9Ic7NB8D3+0LwgOPh
X-Gm-Gg: AYBFou1NbgpSWAfs1Qxd02IvjiFfRMIjs6BFRFg9F2+SokO5ntTA6/d2T9Occlnndlk
	TnyHZx4gntYIxKZpgmiJGYX9qjj11xGnDblLkS13mXir34WKdWUoY8LVD2CKrV2A9Bk3asWgjgk
	DXUZZtqPtDGzxhAfE2XNanByALrjNYojZfIG+s1MVS9qx0MEICbRuEUBk1Fkky75nb8vGnOda5p
	qfCT0NOGdtugy+flAbmYtkeJQEQC/SixUtv99SlILteeU1j9SHWZUUKqU6NBEe72NivYenx6FBN
	IOv1LACW3I6/2yIlnc5pbw2v8+WQALnGiE20aA5TI5ZgiBOjoaRLYc1lThaKET5XYYQmpu+8BR+
	x5Gq4viw08xqgsXpG2d+DucjCbMp/BsdMfrVyadUyAs73GcG/PF/xzgrYW2ESLcMjSYDndvdb8w
	iwRktaa/xdwn4LN492KJ+SjfH8I3c/bRtEGn1YPju5r+iihAQZEwaPYAP8Jt9NoNeYxEKrB03VS
	ZLpvCRQxm69w9vBs9K0FmA1ik/n0ie7IrIH8MIbRu0MlH29XEev6CrH0JM6dsuen0LiOA7ZZfHX
	tfvRbPJ87uOwPVqdsaGQEyCUPB5P4KHfNVtEEbAIjoYv9UZ6H9UcF7m2brL/NA==
X-Received: by 2002:a17:906:18e1:b0:c50:5996:5b89 with SMTP id a640c23a62f3a-c513a84944amr317779466b.23.1795201191025;
        Fri, 20 Nov 2026 10:59:51 -0800 (PST)
Received: from antoniarch (84-40-238-230.cgnat.inetia.pl. [84.40.238.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm125205266b.85.2026.11.20.10.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:50 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 3/3] i2c: omap: add DMA support
Date: Fri, 20 Nov 2026 19:59:13 +0100
Message-ID: <20261120185915.150228-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120185915.150228-1-apokusinski01@gmail.com>
References: <20261120185915.150228-1-apokusinski01@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the TX and RX DMA requests of the OMAP I2C controller.
The DMA transactions are dispatched only if the I2C message size is
a multiple of the configured FIFO threshold and is greater than a
predefined threshold of 8 bytes.

Support for DMA transactions that are not a multiple of the FIFO
threshold can be added in the future using the draining feature.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 373 ++++++++++++++++++++++++++++++++--
 1 file changed, 352 insertions(+), 21 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f02d294db42a..650d1cce05c7 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2003 MontaVista Software, Inc.
  * Copyright (C) 2005 Nokia Corporation
  * Copyright (C) 2004 - 2007 Texas Instruments.
+ * Copyright (C) 2026 Antoni Pokusiński
  *
  * Originally written by MontaVista Software, Inc.
  * Additional contributions by:
@@ -13,10 +14,13 @@
  *	Juha Yrjölä <juha.yrjola@solidboot.com>
  *	Syed Khasim <x0khasim@ti.com>
  *	Nishant Menon <nm@ti.com>
+ *	Antoni Pokusiński <apokusinski01@gmail.com>
  */
 
 #include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -50,6 +54,8 @@
 /* timeout for making decision on bus free status */
 #define OMAP_I2C_BUS_FREE_TIMEOUT (msecs_to_jiffies(10))
 
+#define OMAP_I2C_DMA_THRESHOLD	8
+
 /* For OMAP3 I2C_IV has changed to I2C_WE (wakeup enable) */
 enum {
 	OMAP_I2C_REV_REG = 0,
@@ -57,6 +63,10 @@ enum {
 	OMAP_I2C_STAT_REG,
 	OMAP_I2C_IV_REG,
 	OMAP_I2C_WE_REG,
+	OMAP_I2C_DMARXENABLE_SET,
+	OMAP_I2C_DMATXENABLE_SET,
+	OMAP_I2C_DMARXENABLE_CLR,
+	OMAP_I2C_DMATXENABLE_CLR,
 	OMAP_I2C_SYSS_REG,
 	OMAP_I2C_BUF_REG,
 	OMAP_I2C_CNT_REG,
@@ -176,12 +186,37 @@ enum {
 
 #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
 
+#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
+
+#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
+#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
+
+#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
+#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
+#define OMAP_I2C_SCHEME_0		0
+#define OMAP_I2C_SCHEME_1		1
+
+struct omap_i2c_dma {
+	struct dma_chan		*chan_rx;
+	struct dma_chan		*chan_tx;
+	struct dma_chan		*chan_using;
+	struct device		*dma_dev;
+	u8			*curr_msg_buf;
+	struct i2c_msg		*curr_msg;
+	dma_addr_t		dma_buf;
+	unsigned int		dma_len;
+	enum dma_data_direction dma_data_dir;
+	struct completion	complete;
+	dma_addr_t		phy_addr;
+};
+
 struct omap_i2c_dev {
 	struct device		*dev;
 	void __iomem		*base;		/* virtual */
 	int			irq;
 	int			reg_shift;      /* bit shift for I2C register addresses */
 	struct completion	cmd_complete;
+	struct omap_i2c_dma	*dma;
 	struct resource		*ioarea;
 	u32			latency;	/* maximum mpu wkup latency */
 	void			(*set_mpu_wkup_lat)(struct device *dev,
@@ -242,6 +277,10 @@ static const u8 reg_map_ip_v2[] = {
 	[OMAP_I2C_STAT_REG] = 0x28,
 	[OMAP_I2C_IV_REG] = 0x34,
 	[OMAP_I2C_WE_REG] = 0x34,
+	[OMAP_I2C_DMARXENABLE_SET] = 0x38,
+	[OMAP_I2C_DMATXENABLE_SET] = 0x3c,
+	[OMAP_I2C_DMARXENABLE_CLR] = 0x40,
+	[OMAP_I2C_DMATXENABLE_CLR] = 0x44,
 	[OMAP_I2C_SYSS_REG] = 0x90,
 	[OMAP_I2C_BUF_REG] = 0x94,
 	[OMAP_I2C_CNT_REG] = 0x98,
@@ -462,10 +501,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 		sclh = fclk_rate / (omap->speed * 2) - 7 + psc;
 	}
 
-	omap->iestate = (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
-			OMAP_I2C_IE_ARDY | OMAP_I2C_IE_NACK |
-			OMAP_I2C_IE_AL)  | ((omap->fifo_size) ?
-				(OMAP_I2C_IE_RDR | OMAP_I2C_IE_XDR) : 0);
+	omap->iestate = OMAP_I2C_IE_ARDY | OMAP_I2C_IE_NACK | OMAP_I2C_IE_AL;
 
 	omap->pscstate = psc;
 	omap->scllstate = scll;
@@ -655,6 +691,168 @@ static void omap_i2c_wait(struct omap_i2c_dev *omap)
 	} while (!(stat & mask) && count < 5);
 }
 
+static void omap_i2c_dma_callback(void *arg)
+{
+	struct omap_i2c_dev *omap = (struct omap_i2c_dev *)arg;
+
+	complete(&omap->dma->complete);
+}
+
+static int omap_i2c_dma_xfer(struct omap_i2c_dev *omap, struct i2c_msg *msg)
+{
+	int ret;
+	struct dma_slave_config dma_sconfig = {0};
+	struct omap_i2c_dma *dma = omap->dma;
+	struct dma_async_tx_descriptor *txdesc;
+	struct device *dev = &omap->adapter.dev;
+
+	dma->curr_msg = msg;
+
+	dma->curr_msg_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+	if (!dma->curr_msg_buf)
+		return -ENOMEM;
+
+	if (omap->receiver) {
+		dma->chan_using = dma->chan_rx;
+
+		dma_sconfig.src_addr = dma->phy_addr +
+				(omap->regs[OMAP_I2C_DATA_REG]
+					<< omap->reg_shift);
+		dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		dma_sconfig.src_maxburst = omap->threshold;
+		dma_sconfig.direction = DMA_DEV_TO_MEM;
+	} else {
+		dma->chan_using = dma->chan_tx;
+
+		dma_sconfig.dst_addr = dma->phy_addr +
+				(omap->regs[OMAP_I2C_DATA_REG]
+					<< omap->reg_shift);
+		dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		dma_sconfig.dst_maxburst = omap->threshold;
+		dma_sconfig.direction = DMA_MEM_TO_DEV;
+	}
+
+	ret = dmaengine_slave_config(dma->chan_using, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(dev, "DMA channel config failed: %d\n", ret);
+		goto err_map;
+	}
+
+	dma->dma_len = msg->len;
+	dma->dma_data_dir = omap->receiver ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	dma->dma_dev = dmaengine_get_dma_device(dma->chan_using);
+
+	dma->dma_buf = dma_map_single(dma->dma_dev, dma->curr_msg_buf,
+				      dma->dma_len, dma->dma_data_dir);
+	if (dma_mapping_error(dma->dma_dev, dma->dma_buf)) {
+		dev_err(dev, "DMA mapping failed\n");
+		ret = -EINVAL;
+		goto err_map;
+	}
+
+	txdesc = dmaengine_prep_slave_single(dma->chan_using, dma->dma_buf,
+					     dma->dma_len,
+					     omap->receiver ? DMA_DEV_TO_MEM :
+							      DMA_MEM_TO_DEV,
+					     DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!txdesc) {
+		dev_err(dev, "Not able to get desc for DMA xfer\n");
+		ret = -EINVAL;
+		goto err_desc;
+	}
+
+	reinit_completion(&dma->complete);
+
+	dmaengine_desc_set_callback(txdesc, omap_i2c_dma_callback, NULL, omap);
+	ret = dma_submit_error(dmaengine_submit(txdesc));
+	if (ret < 0) {
+		dev_err(dev, "DMA submit failed\n");
+		goto err_submit;
+	}
+
+	dma_async_issue_pending(dma->chan_using);
+	return 0;
+
+err_submit:
+	dmaengine_terminate_sync(dma->chan_using);
+err_desc:
+	dma_unmap_single(dma->dma_dev, dma->dma_buf, dma->dma_len,
+			 dma->dma_data_dir);
+err_map:
+	i2c_put_dma_safe_msg_buf(dma->curr_msg_buf, msg, false);
+	return ret;
+}
+
+static void omap_i2c_dma_cleanup(struct omap_i2c_dev *omap, bool xferred)
+{
+	struct omap_i2c_dma *dma = omap->dma;
+
+	dma_unmap_single(dma->dma_dev, dma->dma_buf, dma->dma_len,
+			 dma->dma_data_dir);
+	i2c_put_dma_safe_msg_buf(dma->curr_msg_buf, dma->curr_msg, xferred);
+}
+
+static void omap_i2c_dma_enable_req(struct omap_i2c_dev *omap)
+{
+	u16 w;
+
+	w = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
+	if (omap->receiver) {
+		w |= OMAP_I2C_BUF_RDMA_EN;
+		omap_i2c_write_reg(omap, OMAP_I2C_BUF_REG, w);
+
+		omap_i2c_write_reg(omap, OMAP_I2C_DMARXENABLE_SET, 1);
+	} else {
+		w |= OMAP_I2C_BUF_XDMA_EN;
+		omap_i2c_write_reg(omap, OMAP_I2C_BUF_REG, w);
+
+		omap_i2c_write_reg(omap, OMAP_I2C_DMATXENABLE_SET, 1);
+	}
+}
+
+static void omap_i2c_dma_disable_req(struct omap_i2c_dev *omap)
+{
+	u16 w;
+
+	w = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
+	if (omap->receiver) {
+		w &= ~OMAP_I2C_BUF_RDMA_EN;
+		omap_i2c_write_reg(omap, OMAP_I2C_BUF_REG, w);
+
+		omap_i2c_write_reg(omap, OMAP_I2C_DMARXENABLE_CLR, 1);
+	} else {
+		w &= ~OMAP_I2C_BUF_XDMA_EN;
+		omap_i2c_write_reg(omap, OMAP_I2C_BUF_REG, w);
+
+		omap_i2c_write_reg(omap, OMAP_I2C_DMATXENABLE_CLR, 1);
+	}
+}
+
+static void omap_i2c_enable_pio_irqs(struct omap_i2c_dev *omap, u16 mask)
+{
+	if (!mask)
+		return;
+
+	if (omap->scheme == OMAP_I2C_SCHEME_0)
+		omap_i2c_write_reg(omap, OMAP_I2C_IE_REG,
+				   omap->iestate | mask);
+	else
+		omap_i2c_write_reg(omap, OMAP_I2C_IE_REG, mask);
+}
+
+static void omap_i2c_disable_pio_irqs(struct omap_i2c_dev *omap, u16 mask)
+{
+	if (!mask)
+		return;
+
+	if (omap->scheme == OMAP_I2C_SCHEME_0)
+		omap_i2c_write_reg(omap, OMAP_I2C_IE_REG, omap->iestate);
+	else
+		omap_i2c_write_reg(omap, OMAP_I2C_IP_V2_IRQENABLE_CLR,
+				   mask);
+}
+
 /*
  * Low level master read/write transaction.
  */
@@ -663,8 +861,8 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 {
 	struct omap_i2c_dev *omap = i2c_get_adapdata(adap);
 	unsigned long time_left;
-	u16 w;
-	int ret;
+	u16 w, pio_irq_mask;
+	int ret, use_dma;
 
 	dev_dbg(omap->dev, "addr: 0x%04x, len: %d, flags: 0x%x, stop: %d\n",
 		msg->addr, msg->len, msg->flags, stop);
@@ -672,6 +870,14 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	omap->receiver = !!(msg->flags & I2C_M_RD);
 	omap_i2c_resize_fifo(omap, msg->len, omap->receiver);
 
+	/**
+	 * REVISIT: If the message size is not a multiple of the threshold,
+	 * the draining feature must be used.
+	 */
+	use_dma = !polling && omap->dma && msg->len >= OMAP_I2C_DMA_THRESHOLD &&
+		  !(omap->flags & OMAP_I2C_FLAG_NO_FIFO) &&
+		  msg->len % omap->threshold == 0;
+
 	omap_i2c_write_reg(omap, OMAP_I2C_SA_REG, msg->addr);
 
 	/* REVISIT: Could the STB bit of I2C_CON be used with probing? */
@@ -692,6 +898,23 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 		reinit_completion(&omap->cmd_complete);
 	omap->cmd_err = 0;
 
+	if (use_dma) {
+		ret = omap_i2c_dma_xfer(omap, msg);
+		if (ret) {
+			omap_i2c_reset(omap);
+			__omap_i2c_init(omap);
+			return ret;
+		}
+
+		omap_i2c_dma_enable_req(omap);
+	} else {
+		pio_irq_mask = OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
+			       ((omap->fifo_size) ? (OMAP_I2C_IE_RDR |
+						    OMAP_I2C_IE_XDR) : 0);
+
+		omap_i2c_enable_pio_irqs(omap, pio_irq_mask);
+	}
+
 	w = OMAP_I2C_CON_EN | OMAP_I2C_CON_MST | OMAP_I2C_CON_STT;
 
 	/* High speed configuration */
@@ -727,6 +950,17 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 			if (time_after(jiffies, delay)) {
 				dev_err(omap->dev, "controller timed out "
 				"waiting for start condition to finish\n");
+
+				if (use_dma) {
+					omap_i2c_dma_disable_req(omap);
+
+					dmaengine_terminate_sync(omap->dma->chan_using);
+
+					omap_i2c_dma_cleanup(omap, false);
+				} else {
+					omap_i2c_disable_pio_irqs(omap, pio_irq_mask);
+				}
+
 				return -ETIMEDOUT;
 			}
 			cpu_relax();
@@ -742,8 +976,15 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	 * into arbitration and we're currently unable to recover from it.
 	 */
 	if (!polling) {
-		time_left = wait_for_completion_timeout(&omap->cmd_complete,
-							OMAP_I2C_TIMEOUT);
+		time_left = OMAP_I2C_TIMEOUT;
+
+		if (use_dma)
+			time_left = wait_for_completion_timeout(&omap->dma->complete,
+								time_left);
+
+		if (time_left)
+			time_left = wait_for_completion_timeout(&omap->cmd_complete,
+								time_left);
 	} else {
 		do {
 			omap_i2c_wait(omap);
@@ -753,7 +994,18 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 		time_left = !ret;
 	}
 
-	if (time_left == 0) {
+	if (use_dma) {
+		if (!time_left || omap->cmd_err)
+			dmaengine_terminate_sync(omap->dma->chan_using);
+
+		omap_i2c_dma_cleanup(omap, time_left && !omap->cmd_err);
+
+		omap_i2c_dma_disable_req(omap);
+	} else {
+		omap_i2c_disable_pio_irqs(omap, pio_irq_mask);
+	}
+
+	if (!time_left) {
 		omap_i2c_reset(omap);
 		__omap_i2c_init(omap);
 		return -ETIMEDOUT;
@@ -855,6 +1107,10 @@ static inline void
 omap_i2c_complete_cmd(struct omap_i2c_dev *omap, u16 err)
 {
 	omap->cmd_err |= err;
+
+	if (omap->dma && err)
+		complete(&omap->dma->complete);
+
 	complete(&omap->cmd_complete);
 }
 
@@ -1082,6 +1338,9 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			omap->cmd_err |= OMAP_I2C_STAT_NACK;
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_NACK);
 
+			if (omap->dma)
+				complete(&omap->dma->complete);
+
 			if (!(stat & ~OMAP_I2C_STAT_NACK)) {
 				err = -EAGAIN;
 				break;
@@ -1255,16 +1514,6 @@ static const struct of_device_id omap_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
 #endif
 
-#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
-
-#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
-#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
-
-#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
-#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
-#define OMAP_I2C_SCHEME_0		0
-#define OMAP_I2C_SCHEME_1		1
-
 static int omap_i2c_get_scl(struct i2c_adapter *adap)
 {
 	struct omap_i2c_dev *dev = i2c_get_adapdata(adap);
@@ -1338,10 +1587,70 @@ static struct i2c_bus_recovery_info omap_i2c_bus_recovery_info = {
 	.recover_bus		= i2c_generic_scl_recovery,
 };
 
+static struct omap_i2c_dma *omap_i2c_dma_init(struct omap_i2c_dev *omap,
+					      dma_addr_t phy_addr)
+{
+	struct device *dev = omap->dev;
+	struct omap_i2c_dma *dma;
+	int ret;
+
+	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
+	if (!dma)
+		return ERR_PTR(-ENOMEM);
+
+	dma->phy_addr = phy_addr;
+
+	init_completion(&dma->complete);
+
+	dma->chan_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(dma->chan_tx)) {
+		ret = PTR_ERR(dma->chan_tx);
+		if (ret != -ENODEV)
+			dev_err_probe(dev, ret,
+				      "can't request DMA tx channel\n");
+		goto dma_free;
+	}
+
+	dma->chan_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->chan_rx)) {
+		ret = PTR_ERR(dma->chan_rx);
+		if (ret != -ENODEV)
+			dev_err_probe(dev, ret,
+				      "can't request DMA rx channel\n");
+		goto dma_tx_fail;
+	}
+
+	return dma;
+
+dma_tx_fail:
+	dma_release_channel(dma->chan_tx);
+dma_free:
+	devm_kfree(dev, dma);
+
+	return ERR_PTR(ret);
+}
+
+static void omap_i2c_dma_free(struct omap_i2c_dev *omap)
+{
+	struct omap_i2c_dma *dma = omap->dma;
+
+	dma->dma_buf = 0;
+	dma->dma_len = 0;
+
+	dma_release_channel(dma->chan_tx);
+	dma->chan_tx = NULL;
+
+	dma_release_channel(dma->chan_rx);
+	dma->chan_rx = NULL;
+
+	dma->chan_using = NULL;
+}
+
 static int
 omap_i2c_probe(struct platform_device *pdev)
 {
 	struct omap_i2c_dev	*omap;
+	struct resource		*res;
 	struct i2c_adapter	*adap;
 	const struct omap_i2c_bus_platform_data *pdata =
 		dev_get_platdata(&pdev->dev);
@@ -1359,7 +1668,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	if (!omap)
 		return -ENOMEM;
 
-	omap->base = devm_platform_ioremap_resource(pdev, 0);
+	omap->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(omap->base))
 		return PTR_ERR(omap->base);
 
@@ -1478,6 +1787,22 @@ omap_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 	}
 
+	if (omap->scheme != OMAP_I2C_SCHEME_0) {
+		omap->dma = omap_i2c_dma_init(omap, (dma_addr_t)res->start);
+		if (PTR_ERR(omap->dma) == -EPROBE_DEFER) {
+			r = -EPROBE_DEFER;
+			dev_err_probe(&pdev->dev, r,
+				      "can't get DMA channels\n");
+			goto err_unuse_clocks;
+		} else if (PTR_ERR(omap->dma) == -ENODEV) {
+			dev_dbg(omap->dev, "DMA setup failed\n");
+			omap->dma = NULL;
+		} else if (IS_ERR(omap->dma)) {
+			r = PTR_ERR(omap->dma);
+			goto err_unuse_clocks;
+		}
+	}
+
 	adap = &omap->adapter;
 	i2c_set_adapdata(adap, omap);
 	adap->owner = THIS_MODULE;
@@ -1493,7 +1818,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	adap->nr = pdev->id;
 	r = i2c_add_numbered_adapter(adap);
 	if (r)
-		goto err_unuse_clocks;
+		goto err_dma_free;
 
 	dev_info(omap->dev, "bus %d rev%d.%d at %d kHz\n", adap->nr,
 		 major, minor, omap->speed);
@@ -1502,6 +1827,9 @@ omap_i2c_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_dma_free:
+	if (omap->dma)
+		omap_i2c_dma_free(omap);
 err_unuse_clocks:
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 err_put_pm:
@@ -1523,6 +1851,9 @@ static void omap_i2c_remove(struct platform_device *pdev)
 	if (omap->mux_state)
 		mux_state_deselect(omap->mux_state);
 
+	if (omap->dma)
+		omap_i2c_dma_free(omap);
+
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
 		dev_err(omap->dev, "Failed to resume hardware, skip disable\n");
-- 
2.56.1

