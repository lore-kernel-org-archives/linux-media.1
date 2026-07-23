Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9C45D1BF
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820137; cv=none; b=BVVGFdSCuSA9WPyfIE2ha6rvWlUv2He5J7jWbPibpUYeeF0d3x56P0SSuRCr+netFjjO3v7DTi4u5cXllZo7/xVBIebvTV7OOiSrzThnNHekG3Edqhr6d1LE1uA2Cy6kPpCNHyH+/3B9l1z7oau62BYz83yEzhKgRTiscXDNRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820137; c=relaxed/simple;
	bh=Wdu5jzsTRu1UQapIpzehyg1ZndegJxmvxZqQI4wa8/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWA9cGN+aLT0WfqgxszVU85QvW72POik22I0yt62BWvpUhSq4qWEALc6BWKByguWhw38XoCZRXXBajQAt4ONMyPfR58tLAyU31ZPML63Y6ie5fTnhjzkwC1n7nxThKDzbV4FHiXk4BNar6+MUmuu7ivnem6BEHxgxdDCM/MsgaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHnmOUTp; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHnmOUTp"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97727c2064fso441975241.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784820121; x=1785424921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+kSfKG+GX3ABilBOw8Vr5IsCiYnxIkSvhYryTFnFI=;
        b=jHnmOUTp0HZKoW9c8mBBfFe/X/MCVKJm8d6O6gaLAoubSPEZDYqM5n49sAHoj733Tk
         aJVZvYxyl+k9Eqk3f9Yr/5smIwRXNRZN7wIWmOmSPg3AFR8FUcj2D1JYJTuaFMQtLWid
         681DqSGtw1+udZgtzVWslDaz9CTriq3wldmNrWoNOn3NALrbhu/wj84tCxPNTh49X90M
         SgO+7TOCnOwblhTr2rt4ePqrGv5mimHkIn68y6H9Gfh9/3rIX2OFm7NCUVVQppZsZbhH
         5hT9cDKkQfSX5vMWIXh1z0McQv/kc/ngkope0R/TlMYOVwVDnwdB86ZlFddFzcgEhT1B
         7dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784820121; x=1785424921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+kSfKG+GX3ABilBOw8Vr5IsCiYnxIkSvhYryTFnFI=;
        b=sJWFEpyCjBUl8O3PV0PBeA7cLCcMvPbvtCKtCAkfJ914I1xS7R5ORcUnpfHWCie7zr
         pH6YptyGgtbI9jYswsuyic73e1XWeuERDup/AjsbMzn/dTAztxxKuzeos/otJDAfOOUK
         enQinq5rKJFJuK56TXqCWXfaPMi8IW+E7ABWYNwctqMqlDFmfXwfEtIXRbXJ2sXoCP2g
         WSk0uHqfK6gOVL1tefDrKzg/kpjfR2bpKj8LfMGGWLFzei2ScyN0/l7K54Wb+bfB/vBx
         aGEyhABCj4aPtoRcpIAzL010LWVMkUCiwrWlK3hJVL7FyuZ/8EXwlePdJvAHeItbZMsH
         bOxQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1w+fPe+vAqvBpJcxE33SUy/wEs/KYODsArgEUsgNHqQBH29aO/ew1+RI2JuTfpO8oW0QC7L/JS7DJqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKSBbSTW1ViFxeodiDV6WJriKfPwharAiOlFvMVnOttzvQ6wY
	eRb0wuiE1mVDQXIAyn7okNQiokyHkIeAn+S3lkWl6jngj/eR3Gw5pUFV
X-Gm-Gg: AR+sD13/E93TELP/1smfOLm0xiZuGktFMAoi6IXC5O7eOjd76JjA3Qe4JcDwypAOmfl
	f8YN1/w7/JuSIb+zdX8XhvnGq9wSyMhklGL1LLI4Dv+vZk+0U6q/+eKt6c6QuiEKvOY6Qn+0OdC
	KaKt+F6luyltPqksIndGLdjGw6by4TLh+yIWf3KlPCv3gLl1aZpVifSHVoAAPxGqyYpC3AP+ugq
	JzWiml+8tOClPR6ZQ61FyrSMJ3+D6CcpHUBHLNp7RDk+8kosw+LaFpIGT5+LzuMxgMuByagvxAy
	s2O4TNWRh0DSP0Tl9hWsybSfMlHVXBITVih88NZAJPU55Zqi6NICs24YCdBHDIq1AWulkv8pfWG
	xiA+eIfDupR9YG8WbIl/4cO6f4+Vqrnh26cxOuHleiejnt6c5QDI5Vu5p/CMh1PofpM8a4CoPWj
	WaUxbWXoCwmV7ofL4LK1AD+0CJur+a6kTKuT35rUHRd+r73V4=
X-Received: by 2002:a05:6102:c50:b0:631:2973:5c2c with SMTP id ada2fe7eead31-74d604fd347mr1689165137.21.1784820120923;
        Thu, 23 Jul 2026 08:22:00 -0700 (PDT)
Received: from note-javi.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-74ad344bb32sm5494191137.11.2026.07.23.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:22:00 -0700 (PDT)
From: JavierLeventan <javierleventan@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	JavierLeventan <javierleventan@gmail.com>
Subject: [PATCH] media: atomisp: replace spaces with tabs
Date: Thu, 23 Jul 2026 12:21:30 -0300
Message-ID: <20260723152133.56400-1-javierleventan@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath error "WARNING: please, no spaces at the start of a line"
in ia_css_fpn.host.c

Signed-off-by: JavierLeventan <javierleventan@gmail.com>
---

Hey, this is my first patch. I appreciate any feedback, thanks!
---
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index e701b7e41ef4..1c8e60c1b071 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -22,9 +22,9 @@
 
 void
 ia_css_fpn_encode(
-    struct sh_css_isp_fpn_params *to,
-    const struct ia_css_fpn_table *from,
-    unsigned int size)
+	struct sh_css_isp_fpn_params *to,
+	const struct ia_css_fpn_table *from,
+	unsigned int size)
 {
 	(void)size;
 	to->shift = from->shift;
@@ -33,8 +33,8 @@ ia_css_fpn_encode(
 
 void
 ia_css_fpn_dump(
-    const struct sh_css_isp_fpn_params *fpn,
-    unsigned int level)
+	const struct sh_css_isp_fpn_params *fpn,
+	unsigned int level)
 {
 	if (!fpn)
 		return;
-- 
2.55.0

