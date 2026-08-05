Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F87392C32
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 18:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954819; cv=none; b=XngSUerZyW5LhLztcGJcsyZo2K4xFZK4cbd1p+U1TXzO1KBEwwdzMdgiXnbcmlkUeEJuEvcpPA2FNBtTUkdPve24WE3OEvYDzkWjZVobEfhhwEjkFOZIBU8a05atMTPE+f1um+QwoVqnpU45tfKSvLsNlXeHiZqPxTIlrYhrhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954819; c=relaxed/simple;
	bh=KEOWHPmqazn3Rc2NhfWr6RTXphnDCqGYzb+wdac0Md8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N7H2a0SLEGk38Rw/n9izh9gTMxuSgS+cBd/pWl86LPeeH3a056ExUqwssOqu3+j1wKMA/3y1iZj4CPfIXcLgDwZb+aO8xIrvGPGFhJDC/ACPGxX1IQ5ghA7dMFWaDNw97cmsMSCWyT+q18lmtYD3VtaWYBskMTyGJxHYoMWVwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGLN6/+j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGLN6/+j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cfff5f88dbso19956445ad.3
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954816; x=1786559616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll1BDnueTToIDv1UsG/EHfYj5A1zeconA3K3v4tzltY=;
        b=cGLN6/+jPdU1emcvJtNeQ4T/K/IxEj5d8U+Van+xtBSv2DLt4leTYXV1Oon18SnS43
         nCKrU92xovDnAmupeEpvtoYYAIzt6VWSR3ijy9oQnOXr4gtGdS8nUW9bLMMvr+WkMd/a
         Od4jfdVB9Zw2/Y4lG/E5oY8+lO5D4h4fRrHxIHwIFpewtuT32ovnnWU6ytPfkrNalAZC
         xzHDAR7UXxon0+xN2g0N9IZ44EWIyPZBRtDNLBUYbjME85WErQwb5Ud1KDVCuKm7TID5
         +D5th0Z5PC7VcMNHg6VX61IswwbYRSDYSkTUvrleI3KVaWk4I5NsptJ7wAJnszz0breF
         XUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954816; x=1786559616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll1BDnueTToIDv1UsG/EHfYj5A1zeconA3K3v4tzltY=;
        b=VuHKK2zKzKZU6dKMzGEnoqwYKF5xUCzc3biLRjTdCf9+Bn8pBxuEpIM4j0EiGM+D8i
         qlsUjPdJMewp3Ar3FEmUelXSV1lEKxLo6M2gb9/2LJ3i46VyW18G/2rRAw3+GiV0aBN6
         6FDibBhSeeO4EIcZpRRtHtDTSCeA1SykaC0l+b5TJhC6uwf4mUelqjjIln1jE3Ec4BBx
         Ds13GJQzX0PaIDQ6lKqF2ekyw84tTueV9lTetoaR6YcnxAuhsmYPf90WVx2AbjLnvaNx
         qTZ4aQdG9Al1Cefc0oLIg/ktG91khgD9WHw+pxd3r8db3IvXPaA7FRI1iiyKHxHVwKFs
         1YmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpK05By7UJWnzbrz/ozkxzqAzjmI41rRDkk534J4BsZmsE/PMwbAp/7kpfLhjeO6Tnv2loxfp/2f1QCeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlXAGBdEd7cBeiqIcFyqO5Pf3bhzBEoVJsWek2yHfWyWuBcztC
	E79Lip+HgmFidiM95sub+GKl0z3r8lZT1/4XzE6xAi+2kBEKm9DvdhOj
X-Gm-Gg: AR+sD13pT7yM7BfBzpSTE6YCloaRBlSzPsFm9jctuKec7pDLWqBS/9NBOZyL1vFjELN
	TTdjIgcHudA87ZzGtcWtTTIFoJqY+5b8Vvff6qsIx1F/cZ9W+K+A0BRGDGHPlI6MORhl9nRJ2Tx
	4X0Gb6Gevg9GGxpDtzsks0JS6leGDqwBHE6lq4DrEBEjpZU3tVQFXD/Uy8IP7KcAwpiBxcPjkmj
	x3LxI2Ee6k8DjmV45lmHta/UOV6xueuFXoBlc58rqN02ES9lLCSyrTluW1fXGiist/CxO4rV+6e
	crMcoLVi9FBafZ4A6Hd7O/HTl4ffvonlVAObt00y7jHLblI/8XMpMCVDlmoKcECzwaAVy4+VmJz
	v2GygIdh/AlIWvyLAcXrMXQVztwk8ODsADkrpPgDkhR6X8TSYZQ6B8DF27ZyOhTUXzs+J5omNBB
	qMo8B87qmCZDEscCaUKYJJOYjuPq6csdCu7Kg3MXlUWbLDjz5F8TgshjoJvTLQzvbIBTdr2pqZK
	uj1ifRS
X-Received: by 2002:a17:903:3c27:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2d0ca961e12mr110253755ad.21.1785954816436;
        Wed, 05 Aug 2026 11:33:36 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315a1e0b5cesm2369772eec.5.2026.08.05.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:33:36 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Replace custom rtw_cbuf with kfifo
Date: Wed,  5 Aug 2026 18:33:16 +0000
Message-ID: <20260805183317.85489-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs driver implemented its own custom circular buffer
(rtw_cbuf) for c2h event handling. The kernel already provides a standard,
lockless circular buffer implementation in <linux/kfifo.h>.

This patch replaces the custom rtw_cbuf struct and its associated
functions with the standard kfifo API (kfifo_alloc, kfifo_put,
kfifo_get, kfifo_is_empty, kfifo_free), simplifying the driver code
and relying on the robust kernel infrastructure. Furthermore, the allocation
size is simplified to C2H_QUEUE_MAX_LEN, dropping the vestigial + 1 that
the original naive ring buffer required to disambiguate full from empty.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v4:
 - Abandoned ternary operator style fixes in favor of completely
   replacing the custom rtw_cbuf ring buffer with the standard Linux
   kfifo API, as suggested by Greg Kroah-Hartman.

Changes in v3:
 - Formatted as a standalone patch (removed 1/3 series numbering).

Changes in v2:
 - Fixed patch formatting and versioning issues.

Changes in v1:
 - Initial submission addressing ternary operator style issues in rtw_cbuf.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 16 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 .../staging/rtl8723bs/include/osdep_service.h | 14 ----
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  3 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 77 -------------------
 5 files changed, 11 insertions(+), 101 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..424aa180eecc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -202,8 +202,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
-	if (!pevtpriv->c2h_queue)
+	if (kfifo_alloc(&pevtpriv->c2h_queue, C2H_QUEUE_MAX_LEN, GFP_KERNEL))
 		return -ENOMEM;
 
 	return 0;
@@ -211,17 +210,17 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
+	void *c2h;
+
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
 		fsleep(10 * USEC_PER_MSEC);
 
-	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
-		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-
+	while (kfifo_get(&pevtpriv->c2h_queue, &c2h)) {
 		if (c2h && c2h != (void *)pevtpriv)
 			kfree(c2h);
 	}
-	kfree(pevtpriv->c2h_queue);
+	kfifo_free(&pevtpriv->c2h_queue);
 }
 
 void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
@@ -1695,12 +1694,13 @@ static void c2h_wk_callback(struct work_struct *work)
 	struct evt_priv *evtpriv = container_of(work, struct evt_priv, c2h_wk);
 	struct adapter *adapter = container_of(evtpriv, struct adapter, evtpriv);
 	u8 *c2h_evt;
+	void *c2h_ptr;
 	c2h_id_filter ccx_id_filter = rtw_hal_c2h_id_filter_ccx(adapter);
 
 	evtpriv->c2h_wk_alive = true;
 
-	while (!rtw_cbuf_empty(evtpriv->c2h_queue)) {
-		c2h_evt = (u8 *)rtw_cbuf_pop(evtpriv->c2h_queue);
+	while (kfifo_get(&evtpriv->c2h_queue, &c2h_ptr)) {
+		c2h_evt = (u8 *)c2h_ptr;
 		if (c2h_evt) {
 			/* This C2H event is read, clear it */
 			c2h_evt_clear(adapter);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index da2d9088ab5a..e39faed1f195 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -763,7 +763,7 @@ void sd_int_dpc(struct adapter *adapter)
 			}
 		} else {
 			/* Error handling for malloc fail */
-			rtw_cbuf_push(adapter->evtpriv.c2h_queue, NULL);
+			kfifo_put(&adapter->evtpriv.c2h_queue, NULL);
 			_set_workitem(&adapter->evtpriv.c2h_wk);
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 2f5011a8210c..6feeb1351faa 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -36,18 +36,4 @@ extern void rtw_free_netdev(struct net_device *netdev);
 void rtw_buf_free(u8 **buf, u32 *buf_len);
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len);
 
-struct rtw_cbuf {
-	u32 write;
-	u32 read;
-	u32 size;
-	void *bufs[];
-};
-
-bool rtw_cbuf_full(struct rtw_cbuf *cbuf);
-bool rtw_cbuf_empty(struct rtw_cbuf *cbuf);
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
-void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
-struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
-
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 2e791da7e815..62e6b9011625 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -8,6 +8,7 @@
 #define __RTW_CMD_H_
 
 #include <linux/completion.h>
+#include <linux/kfifo.h>
 
 #define C2H_MEM_SZ (16*1024)
 
@@ -58,7 +59,7 @@
 	struct	evt_priv {
 		struct work_struct c2h_wk;
 		bool c2h_wk_alive;
-		struct rtw_cbuf *c2h_queue;
+		DECLARE_KFIFO_PTR(c2h_queue, void *);
 		#define C2H_QUEUE_MAX_LEN 10
 
 		atomic_t event_seq;
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4cfdf7c62344..1db1c5aff530 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -122,80 +122,3 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-/**
- * rtw_cbuf_full - test if cbuf is full
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Returns: true if cbuf is full
- */
-inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
-{
-	return (cbuf->write == cbuf->read - 1) ? true : false;
-}
-
-/**
- * rtw_cbuf_empty - test if cbuf is empty
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Returns: true if cbuf is empty
- */
-inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
-{
-	return (cbuf->write == cbuf->read) ? true : false;
-}
-
-/**
- * rtw_cbuf_push - push a pointer into cbuf
- * @cbuf: pointer of struct rtw_cbuf
- * @buf: pointer to push in
- *
- * Lock free operation, be careful of the use scheme
- * Returns: true push success
- */
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
-{
-	if (rtw_cbuf_full(cbuf))
-		return _FAIL;
-
-	cbuf->bufs[cbuf->write] = buf;
-	cbuf->write = (cbuf->write + 1) % cbuf->size;
-
-	return _SUCCESS;
-}
-
-/**
- * rtw_cbuf_pop - pop a pointer from cbuf
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Lock free operation, be careful of the use scheme
- * Returns: pointer popped out
- */
-void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
-{
-	void *buf;
-
-	if (rtw_cbuf_empty(cbuf))
-		return NULL;
-
-	buf = cbuf->bufs[cbuf->read];
-	cbuf->read = (cbuf->read + 1) % cbuf->size;
-
-	return buf;
-}
-
-/**
- * rtw_cbuf_alloc - allocate a rtw_cbuf with given size and do initialization
- * @size: size of pointer
- *
- * Returns: pointer of srtuct rtw_cbuf, NULL for allocation failure
- */
-struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
-{
-	struct rtw_cbuf *cbuf;
-
-	cbuf = kzalloc_flex(*cbuf, bufs, size);
-	if (cbuf)
-		cbuf->size = size;
-
-	return cbuf;
-}
-- 
2.51.0.windows.1

