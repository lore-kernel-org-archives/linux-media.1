Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543383515C9;
	Wed,  5 Aug 2026 07:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915838; cv=none; b=fMMPIGwu0kwvKEKKlzqWL937piXofSwUBnO4rUwDaQlCZR6lzUhiDHbPr9zVzlBFv1Gw38yP0Jx1NQ+xp+wqhMsbGESu3F/SEbdgmC7HvWBYLz86+qidNt4MrzDmdxgZRM2vxQ8ir219X6H9VLU3V12A1dFkaUQ3jjwuSNmEIVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915838; c=relaxed/simple;
	bh=INcJdKJNULiINN7mNi1oIH6bCPY8yAlihoPfTa/NSMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwqynMi2EYPLBlyckR4h6jaUUo+w3rbd7V7Md8Zlu328Be3dMIeR0vjxnsYv9Fk1LJZVgyQAGhKErLkMLdPpiHz//IWbgHqcBeA32qK2UznyIJlSWo2X/NypfgL+4uB5v3PtpxlNoiC+uk3pAV4cnAfUARhciedfhh1ZvFj+8O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JJ+bRfNh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HI07z7ph; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JJ+bRfNh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HI07z7ph"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hFMqF4cYWzMlLV;
	Wed, 05 Aug 2026 09:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785915833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CvOnvILJapE6cOvfbbHKpGxkPY2vKp10Jy4cwIAjs6g=;
	b=JJ+bRfNhQkkBpDxVMJdWsrbRP6a0H7KpXvRRH+AditjyiUinQcQtcsd4CGfZMEeXXM75JH
	uRtMNMzw447FJxeJgQpTRjtnuVafpkF4nOnBbexsZQ1tUASEMecyck8gvuFiZJXWGgUA94
	W+NXjplAmlC4fJS4r9wfRvvdJcK721fautKWvuyPh779XijIXOvgnL7ICvEWYMlFKMC8xx
	d/biDZwrpqrc6f57IXEnS7W7k7AKfxHPVOqRnK/XI4jeusrRJDBguuyGkt8F92qgnM9bGq
	LbHnuYaH+aBh8Pj8osH1S9zx8lmKqJi5zP5VYf1ZRvlBTU3Vg3A0YDoQkKDHxQ==
From: Qing Ming <a0yami@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1785915832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CvOnvILJapE6cOvfbbHKpGxkPY2vKp10Jy4cwIAjs6g=;
	b=HI07z7phjLSeNNckf9LFeXULmKds7y180AZHuDPV6+E0dIEcn1hq6hINZYnveXWLrlchbr
	rTDxhA4GiEmHtUFIQqX8DpiD/vaTYwJ/ofDMdSflOScqtLTYLzWBaYpaqxLgxV1FEfONF1
	532cR+J1g3CXNNauloPvdisuql1fZ6YlZIeC5pBNkeOd1e5LebG1vSj8HPNGD0SBmHFLHR
	lq0FFXCju/xKyPGpdckzxecMs6OdTxPE1IQlotNTRD54aM8Uf6uK+WWqSFHg2XOH0n+B5f
	jnjKFlUgxc442Susonb5grBFx6Bf5dSz4eMjQ0jfoPVunun2vZqS1vRN1NrJ2A==
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Max Kellermann <max.kellermann@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing Ming <a0yami@mailbox.org>
Subject: [PATCH] media: as102: keep device alive for open DVB frontend
Date: Wed,  5 Aug 2026 15:42:18 +0800
Message-ID: <20260805074220.7396-1-a0yami@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6d18nqbdwn3izogjwn9jcrjj17z3adtc
X-MBO-RS-ID: f5955167e07677da1ee

dvb_frontend_detach() defers the frontend release while an open frontend
file still holds a reference. The final file release calls ts_bus_ctrl()
before dropping that reference, but as102_usb_disconnect() has already
dropped the only as102_dev_t reference by then.

This leaves the frontend's private bus adapter pointing into freed memory.
Closing a frontend file after USB disconnect consequently reaches
as102_stream_ctrl() and accesses the released device object. KASAN reports:

  BUG: KASAN: slab-use-after-free in mutex_lock_interruptible+0xa1/0x100
  as102_stream_ctrl+0x23/0x70
  dvb_frontend_release+0x1ea/0x200

The object was allocated by as102_usb_probe() and freed by
as102_usb_disconnect().

Hold an as102 device reference from frontend attachment through the final
frontend release callback. Detach the frontend on registration failure so
the new reference is also released on that path.

Fixes: 1f862a68df24 ("[media] dvb_frontend: move kref to struct
dvb_frontend")
Cc: stable@vger.kernel.org
Signed-off-by: Qing Ming <a0yami@mailbox.org>
---
 drivers/media/dvb-frontends/as102_fe.c  |  2 ++
 drivers/media/dvb-frontends/as102_fe.h  |  1 +
 drivers/media/usb/as102/as102_drv.c     | 15 ++++++++++++++-
 drivers/media/usb/as102/as102_drv.h     |  1 +
 drivers/media/usb/as102/as102_usb_drv.c |  2 +-
 5 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/as102_fe.c b/drivers/media/dvb-frontends/as102_fe.c
index fecb0735d..06bfa7c9d 100644
--- a/drivers/media/dvb-frontends/as102_fe.c
+++ b/drivers/media/dvb-frontends/as102_fe.c
@@ -403,6 +403,8 @@ static void as102_fe_release(struct dvb_frontend *fe)
 {
 	struct as102_state *state = fe->demodulator_priv;
 
+	if (state->ops->release)
+		state->ops->release(state->priv);
 	kfree(state);
 }
 
diff --git a/drivers/media/dvb-frontends/as102_fe.h b/drivers/media/dvb-frontends/as102_fe.h
index a6409b7ca..b0377877e 100644
--- a/drivers/media/dvb-frontends/as102_fe.h
+++ b/drivers/media/dvb-frontends/as102_fe.h
@@ -12,6 +12,7 @@ struct as102_fe_ops {
 	int (*get_status)(void *priv, struct as10x_tune_status *tstate);
 	int (*get_stats)(void *priv, struct as10x_demod_stats *demod_stats);
 	int (*stream_ctrl)(void *priv, int acquire, uint32_t elna_cfg);
+	void (*release)(void *priv);
 };
 
 struct dvb_frontend *as102_attach(const char *name,
diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a..bf7ff8a05 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -274,12 +274,22 @@ static int as102_stream_ctrl(void *priv, int acquire, uint32_t elna_cfg)
 	return ret;
 }
 
+static void as102_frontend_release(void *priv)
+{
+	struct as10x_bus_adapter_t *bus_adap = priv;
+	struct as102_dev_t *as102_dev;
+
+	as102_dev = container_of(bus_adap, struct as102_dev_t, bus_adap);
+	kref_put(&as102_dev->kref, as102_usb_release);
+}
+
 static const struct as102_fe_ops as102_fe_ops = {
 	.set_tune = as102_set_tune,
 	.get_tps  = as102_get_tps,
 	.get_status = as102_get_status,
 	.get_stats = as102_get_stats,
 	.stream_ctrl = as102_stream_ctrl,
+	.release = as102_frontend_release,
 };
 
 int as102_dvb_register(struct as102_dev_t *as102_dev)
@@ -333,12 +343,13 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 		    __func__, ret);
 		goto efereg;
 	}
+	kref_get(&as102_dev->kref);
 
 	ret =  dvb_register_frontend(&as102_dev->dvb_adap, as102_dev->dvb_fe);
 	if (ret < 0) {
 		dev_err(dev, "%s: as102_dvb_register_frontend() failed: %d",
 		    __func__, ret);
-		goto efereg;
+		goto eferegister;
 	}
 
 	/* init bus mutex for token locking */
@@ -358,6 +369,8 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	pr_info("Registered device %s", as102_dev->name);
 	return 0;
 
+eferegister:
+	dvb_frontend_detach(as102_dev->dvb_fe);
 efereg:
 	dvb_dmxdev_release(&as102_dev->dvb_dmxdev);
 edmxdinit:
diff --git a/drivers/media/usb/as102/as102_drv.h b/drivers/media/usb/as102/as102_drv.h
index 4342c7ce3..c125cae23 100644
--- a/drivers/media/usb/as102/as102_drv.h
+++ b/drivers/media/usb/as102/as102_drv.h
@@ -70,5 +70,6 @@ struct as102_dev_t {
 
 int as102_dvb_register(struct as102_dev_t *dev);
 void as102_dvb_unregister(struct as102_dev_t *dev);
+void as102_usb_release(struct kref *kref);
 
 #endif
diff --git a/drivers/media/usb/as102/as102_usb_drv.c b/drivers/media/usb/as102/as102_usb_drv.c
index a11024451..6eff2ff2f 100644
--- a/drivers/media/usb/as102/as102_usb_drv.c
+++ b/drivers/media/usb/as102/as102_usb_drv.c
@@ -298,7 +298,7 @@ static int as102_usb_start_stream(struct as102_dev_t *dev)
 	return 0;
 }
 
-static void as102_usb_release(struct kref *kref)
+void as102_usb_release(struct kref *kref)
 {
 	struct as102_dev_t *as102_dev;
 
-- 
2.53.0

