Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D33DDAE2
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 12:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613056; cv=none; b=Ty1JL6OoyrInyXlg5gMMc1QzNKZ0FtIjPQYRCrgPuohh+Y6QfEvGY0ONRPVx2p7XYb+ZgaPFZHDNMBHvXrSCLQBCYYh+2F0kG2dWd7s4bbFS2PsULciI3hM3NRpBVAfoQ8UgS2zN3cHi5L3vbBgooPEdWvkuyuAiXIHE2doumgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613056; c=relaxed/simple;
	bh=0GbiNyL6PaCeFSnzxifaG0jpg42+buGimYKFRJQqiJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLyxbJa50qZq+GtepjXNdHDUPtk+3dbhCHbfLFC5aIRsrZZDMbZ3qLegI/ceeDBgXgyMXnD1piNdM02+mBzWgr1wXvKzHUkK3cSljl4Yh0liP1lqsv+5K04rjWTDm0eQ4+CeZLONDU51teTwNwirNheQTd6dvorkSDkfcqc14fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXXfx9t6; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXXfx9t6"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so795690e0c.0
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613052; x=1789217852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiwxf8iLXv/0xdcKcz3UiNeEjss20ShbniaWoqOFMcg=;
        b=QXXfx9t6JVKnrSsR057a2RhMEbziWpTrYiPD8yKjuJWHndlYBqPmod59JbDwfp0B1X
         Vh1LjytRlapuSN4qfx0TDahqi53Re5WlzKh6r7WJS5ieTZ82RVOcNwOKSTem00alsQPz
         dkT4SKWtNwEunIGkc8zCRtTI7qVsEfTyb4ACX+b+1twXLSx/4JaEc9ohGwVuvcRd4gY/
         ZhiFk/1WMn9vzKDcvpKaVs7pIJ9GI6l9x3o/+1hRZ3mhuKabyZdhPz7gL0CC9j5amMdw
         Ghal/UhNCoUW+jjtR9tacHcc8yxruJxFTiuuWmOi9Jis9aES3e48z1vLZiaMwanYjqp5
         kvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613052; x=1789217852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iiwxf8iLXv/0xdcKcz3UiNeEjss20ShbniaWoqOFMcg=;
        b=iUHPI/ZdEskJchySco7YBcvjxEwDsW2YOmw6UrtvvTpKLheEHXf/uDc40bG7oE4JSg
         +AnDnnQohIY8xord/zElKfrRLrX7P6LCVsK2FCpixMGk4uTT/NWMOFEfLC6ULJADdMn0
         d/dzaeILsv4ZPcqmo3kbqNymHXhT3TimIU+EdZrX/4K2aC+SNNuBIG/BUerkbz0auFKl
         MDedC6UJ9B0wb2oUBX+EvCtNlzfrK7ykn9TCnfTubI9NEAijy/oA/InYo9TH8u+3sTRp
         PMyiJKLHJSvvI7+c4UR7uypgd/jWiH4/sQJy1dHhzD0vBzdIq7HyP1OD8O57ju8RcXyq
         cUYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpd478WjhDnGy3JSudQ/LgxWJ+7AA5eVI0DfFQC1ofsOlUuqzN00A1ud/8KSQSThAOW48UUzmk4Zh8NQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mAJUJIDSIgONhTl81StNFpCb40CcEJRRDS6QaIq4haIkJADOGr
	NX2/a79qrHS83pWQUQwZXN30Gw7EyzwHKTkzHOqqZTs3Et01nq2yV4y6
X-Gm-Gg: AYBFou2OYqjni3YZCY3682mVksaCjRl8S+RMMAKVXUi+nIkQXA8K+xHc+/hKHlVHcXC
	Vm1tBRi7KTojbDHgRZsFRz+AKdawK82yWWZRM7Rhu2f1pymT+cv7qTPpCXVGBxwJ/H4lVY9wWvB
	LdErhqG9m9Bs+ogXCQhbIbmT1dGhFsi7XgXSm5nH8ni9IxXitYYd320AaaqTSQHw6akWZv66z+4
	CWYGx2abO1YnrO0L8guM5ywP8leU2gsM0Hnr2CuSnCYeK43krieneSXtHLo7rMDcnI31KsOkuyK
	hnixediEDzfK3xnkwICB/kbO47aSPHTbBimEtvQXQ46l3N5r7d507BWcZehypPKCoyt9FBVwFdx
	qMzc80/3LJYfwvAkHLRsli2J0mz/tg4Dyl2PyPkFtAtsxkpSecS9qDOgDAMKIiGaFaGSDbyuw8G
	w7SWuHJVWjfHuA5+I9Rv/LyTtddQC+thOpnQ1yp3VudsuwN1BbUjQ/sDfNYAQgzDqufsIRqYhU/
	oXjlsJRSU1JFnJEQKbbNmddrUlPvV5Kb5BcP4mAP9w=
X-Received: by 2002:a05:6122:1d47:b0:5c4:1f03:a1fe with SMTP id 71dfb90a1353d-5c7ed298c90mr4817731e0c.1.1788613047695;
        Sat, 05 Sep 2026 05:57:27 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:27 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v8 3/3] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:57:06 -0300
Message-ID: <20260905125706.6550-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up unused function parameters.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 40 --------------------------------
 2 files changed, 51 deletions(-)

diff --git a/drivers/media/dvb-core/Kconfig b/drivers/media/dvb-core/Kconfig
index 8b3f2d53c..c6a97add8 100644
--- a/drivers/media/dvb-core/Kconfig
+++ b/drivers/media/dvb-core/Kconfig
@@ -67,14 +67,3 @@ config DVB_DEMUX_SECTION_LOSS_LOG
 
 	  If you are unsure about this, say N here.
 
-config DVB_ULE_DEBUG
-	bool "Enable DVB net ULE packet debug messages"
-	depends on DVB_CORE
-	help
-	  Enable extra log messages meant to detect problems while
-	  handling DVB network ULE packet loss inside the Kernel.
-
-	  Should not be enabled on normal cases, as logs can
-	  be very verbose.
-
-	  If you are unsure about this, say N here.
diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..ae0073b94 100644
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
-	print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 16, 1, buf, len, true);
-}
-#endif
 
 struct dvb_net_priv {
 	int in_use;
@@ -320,16 +307,6 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
-	if (ule_where >= &ule_hist[100*TS_SZ])
-		ule_where = ule_hist;
-	memcpy(ule_where, h->ts, TS_SZ);
-	if (ule_dump) {
-		hexdump(ule_where, TS_SZ);
-		ule_dump = 0;
-	}
-	ule_where += TS_SZ;
-#endif
 
 	/*
 	 * Check TS h->error conditions: sync_byte, transport_error_indicator,
@@ -659,23 +636,6 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
-		hexdump(iov[0].iov_base, iov[0].iov_len);
-		hexdump(iov[1].iov_base, iov[1].iov_len);
-		hexdump(iov[2].iov_base, iov[2].iov_len);
-
-		if (ule_where == ule_hist) {
-			hexdump(&ule_hist[98*TS_SZ], TS_SZ);
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-		} else if (ule_where == &ule_hist[TS_SZ]) {
-			hexdump(&ule_hist[99*TS_SZ], TS_SZ);
-			hexdump(ule_hist, TS_SZ);
-		} else {
-			hexdump(ule_where - TS_SZ - TS_SZ, TS_SZ);
-			hexdump(ule_where - TS_SZ, TS_SZ);
-		}
-		ule_dump = 1;
-	#endif
 
 		h->dev->stats.rx_errors++;
 		h->dev->stats.rx_crc_errors++;
-- 
2.43.0

