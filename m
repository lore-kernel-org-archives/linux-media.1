Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAAD3750A9
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118528; cv=none; b=CTf3Z6AzcMOv+G0AnJJ22mpjJJhzolgdHZRjXk3iPciMY9dOWaOxO8KlRvCCGPBTiCVv0D1NZsJdcKYAxGcBiTn94m+rHBHVto0rJBiamhmDExacrWPCX0GRX8TTCnf25IALCp7aT4IRIDbf9oVoCDFeIXh8/y54modPIWvpNbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118528; c=relaxed/simple;
	bh=EM4Vhda4iANKw4zH1mLVyegOjLPWicuTh1IS7OIaYHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FgX97otrLlTv48CSMcB1tgDEGtqMWyKEX+bjwp7kVwh3dZZE2MhRjTt0LQ0e6sCbssWgZdkUjCt2FJCfnG+WSjmtL/rHTy2BJLl9ZWDd2FavgURckgsPtj9AJtQO23j5VGY9VDMgec75GHrJhlSHTHr03BFfS/CCpfL0W8x6tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tcf1Skyn; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tcf1Skyn"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caea3f742bso48714945ad.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786118526; x=1786723326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a53gzyAyuQlXypxOv3PMFxi0c3UAzkrW7E7a+SiDOU4=;
        b=Tcf1Skynw9nnxphBort01LDDwlx2xUxzBW5HGrNRVDXZEDEBRin0A5FqUb1Hep8Jz2
         LMYiNfoqeSYTd0GxaY1JNR3LqAqmW2Fmd7mrYkphmFmrgg20W/n1xmI9axviZ/Ki76Z3
         iuvKacOJIufAat02OX6zHgfCqSsb9J/ANcSv8rfPue3bFT5E28IkiiGT9r9hXTo1pYD6
         z5lrlTEIjpmzbj32sKsih4Q6U0Bvoh1pC2dSGfJbpCOpWkO8aZhBkfxkomRsEOYJPl2Y
         MLjiRoB3unM4KLT4jG37gEIfXmz98JoVFHkG1M/xX84Q9O9ClGlbiduvx21aqqMss5TI
         4z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118526; x=1786723326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a53gzyAyuQlXypxOv3PMFxi0c3UAzkrW7E7a+SiDOU4=;
        b=PxkAY69+clI4ee8rJEqW6L5UTk+h/9Tols8w7oqdEOBE6XY/I/UYjCiFJmxcDMbRMd
         kTRoZWzxtghRpwbICtWAR9SvkfRPct13Vsz/lt5GaWU7feyiHDNsSKapljEITTvZ/+5l
         2RropBPY0m7k7aBXgyoEq8psuZtHOLbAifluw45TPmsKXpESNRkOuZf2Vcy1XmP8y5UN
         2gnzKkrptGH4Z0NZQHkf/pVjQIOtnmGDpru0dFvex7tx0z4eOinjDhJW/igJKCl0jhlC
         ZcssN3fmHXa8HvfTJi27EAKsD8pwuCEj1whaiDptzZAt9tUe7+zgTh/p+fPvqXu8owxP
         I+TA==
X-Gm-Message-State: AOJu0YzqFGkDmNtpTryPFdINRB+ozlN3HZirramBoVmW/cKpQijEGPzK
	3aGwCgcH3pRezaQkT6hNVFeA7++WO1oQHBQKogXzeYnCulnzh09oBTQZ
X-Gm-Gg: AR+sD10bf+715tpC1T7Rm1gSDiGlSj5WevIUOtkwH9LPzZuA6kwG63e6JxuaxlQZD8G
	YMI0nHcjIdoyYrFLNoXOFTpc20POv+R1okcrhP01Dxx/BQ6UyrlBgKkWTKAkl6qqewT+bprBnQF
	KqhtWZCnYaBbtRmLYyfJtsau3Ch5s81TeJeF0C9YzFJdSdKiKeHieqDSeGZRDqKTex8uc/1QtB+
	evhe8feB1UVm1Br/vUg/+T0TREOV3ObbXp85WTSxvi6Vj/eKn1IRgSigQ/6u1pFLaivC5GTSZeL
	C+JTKgpLAkn7IAySCzb87lbKaveSd3mqbIfQw3eFYtwJY4KSCfcANjTRnlJcsmmcQJe5hQAsoZ4
	r0dePLW0B7iOXFJY/HdwmNqpIgg0CXFlW3HNYbiI+8S6y5tatDnFACQ71yI/oo0rK5Gu0gMm1ju
	ZTLX4geJ7j1QW5BnPG0Fqfho6wxVurCAtjETBZk0MgM8n1O1KpTIZn7FV/f9ZAGkRRMnDoue+qk
	SflicOGH+s7+VdG637fYUYeV8wo7g==
X-Received: by 2002:a17:902:ccd1:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d11a280465mr102386685ad.18.1786118525413;
        Fri, 07 Aug 2026 09:02:05 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm9884952eec.23.2026.08.07.09.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:02:04 -0700 (PDT)
From: Punnay299 <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay299 <punnaysharma805@gmail.com>
Subject: [PATCH] staging: media: av7110: fix sp8870 initialization and hardware communication
Date: Fri,  7 Aug 2026 21:31:49 +0530
Message-ID: <20260807160149.41580-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address multiple correctness issues in the sp8870 demodulator:
- Fix BER reporting in sp8870_read_ber() by correctly ORing the upper bits.
- Set state->initialised only after successful firmware upload in sp8870_init() to allow recovery from transient I2C failures.
- Catch partial I2C transfers (err == 0) in sp8870_firmware_upload() and return -EREMOTEIO to prevent silent firmware corruption.

Signed-off-by: Punnay299 <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c..def2a7f0c 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -68,7 +68,8 @@ static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
 
 	err = i2c_transfer(state->i2c, &msg, 1);
 	if (err != 1) {
-		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n", err, reg, data);
+		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n",
+			err, reg, data);
 		return -EREMOTEIO;
 	}
 
@@ -135,7 +136,7 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
 		if (err != 1) {
 			pr_err("%s(): firmware upload failed!\n", __func__);
 			pr_err("%s(): i2c error (err == %i)\n", __func__, err);
-			return err;
+			return err < 0 ? err : -EREMOTEIO;
 		}
 		fw_pos += tx_len;
 	}
@@ -315,7 +316,6 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_wake_up(state);
 	if (state->initialised)
 		return 0;
-	state->initialised = 1;
 
 	dprintk("initialising frontend...\n");
 
@@ -353,6 +353,8 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_writereg(state, 0x0D00, 0x010);
 	sp8870_writereg(state, 0x0D01, 0x000);
 
+	state->initialised = 1;
+
 	return 0;
 }
 
@@ -401,7 +403,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
 	if (ret < 0)
 		return -EIO;
 
-	tmp = ret << 6;
+	tmp |= ret << 6;
 	if (tmp >= 0x3FFF0)
 		tmp = ~0;
 
@@ -511,7 +513,8 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 		if (valid) {
 			if (trials > 1) {
 				pr_info("%s(): firmware lockup!!!\n", __func__);
-				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
+				pr_info("%s(): recovered after %i trial(s))\n",
+					__func__, trials - 1);
 				lockups++;
 			}
 		}
@@ -530,7 +533,8 @@ static int sp8870_sleep(struct dvb_frontend *fe)
 	return sp8870_writereg(state, 0xC18, 0x000);
 }
 
-static int sp8870_get_tune_settings(struct dvb_frontend *fe, struct dvb_frontend_tune_settings *fesettings)
+static int sp8870_get_tune_settings(struct dvb_frontend *fe,
+				    struct dvb_frontend_tune_settings *fesettings)
 {
 	fesettings->min_delay_ms = 350;
 	fesettings->step_size = 0;
-- 
2.55.0

