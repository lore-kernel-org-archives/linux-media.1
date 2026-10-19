Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BEB500A8F
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420106; cv=none; b=Cmpu7WEG0S3O3BdthNY7fkEDS3sAgJX4BOHJfPt7j2o4pABxGJ+9CHTQt3ORQAiJ74ikGh6v9AOWsEg/0zaPFyNBixXQsnYtWU90b1F+BAFbodT8aXdr1REevGUTaUGAcGrTUnNCK6jTKO41ZTm3BWUMAwaJDMBPtpBSjuJroN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420106; c=relaxed/simple;
	bh=F79U9/bxD5Jz8JD6jFl35h56iNZhp1FkdKPTOq7BTEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBwIc7xuOvMQzR6IekSOLNLdY13GwUEtBTg3VXXfgZ2DE03AeYt3PlHFvRAo+RaA6OKn7+PZDXIV+Z5/sOJDbqdPI7o4WDRa0btiscErqYNqGQQCR0QSEcQvGk1wisX7bbr+Q0TPwgmx/brrGtnA9OGLWM/6R+pMaN4iJuGvM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=be7jZVkg; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="be7jZVkg"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso1346318f8f.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420103; x=1793024903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNhSDkQLPOkiHBZQuG1DRAhINQRkDBc+H8efXY/uwPE=;
        b=be7jZVkgY4WBkF9Cdh9xc/dnih6N4GjLVd2G3Wh0iC2VrruPzLr35EDn5GRJHISHwD
         b4uM6rTYuJS8hFFMpWyY0h5KTqeBSVzFuDmRoeGnJ4fcdg4lf1nuDhhFRvsYVioi9uIy
         BsHNcJh+KM8cMi4ZrE8pmO9qQ+/fNint9LRsxw5Ckf14dKZ67q7EMBMsOxTHxID40v9v
         n1rq7nBVnFillGyg8eQthSeDitM1RsbhMNQkyT7FUefLw5orLw6gJNEogfHJiemTsVRZ
         ZvEMsTQ70owhhrkNqtF/9f8GO6CAtdMAFwoBxHPpi3E5qcLARxropSc6T+MByIl2E+sK
         +JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420103; x=1793024903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNhSDkQLPOkiHBZQuG1DRAhINQRkDBc+H8efXY/uwPE=;
        b=cQ7uGBbvbeJB0AHrVvXbCErrPhCUv3xg6Wy3J2PM+uHt64nJIs6BBSLpY18EceGuj2
         J1GBw63H95xmXbIMM8fvHw2xR9Wduub16F9yDQjN8/PeCSqW2tQZ7b8DdXK3rDLiN+ax
         HVY3UYEQD9fOLJXUEq7K1hL7CkPVRaBaJKyT6cuEDCVU9/mc7WC41qSnEFgVUgCmHi5y
         fE2F0SsL8FcTpvQcTRqCFacFTjbXgZL7an+WU8fLIl7tVZAmRfKGElb3UsaaMvr13Ns7
         GQT5oDedOHkOR8E8eMfpS1vWJ2r9DfQUK3EP6otBfIn10l0KekPw8Ol5/2WXIRJGxe3d
         V0GA==
X-Forwarded-Encrypted: i=1; AKwUvBzZTBzeY5V9SZSMR9cdAt/K8+X5JIioRr4g61gXv/h70sEmdPbeKDkRTneYMNSDXjtUe2fbLBsVjmbiVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEu4RTCDIhTvMxXhdtuGTtGWgzpvf919fBuPMoLqUFvDDb9NmP
	W454EoENm27ORy72RWjDtYxrPp+Ll6bzQUUC1YwdzbwVqKdSxDWPPAv9DfPVZC7CInY=
X-Gm-Gg: AYBFou0rg0nSLIVY3uLxdKzVJoLyXuN9VpdCU1mGlCvyBGqxbFInhd0iR105B1QyxkT
	w2phUkODcY7z6fz3SCtRpZv0CQIZ+maBt//wPTeJOcKf812WfdZKJczFkKHoA8Yd97uWjSY9fMV
	sZwjP5qz8faW+p1TDUskAHAWDmRH/abPVVZ2zjOpd/kff8KRlFuzQHdPyo8DlZJwYmsjOpWtoiS
	Fud5sD4RdnCqkFo6l8Op0xqHzY7DQqbZgcgbNVNzBvLihzccwH9v5hAYHi6oNLxPBXzuG/BEI00
	RtFGNW3SwB3kBy5r1E/Tfm0DtxnnoEshdu57F9IYUCFjJwmRi8B35/PTg+drmfSKi6AJuwLycQ5
	27xp5vUaLP3FtQs9Qohbb3FHMmaoU2F4wnvAE5BcXyHnviHmlAwer06MiAhO56uESP351KygGGj
	ou0BcP1MCOEmvwynepKrvRDOZ1aXXpV+Dod8rSCx9XWgGr628XMKOJ30YZ/YbLtSUp+LWTCl8hF
	piNCKjbJlfPLHMYeRdfi+pj48v2rF5MJHAr+mc/IZPj+CXICA==
X-Received: by 2002:a05:6000:240d:b0:48e:e28:ada8 with SMTP id ffacd0b85a97d-48e0e28ae03mr12033648f8f.52.1792420103218;
        Mon, 19 Oct 2026 07:28:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:09 +0100
Subject: [PATCH v5 02/16] media: sony-starvis2: Reorder link frequencies to
 remove lookup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-2-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

link_freqs_reg_value is table that just reverses the order of the
link frequency enum.

Reverse the order of the link frequencies so that the table is
redundant, and remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index ec5bd64049e1..e5c56a1d09df 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -186,25 +186,14 @@ enum starvis2_lanemode {
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	STARVIS2_LINK_FREQ_297MHZ,
-	STARVIS2_LINK_FREQ_360MHZ,
-	STARVIS2_LINK_FREQ_445MHZ,
-	STARVIS2_LINK_FREQ_594MHZ,
-	STARVIS2_LINK_FREQ_720MHZ,
-	STARVIS2_LINK_FREQ_891MHZ,
-	STARVIS2_LINK_FREQ_1039MHZ,
-	STARVIS2_LINK_FREQ_1188MHZ,
-};
-
-static const u8 link_freqs_reg_value[] = {
-	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
-	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
-	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
-	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
-	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
-	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
+	STARVIS2_LINK_FREQ_1188MHZ = 0x00,
+	STARVIS2_LINK_FREQ_1039MHZ = 0x01,
+	STARVIS2_LINK_FREQ_891MHZ = 0x02,
+	STARVIS2_LINK_FREQ_720MHZ = 0x03,
+	STARVIS2_LINK_FREQ_594MHZ = 0x04,
+	STARVIS2_LINK_FREQ_445MHZ = 0x05,
+	STARVIS2_LINK_FREQ_360MHZ = 0x06,
+	STARVIS2_LINK_FREQ_297MHZ = 0x07,
 };
 
 static const u64 link_freqs[] = {
@@ -913,7 +902,7 @@ static int starvis2_write_common(struct starvis2 *starvis2)
 	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  __fls(starvis2->link_freq_bitmap),
 		  &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
@@ -1176,7 +1165,7 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	const u32 hmax_4lane =
-			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+			min_hmax_4lane[__fls(starvis2->link_freq_bitmap)];
 	const u32 lane_scale =
 			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);

-- 
2.34.1

