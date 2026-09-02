Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE63CAE9B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377806; cv=none; b=n3TCmoFPaxfTeNnLvvGXaFllrpQhYrne2utNBlu6t+D+716q7xD1jz8hQuGhaz2M5/2VZ1WSLV9oEJuKPg/pG1kZPGunVKim1Dm5RbtqKRKA2l3geY9Q+ys+T/bO5M3clWoMcOccVvgKBqLD8LvOplv8NCJyuPfkXcw7K5U1CDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377806; c=relaxed/simple;
	bh=qVsxC2y/0MufYiGl58xwTDK03WikNijESxC/5IZ+KfA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d2i0faaBOV4M7kQmp19DnqA3Lo7oplmGk14ecqXDA9T+zwWSM7r2B1Ashp3oS4Pxo2OkIibLsmn4MSLMXa4o0VzGSq2V7zPMs3MvqVEhDk+0sOjmMea1VZlqCF1GikAn/VyQtLaSHOnpvZsvOB7XhA89/CGqYorCS99rRMdPiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (91.78.9.64) by exch16.corp.auroraos.dev (10.189.209.38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 2 Sep 2026
 22:36:16 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Subject: [PATCH] media: rtl2832_sdr: check all register writes in rtl2832_sdr_set_adc()
Date: Wed, 2 Sep 2026 22:35:41 +0300
Message-ID: <20260902193542.55451-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

In rtl2832_sdr_set_adc(), the register writes done inside the *switch*
statement are not checked for errors, however the assignments to the ret
variable are done anyway. Add the missing checks, using the ?: operator
in order to save on LoC -- the recent gcc/clang even manage to generate
very decent code out of this crap... :-)

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
The patch is against the next branch of the linuxtv.org/media.git repo...

 drivers/media/dvb-frontends/rtl2832_sdr.c | 206 +++++++++++-----------
 1 file changed, 104 insertions(+), 102 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 0330e7f0881a..cefe6890e983 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -606,123 +606,125 @@ static int rtl2832_sdr_set_adc(struct rtl2832_sdr_dev *dev)
 	switch (pdata->tuner) {
 	case RTL2832_SDR_TUNER_E4000:
 		ret = regmap_write(dev->regmap, 0x112, 0x5a);
-		ret = regmap_write(dev->regmap, 0x102, 0x40);
-		ret = regmap_write(dev->regmap, 0x103, 0x5a);
-		ret = regmap_write(dev->regmap, 0x1c7, 0x30);
-		ret = regmap_write(dev->regmap, 0x104, 0xd0);
-		ret = regmap_write(dev->regmap, 0x105, 0xbe);
-		ret = regmap_write(dev->regmap, 0x1c8, 0x18);
-		ret = regmap_write(dev->regmap, 0x106, 0x35);
-		ret = regmap_write(dev->regmap, 0x1c9, 0x21);
-		ret = regmap_write(dev->regmap, 0x1ca, 0x21);
-		ret = regmap_write(dev->regmap, 0x1cb, 0x00);
-		ret = regmap_write(dev->regmap, 0x107, 0x40);
-		ret = regmap_write(dev->regmap, 0x1cd, 0x10);
-		ret = regmap_write(dev->regmap, 0x1ce, 0x10);
-		ret = regmap_write(dev->regmap, 0x108, 0x80);
-		ret = regmap_write(dev->regmap, 0x109, 0x7f);
-		ret = regmap_write(dev->regmap, 0x10a, 0x80);
-		ret = regmap_write(dev->regmap, 0x10b, 0x7f);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x011, 0xd4);
-		ret = regmap_write(dev->regmap, 0x1e5, 0xf0);
-		ret = regmap_write(dev->regmap, 0x1d9, 0x00);
-		ret = regmap_write(dev->regmap, 0x1db, 0x00);
-		ret = regmap_write(dev->regmap, 0x1dd, 0x14);
-		ret = regmap_write(dev->regmap, 0x1de, 0xec);
-		ret = regmap_write(dev->regmap, 0x1d8, 0x0c);
-		ret = regmap_write(dev->regmap, 0x1e6, 0x02);
-		ret = regmap_write(dev->regmap, 0x1d7, 0x09);
-		ret = regmap_write(dev->regmap, 0x00d, 0x83);
-		ret = regmap_write(dev->regmap, 0x010, 0x49);
-		ret = regmap_write(dev->regmap, 0x00d, 0x87);
-		ret = regmap_write(dev->regmap, 0x00d, 0x85);
-		ret = regmap_write(dev->regmap, 0x013, 0x02);
+		ret = ret ?: regmap_write(dev->regmap, 0x102, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x103, 0x5a);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c7, 0x30);
+		ret = ret ?: regmap_write(dev->regmap, 0x104, 0xd0);
+		ret = ret ?: regmap_write(dev->regmap, 0x105, 0xbe);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c8, 0x18);
+		ret = ret ?: regmap_write(dev->regmap, 0x106, 0x35);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c9, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ca, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cb, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x107, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cd, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ce, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x108, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x109, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x10a, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x10b, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x011, 0xd4);
+		ret = ret ?: regmap_write(dev->regmap, 0x1e5, 0xf0);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d9, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x1db, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x1dd, 0x14);
+		ret = ret ?: regmap_write(dev->regmap, 0x1de, 0xec);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d8, 0x0c);
+		ret = ret ?: regmap_write(dev->regmap, 0x1e6, 0x02);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d7, 0x09);
+		ret = ret ?: regmap_write(dev->regmap, 0x00d, 0x83);
+		ret = ret ?: regmap_write(dev->regmap, 0x010, 0x49);
+		ret = ret ?: regmap_write(dev->regmap, 0x00d, 0x87);
+		ret = ret ?: regmap_write(dev->regmap, 0x00d, 0x85);
+		ret = ret ?: regmap_write(dev->regmap, 0x013, 0x02);
 		break;
 	case RTL2832_SDR_TUNER_FC0012:
 	case RTL2832_SDR_TUNER_FC0013:
 		ret = regmap_write(dev->regmap, 0x112, 0x5a);
-		ret = regmap_write(dev->regmap, 0x102, 0x40);
-		ret = regmap_write(dev->regmap, 0x103, 0x5a);
-		ret = regmap_write(dev->regmap, 0x1c7, 0x2c);
-		ret = regmap_write(dev->regmap, 0x104, 0xcc);
-		ret = regmap_write(dev->regmap, 0x105, 0xbe);
-		ret = regmap_write(dev->regmap, 0x1c8, 0x16);
-		ret = regmap_write(dev->regmap, 0x106, 0x35);
-		ret = regmap_write(dev->regmap, 0x1c9, 0x21);
-		ret = regmap_write(dev->regmap, 0x1ca, 0x21);
-		ret = regmap_write(dev->regmap, 0x1cb, 0x00);
-		ret = regmap_write(dev->regmap, 0x107, 0x40);
-		ret = regmap_write(dev->regmap, 0x1cd, 0x10);
-		ret = regmap_write(dev->regmap, 0x1ce, 0x10);
-		ret = regmap_write(dev->regmap, 0x108, 0x80);
-		ret = regmap_write(dev->regmap, 0x109, 0x7f);
-		ret = regmap_write(dev->regmap, 0x10a, 0x80);
-		ret = regmap_write(dev->regmap, 0x10b, 0x7f);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_bulk_write(dev->regmap, 0x011, "\xe9\xbf", 2);
-		ret = regmap_write(dev->regmap, 0x1e5, 0xf0);
-		ret = regmap_write(dev->regmap, 0x1d9, 0x00);
-		ret = regmap_write(dev->regmap, 0x1db, 0x00);
-		ret = regmap_write(dev->regmap, 0x1dd, 0x11);
-		ret = regmap_write(dev->regmap, 0x1de, 0xef);
-		ret = regmap_write(dev->regmap, 0x1d8, 0x0c);
-		ret = regmap_write(dev->regmap, 0x1e6, 0x02);
-		ret = regmap_write(dev->regmap, 0x1d7, 0x09);
+		ret = ret ?: regmap_write(dev->regmap, 0x102, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x103, 0x5a);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c7, 0x2c);
+		ret = ret ?: regmap_write(dev->regmap, 0x104, 0xcc);
+		ret = ret ?: regmap_write(dev->regmap, 0x105, 0xbe);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c8, 0x16);
+		ret = ret ?: regmap_write(dev->regmap, 0x106, 0x35);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c9, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ca, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cb, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x107, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cd, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ce, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x108, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x109, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x10a, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x10b, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_bulk_write(dev->regmap, 0x011, "\xe9\xbf", 2);
+		ret = ret ?: regmap_write(dev->regmap, 0x1e5, 0xf0);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d9, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x1db, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x1dd, 0x11);
+		ret = ret ?: regmap_write(dev->regmap, 0x1de, 0xef);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d8, 0x0c);
+		ret = ret ?: regmap_write(dev->regmap, 0x1e6, 0x02);
+		ret = ret ?: regmap_write(dev->regmap, 0x1d7, 0x09);
 		break;
 	case RTL2832_SDR_TUNER_R820T:
 	case RTL2832_SDR_TUNER_R828D:
 		ret = regmap_write(dev->regmap, 0x112, 0x5a);
-		ret = regmap_write(dev->regmap, 0x102, 0x40);
-		ret = regmap_write(dev->regmap, 0x115, 0x01);
-		ret = regmap_write(dev->regmap, 0x103, 0x80);
-		ret = regmap_write(dev->regmap, 0x1c7, 0x24);
-		ret = regmap_write(dev->regmap, 0x104, 0xcc);
-		ret = regmap_write(dev->regmap, 0x105, 0xbe);
-		ret = regmap_write(dev->regmap, 0x1c8, 0x14);
-		ret = regmap_write(dev->regmap, 0x106, 0x35);
-		ret = regmap_write(dev->regmap, 0x1c9, 0x21);
-		ret = regmap_write(dev->regmap, 0x1ca, 0x21);
-		ret = regmap_write(dev->regmap, 0x1cb, 0x00);
-		ret = regmap_write(dev->regmap, 0x107, 0x40);
-		ret = regmap_write(dev->regmap, 0x1cd, 0x10);
-		ret = regmap_write(dev->regmap, 0x1ce, 0x10);
-		ret = regmap_write(dev->regmap, 0x108, 0x80);
-		ret = regmap_write(dev->regmap, 0x109, 0x7f);
-		ret = regmap_write(dev->regmap, 0x10a, 0x80);
-		ret = regmap_write(dev->regmap, 0x10b, 0x7f);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x011, 0xf4);
+		ret = ret ?: regmap_write(dev->regmap, 0x102, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x115, 0x01);
+		ret = ret ?: regmap_write(dev->regmap, 0x103, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c7, 0x24);
+		ret = ret ?: regmap_write(dev->regmap, 0x104, 0xcc);
+		ret = ret ?: regmap_write(dev->regmap, 0x105, 0xbe);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c8, 0x14);
+		ret = ret ?: regmap_write(dev->regmap, 0x106, 0x35);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c9, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ca, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cb, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x107, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cd, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ce, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x108, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x109, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x10a, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x10b, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x011, 0xf4);
 		break;
 	case RTL2832_SDR_TUNER_FC2580:
 		ret = regmap_write(dev->regmap, 0x112, 0x39);
-		ret = regmap_write(dev->regmap, 0x102, 0x40);
-		ret = regmap_write(dev->regmap, 0x103, 0x5a);
-		ret = regmap_write(dev->regmap, 0x1c7, 0x2c);
-		ret = regmap_write(dev->regmap, 0x104, 0xcc);
-		ret = regmap_write(dev->regmap, 0x105, 0xbe);
-		ret = regmap_write(dev->regmap, 0x1c8, 0x16);
-		ret = regmap_write(dev->regmap, 0x106, 0x35);
-		ret = regmap_write(dev->regmap, 0x1c9, 0x21);
-		ret = regmap_write(dev->regmap, 0x1ca, 0x21);
-		ret = regmap_write(dev->regmap, 0x1cb, 0x00);
-		ret = regmap_write(dev->regmap, 0x107, 0x40);
-		ret = regmap_write(dev->regmap, 0x1cd, 0x10);
-		ret = regmap_write(dev->regmap, 0x1ce, 0x10);
-		ret = regmap_write(dev->regmap, 0x108, 0x80);
-		ret = regmap_write(dev->regmap, 0x109, 0x7f);
-		ret = regmap_write(dev->regmap, 0x10a, 0x9c);
-		ret = regmap_write(dev->regmap, 0x10b, 0x7f);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_write(dev->regmap, 0x00e, 0xfc);
-		ret = regmap_bulk_write(dev->regmap, 0x011, "\xe9\xf4", 2);
+		ret = ret ?: regmap_write(dev->regmap, 0x102, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x103, 0x5a);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c7, 0x2c);
+		ret = ret ?: regmap_write(dev->regmap, 0x104, 0xcc);
+		ret = ret ?: regmap_write(dev->regmap, 0x105, 0xbe);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c8, 0x16);
+		ret = ret ?: regmap_write(dev->regmap, 0x106, 0x35);
+		ret = ret ?: regmap_write(dev->regmap, 0x1c9, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ca, 0x21);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cb, 0x00);
+		ret = ret ?: regmap_write(dev->regmap, 0x107, 0x40);
+		ret = ret ?: regmap_write(dev->regmap, 0x1cd, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x1ce, 0x10);
+		ret = ret ?: regmap_write(dev->regmap, 0x108, 0x80);
+		ret = ret ?: regmap_write(dev->regmap, 0x109, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x10a, 0x9c);
+		ret = ret ?: regmap_write(dev->regmap, 0x10b, 0x7f);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_write(dev->regmap, 0x00e, 0xfc);
+		ret = ret ?: regmap_bulk_write(dev->regmap, 0x011, "\xe9\xf4", 2);
 		break;
 	default:
 		dev_notice(&pdev->dev, "Unsupported tuner\n");
 	}
+	if (ret)
+		goto err;
 
 	/* software reset */
 	ret = regmap_update_bits(dev->regmap, 0x101, 0x04, 0x04);
-- 
2.55.0
