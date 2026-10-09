Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C673C81B2
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 17:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567532; cv=none; b=XSVvyqL+DWwK55jWMS+JzHlS0XTGxWJnB03KshceQfscYo8ACz0aFq6cHAVxx0BR/VExaBEbDqh3bJM+O78x+CMeubZ1zz0WaF5dv7HKXxRkiJe/dH/8gIVsIStgk60xnsbKpVnHw6X4k6wgZJYMAM4algEJPg5e4NuMmaD04LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567532; c=relaxed/simple;
	bh=rcocceJzvdxseW7oSVOuLeEh+pzPMgoaU0tzjFa8pvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JnRSfgCZ2FiVg1n/ZQhhKjgjbdoBiU6ymjYIo2ks8yIDEUOK9kuFD5dTGzdt4ITwchvQSkT5Xt+0F244YNv7uLI5NsmMeFJVI9GqwRIZOlbABGpi7Xb4NakMhK3m+Ji2qGkNFDdBZLh8ZjAmq0TgRCQtbTJUK0Irk3cO4nIjKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1Dpve/B; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Dpve/B"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so6094536a12.0
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791567528; x=1792172328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQtBsY6p+LlKSNXN5m5Dgc3FzmVkyBn0CPq52gBNyq8=;
        b=q1Dpve/BJqevJLwPZrHt/Z1nF1gmRDX2Gbm0eds6H+DRl5ZIamgjIAWU/ALr+qSQMP
         s3slCmjd7mU//7AzhVC/sZwiq/D5xpsSRh7vDpwPZe9kmtr8LNrw4wwh+U5V7ZNJsQSJ
         c1c6DWlgDDpLDRlBxfNTmC5Ds2roCPNnZrTwO9j2ONIZnKL1CxNQBMyjz6nnd5ycgSwy
         S0Fz5sSBmLBW0bSTmCSEua2chud0dSQPtakOsrJ+YzWk/w48bugzKzLN+sldPOuUu2wn
         IBAfb1eHzETMp27IKJ1gEMnBIrOqRD92Crlq9QNMyPEQqkULlbXPn21kpJgBMosnoB9+
         bBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567528; x=1792172328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQtBsY6p+LlKSNXN5m5Dgc3FzmVkyBn0CPq52gBNyq8=;
        b=Zq/fW8j3lyp2fxakeMKKbQDYl20NbHBddy0pMVbja8B6s0yeMBtqxVYMllooQFFa35
         4sK1FrB5H2oqbo5i9YoDUWndDF7ohM3TfWvRWsrVXWq7OKHyIS+PWF9MOKONxWFs95vY
         muFr0AO0HJs25TXJu80TDeY5lgF4QfkmCV/vLbMJaEYPrJM7ZZ78JxyrKIw5GnaSfvSG
         DAdTcNQgabICvNWeTguheohVCNZKFwJBfNVLKiyyYJReIxTptI+u8Ld+DNnVdEUjdE78
         rGYMkCaU/w1HG3zadqlRgDK1d43lDia6bSJu2ChDHtMAEJvZKnMY9RIE62fQzveqEYtH
         mdvA==
X-Gm-Message-State: AFq9FYIi8VCrSChcxXlQ4k46MaLCBQR7Zu5JSIsRBt9lTT1eJE8Av+NO
	lSj/DZAqJCbg8bUSRQNky+Vc3dMF1Z/wW6zNhBBmgV2t9Er16GX9VlCfwYc+Sw==
X-Gm-Gg: AYBFou2IlzoTSvz/kq9rj7moPhK6BOMHXsrN+8+l1lUA8V1G2gn1kHGzz9jgZx50p88
	AT7Kx+0vuKHix5qCU5vMmN2E5QHV0AmOmgo8clUg0yY3RAiA3IwYhg5dHr+ZxYEQffl4JdESYQM
	O3WGvsvZnbdhSJylfOt6ieE1+3S1iNZhNcKgFA5QgGj0FyphLbnXSF3QACQudofBNQQRYCR8ZYw
	ViynMO2QUsmR+AMc8Vm08kOFVt34L5PvRqTh4ctAmxk9IWvvzpoQSA3lpfLNQ8fYCEGIo/pmPtz
	QGaHSXuSagYZ/T2k//Y9wBgVLBjvRn8UfLIz47xbvh8c2Ict3hUyVCQ9cWGDjsywHg80FfjWvhY
	3kPDE200SaGXkB4J4yq6qd6Vod4J5z0+IjuHgniog2GsWVqRoSJNtFf0dWW+Xf2GOhO4KNiVnS1
	oww+a45O0I1H/bibAfyBDdwIrHvdTG+r9fZrybTykjPgeI5UICkbbGEv7ENdFUBfLx5fY+rzUGI
	ApDRmyU
X-Received: by 2002:a17:907:e98c:b0:c2e:8eb7:53dd with SMTP id a640c23a62f3a-c31aa0c19a7mr316091466b.42.1791567528253;
        Fri, 09 Oct 2026 10:38:48 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:23fa:b7ab:755c:df7c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a74bcbsm124698966b.38.2026.10.09.10.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:38:47 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] add V4L2_CID_USER_ALVIUM_BASE and request space for up to 128 controls
Date: Fri,  9 Oct 2026 19:38:24 +0200
Message-ID: <20261009173826.968402-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

That patch requests a continoous block of controls to enable various
features of the Alvium camera family. There are many features like
triggers, ROI for auto functions like AWB, auto gain and so on.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..5ed91c053617 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for Alvium CSI2 driver controls.
+ * We reserve 128 controls for this driver.
+ */
+#define V4L2_CID_USER_ALVIUM_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.43.0

