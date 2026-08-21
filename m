Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215E03BB124
	for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787347735; cv=none; b=EVDt4jZ3I7HMtzHDuRfPt7GzX5xpCCJA9B5JyKRyNGg41mWpdIeasVpkZFCwwij3iSuJ1OuYIwFkGbRCprsK4jKvwWbJqwDQIrBh0LiGs57emVmhvfiL+4y7QEFVroqaHM5Nbm/Hz1RMVXWHNoABTj9+RPQ183RBKXwwsISddC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787347735; c=relaxed/simple;
	bh=iW5v4cPa+jY4BUhIVqaq+GenRgtpAr+S8n1Qt7BhIyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuwjAqU7i27MdIymAkGoN5SEzP6W1kA2pf+FtZ9BEvpOODrd4Eckhh1fx+4nbFCs770ie5rjrIWla5VWcyDJEki0WZFou0fz0959cemtAOagLvJ+OSCvxoY76hdw9sxvufkQZsPYGFlamjTk09PffLbvVvLb4FjrPvWORWS0zF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8fwmwSs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8fwmwSs"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b57cf2f3so8953445e9.0
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2026 14:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787347732; x=1787952532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=j8fwmwSspKKgt+d3r4IEs8E/CFFqDFvzQR1bnvW3n1rsYqkDF1SlBtGWPcsJhS3wBu
         P0AniAV+9t4I0O0PO14t9uLx7Gd6LNhG4le3rFJwiExaAuOEKitnw1PYrt/yOTXB4mRP
         I+oD8Q0TEutYKU3Ehsvraie8YUbkDfhO8oCdKSWgmZR0hcKHkYoloNvUtvVhBwd7YkG0
         dJJnie2J+qwrgo3mwK9OA76ISRQa/BKX0O69RwWEnLo39zfJAK1HS2PJQdAI5iejO6Lm
         aXBQ6AVrlTqyck/vUgFC2SAPKNz4Q7TzWFL6YK4gHP3brJuoaUZhuMv1FcidoE+Ji9Ss
         tA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347732; x=1787952532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUXEtXgpHp+az+q2AbTUR3kHFspQTU4Js/4VE5CWhoE=;
        b=MZ51QLmeUrCUikG6Wo/TVayrwDoZUIicbYuQ/GhN0I7MQkxr6tggFN+xLNhKoizgCr
         Jix5WwDnZPERgi6y/MaKGUzMaHZdW6mhSpKhhyCuW9GOYIOnytLLnJawBo9E8FY27dfZ
         gWHEFla4XWq+upDoskB/6xGi5el/LWphFQkSlqj5ChrJC6y1EJXvbeyW0ZLOQGKP91tV
         J/2YExut0ET+0h32wsr1EiHBc0BSoz3V3n1drfs5ySYXtyDeSqTrvYm6+XpNpSRCAab9
         o+jxFplCR3RBS97x7Ojf4PrpSLOb3xeOpfNqsFEXxuT419SHxiDjb55QyPGpJTdn7Jxm
         ydKA==
X-Forwarded-Encrypted: i=1; AHgh+RoJUtib04/sXGgoreLHNn5/HxRV3CXNKz9tdjo0jpEW4BelI9zivmNGs+ljdtt29rTJNnhSs2Wh5Qo8VQ==@vger.kernel.org
X-Gm-Message-State: AFuF++npW5PbOPV3nUXHlt3c0b4K25xkRMMML1xQIG9T0xyhbQCFT1mF
	NLfQZIuGFIsVJ/K0NiFPbQBCJIDOJyU2xu/gv7NRgh9r75lRgl+cKgSn
X-Gm-Gg: AR+sD13kLZV00qL0iriiiKXIl/Ok9/TwUosXo08XHnrXy6rUn9LBUJeg370rHWBcVSM
	6Sm/EtPA62hB6u9eJ7i3ZGjJGlyIx7ifngYlsB9o6tIXk6E7yEPL+MrFoohyf6tb4FhRZdsAwZW
	HF6V9IXwDW8Kn41cYZ8lU9EZP02G08bn26LVdCTsAj10FZzYWCVogTP+hUV6kyBuB+Rd+tkq74C
	xVIluwO8dZsNoNO1nLBa5RqluN5Efn4vn30X8OQ4TCMMFy6r88UhGQi9IDp2qmFbO4pG66LD8sQ
	jvOYk381yKypjg9K2/r/H+0PLHRzNIJ24V6Froivl/dGa0zDU8yYd1mtSeWMXrwbic6H3Mk1Pil
	nZBDY8Yn/HKyliu6vo3y7VgjjjEG0iiQgmEmT0//ICYWgvuXBefJ2qMMbZ+3rn7f08520BWwEwz
	w57Es+nNsJn3cRShQkwliBOFmO0dAjG2I0hdeNi/m0ecfsrkKe0wnWFG5pM+kRCGkGJ7HkKCdFX
	iEYeVJt+FeW7Nf1L3pl5XbG8X5BpVNJmaQrij4XIC1PcGZYdfvXLxu1Zas=
X-Received: by 2002:a05:600c:78f:b0:493:e543:1dd9 with SMTP id 5b1f17b1804b1-499b071ce49mr167339025e9.9.1787347732215;
        Fri, 21 Aug 2026 14:28:52 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b78ebfsm147415f8f.12.2026.08.21.14.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:28:50 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: amlogic-c3: Fix out-of-bounds read of metering zone coordinates
Date: Fri, 21 Aug 2026 22:28:48 +0100
Message-ID: <20260821212848.214982-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AWB, AE and AF coordinate loops bound themselves by
max(horiz_zones_num, vert_zones_num) + 1. Both counts are u8 values
taken verbatim from userspace, so the bound reaches 256 while the
coordinate arrays hold 18 entries (AE, AF) or 33 (AWB). An AF block
placed last in a full payload reads 474 bytes past the parameters
buffer.

Clamp the point count to the array size, as the zone weight loops
already do.

Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index ae0777a20bda..f2396e2c6640 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -139,7 +139,8 @@ static void c3_isp_params_awb_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AWB_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AWB_IDX_ADDR, 0);
@@ -258,7 +259,8 @@ static void c3_isp_params_ae_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AE_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AE_IDX_ADDR, 0);
@@ -316,7 +318,8 @@ static void c3_isp_params_af_cood(struct c3_isp_device *isp,
 	unsigned int max_point_num;
 
 	/* The number of points is one more than the number of edges */
-	max_point_num = max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1;
+	max_point_num = min(max(cfg->horiz_zones_num, cfg->vert_zones_num) + 1,
+			    C3_ISP_AF_MAX_PT_NUM);
 
 	/* Set the index address to 0 position */
 	c3_isp_write(isp, ISP_AF_IDX_ADDR, 0);
-- 
2.55.0

