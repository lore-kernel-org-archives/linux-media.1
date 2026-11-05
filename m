Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863643;
	b=DpfT1R7WRqtxUPTsa/DypzpXcEPL/xNAIWX8y8z1SNDiYU0zZfSJmg2r7IlZVkx7jO5A
	 gSDZ9RyeX2SjKKGJFuXglP64lDUCkfJHsz/lZGXvlRDL5+T6sYE1IVs7MW6slEpj15bDQ
	 TFrFwrmOOdDKLUVGO/7y6IRdmimUC8ggQUrrkPw4ptfxIExU7a+FmZ1SRoMmvPikAqbac
	 Ce6HmDTGkz28egMp+L6GeMTURCDFaU8iGQL6AaiDFFb/YG4PQxgzsmIyzxjGTkvJeZAT8
	 7a4gGTrAM6I91wAbzdFbujUmYdmWtx/V15QIQCelVPUgIv8m6pELLJVaIiLpWZUgWJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863643;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UTriWbmbk/gnc8CBtFKyQBHp0Lznha4otsdtbDHTtSU=;
	b=3PH2FJ19ooR0iXcF8jTEMRm6jn1azAinm8rjCLgGNtKAlhKtgWm0ZSEN8x4WEe0p78FE
	 GOGB0wyl7XSO3WA3x5J84biBh3/zccfkLqPY5bKJw6t4+gJ0FQR8S4RIq0yR+OOEp8BT0
	 UEoYywy+0uLzX8W/q9NlerbowbLUCtdpYuB6WtBt+g89jaDDx3z8+Dq5hPBUGZMyD1YO7
	 nNC14Z/deLqsFIrWY+WoG+RUOFt57b572+oaU4oLpa9RiBieKIZWB455ERgdsoJU20pOI
	 OkLFE3PgCAsKe7mGgq/EUZfqWJeT8EAzi295n+AO8tXMy0bd1PfoCBowlt3QfG1xdwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=corrtbgn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0D1606A33C
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=corrtbgn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE2F1F000C1;
	Thu,  5 Nov 2026 07:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863643;
	bh=UTriWbmbk/gnc8CBtFKyQBHp0Lznha4otsdtbDHTtSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=corrtbgnf2sjXG3DCZaPHx5eLZl2SRk0L1X2zJbsiX6vifWHZjUVFlfU6zmn8qBw8
	 XNZuBy2cBT20o8balEraMdbryf3lax4vMKnH78zSLie7j3xu4Uybi8SYJypXa3xoGm
	 5s/lEYLp8B4l3Im0nhSx1oW1QUhDn5BfV5Vlm7rqJPWqpgwYJ39WglNxli+qCtUO8J
	 c8Jx6k7Y+cBMILMtIBNSKbIkVUzbJrpxcTieN57PGE6ErxsolydOhjC+s4RgZTfSRJ
	 lTsi2+mfziupR71sIgWKP+DiXlGluGG8o+olvhv7CvvcOL4mumoOfu68z90QO3/cPP
	 ilyTYYN4swxYQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 06/13] media: cec: core: improve cec_notifier_phys_addr_invalidate
Date: Thu,  5 Nov 2026 08:22:20 +0100
Message-ID: <e03c6b786e243e6a0062c61a77ce478dd561c27b.1793863347.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793863347.git.hverkuil+cisco@kernel.org>
References: <cover.1793863347.git.hverkuil+cisco@kernel.org>
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
that there is no HPD.

Also update cec_notifier_cec_adap_register(): it has to remember if
the last set physical address was from an EDID or because there was
a disconnect.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-notifier.c | 26 +++++++++++++++++++--
 include/media/cec-notifier.h          | 33 +++++++++++++++------------
 2 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 8cf1474d0361..5a4588487ea3 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -29,6 +29,7 @@ struct cec_notifier {
 	struct cec_adapter *cec_adap;
 
 	u16 phys_addr;
+	bool edid_present;
 };
 
 static LIST_HEAD(cec_notifiers);
@@ -113,6 +114,7 @@ cec_notifier_conn_register(struct device *hdmi_dev, const char *port_name,
 
 	mutex_lock(&n->lock);
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	n->edid_present = false;
 	if (conn_info)
 		n->conn_info = *conn_info;
 	else
@@ -135,6 +137,7 @@ void cec_notifier_conn_unregister(struct cec_notifier *n)
 	mutex_lock(&n->lock);
 	memset(&n->conn_info, 0, sizeof(n->conn_info));
 	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	n->edid_present = false;
 	if (n->cec_adap) {
 		if (!n->cec_adap->adap_controls_phys_addr)
 			cec_phys_addr_invalidate(n->cec_adap);
@@ -162,8 +165,12 @@ cec_notifier_cec_adap_register(struct device *hdmi_dev, const char *port_name,
 	n->cec_adap = adap;
 	adap->conn_info = n->conn_info;
 	adap->notifier = n;
-	if (!adap->adap_controls_phys_addr)
-		cec_s_phys_addr(adap, n->phys_addr, false);
+	if (!adap->adap_controls_phys_addr) {
+		if (n->phys_addr == CEC_PHYS_ADDR_INVALID && !n->edid_present)
+			cec_phys_addr_invalidate(adap);
+		else
+			cec_s_phys_addr(adap, n->phys_addr, false);
+	}
 	mutex_unlock(&n->lock);
 	return n;
 }
@@ -190,6 +197,7 @@ void cec_notifier_set_phys_addr(struct cec_notifier *n, u16 pa)
 
 	mutex_lock(&n->lock);
 	n->phys_addr = pa;
+	n->edid_present = true;
 	if (n->cec_adap && !n->cec_adap->adap_controls_phys_addr)
 		cec_s_phys_addr(n->cec_adap, n->phys_addr, false);
 	mutex_unlock(&n->lock);
@@ -216,6 +224,20 @@ void cec_notifier_set_phys_addr_from_edid(struct cec_notifier *n,
 }
 EXPORT_SYMBOL_GPL(cec_notifier_set_phys_addr_from_edid);
 
+void cec_notifier_phys_addr_invalidate(struct cec_notifier *n)
+{
+	if (!n)
+		return;
+
+	mutex_lock(&n->lock);
+	n->phys_addr = CEC_PHYS_ADDR_INVALID;
+	n->edid_present = false;
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

