Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BB12F585
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617804; cv=none; b=Qnc71D7yziyGo8r2NI15HvQ1HpObPNNyJ95VQVqDzZLgm5MJf3dKOtgC8OwIn0GBsxnYEuuUbxfhv8eglBhbxzjpYEZlfBrp4uvKNcXfN5ZvMDelIRy7gVy/bRIt+NCkv2+L4cfYGJUow6LoqEFQbCWvo0goP0KPZzluVXKlLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617804; c=relaxed/simple;
	bh=Uq2QKVVyZAJ3iw6CumjZWhFioqu61MDeX2nc5nXbbvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKM2KUI1V00TfTAvrnArqHXwKZY334QDL9fOnWliIykrNZBIohFcU3Jwrd+lT6Zsq/pAH2ARTrEfpNC9C8M8IYFitSnt+jVuFjUv9w+QWMLR1qIVPqnBrCcZFu0OkizOo19zJ05c4IXkRlpH6OjTTSMZjSoUGewU40X1NPBWuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/IY6p2r; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/IY6p2r"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d7195706f1so22630595ad.0
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617803; x=1789222603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=abSqaXjYNWpx1velmfbb4Gcwy1xXArcmn2otfVZnNGs=;
        b=C/IY6p2rFxMtFFafnTecKroKFG5z3EIZcVIZvgQedzwwUBKuJ+E6q5jk140+itu5wA
         gMV7J/3VCdyZSo4/xyGfga87wLDf18zTj+7O5j9f4BT2IgtxnQ0lxKEPB/6Qqn+1XAaT
         EUTYszbA3uGn3Zq/+c1pqg5laAEl6xFr9OvPQXMm31QeIURHr9yccn8nuiTAdzWTcaHp
         IZn+UXWSExOKf4qBNvZvE4iMNKkdTfHZkmGYAhtn6s+qUWvD/JRrRnTwDxruXgGNSvYQ
         0j8N41FX069DKZ+btgYAxOf7ZEEM27ITbAWez1+dRvlsJTppCVcMxERhS3OFzKbH9qse
         B0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617803; x=1789222603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abSqaXjYNWpx1velmfbb4Gcwy1xXArcmn2otfVZnNGs=;
        b=bVPkSUNSMcV071szWYYpDVvWqwUBkV3GA3LBPz3UFdZ1poqDY5ta2QZChyXP0KXFkw
         uwSxpHWTPC1LPlZRB5QJmog0o2Q/dKqKOdx4kq0nZXwQ/k996mUqEy/tpQEQ91dIASue
         oETxSYK3mPQn8j/gV0knAJT3gd0N1txBvGrGxOXqLO90F8+GwSu1VwskEmrd0DtT8M7L
         XHv6R3D+qcYLhqV94DLjflxcTO7sK4TUrfnSucVl78uraDKDg9nAtuQq4pYVkOqgdwPK
         V9kl6Ov4EDIosXe0QEdSJpaHikT66aKLbeUyQqX7WvInBJmC+q1k88UaTG0BDBKodvD1
         0hqQ==
X-Forwarded-Encrypted: i=1; AKwUvByysmHuVo9d5EKZiY0qVNGz8sLAUAGGJFWejQCB2ACzsJ5DHkWktujkuuICMRzK73rsyK+mi5mWmUuV2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nfY7XMry04ca27nT1ZbGJXSquiS+1Ahq6Zvqb0qoWmYmL5vGvs
	Rr88M91eqIgM/EQirR7EDmimt1Secz/FQjQKy5u0JQ0jb0NbBXPAW1eO97Qbig==
X-Gm-Gg: AYBFou02NsUfSNA1pFaFzBxPJms01tcaeAfJCZzqvj4JemrXB8T67gepOpq2fBIgUxr
	AFQL1SnJGOta+7j1EXvKaUVx5cl2lOyhRV6T9ESYYg9EBgjI5E//2RvFhMPRhQWVyjNOLmTv+f4
	quR6C33156kU9MEYNhWFNcrzGGkNRYPUcHZGsWsTxcezUmJnhLvfYPBI2Hgj10aIjoUjm5sHwvl
	sVlHpV3kxOtEHR3mIq279LIHJ1xH2c0oGJiug18PWSA2W0yUKnMPyKRZNzUFWbVnKGgA1ZOj89V
	EVNTV5Jo7PZ7c6gJ+kmDW+5946XNRcThoBh+G9sTmyMBIMu2rvVFQcAvzo1sAjcxL5eTx7bnkeL
	14VQ9TKvJHkNtqsjUCjOXkqBDXXPRJD2RmBR7bezSdhRHGJplZ1jxFyacND+C+yJKGmQD/Thray
	Z8JmSB/6AWHAYjapaX5Pvce+uGfVSUc5dNyIZuQf+TIOc9CJD/VOJ7ndG2ji1BAxqw8lrKpTv7/
	sSLzQF8VwerhsFq+Ei32pmwMeWoTZZ3
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr22399265a91.3.1788617802530;
        Sat, 05 Sep 2026 07:16:42 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm13596787c88.11.2026.09.05.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:16:41 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH] media: dvb-core: purge unsafe ULE debug and fix pre-existing vulnerabilities
Date: Sat,  5 Sep 2026 11:16:37 -0300
Message-ID: <20260905141637.22501-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit completely removes the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate lockless race conditions
and cleans up the unused function signature parameter in dvb_net_ule_check_crc()
to resolve compilation failures.

Additionally, this patch addresses two pre-existing critical security issues:
1. Fixes a Use-After-Free (UAF) vulnerability in dvb_net_remove_if() by
   invoking unregister_netdev() before flushing the workqueues, ensuring no
   new callbacks can queue tasks after flushes.
2. Fixes an Out-of-Bounds (OOB) memory read vulnerability in the ULE extension
   header parsing loop by introducing a strict bounds check against the skb
   tail pointer.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 --------
 drivers/media/dvb-core/dvb_net.c | 57 ++++++++++++++------------------
 2 files changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
          If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-       bool "Enable DVB net ULE packet debug messages"
-       depends on DVB_CORE
-       help
-         Enable extra log messages meant to detect problems while
-         handling DVB network ULE packet loss inside the Kernel.
-
-         Should not be enabled on normal cases, as logs can
-         be very verbose.
-
-         If you are unsure about this, say N here.
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..5060b8866 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,19 +68,6 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
-/*
- * The code inside DVB_ULE_DEBUG keeps a history of the
- * last 100 TS cells processed.
- */
-static unsigned char ule_hist[100*TS_SZ] = { 0 };
-static unsigned char *ule_where = ule_hist, ule_dump;
-
-static void hexdump(const unsigned char *buf, unsigned short len)
-{
-       print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
        int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
        /* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-       if (ule_where >= &ule_hist[100*TS_SZ])
-               ule_where = ule_hist;
-       memcpy(ule_where, h->ts, TS_SZ);
-       if (ule_dump) {
-               hexdump(ule_where, TS_SZ);
-               ule_dump = 0;
-       }
-       ule_where += TS_SZ;
-#endif
 
        /*
         * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -382,6 +359,10 @@ static int handle_one_ule_extension(struct dvb_net_ule_handle *h, int ext_len)
 static int handle_ule_extensions(struct dvb_net_ule_handle *h)
 {
 	int ext_len;
+	struct sk_buff *skb = h->priv->rx_skb;
+	unsigned char *tail = skb_tail_pointer(skb);
+
+	h->ule_next_hdr = h->from_where;
 
 	do {
 		ext_len = h->ule_sndu_type;
@@ -391,6 +372,11 @@ static int handle_ule_extensions(struct dvb_net_ule_handle *h)
 			ext_len = handle_one_ule_extension(h, ext_len);
 			if (ext_len < 0)
 				return ext_len;
+
+			/* Prevent Out-of-Bounds read from malformed long extension headers */
+			if (h->ule_next_hdr + ext_len > tail)
+				return -EINVAL;
+
 			h->ule_next_hdr += ext_len;
 			if (h->ule_next_hdr == tail)
 				return -EINVAL;
@@ -632,7 +618,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
-                                 struct kvec *iov,
                                  __u32 ule_crc, __u32 expected_crc)
 {
        pr_warn("%s: CRC32 check FAILED: %08x <> %08x\n",
@@ -659,23 +644,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
                        h->ts_remain > 2 ?
                                *(unsigned short *)h->from_where : 0);
 
-       #ifdef DVB_ULE_DEBUG
-               hexdump(iov[0].iov_base, iov[0].iov_len);
-               hexdump(iov[1].iov_base, iov[1].iov_len);
-               hexdump(iov[2].iov_base, iov[2].iov_len);
-
-               if (ule_where == ule_hist) {
-                       hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-                       hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-               } else if (ule_where == &ule_hist[TS_SZ]) {
-                       hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-                       hexdump(ule_hist, TS_SZ);
-               } else {
-                       hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-                       hexdump(ule_where - TS_SZ, TS_SZ);
-               }
-               ule_dump = 1;
-       #endif
 
                h->dev->stats.rx_errors++;
                h->dev->stats.rx_crc_errors++;
@@ -843,7 +811,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
                                       *(tail - 2) << 8 |
                                       *(tail - 1);
 
-                       dvb_net_ule_check_crc(&h, iov, ule_crc, expected_crc);
+                       dvb_net_ule_check_crc(&h, ule_crc, expected_crc);
 
                        /* Prepare for next SNDU. */
                        reset_ule(h.priv);
@@ -1214,9 +1182,9 @@ static void dvb_net_remove_if(struct dvb_net *dvbnet, unsigned int num)
        priv->in_use = 0;
        net = priv->net;
 
+       unregister_netdev(net);
        flush_work(&priv->set_multicast_list_wq);
        flush_work(&priv->restart_net_feed_wq);
        pr_info("removed network interface %s\n", net->name);
-       unregister_netdev(net);
        free_netdev(net);
 }
-- 
2.43.0
