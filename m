Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D9478E58
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521713; cv=none; b=KJrm5D9ZGFmGiCqVNnWLEvBsz+owfTLOZwsduws+LDahV9ai8glF9Y/FSHysfG1/VYd6kuf77t3gE4ofYZACNESvPxotvq6bWJkLlOXyteXzx066mElhEtcybzN1DBGr+NprLvXnLH67+DSuKijol3Z38r3J72dRU8g8UXx7qbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521713; c=relaxed/simple;
	bh=gYeX8/by2IAXM7fkKgKFaKJtBSBh9U1IZ88eVXMXYKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLtIAGIPlQVjU+D/wmh78x2Q054XJHjVsrtvIcfVc6jBwKCkJ4kiXOWlmQF5g8/EPolxdVEWekj9+zoM0xiuBUvZ1tTqunX/s/+qWPd85mxIZWoAG3aLNJSul3N5kApt476sweISCXlR+7SnuwdlgeosxxAsCkeB1pq5qY7DxIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibCHsCtG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibCHsCtG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-46add2afca9so527755fac.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 04:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521706; x=1789126506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ewfDI1ZgGJ9f7uoMqmTZW/ns6RfSEti1ZKdNzm+2NtA=;
        b=ibCHsCtG1xGOFDfJZOH+EgTXnubn+SAYSn89gUP8pvj657i9KbtxGvme4d8nUWeNqR
         ymQdZfiUICWUclLbs1CeoiRPpKu6nWazTdS7bIXxJFMWcs/iIu6YtieJdlTDaHvUY3M2
         IAN4BuiWgF2Opkym2Mu1xNL9PhAYLh2mCVfvEDUxngZ9bRxgfUiSwVxpfVCEWKdsZ1qF
         Wj5nrQqrVBbqVtD8ZePbpoMrr7dLqf7s5LF4Y1bC2BNKYLLbKqx5oSfpeE9MwKhlgs0n
         FvkCLk8WUc2cLMlk8Z6RZaUTiapFvYLDbg2raXRU1RfqRLeK2RWNnvBKowN5v/io89Pv
         GzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521706; x=1789126506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ewfDI1ZgGJ9f7uoMqmTZW/ns6RfSEti1ZKdNzm+2NtA=;
        b=dgc1gPxuLrtNVEAgNZYlD6lU7wvNMBLrwuKurooUGlZfJ3M5JhF14etzuTfSy65gWu
         hg5WH8MeN/+Ro5EROnDXOWMjKIdbu2bl9jYizEYWpdZ4tCFnqxTQ1zQS60/CgVUOjwq7
         Kl/b1zBsYI6OEtgQyAY30DWPD7XcEeE+dZt8WxoEMz6OOzBkIBkFI2R9SHBgF84Xjlei
         7enbWpVK/atb8bm84JN1960qa+R0HsqszT1ZvnR/3+fG+qIUm7cbc+PQR0jjfpVmdXee
         lcYAh+IvwKkK6qiDy41I+3rk0Vqz4/drGiTS6/jFvibbmxDu3zSyftcqz+hsdyvgg3DZ
         p9cg==
X-Forwarded-Encrypted: i=1; AKwUvByf8umt0jnIhCRa8ormSLYrRxpkW/YnoXOnfjsS5jj4MxAwFLcjybQJ5fFnIAnN46NmCjrX2T43t3C8Fg==@vger.kernel.org
X-Gm-Message-State: AFuF++nRJ9R8ZWBbYuChWipoeGPs1tRYM7gRscmAfxPAFnyG3lSsTB2f
	5QSj2NNjEFsNk3hoHlWkm6vze1w7sxwD4rGBVslKE2iA9AQ2WOc5Yj8v
X-Gm-Gg: AYBFou2e2JoRyVhI2K4HTwxB/GYkQtr9nTwvPF9wdKaaEXeA6qPIq4cDZaKkCNieEQt
	dEa6qyppcQ2rdLQ/txdbMTRsDNXjnyfNH7GWsTzJad1UzZHP9b1Wzi+dNsu5Ya2tNZe1hb52fL9
	4bcyUJ84P5/Brzz/TZhl2HuWxfxGyjHPJFz0YzbQxOU72ccRYzJ8P/Ieqt/z6RJhQy+oUZ1hb33
	ITv2ww6y/9UkIyitm4i6kgqj4w7imyDw1g6Yphavz09BndwIUeWZXCL3PwdNP3bd0ZWudMyRhE0
	Bxp7oC35hUg9ZetZPbPtxOp6zAo+490OedSf7Poij02s2Ufy2KzXhygocRMMXIxTsc/CFXKi6iu
	F8Je01KFRS3Q52M7aqYDKsjt6FcGtZm3q6hqQSzMOL5zpVY1VJaKWMWXByaIea1I2LKgU64EuDy
	FQQUBXZdQUk52pA37l9fIawXZyfodMPxuAp3/GhGFf/TxfRBGBkbn26d3srkoZemxcYe00CA6/c
	qwATL2DvShrIaI=
X-Received: by 2002:a05:6820:1787:b0:6b7:83c5:fdee with SMTP id 006d021491bc7-6b783c60345mr1409156eaf.47.1788521705811;
        Fri, 04 Sep 2026 04:35:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:35:05 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Andy Walls <awalls@md.metrocast.net>,
	Hans Verkuil <hverkuil@kernel.org>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: fix typos in comments
Date: Fri,  4 Sep 2026 17:04:42 +0530
Message-ID: <20260904113450.15838-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113450.15838-1-hemanth.selam@gmail.com>
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/media/dvb-frontends/drxd_map_firm.h                   | 4 ++--
 drivers/media/i2c/ccs/ccs-data.h                              | 4 ++--
 drivers/media/i2c/hi847.c                                     | 2 +-
 drivers/media/i2c/ov772x.c                                    | 2 +-
 drivers/media/i2c/wm8739.c                                    | 2 +-
 drivers/media/pci/cx18/cx23418.h                              | 2 +-
 drivers/media/pci/saa7146/mxb.c                               | 4 ++--
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h             | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 4 ++--
 drivers/media/platform/renesas/rcar_drif.c                    | 2 +-
 drivers/media/radio/si4713/si4713.c                           | 2 +-
 drivers/media/usb/dvb-usb/dib0700_core.c                      | 2 +-
 drivers/media/usb/gspca/w996Xcf.c                             | 2 +-
 .../atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h    | 4 ++--
 drivers/staging/media/av7110/av7110.c                         | 2 +-
 15 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_map_firm.h b/drivers/media/dvb-frontends/drxd_map_firm.h
index bdcc63576df1..a6585e53d879 100644
--- a/drivers/media/dvb-frontends/drxd_map_firm.h
+++ b/drivers/media/dvb-frontends/drxd_map_firm.h
@@ -10,8 +10,8 @@
 
 /*
  * Note: originally, this file contained 12000+ lines of data
- * Probably a few lines for every firwmare assembler instruction. However,
- * only a few defines were actually used. So, removed all uneeded lines.
+ * Probably a few lines for every firmware assembler instruction. However,
+ * only a few defines were actually used. So, removed all unneeded lines.
  * If ever needed, the other lines can be easily obtained via git history.
  */
 
diff --git a/drivers/media/i2c/ccs/ccs-data.h b/drivers/media/i2c/ccs/ccs-data.h
index 638df69804ec..522466b81929 100644
--- a/drivers/media/i2c/ccs/ccs-data.h
+++ b/drivers/media/i2c/ccs/ccs-data.h
@@ -160,7 +160,7 @@ struct ccs_pdaf_pix_loc_pixel_desc_group {
  * @main_offset_y: Start Y coordinate of PDAF pixel blocks
  * @global_pdaf_type: PDAF pattern type
  * @block_width: Width of a block in pixels
- * @block_height: Heigth of a block in pixels
+ * @block_height: Height of a block in pixels
  * @num_block_desc_groups: Number of block descriptor groups
  * @block_desc_groups: Block descriptor groups
  * @num_pixel_desc_grups: Number of pixel descriptor groups
@@ -197,7 +197,7 @@ struct ccs_pdaf_pix_loc {
  * @module_rules: Rules for the module
  * @sensor_pdaf: PDAF data for the sensor
  * @module_pdaf: PDAF data for the module
- * @license_length: Lenght of the license data
+ * @license_length: Length of the license data
  * @license: License data
  * @end: Whether or not there's an end block
  * @backing: Raw data, pointed to from elsewhere so keep it around
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index def01aa07b2f..710328d7984f 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2187,7 +2187,7 @@ struct hi847 {
 	/* Current mode */
 	const struct hi847_mode *cur_mode;
 
-	/* To serialize asynchronus callbacks */
+	/* To serialize asynchronous callbacks */
 	struct mutex mutex;
 };
 
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index be3ba284ee0b..041f3b02e222 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -122,7 +122,7 @@
 #define LC_COEFB    0x4B /* Lens B channel compensation coefficient */
 #define LC_COEFR    0x4C /* Lens R channel compensation coefficient */
 
-#define FIXGAIN     0x4D /* Analog fix gain amplifer */
+#define FIXGAIN     0x4D /* Analog fix gain amplifier */
 #define AREF0       0x4E /* Sensor reference control */
 #define AREF1       0x4F /* Sensor reference current control */
 #define AREF2       0x50 /* Analog reference control */
diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
index db62bafb447c..9eaf48f1c3a2 100644
--- a/drivers/media/i2c/wm8739.c
+++ b/drivers/media/i2c/wm8739.c
@@ -217,7 +217,7 @@ static int wm8739_probe(struct i2c_client *client)
 
 	/* reset */
 	wm8739_write(sd, R15, 0x00);
-	/* filter setting, high path, offet clear */
+	/* filter setting, high path, offset clear */
 	wm8739_write(sd, R5, 0x000);
 	/* ADC, OSC, Power Off mode Disable */
 	wm8739_write(sd, R6, 0x000);
diff --git a/drivers/media/pci/cx18/cx23418.h b/drivers/media/pci/cx18/cx23418.h
index 22486f39bcda..4ee45be757cb 100644
--- a/drivers/media/pci/cx18/cx23418.h
+++ b/drivers/media/pci/cx18/cx23418.h
@@ -24,7 +24,7 @@
 #define CX18_CREATE_TASK			(MGR_CMD_MASK | 0x0001)
 
 /* Description: This command destroys an instance of a task
-   IN[0] - Task handle. Hanlde of the task to destroy
+   IN[0] - Task handle. Handle of the task to destroy
    ReturnCode - One of the ERR_SYS_... */
 #define CX18_DESTROY_TASK			(MGR_CMD_MASK | 0x0002)
 
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index d759e8a87e24..129d41c1862b 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -37,7 +37,7 @@
 /* global variable */
 static int mxb_num;
 
-/* initial frequence the tuner will be tuned to.
+/* initial frequency the tuner will be tuned to.
    in verden (lower saxony, germany) 4148 is a
    channel called "phoenix" */
 static int freq = 4148;
@@ -429,7 +429,7 @@ static int mxb_init_done(struct saa7146_dev* dev)
 	/* some stuff is done via direct write to the registers */
 
 	/* this is ugly, but because of the fact that this is completely
-	   hardware dependend, it should be done directly... */
+	   hardware dependent, it should be done directly... */
 	saa7146_write(dev, DD1_STREAM_B,	0x00000000);
 	saa7146_write(dev, DD1_INIT,		0x02000200);
 	saa7146_write(dev, MC2, (MASK_09 | MASK_25 | MASK_10 | MASK_26));
diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
index b810c96695c8..9744e00b0066 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h
@@ -56,7 +56,7 @@ struct mdp_ipi_comm {
  * @ipi_id        : IPI_MDP
  * @ap_inst       : AP mtk_mdp_vpu address
  * @vpu_inst_addr : VPU MDP instance address
- * @status        : VPU exeuction result
+ * @status        : VPU execution result
  */
 struct mdp_ipi_comm_ack {
 	uint32_t msg_id;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
index 47070be2a991..c2c2a3a63dfd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h
@@ -53,7 +53,7 @@ struct vdec_ap_ipi_cmd {
 /**
  * struct vdec_vpu_ipi_ack - generic VPU to AP ipi command format
  * @msg_id	: vdec_ipi_msgid
- * @status	: VPU exeuction result
+ * @status	: VPU execution result
  * @ap_inst_addr	: AP video decoder instance address
  */
 struct vdec_vpu_ipi_ack {
@@ -98,7 +98,7 @@ struct vdec_ap_ipi_dec_start {
 /**
  * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
  * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
- * @status	: VPU exeuction result
+ * @status	: VPU execution result
  * @ap_inst_addr	: AP vcodec_vpu_inst instance address
  * @vpu_inst_addr	: VPU decoder instance address
  * @vdec_abi_version:	ABI version of the firmware. Kernel can use it to
diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
index 0844934f7aa6..bd67e8e16f53 100644
--- a/drivers/media/platform/renesas/rcar_drif.c
+++ b/drivers/media/platform/renesas/rcar_drif.c
@@ -464,7 +464,7 @@ rcar_drif_get_fbuf(struct rcar_drif_sdr *sdr)
 					rcar_drif_frame_buf, list);
 	if (!fbuf) {
 		/*
-		 * App is late in enqueing buffers. Samples lost & there will
+		 * App is late in enqueuing buffers. Samples lost & there will
 		 * be a gap in sequence number when app recovers
 		 */
 		rdrif_dbg(sdr, "\napp late: prod %u\n", sdr->produced);
diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si4713/si4713.c
index 0c0354566b0a..150d07f6b319 100644
--- a/drivers/media/radio/si4713/si4713.c
+++ b/drivers/media/radio/si4713/si4713.c
@@ -667,7 +667,7 @@ static int si4713_tx_tune_measure(struct si4713_device *sdev, u16 frequency,
 /*
  * si4713_tx_tune_status- Returns the status of the tx_tune_freq, tx_tune_mea or
  *			tx_tune_power commands. This command return the current
- *			frequency, output voltage in dBuV, the antenna tunning
+ *			frequency, output voltage in dBuV, the antenna tuning
  *			capacitance value and the received noise level. The
  *			command also clears the stcint interrupt bit when the
  *			first bit of its arguments is high.
diff --git a/drivers/media/usb/dvb-usb/dib0700_core.c b/drivers/media/usb/dvb-usb/dib0700_core.c
index 1caabb51ea47..5d2fa7037c00 100644
--- a/drivers/media/usb/dvb-usb/dib0700_core.c
+++ b/drivers/media/usb/dvb-usb/dib0700_core.c
@@ -560,7 +560,7 @@ int dib0700_download_firmware(struct usb_device *udev, const struct firmware *fw
 	fw_version = (buf[8] << 24) | (buf[9] << 16) | (buf[10] << 8) | buf[11];
 
 	/* set the buffer size - DVB-USB is allocating URB buffers
-	 * only after the firwmare download was successful */
+	 * only after the firmware download was successful */
 	for (i = 0; i < dib0700_device_count; i++) {
 		for (adap_num = 0; adap_num < dib0700_devices[i].num_adapters;
 				adap_num++) {
diff --git a/drivers/media/usb/gspca/w996Xcf.c b/drivers/media/usb/gspca/w996Xcf.c
index 79baa0c1a031..700c39fe307c 100644
--- a/drivers/media/usb/gspca/w996Xcf.c
+++ b/drivers/media/usb/gspca/w996Xcf.c
@@ -407,7 +407,7 @@ static void w9968cf_set_crop_window(struct sd *sd)
 
 	if (sd->sensor == SEN_OV7620) {
 		/*
-		 * Sigh, this is dependend on the clock / framerate changes
+		 * Sigh, this is dependent on the clock / framerate changes
 		 * made by the frequency control, sick.
 		 *
 		 * Note we cannot use v4l2_ctrl_g_ctrl here, as we get called
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
index b8206d2f3d31..97e63082d254 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h
@@ -102,8 +102,8 @@ struct ia_css_3a_grid_info {
  *  awb_lg_*: Thresholds to check the saturated bayer pixels for AWB.
  *    Condition of effective pixel for AWB level gate check:
  *      bayer(sensor) <= awb_lg_high_raw &&
- *      bayer(when AWB statisitcs is calculated) >= awb_lg_low &&
- *      bayer(when AWB statisitcs is calculated) <= awb_lg_high
+ *      bayer(when AWB statistics is calculated) >= awb_lg_low &&
+ *      bayer(when AWB statistics is calculated) <= awb_lg_high
  *  af_fir*: Coefficients of high pass filter to calculate AF statistics.
  *
  *  ISP block: S3A1(ae_y_* for AE/AF, awb_lg_* for AWB)
diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 06c43b5f8a87..432404eceaea 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -2347,7 +2347,7 @@ static int av7110_attach(struct saa7146_dev *dev,
 
 		/* RESET SAA7146 */
 		saa7146_write(dev, MC1, MASK_31);
-		/* autodetection success seems to be time-dependend after reset */
+		/* autodetection success seems to be time-dependent after reset */
 
 		/* Fix VSYNC level */
 		saa7146_setgpio(dev, 3, SAA7146_GPIO_OUTLO);
-- 
2.48.1

