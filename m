Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82584B04B1
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854685; cv=none; b=aJmdjhLmkgXeazlY4mzYPq8kPmyu8+pPdo9bwe0twLxmLsCz6JL4KRLoE8aeY/+9x9yzRGXoOAFkR+26VdClo8NZA71iPErGaPVQfnCFvjQstmj/y1pd+7HfCgauV+jr5M7DeaZkJIqpSKA+hGh8rbp22FIgbb5mmbAGKWDUg1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854685; c=relaxed/simple;
	bh=6EF7z2uySlV4sLNAOPuHFw8GGYhKTCfnk5/Qxtc2JUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjQgOLlmjx+6dBsszJu5TDngNBIfZFpOd2gf4vBBS85yfqdMk7nnXBojE87jWR8tkoQ5nGNP8KOkVdwyi6XiqDgj6WzsqVf6Er+HJHHMeT8GWNmVVb5Sfjlm/Q3uEGy1+VVtPMFQ5UEnJT0+1SdiReVXgV1NjQPXVUffZUrtsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKgPoYBE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKgPoYBE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso273755e9.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854682; x=1788459482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=BKgPoYBEz5gySK4FzvULF12njfJAomVy/xulwX97cKbvPeq53h/WbbiPKlxhxkE+fZ
         l8c5L6bwc3B5LUSTMW+jV47CzAnyvz18flKSNSPRLf0nbnzckcX2HyeDPlHtTx575hIe
         OQb4HkU9m/PyM17GaJGau7qAjySalFAyYFArEIPVLSQlACIogbma92/GD/G//MCj38JF
         nkhmAa+8BRqB3IfkeRk1an1HjbSxt5vh4OF28xy4lf6nX9SE/mvyFNUd7MA3kNq48fr8
         WWr1bVKBbE8ATNGbhSJWng8PFdAFOXVSeX8WT/vv09Z75ORJITzGFNo1lgHxGeAWzi5/
         Oj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854682; x=1788459482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=sNcgpf4KMhmsUdVLyuTPorz++IUlvf6nHEiPmOQnCjrVPTpI+Lnigw904pJjHjeFO/
         FnLAU+W0CIBrG6OgCIjggrWGQdgAaAk9LiFTts8QsuWbI2KlJ8soQq4u6EFuaSM7XRL/
         xy7FPwsN2BkD5cAsygkUyAjylg49gufgpko5lrxsJIte8Qb+InmZlu0oN3iR8cv1Essu
         7iZgnN1PCPHN2i7TdIqVgLyT4+afLnNKCcr3NziAmkAh4pu9Pzyd8YsC0ykO9aU2mBnU
         tJp61OQ11wnsKIxnhD8PbhHYHXIpQY4/fTVlpMactyMzDDgKfh7kIotMcVbOHMYOqkfL
         K66A==
X-Gm-Message-State: AFuF++lQ0GSll1laoqcKaS88hj1Xws7j8nuedBUTG+PHlprzyPtbqu7k
	3ZRo6a9rrI7Pw7bSgXfKhRq8S1Sf0q8Oe2u1LpodN3CtF9sqwen+YnEA9FiMeFjL
X-Gm-Gg: AR+sD132wnOxRzzKRhalKL/89kuuphqMPmBgUk4nBHQjWVLlL7U6kR08KGrbTbPZEfy
	11X7xflaYvLHbuxeflJuetUKmqyMSF8KxdU32bKElmXKRVmvprN7XwtB5FFjMLReqFRN7zop0mE
	SJkgFOa+UKCbKHLVVQMluE736Sgbq3qUOlDCI+Bq8Xrj5HzUTNgiQsSwswqF5I9Z5FX/wLi3uKl
	aWhtwsBT3rA6i65mEOf4Jx8Yt2UictJXMT7doJfPZu9cQ86OHWO/pGH19tZb/UQe+nWD3uh/dYu
	IJBLuKnL5Qv8M2ZJvlHoWvbwqsnQBiwrVtQn8Lcx5W/6zHwBfBuSSuJC71TXlGFrTd9r3wkLPQD
	BtvcmZPSIMOpjBFCFaKzZHfEQH1nUFpVdoloGQ26uTbQi7kw+BJhekurLU3S30893SYNaBkQKbs
	NSeKQDiCBXblgiwa6C0rRQ7tjWdsSegM0WPU0NupTP/GXLD9E/4n4/Rd60Nxr6uvpM2BP8CKkKJ
	fcVJJdq8K3hS+aAMXG6yw6i37IxgRFSodxcIqURzgK7
X-Received: by 2002:a05:600c:6091:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49b91c4b3c5mr14656215e9.14.1787854682035;
        Thu, 27 Aug 2026 11:18:02 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 01/11] media: ov8858: Extract digital gain programming
Date: Thu, 27 Aug 2026 20:17:46 +0200
Message-ID: <20260827181756.2430054-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a helper so
clock-specific gain handling can be added separately.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..f0b3b4a5d3bd 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0

