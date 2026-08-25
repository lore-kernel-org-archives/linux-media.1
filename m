Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503678C9C;
	Tue, 25 Aug 2026 02:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787624792; cv=none; b=ArHuQemutb2B80lnOE7t7AxTzb3EhdGXvnBMkVgwJZB0m8UaetXnmzKjrenGJiwnfzf/T1fqOFZNv9s+XJOBLZfU8sxW9ZbhK8JaaIYVRgLf2SEVfhWi0QduMp5pn60zDVDlocfZvzY53hrJ6eONVTJw3p5lOETZ0bXWAyVcioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787624792; c=relaxed/simple;
	bh=qkrz96l5Ep1kDmtx3oeF2NnY1g9FLF6WhIrQvmBaV5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cL/aEDjMw+AOTmdVKWZb3TfUPdUdDRn5DAepCar0sQm0N5mCTgjb2WM57ey/GZvtx+yUMXHnhb6JVWX6YYuo93rn0stR+GyqU6fUslRgohMzMr3dmGB9nFBDtJw2Nsvq2EkKJsYhYCJ99TOAkxxMAhIR0sKB4/ryJOcXVgiTBC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5c816606a02c11f19a56ed5b684f684d-20260825
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0bacf5b3-bed0-4233-9109-3aa62ce3a5ae,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7619e05441767de276e0f1776701b04e,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c816606a02c11f19a56ed5b684f684d-20260825
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 565875025; Tue, 25 Aug 2026 10:26:21 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mats Randgaard <matrandg@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gonglinkai@kylinos.cn
Subject: [PATCH] media: i2c: tc358743: add missing color-space strings
Date: Tue, 25 Aug 2026 10:26:16 +0800
Message-Id: <20260825022616.1133967-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VI_STATUS3 S_V_COLOR is four bits, so the index after the shift
is 0-15. input_color_space[] only has 14 entries. Add the two
reserved values so log_status() cannot walk off the table.

Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>
---
 drivers/media/i2c/tc358743.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index fbd38bbfee03..ce75812cbf72 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1373,7 +1373,8 @@ static int tc358743_log_status(struct v4l2_subdev *sd)
 	static const char * const input_color_space[] = {
 		"RGB", "YCbCr 601", "opRGB", "YCbCr 709", "NA (4)",
 		"xvYCC 601", "NA(6)", "xvYCC 709", "NA(8)", "sYCC601",
-		"NA(10)", "NA(11)", "NA(12)", "opYCC 601"};
+		"NA(10)", "NA(11)", "NA(12)", "opYCC 601", "NA(14)",
+		"NA(15)"};
 
 	v4l2_info(sd, "-----Chip status-----\n");
 	v4l2_info(sd, "Chip ID: 0x%02x\n",
-- 
2.25.1

