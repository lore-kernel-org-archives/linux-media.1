Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06483EAC80
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 03:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701234; cv=none; b=GycdFSzuaXiIL9nrIl6XMlTTgLRgAzWlzu3WubYHfIxyoPhc1tlHvEyoQ/6alw/qMZp20PxlnJfGg5y1OW8ViWWlXysatk8G03/wQ5nDiePyM72Oa4Ft2H8HkqP0fu6chsVDFX/fdy8Xr88hijXjI2fz8Maw8eICs1HqV0wmnwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701234; c=relaxed/simple;
	bh=Igrepa3WvnJSDmQC/5fjbl/UtaJmGwmrx2Bv1bHpAFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkOZU5fMsoknQC9iZ0lOo+XN3/qgwwdc9PMQgxzGrIBACAxJ8VDaMChzCMmYRjqFnDNOYWMGO+yXmdESsJIapEupRthfIbI9NzJLK1f10cjXdGP86PE/VSuuSiOdGqSflkZn2VoDDILbClZviaLzU7W544+xvDCLdClr7U+8M9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc+ueTLO; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc+ueTLO"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f9dddd99so1380355ad.0
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 20:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789701226; x=1790306026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kju0TCvvdsRpQXR1OVLSTWdJAe1ni45S1NkZW4DOAK8=;
        b=Cc+ueTLOGQO4r/7xJwoEjQIKGxu2Nq8KS3N/3N1PDwlJfD/xbo5wwQodZhLWZQIzlR
         t3AsyzrtD0StpWzia80zS7fTubXfzXAs+WemZ0jcBeWcIMeunCOZUJPNgoZoF9CEAZgf
         YvMvzXmBKGdsEICw62PgcRcVrnN8puoasx0/m9Xj8riEPJJKhfEgBZYvlP3jQ+gIOlr3
         V5bGKI3468+03qbY1e5QYmThL/RJLK16DZNcH9rVR7J50QqHlH188vyEojiLxp8DhRK+
         gxKR9+Hw8u0xTW4Bz8BWHyDBSJNEnhJJ+bzuueoNq132liZUfYDew4+lDJ4YS6dhhQIb
         +zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701226; x=1790306026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kju0TCvvdsRpQXR1OVLSTWdJAe1ni45S1NkZW4DOAK8=;
        b=JlbNE3D4tIeqUvGsAQgzh63oIYVTOlOSqnrVHnC05QT1UINf7a/2xE2RHfPUkFKy+o
         /hjzkPIcvaldMZTDtyDxuoz0ZYNzY5YpLA3OmmDM3MJ0QF/p+g34WCl299OrYrTvkkq4
         RGYeru8AiNlqhst1WpMygTcN7cok5buV1pQW6vcrIsYdbCxyTK8kNYdWRMTQ6JhAbqv1
         NXT4FBQu5ex5VhkbOGdSqoCzGlKw2ySVDZ7FjrZDLrmzK011Td58Uab8d3ywxs/FzLjQ
         Z5qWwN8x4k47oDgLMX8wvruL/vFTqlPBKRx7gIfaXNvGBHgVHF2+5EzfiraClg4czt/O
         x36w==
X-Gm-Message-State: AFuF++mF84+dwOXlDS+YcXcIk89s+GQFsMBXU3sUdzKDl483tNaLEvkk
	GJ+eFxAJ9FtbezXLrS2ea3ejeaM3YgQitajTpK321PBLTxtZlq1H5azHdJaNXC0kFJg=
X-Gm-Gg: AYBFou0J7I1AvYJSpMxeenqCaytFNa5zBwKU/w31yrmJYK+1gu3pqDhW91NuL58dYJ+
	onZ5LG1ovGMkPpzwk4O+4c4I3iTKjtlqaocDHcpInQPAJl3EXd4+OMoQhB5MXi5u+K22ZpBhBEU
	D1JU5Ur0NU8g6AwJeCo53w4DkmktVjBJCLxpVVV9Orf1oFwf58S/ENywT64BdWTEtWyZWXbZssm
	xGdOtOCQex/efZ7wa4eDOYtRdo6iQP5w5nUQC67OqcD9IDOSBC3+w7A3g+IS+OlatjQZpMPQE79
	hdUeram1dpfP2GqzlitrqiyjWJ3Ft4G4TJWqjK2ZdAYXUcb79S0E49q1HvWAKBf3xW4K41cT2FE
	wsYgkc9lVu10htklVU0mWpj+Sh60EoK+rMhvIgL7SaWkjzRKYf93BcXpLS4DlQYKj6+9SuDIJsJ
	EGzNhY6szzEKaO1J8z1TJsjj76yevBAl1KEkG1XXGBCoXC9OeEvlQqomBbeWF8wKi5JGJB3Y+z+
	ItcCvoHuOxzb6tYxjk1w51TyN76ebJ0DZguC9EncAA1y0m+7U5Pk3BhBxKWdFh/40psfI8EjAye
	rjz/YG/VuWXQBGael7pnBu7C5FxRfvz7vWLcG7ES16bLLbIQ815/vArXGZcxaH0AgzFwRpajxgg
	f
X-Received: by 2002:a17:903:2443:b0:2dd:792b:302 with SMTP id d9443c01a7336-2ddb1af0da2mr19170635ad.11.1789701225518;
        Thu, 17 Sep 2026 20:13:45 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286dc939sm432672eec.6.2026.09.17.20.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:45 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-media@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: davinci: remove unused <media/davinci/vpfe_types.h> header
Date: Thu, 17 Sep 2026 20:13:34 -0700
Message-ID: <20260918031337.436820-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last use of <media/davinci/vpfe_types.h> was removed in
commit 582603a95734 ("staging: media: remove davinci vpfe_capture driver")
header") but it was left behind. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 include/media/davinci/vpfe_types.h | 38 ------------------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 include/media/davinci/vpfe_types.h

diff --git a/include/media/davinci/vpfe_types.h b/include/media/davinci/vpfe_types.h
deleted file mode 100644
index e65c9a48d002..000000000000
--- a/include/media/davinci/vpfe_types.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2008-2009 Texas Instruments Inc
- */
-#ifndef _VPFE_TYPES_H
-#define _VPFE_TYPES_H
-
-#ifdef __KERNEL__
-
-enum vpfe_pin_pol {
-	VPFE_PINPOL_POSITIVE,
-	VPFE_PINPOL_NEGATIVE
-};
-
-enum vpfe_hw_if_type {
-	/* BT656 - 8 bit */
-	VPFE_BT656,
-	/* BT1120 - 16 bit */
-	VPFE_BT1120,
-	/* Raw Bayer */
-	VPFE_RAW_BAYER,
-	/* YCbCr - 8 bit with external sync */
-	VPFE_YCBCR_SYNC_8,
-	/* YCbCr - 16 bit with external sync */
-	VPFE_YCBCR_SYNC_16,
-	/* BT656 - 10 bit */
-	VPFE_BT656_10BIT
-};
-
-/* interface description */
-struct vpfe_hw_if_param {
-	enum vpfe_hw_if_type if_type;
-	enum vpfe_pin_pol hdpol;
-	enum vpfe_pin_pol vdpol;
-};
-
-#endif
-#endif
-- 
2.43.0

