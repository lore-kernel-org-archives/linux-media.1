Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731423A2574
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 04:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212450; cv=none; b=PfTiM3BRDKAmq8gm6Ij+r+D5421KtFCSAK9f0ycYiqug0BHgeNmXo82wVd/jf4og9vw18wY20AKeYfqfnpfme6+b/X5ghHhEv+l/PR/Es0Vcefi+QHhBKTcX1SKvtQ5oKsjuusSxxAVgqOy0SVAdwl/QvFpGQvPnmm9XiiaI1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212450; c=relaxed/simple;
	bh=OgwQBZmFSYnHBJ8yzwWfr/GzrbKbmVTroSdeh9md7wU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KzSgs1H+GezbzR1STQhT8kHY8nBvAq6MHD9dLSzv/SthXfV0V3nGEOcoTeZc0e27tL502fE3wb5KQp8NADaM2IVWVaSrlC7LvXQqU4yF3hWERYA5lcom50f/acADdZGJhyBO6keyxX2+zilJhPImrsxpIq1KvRFbB+P8/xaq85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FIuqV3dt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FIuqV3dt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785212447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vhPdBa8rEcf+OJFnOy5cTF5xLDxvSXTYofAemgQe+rU=;
	b=FIuqV3dtvRQWFJpk7u133BzCj0I9QubhIDJ8a/SrN5AULDgnlnbE/IPf1UXPgifUYpxc57
	oW/tn7cYPy/eESDlIC6wweRgBHaCcZLR0vKAjSuiw35+0wLY+BMPvvQ5V+nXRGrLjjPWXR
	bk7RwacJ8XrWlep+//hmxO7Wtwg3RGE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-hxC4U1fpNzaiWHZ3S6PDOg-1; Tue,
 28 Jul 2026 00:20:43 -0400
X-MC-Unique: hxC4U1fpNzaiWHZ3S6PDOg-1
X-Mimecast-MFC-AGG-ID: hxC4U1fpNzaiWHZ3S6PDOg_1785212442
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D5B1195D00B;
	Tue, 28 Jul 2026 04:20:42 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.com (unknown [10.67.32.102])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AC9C3195604C;
	Tue, 28 Jul 2026 04:20:37 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: i2c: imx471: Add line length PCK setting
Date: Tue, 28 Jul 2026 12:20:13 +0800
Message-ID: <20260728042013.23707-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add the line length PCK setting to the IMX471 driver. This parameter
determines the horizontal line scan duration and is used for
controlling the frame rate.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/i2c/imx471.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
index 6d358b11e96d..e661f5b78dcc 100644
--- a/drivers/media/i2c/imx471.c
+++ b/drivers/media/i2c/imx471.c
@@ -91,6 +91,7 @@
 #define IMX471_CSI_2_LANE_MODE			1
 #define IMX471_CSI_4_LANE_MODE			3
 
+#define IMX471_REG_LINE_LENGTH_PCK		CCI_REG16(0x0342)
 #define IMX471_REG_X_ADD_STA			CCI_REG16(0x0344)
 #define IMX471_REG_Y_ADD_STA			CCI_REG16(0x0346)
 #define IMX471_REG_X_ADD_END			CCI_REG16(0x0348)
@@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x1088_regs[] = {
 	{ CCI_REG8(0x030d), 0x02 },
 	{ CCI_REG8(0x030e), 0x00 },
 	{ CCI_REG8(0x030f), 0x53 },
+	{ IMX471_REG_LINE_LENGTH_PCK, 5008 },
 	{ IMX471_REG_PLL_MULT_DRIV, IMX471_PLL_DUAL },
 	{ CCI_REG8(0x3f4c), 0x81 },
 	{ CCI_REG8(0x3f4d), 0x81 },
-- 
2.55.0

