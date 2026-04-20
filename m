Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D9336894;
	Mon, 20 Apr 2026 13:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693312; cv=none; b=FoobxWg7FPLwU0+8PrHqV/vcQCCgynHpLh0uGfGUTl1lsjGLi5aj26JZZNcOwAFQxrQ8gQTol0FLr6/6Ypa8rFZ709XEFWdR746N8rGy8x7w8jgYnDaHcwlEQPXBhqjwSguwICHw6pzW+WkVF17eJiaVYgRylL1Lo8FtMwpfGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693312; c=relaxed/simple;
	bh=Ssfj0cVGadpRPkLNIxdEg893oD5MdyY4VfefAhq41h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVP815zSTXQwmWdpKg2SvYJ1sl2b8gnktVH01HqvyFzI6NfZQf5OnS1zqtmQ/JPylaOfvksokbND3aPTkxa5rC76zUc4WTErOmACso0i6o7I75Kp2LXMRTvgLtravx2lYSa8di/nsbHb4tBXfQ6SHC7QGg1bMENGaSrwh93j43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=Xk+lKENL reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="Xk+lKENL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776693300; bh=Ssfj0cVGadpRPkLNIxdEg893oD5MdyY4VfefAhq41h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xk+lKENLekKJX5Salxsqa3VtQywbHQA702CVuHYezuxWsQcrQLR7XJfth1aRUozHZ
	 hE+M6n+Z2Mal2tHlk288CtpkD7lgJv+t/m75xPse1HgVTAACH1yPLkWafEcNm7G/R+
	 SLceYK8CWpxEY0A1WIkSb9ig2j9zdlRK1QoUwUrvFAZJMnh7dD1TyFAk/xPIwZUhMc
	 t5tiIaiytwNrzv0h8fsZG4f/QVYbCfV4rElW/MsDT/3pk+8TMggLoUcQ7sfryw9xvl
	 HyVpTu1+wqlj0fxhDmmOfwq9JvjlYX9WVHUTefAzyWY0bGDUYZiEY67+DRIDQJnWOV
	 WMg0zeql7EKQw==
Received: from jovis.fritz.box (p54909809.dip0.t-ipconnect.de [84.144.152.9])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id D405F2206DEA;
	Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id 9451E83; Mon, 20 Apr 2026 15:55:00 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: gspca: Fix comment in sd_init()
Date: Mon, 20 Apr 2026 15:54:43 +0200
Message-ID: <352a50a64a3ecb7ad6346d2d0844b5b7d4aa90eb.1776693140.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776693140.git.pmhahn@pmhahn.de>
References: <cover.1776693140.git.pmhahn@pmhahn.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake of{ -> f}.

Signed-off-by: Philipp Matthias Hahn <pmhahn@pmhahn.de>
---
 drivers/media/usb/gspca/sonixb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sonixb.c b/drivers/media/usb/gspca/sonixb.c
index 09725d62d904..60b5d4bc528f 100644
--- a/drivers/media/usb/gspca/sonixb.c
+++ b/drivers/media/usb/gspca/sonixb.c
@@ -946,7 +946,7 @@ static int sd_config(struct gspca_dev *gspca_dev,
 /* this function is called at probe and resume time */
 static int sd_init(struct gspca_dev *gspca_dev)
 {
-	const __u8 stop = 0x09; /* Disable stream turn of LED */
+	const __u8 stop = 0x09; /* Disable stream, turn off LED */
 
 	reg_w(gspca_dev, 0x01, &stop, 1);
 
-- 
2.47.3

