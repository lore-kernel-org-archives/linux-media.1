Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616906;
	b=Q4Mb2ero6M7yp5hk3U3CuLmlDoj8n0k93ZSDpVr+tEqVRndK8/eBHGpTsV7BSyhqenbP
	 U4yX4W0WsdVGyGgk1rNRzz/off4MHpwZMkuSC+0q+RlL+uCFTanc18GF3Sb6lSOBEWbvr
	 39yX2Sfec2KpLJYvxICvM+zVdje76ER1LPu7uvP5EwvlGGmPrikNVoDXnhQiHmuK34b2D
	 2DXhRmxrJAR/0wMhT67aIHJOhK+F0nOuAXli9MlfPR5M+ZR4QnwsJTjWaZQc+Eern3tpZ
	 ESg3iGG9BQj5vkY+GG35MKP1WllV/t13z7c8HuHBfHwyDOPieiO1m0UT3bIllZlnC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616906;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZYGq74QN/HtfXC0Xdi0YdDACmBos9aRbbnKwQ9E50og=;
	b=wSrYMnnzpHhGKKp+HSZwEQsU3E1qEDPUxl/0kSvUhksGdDgMVOrPAq1bYFK8dbvyXzh0
	 4ejZ5MRsK6hNHzsqpKTNEX89MB0FX+Uqe4Bt+U92xmN1mRmiaB+YnDegXYA4dd7ay6U2H
	 oRSBHd8E1OhFTV39sotcVB324GI363hXP/LfBGkZwrFsVgzdFz1theI9n4E3G6/jXicJn
	 KVVnNUdLDVwhgonKSRXKZbKvZqGGT+07mW0hqyZsQbFBbNgudv7ma/vN9c+o+MI0UAZOP
	 iBklXVZ1vd0rugzEwWZbobizxXpGoMxZqjMiCsRhgCeHq4CoF806quxxWNeaqLL+GIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VebnN6sP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F613606A324
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VebnN6sP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA59E1F00A1A;
	Mon,  2 Nov 2026 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616905;
	bh=ZYGq74QN/HtfXC0Xdi0YdDACmBos9aRbbnKwQ9E50og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VebnN6sPUB92fyBfGG1AQUT/cDgz4NYxz0XblfwpnZy5gESJKjONoffXF4wlugt66
	 uBpbOAjbUqsqSwAN/FDU6qLmx9Qd4kDSNKhQv8cjZ3FbEtX7nH9QlVWxVlT2Wptrli
	 bQqx4SOcMBKH8JIT5H1jQ5yYmQdyQyFk1HFt9b6yRhecgV3R6Qe/nQPy8m2MHCV2jH
	 2WhSrXkzj2zLPQWiESdhIhZS/u7ad5orPoHfOt064ewXtd9SQbEhROBWWyVlGL9TpQ
	 L79zoAStweUVFKsl8wr828hzgcsreby00GqJnKLyti0jhxOf/sLgOR47MYWkXwN8os
	 g8HN2U2biSROA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 06/13] media: cec: core: improve cec_notifier_phys_addr_invalidate
Date: Mon,  2 Nov 2026 11:36:57 +0100
Message-ID: <145607674d4310ee75edd1d7533caa73a233d14d.1793615824.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793615824.git.hverkuil+cisco@kernel.org>
References: <cover.1793615824.git.hverkuil+cisco@kernel.org>
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

cec_notifier_phys_addr_invalidate must call cec_phys_addr_invalidate
instead of cec_s_phys_addr. This ensures that the CEC framework knowns
that there is no EDID.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-notifier.c | 13 +++++++++++
 include/media/cec-notifier.h          | 33 +++++++++++++++------------
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 8cf1474d0361..2814ef7d4804 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -216,6 +216,19 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);
 
+void cec_notifier_phys_addr_invalidate(struct cec_notifier *n)
+{
+	if (!n)
+		return;
+
+	mutex_lock(&n->lock);
+	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	if (n->cec_adap && !n->cec_adap->adap_controls_phys_addr)
+		cec_phys_addr_invalidate(n->cec_adap);
+	mutex_unlock(&n->lock);
+}
+EXPORT_SYMBOL_GPL(cec_notifier_phys_addr_invalidate);
+
 struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 {
 	struct platform_device *hdmi_pdev;
diff --git a/include/media/cec-notifier.h b/include/media/cec-notifier.h
index b1c839734124..15e9bcb5b887 100644
--- a/include/media/cec-notifier.h
+++ b/include/media/cec-notifier.h
@@ -80,7 +80,10 @@ void cec_notifier_cec_adap_unregister(struct cec_notifier *n,
  * @n: the CEC notifier
  * @pa: the CEC physical address
  *
- * Set a new CEC physical address.
+ * Set a new CEC physical address. @pa may be f.f.f.f, indicating that
+ * the EDID does not contain a valid Physical Address.
+ * Use @cec_notifier_phys_addr_invalidate() when there is no EDID at all,
+ * i.e. there is no video sink connected.
  * Does nothing if @n == NULL.
  */
 void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa);
@@ -96,6 +99,17 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa);
 void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 					  const struct edid *edid);
 
+/**
+ * cec_notifier_phys_addr_invalidate() - set the physical address to INVALID
+ *
+ * @n: the CEC notifier
+ *
+ * This is a simple helper function to invalidate the physical
+ * address when the video sink disappears.
+ * Does nothing if @n == NULL.
+ */
+void cec_notifier_phys_addr_invalidate(struct cec_notifier *n);
+
 /**
  * cec_notifier_parse_hdmi_phandle - find the hdmi device from "hdmi-phandle"
  * @dev: the device with the "hdmi-phandle" device tree property
@@ -143,6 +157,10 @@ static inline void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 {
 }
 
+static inline void cec_notifier_phys_addr_invalidate(struct cec_notifier *n)
+{
+}
+
 static inline struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 {
 	return ERR_PTR(-ENODEV);
@@ -150,17 +168,4 @@ static inline struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 
 #endif
 
-/**
- * cec_notifier_phys_addr_invalidate() - set the physical address to INVALID
- *
- * @n: the CEC notifier
- *
- * This is a simple helper function to invalidate the physical
- * address. Does nothing if @n == NULL.
- */
-static inline void cec_notifier_phys_addr_invalidate(struct cec_notifier *n)
-{
-	cec_notifier_set_phys_addr(n, CEC_PHYS_ADDR_INVALID);
-}
-
 #endif
-- 
2.53.0

