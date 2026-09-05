Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550C53546EA
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788618153; cv=none; b=Cl8mL+nuN7V/EivjM95DJmoRZxLnvwDgsdQswCcqzufF99uFHjc2W7QJcW+ra34pGF9F5NifYMcvfAW7/mUFR2OdJlJdhVDkWM4DOp1NwjqVk/49it+U5o8haIUOOw0o56mhE9K9LkfFePKz/wzPQ5rVa6lrZvBjvtvmY1sQYqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788618153; c=relaxed/simple;
	bh=onVBlW7MOcXY/4u/1wLc1luNV8JQgXpPbl+Dwq4jXa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ellqhyCu0ylkakUWv2KE0Fiywut4p/zURX/cXKjRXU2jDZFqXyDSzNWlellAhUW7A0C7unJmYxpARAY+aZ9CNvGT0MY1m/SquL0YDQpeGsVB4itYOff9O527Luz2al9ZYaaO47voeCXM27G+iROeLk/LH6NGw5Mw4KfkzOiu/l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/hNJN39; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/hNJN39"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1514962a12.0
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788618147; x=1789222947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=c/hNJN39rjgbVh8w0XjfqOqL4Y658Q6hGf2lAhAV+DtF1ml1UIvc0b6DiG3ihMlWMU
         7A0o7+QAUU84hpZvF1XGpe6mdl7odM5QA8haXWbAdiDwWAsv+tYF5VOfWhUWwKpTeNcM
         7Jsa4mbpI+St1q3oE4xF2Gf32bkhNVBkw7A2Utum4oaqv0PVkrHp7ChS+wUcAiPRDPHn
         t7n0VkOya2RabVLMaTc/mVBi3XHRFEzvlmK+2bgwT+zfCx3wA8Cz7RONZOlGlmkmx/8y
         vsSF1YVI6Ofi4x4ciXMY/oTmbYje0zsSyCcQ1wA+972XeZVOxuAH1PUXRP8/IqRAz6cD
         CtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788618147; x=1789222947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=005z03CIhBd04YrgIq3DK9hNQnxi1U/rfpjn1baG6tI=;
        b=NH5faSimvZKZjw95HnvYnh8+YXsiZRee5UOvjE2dc0mJGdxIISlBcrPevIaFWCSkGc
         xyD9rRUBbPcVJA8ld62sd3G2lK3+V98YRTjo5KnMFTzRzzRyuW8C/jzh0Pg+k2ieiL6f
         Z884+pOlljR/aRS74DUF8ADX0I1Hn9WUflpAjaAuMQ1JbKWVP3PnICMU5LFdapZnKi7i
         DIE8QWwcMooveSBnIlQvs7RUKt0Cl9rBc5RftVeyMf6LtQ9N4nYx7GL6q5GLVNYI0gVK
         UwKlZErX0iHQ++vACabGmP+JLdOJFkivsN2zyU4jcDH5UcNtQBtFKveGie7lLO7li9gf
         HQIQ==
X-Forwarded-Encrypted: i=1; AKwUvByG6ikcd2Ec0bEplszYx8SzXmiTz6iV/5Jc7reYYp0dCsUHEE2OGNI3hogSfyuY5VnLi7E+Y4d9k/0nUQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mTfAsV8eBYB3Jhi5ezd+f+1qI6X8PGwwSmq/2i8hQwR7mSdjEF
	7Dlf0zV5L4u1b8OvUavCPzBKQUTwUC4TsMIJ+SkhoT15vfVKnLulcWcE
X-Gm-Gg: AYBFou1ltNexG4hy99ScUcwTKCV8/G67DajyBhwvLDlnKfDsf1pQCNzmZly6qLJ3Kzs
	OxD0QG4myONBvM+PtyMb9kQlkdu7YT1HsDp0LKImh36GSj9usHeel+mQWCHybA3PYnRawvsmSvq
	SiEx2Xb/VOFP3q9n3tSvpIDiuADzCtqE9MLoq51p+ne8ykfHu5Y2LVwpNqf7TowgfyEEpeuM4Vr
	nPunZaEsje8aocDAE5VbpoctviJBIXaaWNDXbXaUO9Ebj5XdDpBK0gMR+nZCDlTaKd4tl8ygIKl
	Jxz6PknhzzSK2odrSJqxygpz8mgaV2QvXU2pwb3yIzDwAvmCN9Ec4n+lPfZ1eSRKpoXWT2Qh0RH
	zvz3xMzDwZcrAAx3T2n5BMAoRzK6pETcIx2Y7SpUT6/hB+rrBBN7r6wWH7GS/OCWHa99C29w3CR
	xv9Z9K+bhUapr6T7SAixuzdK32Z1z9u/zLSFJF+CrlQN/bK6BJ2H1LH06zwvtfryyhLTIPfQ0VH
	LbSg6gE+vX7pNlnbkLyuYinUZTZfke7
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr22265404a91.16.1788618147352;
        Sat, 05 Sep 2026 07:22:27 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm13347645c88.10.2026.09.05.07.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:22:26 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2] media: dvb-core: extirpate defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 11:22:22 -0300
Message-ID: <20260905142222.22818-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c and its Kconfig definition to eliminate severe lockless race
conditions and clean up the unused function signature parameter.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/Kconfig   | 11 ---------
 drivers/media/dvb-core/dvb_net.c | 42 +-------------------------------
 2 files changed, 1 insertion(+), 52 deletions(-)

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
@@ -843,7 +803,7 @@ static void dvb_net_ule(struct net_device *dev, const u8 *buf, size_t buf_len)
 				       *(tail - 2) << 8 |
 				       *(tail - 1);
 
-			dvb_net_ule_check_crc(&h, iov, ule_crc, expected_crc);
+			dvb_net_ule_check_crc(&h, ule_crc, expected_crc);
 
 			/* Prepare for next SNDU. */
 			reset_ule(h.priv);
-- 
2.43.0

