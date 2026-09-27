Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE739B48D
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790497516; cv=none; b=tPBoXidlZ5Gh9qsFhe8qdvhbzSfwRKJElZKO/G1h/SvBOVIcZFo4xR74jWzCeTw5PnA7vlYeIXPknM6bgiockEMZC8DdN0f/n5bcjWWTl+V5hUCqtD+QjCHKBFUPjHgbhN9dTmI04pzU31EFU9Uc9UJ1/6sYdxa7vQbHRVLhp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790497516; c=relaxed/simple;
	bh=NPigKbp8vyN06B+BAq79WqXAMDm+DA/rGk9QHrbVKf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TEnnKZWiuC6XzvSJJ+xco7TdmUFsrWK8L6RR9pura3bE+NZvR4RZDiqdWkMpOUR+Pewq56P2ihGaGNXmi3ND7t6xtF9Rrra3cQgKTxiJkWr5DN/w1s8hSMtsFliNgfGeNwavpuvAweBNFtMJ5BvObfK717uC+3raD7j4Ec9W9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCoFkwAk; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCoFkwAk"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso12141035e9.2
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 01:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790497513; x=1791102313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZmbzIXGiuJ9BYvQKW+nYYthzfQ+z84ggHpWINPX0Wk=;
        b=RCoFkwAk0GUjchQtQr+jGy9vVrRXSwoHdIzsRA5lBYNFf19EK/DwHhGWkZNjyHUdDI
         OrEupq5vxIk7iJ0CYJ4vcot9acakIDdgUtkcWOttxKQ13rwk6s+uiiYUTZlwUCEYvM1U
         2yUyETiOcXLjA5fcD+zed8GJWoyAGrU/zJPJbCb+8GpfEAl/mVvjz5e2trrBLehlEJzR
         CgbAl5mnykO3kRZuxx/rtMSxJAQvzu+igf4Nn4JVlols0TqTFYpTglkj6++yKbeeaRa+
         PCXOrdpwwCRDcdoV/OzgCcGnpmOukYxQfBW4iQwKIQGhJnnxK4fs+NGqTLzvWvF3Y0Yz
         EcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790497513; x=1791102313;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZmbzIXGiuJ9BYvQKW+nYYthzfQ+z84ggHpWINPX0Wk=;
        b=tDYFOLd7UUbhDqaG8Tw14XvrzFOQEVj0/Fbj5tWrBetjzBdj1b8tS6lSV0x+JPGrEl
         Rfe2jjfMIUF7H3BVi5NWbs+Oe23ShPJp7C/WRGCPmJPN5YChJ6NeLffJuOHMlXjHIBJz
         qrHZnwtWRkICdkXs/qzhgSRpEW6gB0QtCho206LkPQ+YZZbIgybiQBpOQeTR7roZUjJz
         /OJOSogvVU/3k9FKZSi4kaPVhGtD0G+bedrGpHS1av8AgGZUX6K+H+JlpkFTnMVE6PnS
         Zk0TaeNlwIJxbA+oZDGFnlkPc+3D6kCxyp9lHvv5AtBEntp9TSiVOiKRz2TaMGfH1jtz
         wM6A==
X-Gm-Message-State: AFuF++lviJV0wFGjd5qODZ/3RVKth2BRmzsybx77SI6EmfrqNNOsP4Ys
	EKFe9OYIwlYjCmjQqi7P1nUqgih/nLVY+kzcfw2Lz/Ce8xmGB4Z2j001H+LbhQibIWlFjQ==
X-Gm-Gg: AYBFou3w2bnyYsZu5P5wLP0MG72c13A9p5U7KiX6ry/OMCizn+Qg9J5nCDDDPqOhb0f
	izflGc72VSjDD4omqZ4wTZ5IMlhRykH4RKGITqA8eL1otwGO3nozR0rjuHQndTYXoWGAhI1QRJX
	xyb1fHvLxFBpqzmFSaMja86j3f9jXqP/ySNHZjaizB6xu7Z5uhsq/3okbh/Adpel48bNOEisbV1
	7LVRvbAtyWqTdpzMZhEmbJ23nKCc9fWm3SUfOewqNAf9JxzJjr8wD0Tc/GxTVpR+8iXP31FKl26
	g3uV+UWIgIpNQhmqzgtY3kaSks+VnaAEi/gR6ahAmNFPwDLfDIHRiT/GUcqwz0BFQkVccfC61d+
	VbS7bfN+9hMSEzWK7MaXR5vWPoJeQP8iDIbJdcc0yI4haHSAtJc4bQYXPE4Yr5f8c/5djg4R1QS
	EPs4IUYerUWPcf9x1jifZTEqekktI5hm47PddKP2IgG9Ag7P39QbJe1FPU11iNpS22+xY2Gr2Nn
	5eMXcxvfGh3Op01MOWoI+13rZigwyOsMwoh0PofTycs7bMdG/rZgHB4lJ45wxTi0EE549guiaYh
	fMHVonHfPBYwkHJ+/xsYadL9N9n2lt5KnFEltRjbnn9PBG0Ba0gFGg16wrUsNj5HqDv81LzT5l3
	BCkr4lFFuxc3Ewg1vj9ndkQ==
X-Received: by 2002:a05:600c:1385:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-49fe66fa07bmr176869815e9.25.1790497513284;
        Sun, 27 Sep 2026 01:25:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-c45a-e144-7750-6d8f.ipv6.o2.cz. [2a00:1028:c000:ddf:c45a:e144:7750:6d8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6dcbsm37161135e9.6.2026.09.27.01.25.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 01:25:11 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: linux-media@vger.kernel.org
Cc: Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH dtv-scan-tables] dvb-c/cz-Vodafone: rename from cz-UPC and add the 786 MHz mux
Date: Sun, 27 Sep 2026 10:25:05 +0200
Message-ID: <20260927082508.14851-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UPC Czech Republic was bought by Vodafone [1], so adjust file name and
as well URL for frequency list [2], which is valid since 8 September
2026. Add the new mux at 786 MHz with QAM 256.

[1] https://www.vodafone.cz/en/about-vodafone/privacy-protection/acquisition-of-upc/
[2] https://static.vodafone.cz/cp/docs/tv/frekvencni_prehled_digitalni_kabelove_televize.pdf

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 dvb-c/{cz-UPC => cz-Vodafone} | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)
 rename dvb-c/{cz-UPC => cz-Vodafone} (92%)

diff --git a/dvb-c/cz-UPC b/dvb-c/cz-Vodafone
similarity index 92%
rename from dvb-c/cz-UPC
rename to dvb-c/cz-Vodafone
index e94d0c20..b82055cf 100644
--- a/dvb-c/cz-UPC
+++ b/dvb-c/cz-Vodafone
@@ -1,6 +1,6 @@
-# UPC Česká republika | https://www.upc.cz/
-# Created from https://www.upc.cz/pdf/Frekvencni_prehled_digitalni_kabelove_televizee.pdf
-# Last updated: 5/10/2018
+# Vodafone Česká republika (formerly UPC) | https://www.vodafone.cz/
+# Created from https://static.vodafone.cz/cp/docs/tv/frekvencni_prehled_digitalni_kabelove_televize.pdf
+# Last updated: 27/9/2026
 
 [CHANNEL]
 	DELIVERY_SYSTEM = DVBC/ANNEX_A
@@ -249,3 +249,11 @@
 	INNER_FEC = 3/5
 	MODULATION = QAM/64
 	INVERSION = AUTO
+
+[CHANNEL]
+	DELIVERY_SYSTEM = DVBC/ANNEX_A
+	FREQUENCY = 786000000
+	SYMBOL_RATE = 6900000
+	INNER_FEC = 3/5
+	MODULATION = QAM/256
+	INVERSION = AUTO
-- 
2.54.0 (Apple Git-157)

