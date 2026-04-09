Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297382FF66B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 21:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770942; cv=none; b=p4TQ1P3poGYx9zO1t6TErpNJbCpwSL0CNRO/1ojThIYaF6BDesG4s4qnMhU7l3nMuV9q8DgrU0Dk6i7WONgVdr5KWucvYG1ZvCZfdmrclLEGVszdvRDcFQNBwc8wadTrKm0XMGYgAcR5pCBsX/p8rxup89IZpNsuQDwatMGrh7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770942; c=relaxed/simple;
	bh=b07lhGhDVK50WNDJbuRFqLpuGn6W7XK//YTTs0ila64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOX8JYkGRiDoAEyBtptWbi2dnQtgBnZJf+ZLqUdERKwoBd3SEob3cjxs/8V7Bln2whxWuP0TdlLeLd+yWckMGbInxtRvSd4NQ0WwivJyq3v198X0t781bSfSQuz9kP27nK/oHM6gjem22/zZnKXgc+Nj9XYxd//QcHIfDYX7aYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ok1P8Oic; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ok1P8Oic"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so19802685e9.2
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775770939; x=1776375739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swSed9MUGsB0gPy7tBfpl1IlkUtjnf0/4lv9+O0gYWg=;
        b=Ok1P8Oic3N8EHWj1yv+w9damO+CxMAWLGG8kejM6UcHWQG3RJqCzXTolof+8fNpZT0
         cq6YFMp0ODlQEG/d+Epoq8QEZ83eIhZ3jmi9Yk3B48odV65eDOsrbNW2fOFbuKYoqPZN
         tk3BzlUfcDsVFlZSkTq+6oJxldnqC6NO0ugZxI2gEqTPUrcPMcwzv5oK7NCtI/GrG7Rs
         VEYVGBS6kj6Cku6Dm0c7n8xyRrbd9EmG9syUwPMreP79a6FU/gg9nY7Rhvg0wM1Uor/h
         IYjaMudhnxrEVZ2Wan0HC3SZ/2IHe89zXoG0zdTaqafez1G9xKEJBSj2zXItDlXXP+Z4
         /FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770939; x=1776375739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swSed9MUGsB0gPy7tBfpl1IlkUtjnf0/4lv9+O0gYWg=;
        b=D0giCYDzSKfLBtFwOLI/JW2xbcCfii/gjYyLkXYjPTPlb9rpNoGZcCZqaKQpGOlVgw
         DtHTHTE5iNin66tJpkJiPZ1n3R3HqZwGSBJ3hAl/OMM47DVW0PeUSLL+DtEf1cN6YKcZ
         8U6XD3bGyu3RQ4CtUpaTBnAOx28FAHNA5gJRT+e2IK210BR8WLOiBEmysCQXT6NPRhp7
         pFdSQQduEBpzysyPvDfqy3kLbZ8osCkuliFm4u+FMe1iw/VJLE9vi5tkoWpWPqZOhwDl
         68jwUM/MKsYMaxQ4Blxd9aEujPd/JNT+klStLsZzF7Yo8/JqHgpTa1ZS8tKYGIcg5WjU
         Lo+w==
X-Forwarded-Encrypted: i=1; AJvYcCXGJk9OFQ/q0s7Ugbgh3R8kKmoTcQjU5Wn1FT/ySXkNEXosLmy2mECx+AHFbW8SWbeIQ/a3RqkG58knrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdQs5i+CgKtf8DF9XaOqxjTv1pGcM3KFbAWMILaK+TcLfepuun
	P5UUKOkoFa05hvxN8k7qKCi6e5Q+P5OzN/jZ18671y2vzQgMKINExUQm
X-Gm-Gg: AeBDieu2hEZUHFY1OV7RJoIh9KBdzc/ReXBIvYJoae3jxIi7glP9nWnbzYo1iXTa534
	ciid5/QkhaJr2djhwzpqahrCkN9Pay8dN3xE31nQsDhlC7+l0xPVdZQUrnBjGeZk6WEVjg9oML6
	03gD8cLP1w5CgK6eSdowCFlwfhV1jeoJgWxqa8QB0qn3aPi5TBIHtv8V+16WSeUuqvQndoVUOAj
	3wy3fL1W/ivTWzZpDPBKz+X4li0x9cZwhp0ArdsXmFpRStVxAIQtYCTpIUE6bbBbT1+Tms8xt2b
	xNiduv/E5aHKdCXVD75xDMJlh7/8nJBtNuttZgg6Ve4VmaPLWooNefTbSZUSRNxRtPLKikAGL0d
	uFcCCP1hopiXJrUK1RZdNlLJSAzmN2+5vDe6YDvSM4JXlpK3HcWT8Q5gtexuCSVN2i9fygtCEkA
	kyNYpc+1ZjMxd7fXM9aEVZ/Gb0CLg=
X-Received: by 2002:a05:6000:2383:b0:43d:855:f161 with SMTP id ffacd0b85a97d-43d6424c218mr928785f8f.11.1775770939347;
        Thu, 09 Apr 2026 14:42:19 -0700 (PDT)
Received: from DESKTOP-D4E07GJ.localdomain ([94.187.23.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm1745525f8f.33.2026.04.09.14.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:42:18 -0700 (PDT)
From: Mohamed El Harake <mohamedharake2006@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mohamad El Harake <mohamedharake2006@gmail.com>
Subject: [PATCH] media: atomisp: avoid ACPI package count underflow in gmin_cfg_get_dsm
Date: Fri, 10 Apr 2026 00:41:58 +0300
Message-ID: <20260409214158.3248-1-mohamedharake2006@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohamad El Harake <mohamedharake2006@gmail.com>

gmin_cfg_get_dsm() iterates over ACPI _DSM package elements as
key/value pairs using obj->package.count - 1 as the loop bound.

If package.count is 0, the subtraction underflows and may lead
to out-of-bounds access.

Use i + 1 < obj->package.count instead.

Signed-off-by: Mohamad El Harake <mohamedharake2006@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index ba61cc28fac1..cca91c6d71a5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -113,7 +113,7 @@ static char *gmin_cfg_get_dsm(struct acpi_device *adev, const char *key)
 	if (!obj)
 		return NULL;
 
-	for (i = 0; i < obj->package.count - 1; i += 2) {
+	for (i = 0; i + 1 < obj->package.count; i += 2) {
 		key_el = &obj->package.elements[i + 0];
 		val_el = &obj->package.elements[i + 1];
 
-- 
2.43.0

