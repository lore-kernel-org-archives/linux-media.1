Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9F3803F4
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790439912; cv=none; b=Qm3Mpu5Eu80DxrXoo7Ni682FWWO0Wo1a/jXg5hNFIxiNZeHFK48sG/5a/sUTJhaqOgPjylDLd4YcldpOo8rdcSBxaroXFaR+qCMb7wMZ1S/cPxsaDo5XGvn7JUnyQdRc8FJrt8flYByLaUEWkwsicygO++d6nsyQ6X2S3c8sogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790439912; c=relaxed/simple;
	bh=ycWqyxbgnHvqj0AlMW/czgPmqlicvxw2e9p7wr19g0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XeVVC2RNAKGfBxsbBww+DcmvGBhkV6EUnNYw1011DJpuYbpdUj0o4wwy24N1LYvmY0fon5yfEHxOFM1UQD3QIPM4dxq+pE1E67XrMba1cjl7CQ6CFN6lUA7hNvDJFgA5HFyTQUcNKbXTraY7EfcAzoVqUnEWu003K0etMPLgs3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mzg3aSVh; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mzg3aSVh"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93c67dc382cso18304685a.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 09:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790439906; x=1791044706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DDJ7gOqHzkRBzCx4A2IxEfGV44FjToeR/N8xHqxayQ=;
        b=Mzg3aSVhQ2lAQHOrU9e9BQPqe2mf0chynvo7ymXqwk2xD5tjVMx/SqIqc94BtIDiN8
         pJVIlRAGrrdt9waCjFgOw9IzI6UIrbxNqkdQJfaoll+1j/nSxj5OzOBxXZ7PnyA/zED3
         19w7vGjE1CCwhSY69yZH5hZJHDuLch9TVPlAKlVmwf4cKJ6P/iO1Vm8A9QvvzpcTjKkf
         HlYzsCXyDiHpaWEua/jA9LUXKtxZNed5MyjcAZB9FxO2AQgnAgir5IEFh+fJbNgWlGzF
         SPOESAOtAhS1RUlCZ+FwfBmHkn5BwTaWEjDWRvo8hK6Wq+fKRzKW5zo1PV80zJytm8jl
         izGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790439906; x=1791044706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DDJ7gOqHzkRBzCx4A2IxEfGV44FjToeR/N8xHqxayQ=;
        b=IomXfZvZoZHTJ+uMMKOcjF2FZfwJvXjJedQWUppBX0cCTIZDCTyM+toIunJJ6j9Ugv
         nZdTTpr9N+AMQSZve5S8rmU/b/QaRcN8jEOzZItdoKH3glGuKCXWyuRP9faBZoPfTRWV
         QHuuk1kcO50NhN+SNUq5IRkKsPC0MZyTA8KtU2/EQ9skkqHekRnKxpBPctBeMxNw38g5
         FGiFFJbrKB525em0mL/1QB8zwxEglQHMTaVZShY/JgSiTWsFx3n+9lg1ooHwpXUSbsuZ
         1u2QbN5M6tptf0ZU7CJjj3vJYV5A1fbddf330UK1NgCgBIvfj1o8V264R5mME4e1hJ5T
         fpPA==
X-Gm-Message-State: AFuF++mTk645DIARmzkuv+uPMsNU2dMHxAnsvd0s9Xnmq+M1F0VzrUUa
	8n8sLhJOlAVOpWcSQs7XkTj4EuA9UlTjRTya+D0yCbOIcdcxM4wChiAp
X-Gm-Gg: AYBFou2RzXJXQPo2yuUCQM1W7OC0Mt6CQb3QRTb1r9kp5AwNE7LZ2XDVMmu/BVSQJFt
	NIhd+LWVR0ymIu0HXuNyFN0I3l4hOm8njsDwdquL57ZD+yoisQALvF4va3OYYCTsfbESXVos4Jh
	ofySLV0RL8Rh8djQ6oyTYhtFlWSuWv2FuWjOO4OC8WqZYeO5wlZWwWQdJgDFJUnrCv5kIKw0hWL
	ljwDVRQMi2vEronXBKfF1C/VdCj7ogi0NnBFTBwJgq7oAJ8RI0Mx8ghIrL6pBhwubarGJpFATnD
	nUfLonAaTUoUlQXd6TdUqxYAuFsKB6rVFSGDJlwRdNG7fIPoELaClsmCgj1V26TDmzvBz7foObd
	nW1ijtjs80oR9Abwlqn6ovg2J++jL95JNT8hCxsyLn/IrrlkNUv+7GEUp8qmG70m2EKJRYxjmF4
	UV9OrkVmoER8umR53l+qvC+8xcXLJgpFfgVn8isrT3buMajPnji8mQEGqe8g6AVEfTPmEZRXdCO
	TCHaPWE+ZhSt/Wvb3suBgenVCVl9nqKBjKLFk5s88VyIr/Z
X-Received: by 2002:a05:620a:198a:b0:939:6dea:374a with SMTP id af79cd13be357-93c43d0eedamr1128436585a.46.1790439906109;
        Sat, 26 Sep 2026 09:25:06 -0700 (PDT)
Received: from zaina.localdomain ([172.56.198.134])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448b06c9sm443740285a.11.2026.09.26.09.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 09:25:05 -0700 (PDT)
From: Zain Aboobacker <zainaboobacker33@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx231xx: remove unused cx231xx_dump_SC_reg() debug helper
Date: Sat, 26 Sep 2026 12:25:00 -0400
Message-ID: <20260926162500.25208-1-zainaboobacker33@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx231xx_dump_SC_reg() is compiled out with #if 0 and has no callers.
Remove the dead code.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 103 ---------------------
 1 file changed, 103 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 0a5c635da040..544d80f867d9 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -1338,109 +1338,6 @@ void update_HH_register_after_set_DIF(struct cx231xx *dev)
 */
 }
 
-#if 0
-static void cx231xx_dump_SC_reg(struct cx231xx *dev)
-{
-	u8 value[4] = { 0, 0, 0, 0 };
-	dev_dbg(dev->dev, "%s!\n", __func__);
-
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, BOARD_CFG_STAT,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", BOARD_CFG_STAT, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, TS_MODE_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", TS_MODE_REG, value[0],
-		 value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, TS1_CFG_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", TS1_CFG_REG, value[0],
-		 value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, TS1_LENGTH_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", TS1_LENGTH_REG, value[0],
-		value[1], value[2], value[3]);
-
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, TS2_CFG_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", TS2_CFG_REG, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, TS2_LENGTH_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", TS2_LENGTH_REG, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, EP_MODE_SET,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", EP_MODE_SET, value[0],
-		 value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_PTN1,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_PTN1, value[0],
-		value[1], value[2], value[3]);
-
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_PTN2,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_PTN2, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_PTN3,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_PTN3, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_MASK0,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_MASK0, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_MASK1,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_MASK1, value[0],
-		value[1], value[2], value[3]);
-
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_PWR_MASK2,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_PWR_MASK2, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_GAIN,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_GAIN, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_CAR_REG,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_CAR_REG, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_OT_CFG1,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_OT_CFG1, value[0],
-		value[1], value[2], value[3]);
-
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, CIR_OT_CFG2,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", CIR_OT_CFG2, value[0],
-		value[1], value[2], value[3]);
-	cx231xx_read_ctrl_reg(dev, VRT_GET_REGISTER, PWR_CTL_EN,
-				 value, 4);
-	dev_dbg(dev->dev,
-		"reg0x%x=0x%x 0x%x 0x%x 0x%x\n", PWR_CTL_EN, value[0],
-		value[1], value[2], value[3]);
-}
-#endif
-
 void cx231xx_Setup_AFE_for_LowIF(struct cx231xx *dev)
 
 {
-- 
2.53.0

