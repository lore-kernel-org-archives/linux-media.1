Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26AF3803CC
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439919; cv=none; b=fz8Fck07R9437lat67DKEoYCTBsVFwKOdkn00nKDctMl/gmhOa8k+DyQSpcL4Az0hdRaMKoS0U5MDqBJAURYE4Gwcs79F+QEtp+PDujBC3AwPx336rr2n2O0klwYfWkcHKV2e1viy4FCr7CaGM6G9pJtk0M8/mXBYqHnyJtxjWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439919; c=relaxed/simple;
	bh=qyVsTrI0lYDk/H9djXYnt6XVAaCOyj13Bdyjnjxd95g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B1/T3H4mj0Xuid5kenHQNHJsgdTmtIW5jRtfcutzvfF81EYsSkLMlCiA3ZLV1VohE2jq+ppPOSPaxgR/tSCl9fqKvx01J2kN57kFukc0Wls39fMonsHWXqgvU6eNOlpT0MID0xA71JrTyYg2pCcWzYTWOJ8AnDK7D2QX8IOzyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3IeyBkD; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3IeyBkD"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so22614586d6.1
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 09:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439911; x=1791044711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sr/EPY03GpOHmQzo/zUfA0mc4dSwT2ZOrZjnEj21b/o=;
        b=b3IeyBkDeAqGYDDbPeKhDmyepPE9R6BThat0ztsOFTjDvcCiHP0AILE1zO17TavJIb
         6gC9ZhURHXlUwvstDkC8jVDHdgRNB5IUW/KS7WO40yBIy9yvxeyLX697ULGlQL+xtP3/
         ngZp6HYVt5Tt0WB21hLEqNEYfEW5QmTCdhfVweJjBNrBFRXWkFRmHhdtjGeKuSZUN5MW
         fWnwCtELcMg8X4lcTrQku6tPebesNSsswok7xe3+SM+EsFwc+INgfY3r8QroZoJeEDFU
         DtgoJg8+tYg0VE4zk3vfVFGAytdHuVP9VaLwrgC4Wm4SQt4h45OWbplzIG5wziyY55Wa
         vEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439911; x=1791044711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sr/EPY03GpOHmQzo/zUfA0mc4dSwT2ZOrZjnEj21b/o=;
        b=GOI8UYJ7Sqn3vSPa1iOX6TZou2MMYmtlyADGAUmg7f4FNI8x2e7KzWaSG5Ck+S48Qq
         vvJgrg1qmWmWnwbGJZil4nhfRbLPHufG/u6GaJURmqBhNrwTocRcYOnNwHkqZ9merTl+
         bnPuUfhDXI9OvR86Cf+0YvWcdQHa/Ia2prPTV7dge1Vaq7/QJUsxRDYnA7JBsg1i8H2L
         Pkzn+RA8H8uchql8x4z1pSH5utVSnVzE9WYlNo9hb7MSp9p6WzVqa0CDGDmySMuJ6Z+J
         whg7enyaxbKKH3C5wjMuI0Q0FnK41i3b1C4ukxRIJ4HfVbVEf4JYyoMmR9D/mN0Y6Hkn
         hiKQ==
X-Gm-Message-State: AFq9FYLnOtTgOzvIKx9qQeaFDV40RWTl66P/GnNHW/55tdxdoygeZ29R
	jPo4RP7e5anUf/Btf5auT6MvGL+JOZWnIwLMXBGnySi/aimte56FeiYk
X-Gm-Gg: AYBFou0y1eTNWwmOu27Eb860UKxboaAs7kFo67UZZPBgdP5SKPCXQvyQZJJWaM3r2Zx
	Pp8n/gXooTyxjDIFJxBnhd8A+33CKFuH+GrEn8G3/sfpsDanWssTkOs+nsXoRZL7uj+dK8SvZfL
	Z6MLOaT2lr/L6ZAQa4vetmXMlZviyU+b1O7qncl4FfbasKAQcPAkW0lFYEkLClnyWFTbE7HHXX8
	VZYA2eZEg6Dw8nrTQXKElWOXnTsKnRSeoQQQc0AXzYHYZw51VPKviWSM+P6Hr2NVOiscfChiLh2
	HgjtZRZeSWII6ffDU54pTb7tko6MyJOMRfV+KT1M+NHMTf1myBms4OnmoZxm6pIIhxYpXy8URXI
	8KOpuQ7Y473lYr/fH6PRkxTyiFpGN/XZkZFEHYo/CukPLyRy0xWyEBwRNb0F96b4skN+IIkCtz0
	+qGDTgXUzZW6F1i0UjMNrmqrXAFc2224N2UceWC8A7mFMRv0uL8tjgNneWpoNLZZQ5HcNjjUD3c
	Or10EnTOwc//o5Vfa6u+dunGapRo6+NjF61PeQMWPtGd+E/
X-Received: by 2002:ad4:5dec:0:b0:912:6380:fe12 with SMTP id 6a1803df08f44-914321eca0emr97986826d6.8.1790439911488;
        Sat, 26 Sep 2026 09:25:11 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430dabed8sm43015606d6.12.2026.09.26.09.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:11 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: technisat-usb2: remove unused EEPROM dump debug helper
Date: Sat, 26 Sep 2026 12:25:07 -0400
Message-ID: <20260926162507.25238-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

technisat_usb2_eeprom_dump() is compiled out with #if 0 and has no
callers. Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/usb/dvb-usb/technisat-usb2.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/technisat-usb2.c b/drivers/media/usb/dvb-usb/technisat-usb2.c
index 1e43aab2bc27..16bf3c99ddfc 100644
--- a/drivers/media/usb/dvb-usb/technisat-usb2.c
+++ b/drivers/media/usb/dvb-usb/technisat-usb2.c
@@ -384,27 +384,6 @@ static int technisat_usb2_power_ctrl(struct dvb_usb_device *d, int level)
 }
 
 /* mac address reading - from the eeprom */
-#if 0
-static void technisat_usb2_eeprom_dump(struct dvb_usb_device *d)
-{
-	u8 reg;
-	u8 b[16];
-	int i, j;
-
-	/* full EEPROM dump */
-	for (j = 0; j < 256 * 4; j += 16) {
-		reg = j;
-		if (technisat_usb2_i2c_access(d->udev, 0x50 + j / 256, &reg, 1, b, 16) != 0)
-			break;
-
-		deb_eeprom("EEPROM: %01x%02x: ", j / 256, reg);
-		for (i = 0; i < 16; i++)
-			deb_eeprom("%02x ", b[i]);
-		deb_eeprom("\n");
-	}
-}
-#endif
-
 static u8 technisat_usb2_calc_lrc(const u8 *b, u16 length)
 {
 	u8 lrc = 0;
-- 
2.53.0

