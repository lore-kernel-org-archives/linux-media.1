Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA42C033C;
	Sun,  1 Mar 2026 01:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328770; cv=none; b=eBGpXKdDQXRfqDWCXDWIHz+io4qGHSsCrNn9uB3T+SISeGkjouTGVmBI1MpszZvT6cezIdb9jxWwxm98bwUJsI+Xx3SEhOmFk2Pt453xPhRyi9B4wHBZbx9LRYfxwpVEBCBvbXUskunxbXoT6UQDt52yKnv50dTBjXw6+MLiToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328770; c=relaxed/simple;
	bh=5nLNgNVtMzks8jb7vnpIYtG8JI1sZKNiG/e8cI5yKt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KnC5PpfvE5g/YORB9AAW5vaI4nSIndE/w+7WWJv5ViHoOLHjZ6iEUn5HY+X2GD6UiWccGtIBQM7G1+M4fx13y3+osnZcYp+/bKfSfhDz1PkWDx7Xoo8VgyEOYh2xjagHLtajnuvxl6zKHkyi+raPnmVGeJm5hE0Ofs2+LEKIEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhGkm+A3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhGkm+A3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43C0C19424;
	Sun,  1 Mar 2026 01:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328770;
	bh=5nLNgNVtMzks8jb7vnpIYtG8JI1sZKNiG/e8cI5yKt8=;
	h=From:To:Cc:Subject:Date:From;
	b=JhGkm+A3XE0MCLNNAb4El2ye912rApEIk44ei0iKMlPkvWNlWmFcb8LMdrlRRctYF
	 fX5mWa2KSI4PBHRrrh8KWYj7JJwE8rGw1PFWxQg9bBfcljMFmiEndAxL6ArbWe0IWV
	 yYNF8GEFjOQE6uhtAMJDnwQldcTh3ejMesAzjRLbhHSBgZZSU9AlRI39xih+IWmj7W
	 IkF8f3FsynB494SgrPV6RrvP+PqpHCERovrsK62mYXfE/3jrDRs1zTuumwBFBVKWr5
	 8wV7iRAFyIriPHlsXf7g7m9L0gh69uHTiNBwORl8La7KOllfx66Bg6J3wtVyX0FyeH
	 TLSO1GAGSo6eA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	mehdi.djait@linux.intel.com
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix digital gain range" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:48 -0500
Message-ID: <20260301013248.1691913-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 91848c99ed6a98daf77f4cb7d44cf3f13bc6998f Mon Sep 17 00:00:00 2001
From: Mehdi Djait <mehdi.djait@linux.intel.com>
Date: Thu, 8 Jan 2026 14:57:38 +0100
Subject: [PATCH] media: i2c: ov01a10: Fix digital gain range

Digital gain wraps-around at the maximum of 16838 / 0x3fff.
Fix the maximum digital gain by setting it to 0x3fff.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1aeba3df4cbfc..8a29e5b4b6ba0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -63,7 +63,7 @@
 #define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
 #define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
 #define OV01A10_DGTL_GAIN_MIN		0
-#define OV01A10_DGTL_GAIN_MAX		0x3ffff
+#define OV01A10_DGTL_GAIN_MAX		0x3fff
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
-- 
2.51.0




