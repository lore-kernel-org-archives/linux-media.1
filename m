Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348A3EAC80
	for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944588; cv=none; b=gwc1XIJhVA+u0ujOaHGm9Fpa0ToaVfFoXxbUmV2yQYimK2rFccztk98A2oggIEADnX97GY9hvjLOyNhQgbXTynNp5OXas7N9zsf1qZWJ+rHhrHzRhKrGPwxremczBDsAU8lqPa6i8HnhWdhrqHY1kP+Y6pIQwCbU5Cz0v/DSse4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944588; c=relaxed/simple;
	bh=ny5o3zfT0fuGJoeS4GUfxj8Tt3OekTQ0Vscu+ywukhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgkEl5raBOTyLBf1N2KVW+OwXtcNA6cDLstGkG78RtTeNfnQG1FBu5uuu5Qf/VylPfWFeZ1ZyYa/M/Fv6Gn6IuocfsJNbhd0qenhBgu+eEX3JTHtiRlZqyyS3joAd1Hc6enWxDpRlrN989AtMXefGsREBVBsx5aB2u8+YYaWvzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOCCPdL/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOCCPdL/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381018b9375so3449448a91.0
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944586; x=1784549386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Krigkeb0EY7ngMYX+Y7ADjdq0pOv6Fpp5Q1fhmmedpo=;
        b=ZOCCPdL/Qlgk9Q4gYRWVv5RhK2kIbh7G6+X6nrEzPYNmcuDW5xeFEp1eZbFIupWDVU
         sxyt+8LwMlUyzwKTjPysg9b1N81KPZLM9V21/Od86SKre1hC7BjN5UvN3fYlN2Tj8EsZ
         AldchHiAJQhn5su0HdRMDqCxRl1GQBaRxAq4KyXwqPcI6rd2NdRh9SRsXZo9ielriJn+
         oSAnTkCvq+9slXFDjvVpX4VDSFuibXs4uoRNqX79c0/up3Ihtxw6YMsXvVAr4rNdpXrX
         J7ZTagAVOBLNHWdb5UBLQsL14wRHJouSnIuypwaHkaYQ9eBUqOQcYvajjl3tBG2xwV+N
         /4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944586; x=1784549386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Krigkeb0EY7ngMYX+Y7ADjdq0pOv6Fpp5Q1fhmmedpo=;
        b=Y6cj3wuGhoGGDbefB/Le8KlWLIo7v/HNTkTaQQiaLq+nZSnOqp2Dg2Crr3akDxw3dD
         BoEZ19RLAGROyiYTu0bzOmcmma59sapaYiZSUuooXt96OPkPLVacy5hZBaEek7pSC3TX
         FQXYKzqC5wJzvfd0p89WcOQS6HZMYvppB5FUCmR/iiQKzZmjtlUJ8HGwJjJzMFDNNkTW
         e9aoZEoo5St57d93fxA027Ud5qbag9LDghuDNQWZyDtjOqCH08K0y6vAHmpVQo3xHjJ6
         Jx6vwijoT0vqSFARdozpz2sI2pqXgIPIixM9KrIUsY2m0OC/tLqllsnEPJhceAmIe96g
         1IgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyntYTHPJfnavNdrmLmDKU8TA0fvdA39LsPnxInW7NwmEY9sofRgqyJiKC0UyX/irUwA6cfWDqTdBBRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+cthoQj39KV4kUab4E+gk4jXLzF0U1WtR6AwVCP6in7KqzbeE
	7AMk5ByJQiU7RjtCUHKKgSd0yP2ZBOmXaVVQ8V81G1LCPQ68QDV8xlqk
X-Gm-Gg: AfdE7cmV5biZX0YhNycTXagqQf9MRtLstVav2Z70T43tuzzTdzunPntOjHlAPoUR2Fx
	xBrYLIk+aPkrneabHM5OVOdx5UyBdMss5NZmJg1ZsR0loRY2w2CaQBq797QoeWVvZX1RYDQ8cUX
	t9mb9jz8bwOOT2cVKj8NmtdINrp0vRmEYKw//YLXnlnvu+GQVToMD9C2f5e0EWAowdAn0RDVYEN
	vsGAKNmrdwx9c5YMaiuv3bNIhZJvL4tm2rnmB15EUlBtttE6J5NHl2r75CPPZ3hoRCF7MWp0ikU
	ERF8F2iTP2E3RDME7PczhkvoLt2dxZjj9DHD1FrD9sPjLrztiv/EB/oVstbOEe7wo/IQRQ56uQh
	0/416TX80+drkAMk+ug6gZ8Udu84Kb/XRIglkQT7YDeq2rscX8nlnD8QuS0KUwd9XY1wqdoewv+
	mCSR+WHOCWHm5hXyJKcqVX
X-Received: by 2002:a17:90b:4ac1:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38de0c4ca49mr5634290a91.15.1783944586225;
        Mon, 13 Jul 2026 05:09:46 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v7 05/19] media: meson: vdec: Fix race condition and synchronize esparser IRQ
Date: Mon, 13 Jul 2026 17:37:00 +0530
Message-ID: <20260713120840.17427-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During session teardown sequences in vdec_stop_streaming() and
vdec_close(), the 'esparser' hardware interrupt handler can still be
actively triggered or executing on another CPU core. This creates a
transient race condition where the ISR attempts to handle stream data and
allocate internal tracking state structures after session contexts have
been modified or freed.

Update esparser_isr() to read the current session context utilizing an
smp_load_acquire() barrier snapshot. If the pointer resolves to NULL,
terminate processing early with IRQ_HANDLED to protect against
concurrent dismantling.

Suggested-by: Doruk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 8 ++++++++
 drivers/staging/media/meson/vdec/vdec.c     | 4 ++++
 drivers/staging/media/meson/vdec/vdec.h     | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9e..37749ede308c6 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -60,6 +60,12 @@ static irqreturn_t esparser_isr(int irq, void *dev)
 {
 	int int_status;
 	struct amvdec_core *core = dev;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	int_status = amvdec_read_parser(core, PARSER_INT_STATUS);
 	amvdec_write_parser(core, PARSER_INT_STATUS, int_status);
@@ -439,6 +445,8 @@ int esparser_init(struct platform_device *pdev, struct amvdec_core *core)
 	if (irq < 0)
 		return irq;
 
+	core->esparser_irq = irq;
+
 	ret = devm_request_irq(dev, irq, esparser_isr, IRQF_SHARED,
 			       "esparserirq", core);
 	if (ret) {
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7ae3d5a9dd6ab..7689ffdb2e500 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -486,6 +486,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
+		/* Ensure esparser ISR finishes executing */
+		synchronize_irq(core->esparser_irq);
 
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
@@ -994,6 +996,8 @@ static int vdec_close(struct file *file)
 
 	/* Synchronize and flush pending hardware interrupt service routines */
 	synchronize_irq(core->vdec_irq);
+	/* Ensure esparser ISR finishes executing */
+	synchronize_irq(core->esparser_irq);
 
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index d165c343fd022..c4639cf33e73e 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -68,6 +68,7 @@ struct amvdec_session;
  * @cur_sess: current decoding session
  * @lock: video device lock
  * @vdec_irq: irq for video decoding
+ * @esparser_irq: irq for elementary stream parsing
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -95,6 +96,7 @@ struct amvdec_core {
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
 	int vdec_irq;
+	int esparser_irq;
 };
 
 /**
-- 
2.50.1

