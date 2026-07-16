Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1D33D6DD;
	Thu, 16 Jul 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194232; cv=none; b=e90qXEI4ZLbwA/+1JeAGD8RoM1yelELHafJXKdMCzbBqTGupXGONM/wFj0T7nZm+5bAM0LuNouiswE/kANl76yyVVZQcv87gVOPaV8IZglJZOzSRM79JdvZ4F5jlfNJnK06JVbziGbgrcCZr2TEjnzJoxzeN00R/u12sCQVXQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194232; c=relaxed/simple;
	bh=UmiiFVX/n5ZxHfYD4gTKN9UtWhw27b/sHoNxHU89Zr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IVKvZCdlgM9yqC9BrePPaxTsTU9DNnm04dfKJs1q2KPu1rElg/Sr9zwfp3o/d/V9npCXw//eND9/P0ulADYTnhFK9UJ5CLcWVCX2J5C3oiB7iwjhlG8sOMwEY1rSjXGQ7nYMO5XH4VicRIV6UJTwD3ziiwwn/XAadaoy/PxIoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f7feb29e80f811f1aa26b74ffac11d73-20260716
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d91e312a-c828-422b-9ddf-313232f508cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:274c1981217e0f5fd239061cd272e7e2,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7feb29e80f811f1aa26b74ffac11d73-20260716
X-User: chenchangcheng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenchangcheng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1130551392; Thu, 16 Jul 2026 17:30:22 +0800
From: Chen Changcheng <chenchangcheng@kylinos.cn>
To: skhan@linuxfoundation.org,
	kieran.bingham@ideasonboard.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	faizel.kb@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Changcheng <chenchangcheng@kylinos.cn>
Subject: [PATCH] media: vimc: Replace do_div() with div64_u64()
Date: Thu, 16 Jul 2026 17:30:17 +0800
Message-Id: <20260716093017.175254-1-chenchangcheng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

do_div() expects a 32-bit divisor, but pixel_rate is u64.
This can lead to truncation on 64-bit platforms where
pixel_rate exceeds 32 bits. Use div64_u64() which handles
64-by-64 division safely.

This fixes the Coccinelle warning:
drivers/media/test-drivers/vimc/vimc-sensor.c:107:1-7:
	WARNING: do_div() does a 64-by-32 division,
	please consider using div64_u64 instead.

Fixes: ec1e620b2454 ("media: vimc: sensor: Add pixel_rate,vblank and hblank configuration")
Signed-off-by: Chen Changcheng <chenchangcheng@kylinos.cn>
---
 drivers/media/test-drivers/vimc/vimc-sensor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 5deebcc78a33..3ac797fa9921 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -104,7 +104,7 @@ static int vimc_sensor_update_frame_timing(struct v4l2_subdev *sd,
 	u64 frame_interval_ns;
 
 	frame_interval_ns = total_pixels * NSEC_PER_SEC;
-	do_div(frame_interval_ns, pixel_rate);
+	frame_interval_ns = div64_u64(frame_interval_ns, pixel_rate);
 	vsensor->hw.fps_jiffies = nsecs_to_jiffies(frame_interval_ns);
 	if (vsensor->hw.fps_jiffies == 0)
 		vsensor->hw.fps_jiffies = 1;
-- 
2.25.1

