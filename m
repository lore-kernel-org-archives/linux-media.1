Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C41B4F0A
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351339; cv=none; b=DaVtnE9JQoFBHgP/498LBrDCh8LgZ+vatvwc1AVbOwGAvzehLVkUcSdocZ6d5qwAxrBtNaIPDvwr5Vfw5E9NDagpewmbApSc4Zr6RVITdWiGg1aSYYAvYB9j1zukKL9R5vxqmnLKAPsfkX9BkCk42zZQ/pNBmGt/cU9nvzwT6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351339; c=relaxed/simple;
	bh=AUEWxzWAXQc7XpfzzMFB3szz5NBECs/2keGxpcQikMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bEetmQ9HbjjUFAY+1tzsmNnvaJEYDMdi27u6EHp40jZ8+F03hw7sW2/it52TQvoCg8Io/Ag4K3XvrHgyTO8B/Y/8Kh63OozpXgLK3afIVRKak+9aO7reDmQ9mnDwtl/B08LsN/QuojuluVu0NwWEdlB54/2Y/53bss4effBL918=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=Jdtka9y4; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="Jdtka9y4"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46726528f1cso1113585b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351337; x=1773956137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KvOzoOy8FZoUMZdYOVbw+zFvvXKFmzy1KYVwXobPN8=;
        b=Jdtka9y4axyKKxUPoLgZ/GjnNPa721c07gl7G3ZglObyeXAlEyvvmCa7Z6AVUsHrn0
         qgfTuf8MByQsmVZDad0wdCZ/+WajDreIjLJ8XaEFBW/oA5h7yxgt542aC4IVPEsZnXCn
         Edc3HWHi3w+vKLArhpYiznkBlG+bqAqHSh96LCQ+fuox+mai26kuC8oPKhs3cvR/BFh3
         3i5mkeia/imzWrsaCwe3GT+0OHQezjQIDjSstU9Rceo3XV/Ow0V/BKRBsoJjUs72uev9
         LKQg6e4RXPbSn7t+ymWbGp1fBermD3uMdRBe44j9Zu1wHuVfSMGVImEBHjtxvnAiEsCd
         Z4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351337; x=1773956137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9KvOzoOy8FZoUMZdYOVbw+zFvvXKFmzy1KYVwXobPN8=;
        b=dpZcANvno6LgEecxdkPyMMhkxpehgX3pb+TIsqiHvfiET6Z5RupNkKRpKDKFcfr1e2
         e4WntgZGz59QWlH3VnmN3xQGa9mdT37Fm4gUMWZOQK1Jb0wq97irn1Df/x46HChZYz+S
         BbTXbE+04aWNEhla1ioeksjHP4H4iDJVNb7CcUesGG++DwWvSNwXqaDy9sX71SZ51jdM
         MVWRuXFoCsBOuJPv+Ap3NTm+vhCKqjWznkrOHz7qi2fCA+EYP2JQPXnChPIVNMydZi7u
         G3kaucNILulrhU29zcRPsNb2Yg7yf24EpVLYYBigCVhxs1kAI9rghnnaROUa/mL9PhsG
         wcAA==
X-Gm-Message-State: AOJu0YyUw/5R4Zm3+qAFCcM9yUXQ8cMQx9xQTDFULPzHGT7XO8gB4OeX
	NPK/RbgzlESoG5UNzQa7ZspxkrSIWqsqrMehq+QcXF32cRqJzNk8udRkUnkNrF5CQ85UYgEN33q
	4PxEuH60=
X-Gm-Gg: ATEYQzwWdBqwBD3I7wY/a9h58qe+caZ0Ve0kLMOYAt825PfeFIhMiOMYr5io1HeuD4+
	eTO9l1lrZozRg79vn9x1FuvQx7w99bThftroeIaHnC171u2Ar9ZVAd5LfbRgW+ZK26H0YNlVzeU
	zL5CTh8sGvEQTzmSR/dnrlWKK/7bMADgmtES94IXssJHUdK/8fbbDhAAqCXcqAa2TJQZlbd7rMn
	6DDWYpKEL/CmQFzrgkpMf+HzP2SG5aWhZOgXR9hKUy652gHFNy/EaW76yF+UzEFAMdz7qxMopbo
	LPILs0/xNXFBSbGU0EqMdDAOQPW4TtNaMFzu8yoxJmv+d8nW/2W405KpoWlwMmFE8yEzBH4ezwj
	QnQl1Nq4htytdR6kG/tPpvizmetEawKB8iT8lKKjaqV+xwc9W0zCtdl6uJRvlvYANZxgjaT8NcK
	vHwgkqL74/DD+GLnXbKQo1GZ9e9gmZIFdl7cVrwrTTKBSApDGG7SK+VrgGbGRF5gUgRsvBV72KQ
	szqE48U81JfPJ+LIeA=
X-Received: by 2002:a05:6808:30a7:b0:467:ca8:c396 with SMTP id 5614622812f47-4675704febcmr521766b6e.9.1773351336804;
        Thu, 12 Mar 2026 14:35:36 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:36 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 01/11] si2157: Analog format fixes
Date: Thu, 12 Mar 2026 16:35:22 -0500
Message-Id: <20260312213532.2907276-2-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates to support PAL-N and PAL-Nc
Verifies PAL-I and PAL-DK standards are working
Fixes and verifies SECAM-L now works

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/tuners/si2157.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 4ca42114da8a..b041cd854732 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -638,20 +638,27 @@ static int si2157_set_analog_params(struct dvb_frontend *fe,
 				color = 0x10;
 			}
 		}
-	} else if (params->std & V4L2_STD_MN) {
+	} else if (params->std & (V4L2_STD_MN | V4L2_STD_NTSC_443)) {
 		std = "MN";
 		bandwidth = 6000000;
 		if_frequency = 5400000;
 		system = 2;
+		if (params->std & V4L2_STD_PAL_N) {
+			std = "palN";
+			color = 0x10;
+		} else if (params->std & V4L2_STD_PAL_Nc) {
+			std = "palNc";
+			color = 0x10;
+		}
 	} else if (params->std & V4L2_STD_PAL_I) {
 		std = "palI";
 		bandwidth = 8000000;
-		if_frequency = 7250000; /* TODO: does not work yet */
+		if_frequency = 7250000;
 		system = 4;
 	} else if (params->std & V4L2_STD_DK) {
 		std = "palDK";
 		bandwidth = 8000000;
-		if_frequency = 6900000; /* TODO: does not work yet */
+		if_frequency = 6900000;
 		system = 5;
 		if (params->std & V4L2_STD_SECAM_DK) {
 			std = "secamDK";
@@ -660,7 +667,7 @@ static int si2157_set_analog_params(struct dvb_frontend *fe,
 	} else if (params->std & V4L2_STD_SECAM_L) {
 		std = "secamL";
 		bandwidth = 8000000;
-		if_frequency = 6750000; /* TODO: untested */
+		if_frequency = 6900000;
 		system = 6;
 		color = 0x10;
 	} else if (params->std & V4L2_STD_SECAM_LC) {
-- 
2.35.1

