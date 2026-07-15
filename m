Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3844E053
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115860; cv=none; b=H0+fng/fCUwsYDONixRlznEIbKnw1gzWkF9lZHzC3SIopxTEbY9XTIKM73KszErZpu8USTQowZBcAr+rXzPlsrLxtJoWbxLLQO4jKvzmmm4Ha7NIVdzFHHO8b3Vwgup+CrJoongnm3usZirR9wSURlgnfHGf0QZvYwCE5oVIyxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115860; c=relaxed/simple;
	bh=gyqujfHJHkzn9T9XsAEbi0n2Q1X+fbSwsvnueuC+UJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egedx4Lvg5kMSocNKgAJAwhCNA8PUUWyvH7vv/TBDQu0VTPkcweD09ihh7tiFcu9EPvPj2RpdULN0BYUhNpLGwHS+uJ60uAuVLvGnG6KtbQ5er4GMvE7oN8QAkikzpwMUCVwpkj+lWuNJEDTJNveOwuxUfoUHkDYK983R1B/18M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=klVItU1a; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="klVItU1a"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso5056462f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115856; x=1784720656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQLciStRyxHcQjyBCc3cnu+LNwHPfM7OOKyYTNEVNSs=;
        b=klVItU1aGyjcGc5fX8ARnYxBEiOXuc374EEyzOURSdJeYObPU3qajJxItKEeAgaU2T
         TkadsQe/fo1+13cYZqnTIPdyYUX5PXq+ZR/j0Yf0xDzC+wp9AgjiuqHS+h5ONJjEFrza
         Az+z+0OmvT5a7efa3Dtf1G5PSqn3YWdP8MxWAb11CjJ8LYZEIIjxC/o1diW41Gq5TLlI
         36PpNBWB2iOLRydCU3T0e1cm/shWqT50q7wAgVDzgro7aTvmjMJFB3u7hLLo516CcUoA
         FbLWOPMv0zrLIyfM0esdbGWtVMxsps9pID/fopHesdhMBuTWHGU/mCvY05QyZUndmHmQ
         WbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115856; x=1784720656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQLciStRyxHcQjyBCc3cnu+LNwHPfM7OOKyYTNEVNSs=;
        b=FZxjZDLoAbiPGHEDvHueBMBjz8E+nAryXesfBN8n6RnQ/cdjFJs+ykwZbLttpD377n
         KswtrzEOneHVSPO41+ihA2xeH+lzk3F+FNNP8kEBF131xdJxHSHAvqP7EYg3NdA9YqnE
         9d8GY5PH1avMfv0m8gY1j2+9E7SdPgcwWMQT7mq/Y+3q7mamFuVaL7jFPFHEhLCj/ZJB
         5vSzwE45yPrLJ5MLmBYSVZMus/vXjK8Vhh44HIJYfbRLktazyYmIim5E+immIMr7Nmki
         1xBZYUkU0TVoqg3wsjVy7OZT1AqEBWv0HKnWNwkVNZI4FEJd5j49EvaaYr7dwADyjbMG
         lPcQ==
X-Gm-Message-State: AOJu0Yx1w7RAFWlwuw/8Z4YF/7CIMrWJVoLlnu3rfhAJ6KQXW6HixREw
	GoZ1+R462e4Ka6L7KRkOA+XJMPvuhQVvA034yeOYPMpIMorJBVV0I7b8kL8gxfmAlJQ=
X-Gm-Gg: AfdE7cmNFS1f25tptTG1NKD11pnhk6lwRFxbEspG47Yxfb6k5VAATghR67lYMeufq8U
	3gMCE0cuGxG1Orzv4BcaWQsi2EYsqNHP3ngAG8pZnWC7kGut8TRv8Je3SAEugcIYfdO6SeEe5zt
	zlL1jIv/zEEShKzETdcMSrtG1WOxPfkcWmW8U2rxiUCXUpFbdQifhXIiRRRdZovATpyRbLIuN0a
	4EBuSTWW3s6YzGFRcHRaVrHCjpestiO7SjkXCNbknlptMFiEv0uMO7itfyqYaE44FgzGvpGhFzT
	qGax9FccNE4EnrStIQYFuxjecLjgSGvotLLcd8wmQSkxgqZNJAfxTVFXDqIfV6Qw3RuzuJ80ApV
	uQHwWytLCeDq//qR3pf4ev6NYCsb1SZRIuTKjIQAaTK0lSzPpIZ3vbK6pHmyfuEuAV+KOi4sbCc
	cJYiSN/ekX0l6Apu1MvafQ9KcDVMqyab5KtFJuUYOy3FhR+Zn3cNlTyqB2Tr79pDMV
X-Received: by 2002:a05:6000:2407:b0:475:f0c2:75ac with SMTP id ffacd0b85a97d-47f4fd3a065mr2962749f8f.61.1784115856194;
        Wed, 15 Jul 2026 04:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:20 +0100
Subject: [PATCH v4 07/21] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-7-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The driver already has the LLP value stored in the mode structure,
but also had the same value set via register writes in the mode's
register list. Remove this duplication.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 123ceed26d05..e9f4bea67d3a 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,9 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_LLP			0x0342
+#define IMX355_LLP_MAX			0xffff
+
 #define IMX355_REG_X_ADD_START		0x0344
 #define IMX355_REG_Y_ADD_START		0x0346
 #define IMX355_REG_X_ADD_END		0x0348
@@ -260,8 +263,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -270,8 +271,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -280,8 +279,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -290,8 +287,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -300,8 +295,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -310,8 +303,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -320,8 +311,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -330,8 +319,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -340,8 +327,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -350,8 +335,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -360,8 +343,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -370,8 +351,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -380,8 +359,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -390,8 +367,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -1059,6 +1034,12 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	/* set line length */
+	ret = imx355_write_reg(imx355, IMX355_REG_LLP, 2,
+			       imx355->hblank->val + imx355->cur_mode->width);
+	if (ret)
+		return ret;
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 	if (ret)

-- 
2.34.1

