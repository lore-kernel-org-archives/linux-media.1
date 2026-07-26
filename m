Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9D372EE9
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048857; cv=none; b=qUTn65FzjYz6OE9W/3hxD0/fpHr2Yo0Q+yOu7gIWpmlc8UgjnM453/smQj3KK/Pt2V8lJ9Bx+8HOsuJ99axQMhBpeUUju/IOtb7rATWViH6g+DURr09et3hfgoMoRa3vRubsiy2NopvLxi6alBPCdfxV6neMTo7DcUb9y2ts5F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048857; c=relaxed/simple;
	bh=Hv9tdkNS1dKV8sMiO796wDtRCJIKrdOu+YoPslNw5TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r21ACNZfQUPyNdRyAHmu6pA/2A5zTnF9oqcuEzWVkpl2PXkHDLLsP4hcRlFiIXqkZ48e9c3BcktEUwHMpr90I38fZpIN+e5X5zSzLb/xrsIXmsgkUpB30ZuJ2GdeE0mwh+WGd65rqsLxWU9docf2bKefxHgMvfhr+1xo9cdF3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVDhwaDy; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVDhwaDy"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848761b5897so983732b3a.3
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785048855; x=1785653655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hry9116D0FdbqlgJF0pvLPaieGDsmlVjz6I62zN19e8=;
        b=YVDhwaDy0irVqxxK5MnLQiD+A/VH9GukrmnYQJ+PhWxXXSxxHGdgNeGEV2/3z0YdOL
         Wm+vmi+QChH3fe3DTBwfktryO5wmn3Pak5Wl0IQmwhxC11zMx18W0EXsEJogXubP68mu
         wWpAZZeOFMl0/47lyxD11N61HkKjaJLvZffHF6xwfdoHkHzVw4uARyTnMTs/8iddKwhP
         2vfCYmuvjmcl28ye+yyPuzsT5HJ4MtztmqioDXXB0oi7Nk27o5CqJJvL/t/3KgbWu1VJ
         gXST9xdJmPSL6bG/fMK24m3l3qj7yCk50rvqpGVLW/bJH3P8FiNKlqkbpjCAO1cDQwk0
         KDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785048855; x=1785653655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hry9116D0FdbqlgJF0pvLPaieGDsmlVjz6I62zN19e8=;
        b=T2iXN1f3nnfbhwlLBw/brqV8iIytJLB1W4F6+tE8o1nMILvVavrYpy8G87isojuCEw
         88I88lJExNSkjo3cqGLMr9BLtt92PeD95Dge8di82kWDpyIj1ZOXGTVErZ3lMPHPkYd+
         0FOsYhT1Ss5ctHw30oSCBKi7rUiuQdmI5HJ1KpzqpManuDMpxgjf15/7FbOwrOODSVdE
         RzJ9WFfldSYKY/BouwYV7ueHK0ozx5apHyxYdeXm4gXNPfDUH3ZQYdGzU9x+HAye9mwO
         KKYcHZfub0Malql1nwL7BB0+fpPWR1ICdOvKG+CLBbuhXwHqiODrE9Z6UTa1e2zNnKaD
         a5wQ==
X-Gm-Message-State: AOJu0YxYYAVn/WngUgX4+YLCAU4Y5maBNXjZvMM+V0DpgBA/0PnYVndj
	iu23wcj1m60A6E3Nq2NSV8QA3s0CvjFV1JrdQgXgaMJkcKiVvea5cCeA
X-Gm-Gg: AR+sD13dlcQEwQqYTDTGf6Rw9xDicJXeHI3zDaTUQfAKNHhshg9vEwZJL0SeUIjGxoH
	YDhc0L2cM2t6+kM88U+2JKFDTRAdxdXN8SmX/RrCvcs69i6jZlPZ2L8bEWZQ9OOUAh61HE9AIwg
	D/avgmLr3nGUIV3U3GCfGHMsE0VHMQv2yNmub+mSF/wfVBlszJIIcpnoQnuzfxdvAW5Wwwvtnit
	pBXYafo/aPv/ooN7/ghnxbKH1RLuyt3zrirRStEX/6YpERNZIDE6WM7mDhbAhxv6mogGLuie2ji
	0c3KncNsp5rK1auW6Dusq7yJceJ9Q5MiB4SN23ALUd/dMyCfg0EBhR93vJPSVeAiOPld2P5hcC5
	YjmLDMFuufnq/GCVeIBV5eVBJI/W8XNTdjDQCYmckyWS4fzpVGzbANdEQ8dPELH7kgyjWd2Y/G3
	SMCHklWXTUsvDGVysP55AfMJ/kUuF1GYQ=
X-Received: by 2002:a05:6a00:3a11:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-84e5927702bmr3203985b3a.0.1785048855351;
        Sat, 25 Jul 2026 23:54:15 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e530079f1sm1620224b3a.0.2026.07.25.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:54:14 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	"shaikh.kamal" <shaikhkamal2012@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: media: fix spelling errors
Date: Sun, 26 Jul 2026 12:24:07 +0530
Message-ID: <20260726065407.20766-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling errors reported by codespell:

  thare -> there  (vidioc-subdev-g-routing.rst)
  stuct -> struct (legacy_dvb_video.rst)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
index b9fd5cadae24..71d044605315 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
@@ -344,7 +344,7 @@ Variables
 
     -  ..
 
-       -  :rspan:`5` ``stuct play``
+       -  :rspan:`5` ``struct play``
 
        -  :rspan:`4` ``__s32 speed``
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e..164cf0ad3593 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
 drivers may adjust the requested routing table.
 
 The kernel can return a ``num_routes`` value larger than ``len_routes`` from
-both ioctls. This indicates thare are more routes in the routing table than fits
+both ioctls. This indicates there are more routes in the routing table than fits
 the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
 with the first ``len_routes`` entries of the subdevice routing table. This is
 not considered to be an error, and the ioctl call succeeds. If the applications
-- 
2.43.0

