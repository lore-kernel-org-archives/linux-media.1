Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863648;
	b=NLyeJ8HbFKXJKkh7fr05lVjUG5RAPOj0srHZ20DHWMmUTqsKnsyQGyGl+rIC/M4iWFb7
	 BNSGEWEjfj+U4xFAyb2ED1aIZJWD7h0DgKJ6qiZRCC4Xpt3Y6K/gdT6KLiDm5FtElnmgM
	 YD9LG5nvk7Yry0I0BttRAVSqOg1Fs28Fo18a8ce8qSFL790IJ1BjBA9nwZp6sj17P+1JE
	 eYh7ORwQ2fhHYY687OdmYKvalJqlXPWSdTuQW0llf8bWgbZcPvufzcwvbA46fAE0HeeuT
	 BpzxNO06Oluga1jDJYVNq3fcz8QckYG1hRGgyL7qwCrWSTtUTRfgGxY6siTUDRoU1iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863648;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RlACA9MD4T67LKgEBcMZ7tpcjd9NPKYk1vwV9d8Vfp4=;
	b=UYhhexbs5YJF19ywzFn3AsdociTCULuqQhGuDwXt7fJax3EsD4BuRrqxvwmshYsDyXl2
	 0cDH1Eh+tVCFxpgSVluknbN2YRYbhUut3+au+KsgOqjtELYRgAgoq1z566VTH1JTvKauG
	 ktzPmzypbRQ4tZPnWh84swcRRSV21UEB9OfYZLS+9AL+LUU5RlPGeFELlsMwPVPy5cXUz
	 NorJDUoGLEidl1mLfQGmmOvq7jUgRAYwW9X7iF2DAlVc9zNEwTYqKpj8n8QbjmXAAmklH
	 Gi0m80kfc4X2pNfA3KWeKZBl50HVRFu8YhUj5YinSvoMcBZIs3dBxeVp3uds9zKXW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDZ81ODR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A1606A326
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDZ81ODR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D062C1F00919;
	Thu,  5 Nov 2026 07:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793863648;
	bh=RlACA9MD4T67LKgEBcMZ7tpcjd9NPKYk1vwV9d8Vfp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZDZ81ODRhqOjGZtD1mJgP5IRR630t9gleJ5cJpKb5QBOsJuyM7rfJAjmvj7VL3CjN
	 TtdkYYd8iAeIxFwNrnEsDqLiFjdBEEldJpwoTAU/oOVQ2lK6q4hotMnhzrOnfHFujR
	 9bVk9g9zRt0toLiWmuS7HU+FJwjxLIpxBuk/N2rEMuBQF0Oc5f+JOx6jKsJO86oi9+
	 kojMz0p0dbQQs67tduYCpLbfWKCIiUDq7aVrHNpe6VLJ+NZld4uSf5k+oVitSRvg/I
	 YKsGPG8prHDvEDVoczV8MToR1HosU3q5bAFQczYG87BoU/r3rvwTG7EcZxPjVSa4nO
	 Lk0yKwX4itQNw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 09/13] media: cec: core: add support for HPD_PRESENT
Date: Thu,  5 Nov 2026 08:22:23 +0100
Message-ID: <ae93656d52c429861504836a10c07b9eac3cd470.1793863347.git.hverkuil+cisco@kernel.org>
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

There can be two reasons for the CEC Physical Address to be invalid:
either there is no HPD, or there is an EDID, but it does not contain
a Physical Address, or the Physical Address is set to f.f.f.f in the EDID.

For debugging it is very useful to know why the PA is invalid.

Add support for reporting this to userspace by changing the behavior of
two CEC functions: cec_s_phys_addr is called with the PA read from the
EDID (or CEC_PHYS_ADDR_INVALID if the EDID has no PA or the PA is f.f.f.f),
and cec_phys_addr_invalidate is only called if the HPD goes low, so the
EDID is gone.

The first function sets the new CEC_LOG_ADDRS_FL_HPD_PRESENT flag, and
the second function removes it.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/cec/core/cec-adap.c | 49 ++++++++++++++++++++++++++-----
 drivers/media/cec/core/cec-api.c  |  3 +-
 drivers/media/cec/core/cec-core.c |  4 ++-
 drivers/media/cec/core/cec-priv.h |  3 +-
 include/media/cec.h               | 27 +++++++++--------
 5 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index ee8a200b9803..55b2e711fe77 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1727,18 +1727,35 @@ int cec_adap_enable(struct cec_adapter *adap)
  *
  * This function is called with adap->lock held.
  */
-void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
+void __cec_s_phys_addr(struct cec_adapter *adap, bool hpd_present,
+		       u16 phys_addr, bool block)
 {
 	bool becomes_invalid = phys_addr == CEC_PHYS_ADDR_INVALID;
 	bool is_invalid = adap->phys_addr == CEC_PHYS_ADDR_INVALID;
+	bool hpd_was_present =
+		adap->log_addrs.flags & CEC_LOG_ADDRS_FL_HPD_PRESENT;
 
-	if (phys_addr == adap->phys_addr)
-		return;
+	if (adap->capabilities & CEC_CAP_HAS_HPD_PRESENT) {
+		if (hpd_present)
+			adap->log_addrs.flags |= CEC_LOG_ADDRS_FL_HPD_PRESENT;
+		else
+			adap->log_addrs.flags &= ~CEC_LOG_ADDRS_FL_HPD_PRESENT;
+	} else {
+		hpd_present = false;
+	}
 	if (!becomes_invalid && adap->devnode.unregistered)
 		return;
+	if (phys_addr == adap->phys_addr) {
+		if (hpd_was_present != hpd_present) {
+			dprintk(1, "HPD is %spresent\n",
+				hpd_present ? "" : "not ");
+			cec_post_state_event(adap);
+		}
+		return;
+	}
 
-	dprintk(1, "new physical address %x.%x.%x.%x\n",
-		cec_phys_addr_exp(phys_addr));
+	dprintk(1, "new physical address %x.%x.%x.%x, HPD is %spresent\n",
+		cec_phys_addr_exp(phys_addr), hpd_present ? "" : "not ");
 	if (becomes_invalid || !is_invalid) {
 		adap->phys_addr = CEC_PHYS_ADDR_INVALID;
 		cec_adap_unconfigure(adap);
@@ -1767,11 +1784,22 @@ void cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block)
 		return;
 
 	mutex_lock(&adap->lock);
-	__cec_s_phys_addr(adap, phys_addr, block);
+	__cec_s_phys_addr(adap, true, phys_addr, block);
 	mutex_unlock(&adap->lock);
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr);
 
+void cec_phys_addr_invalidate(struct cec_adapter *adap)
+{
+	if (IS_ERR_OR_NULL(adap))
+		return;
+
+	mutex_lock(&adap->lock);
+	__cec_s_phys_addr(adap, false, CEC_PHYS_ADDR_INVALID, false);
+	mutex_unlock(&adap->lock);
+}
+EXPORT_SYMBOL_GPL(cec_phys_addr_invalidate);
+
 /*
  * Note: In the drm subsystem, prefer calling (if possible):
  *
@@ -1782,10 +1810,15 @@ void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 {
 	u16 pa = CEC_PHYS_ADDR_INVALID;
 
+	if (IS_ERR_OR_NULL(adap))
+		return;
+
 	if (edid && edid->extensions)
 		pa = cec_get_edid_phys_addr((const u8 *)edid,
 				EDID_LENGTH * (edid->extensions + 1), NULL);
-	cec_s_phys_addr(adap, pa, false);
+	mutex_lock(&adap->lock);
+	__cec_s_phys_addr(adap, edid, pa, false);
+	mutex_unlock(&adap->lock);
 }
 EXPORT_SYMBOL_GPL(cec_s_phys_addr_from_edid);
 
@@ -1969,6 +2002,8 @@ int __cec_s_log_addrs(struct cec_adapter *adap,
 	}
 
 	log_addrs->log_addr_mask = adap->log_addrs.log_addr_mask;
+	log_addrs->flags |=
+		adap->log_addrs.flags & CEC_LOG_ADDRS_FL_HPD_PRESENT;
 	adap->log_addrs = *log_addrs;
 	err = cec_adap_enable(adap);
 	if (!err && adap->phys_addr != CEC_PHYS_ADDR_INVALID)
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index a491d7fc8a71..1ba080d5a123 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -136,7 +136,8 @@ static long cec_adap_s_phys_addr(struct cec_adapter *adap, struct cec_fh *fh,
 	if (cec_is_busy(adap, fh))
 		err = -EBUSY;
 	else
-		__cec_s_phys_addr(adap, phys_addr, block);
+		__cec_s_phys_addr(adap, phys_addr != CEC_PHYS_ADDR_INVALID,
+				  phys_addr, block);
 	mutex_unlock(&adap->lock);
 	return err;
 }
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 230f8a413e74..49589e71d240 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -178,7 +178,7 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 	mutex_unlock(&devnode->lock);
 
 	mutex_lock(&adap->lock);
-	__cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
+	__cec_s_phys_addr(adap, false, CEC_PHYS_ADDR_INVALID, false);
 	__cec_s_log_addrs(adap, NULL, false);
 	// Disable the adapter (since adap->devnode.unregistered is true)
 	cec_adap_enable(adap);
@@ -279,6 +279,8 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->log_addrs.cec_version = CEC_OP_CEC_VERSION_2_0;
 	adap->log_addrs.vendor_id = CEC_VENDOR_ID_NONE;
 	adap->capabilities = caps | CEC_CAP_REPLY_VENDOR_ID;
+	if (!(caps & CEC_CAP_PHYS_ADDR))
+		adap->capabilities |= CEC_CAP_HAS_HPD_PRESENT;
 	if (debug_phys_addr)
 		adap->capabilities |= CEC_CAP_PHYS_ADDR;
 	adap->needs_hpd = caps & CEC_CAP_NEEDS_HPD;
diff --git a/drivers/media/cec/core/cec-priv.h b/drivers/media/cec/core/cec-priv.h
index ce42a37c4ac0..c16792a30752 100644
--- a/drivers/media/cec/core/cec-priv.h
+++ b/drivers/media/cec/core/cec-priv.h
@@ -46,7 +46,8 @@ void cec_monitor_pin_cnt_dec(struct cec_adapter *adap);
 int cec_adap_status(struct seq_file *file, void *priv);
 int cec_thread_func(void *_adap);
 int cec_adap_enable(struct cec_adapter *adap);
-void __cec_s_phys_addr(struct cec_adapter *adap, u16 phys_addr, bool block);
+void __cec_s_phys_addr(struct cec_adapter *adap, bool hpd_present,
+		       u16 phys_addr, bool block);
 int __cec_s_log_addrs(struct cec_adapter *adap,
 		      struct cec_log_addrs *log_addrs, bool block);
 int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
diff --git a/include/media/cec.h b/include/media/cec.h
index 4c8b0950b377..7bb9ada696ca 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -381,6 +381,16 @@ void cec_s_conn_info(struct cec_adapter *adap,
 int cec_transmit_msg(struct cec_adapter *adap, struct cec_msg *msg,
 		     bool block);
 
+/**
+ * cec_phys_addr_invalidate() - set the physical address to INVALID
+ *
+ * @adap:	the CEC adapter
+ *
+ * This is a simple helper function to invalidate the physical
+ * address when the HPD is lost.
+ */
+void cec_phys_addr_invalidate(struct cec_adapter *adap);
+
 /* Called by the adapter */
 void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 			  u8 arb_lost_cnt, u8 nack_cnt, u8 low_drive_cnt,
@@ -491,6 +501,10 @@ static inline void cec_s_phys_addr_from_edid(struct cec_adapter *adap,
 {
 }
 
+static inline void cec_phys_addr_invalidate(struct cec_adapter *adap)
+{
+}
+
 static inline u16 cec_get_edid_phys_addr(const u8 *edid, unsigned int size,
 					 unsigned int *offset)
 {
@@ -513,19 +527,6 @@ cec_fill_conn_info_from_drm(struct cec_connector_info *conn_info,
 
 #endif
 
-/**
- * cec_phys_addr_invalidate() - set the physical address to INVALID
- *
- * @adap:	the CEC adapter
- *
- * This is a simple helper function to invalidate the physical
- * address.
- */
-static inline void cec_phys_addr_invalidate(struct cec_adapter *adap)
-{
-	cec_s_phys_addr(adap, CEC_PHYS_ADDR_INVALID, false);
-}
-
 /**
  * cec_get_edid_spa_location() - find location of the Source Physical Address
  *
-- 
2.53.0

