Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D544A012F
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289487; cv=none; b=goIXBhqHYdAqHr4wFEKXebjixu344fv8TW3Hb0VnXpBwEwpYPqciv3mr/vQLyd5cEF3K2rmdNb0OSUoPOeLOFBMR3QryDW4cRmnUDF5VXX1XkxsYTicLF0oHLdcvHOJq3ceLtjS4SaDoMYY5l4sQm3Mr2VO6Eru++3nOWz8F1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289487; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdbrfWeSNIr7v7WzP/hoJc7CJFGDrkD2DcgBgmnxdJFA7NOM32huSTKdkJ66iZRPgayVYsEM+n3mAnb/UX1t/TqdcpDwZna0f+2tqsXJ+385Vye7989t/SiSgVzLylHs9tuF/sAChRpYgK3VA2NyiyKV/A0D//kEtHFX4zsM5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG878jRD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG878jRD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b9320423cso1662995e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289483; x=1788894283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=OG878jRD8BojDaN0KLvEHSS60LOlyaX0Fy5GpZu+YhMRNLyUNroiShPOYvuA2/a7Ps
         grFgHRtZPbV6X8H0CYCZAfGNGYby7HsHFllcY7JlhKNRdBXIIXwGh06h0BQjUqUzLdqF
         f0odyZh7q/PiUDdP0mGhVYju6XIsvE9IVntaLdmpHnDt+3rJKRXUYf14CxTT5VF2TMbo
         aK5REjjvtcBoP5cuz2qiB1RZtAcB5xhOJjOf6K8WyBkICuoxckuWZ8eJox+i2IUUwIg1
         6V0T7LYE1Iw+04vtykqlJd2isGsiVCagoxF51UHFF8FxB2hxHoJZU0BPU83+RWdq+mYl
         8IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289483; x=1788894283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=GQZ5Zjb2RFeQwpWVb/ASNNqjjgaajCAWw0DY6Q1ND4sLhJMq41FYYUywIvUpaLRiej
         272X8gnvY8vDKsCOFborBuT9mpFc+Up8tHWX0e0yfNjjR9CmPF/Ud3dzUu0CBWXh1Ody
         jnZbJ81/fQiFdtvxN1FD1MNfkxXd6/HO5d7s1pUhyOzCQtdIjbBbM+Ghq6pJsPNhfNb7
         r6C257VIuScre/ZLgw4QXWfggp8mS+73Lhs8qVvevUXAy9Ay3XnSBzvaqaNT8lBnAJnH
         TdB/t/1T7/z5ylECJ1FKznNf5ghkbog+CG2myLyVQHCLpWp2bZ3BwpENsfzqQ4Rx3tDu
         sN4A==
X-Forwarded-Encrypted: i=1; AHgh+RpzCLGTk+IB1oT6zECNuoFBiMkZFOA1bktqL2Z8HtoJHvXvow6UBD6S23yA0jXTZiGu689kjMeD/j9Q2w==@vger.kernel.org
X-Gm-Message-State: AFuF++kXIH0RUoOM7h/FNURQAJDaCA+7Y3zUqqES2TjNrowNUH6a9Dc9
	U4Kk9CCX0x/vsS9HPEl2OOEEfw9YMnSAVRa2r3MYszrA+HZ0Qd5BHEFZRC9FItUShrtSww==
X-Gm-Gg: AR+sD10u1nX6JiDNTPuHnl/EZN10ZpBp3Gw6ddPTim+JFEGNJsa6J4tALyvJV6BxJgX
	1tE90htKJJc+49yH0z9dv0s06KFscYhodpVXv58oAet2XMpqfCT8+bmzQ3mrhFKWzXEvRAQmrfx
	4bQI9gA7+EBfg1CV5qoWoZ1bwsBlpRgU3/UTXPp0vpv4YMDQKYA5BDB9VadLk86fy2lEughnMi4
	iaJepzPLOrf+n75EwxPlroiTvirDQzFZfrtJlLD3Wrcce1i0pqVNGoZmQKDCXO+XKDzAits5IqU
	64+GK8p7vn3dzdFOYXu2e5TOANGZ7bhUOKQ26dt83x1+XFYCQj1cTon+3JNEGZOM1iaJpuEF491
	W7gJgICROeKAVKWfmJW6m4iZ73LXsBDjyainnCcbJexYffsmWdsQsH4Eqf+y4XKWgV4jGTgva63
	inaUr/fcbQVVBHn8SJ/i8rjYpyw5Jlju4yLIttfdGwNCFDcQD/7oZ+sbl/r4ofvsqqoXsHlESEh
	OuB+yb6bKk+E6qJwtwlBNXQWd2r9ALFqrrfVNEifQ==
X-Received: by 2002:a05:600d:6402:20b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49cdc42f449mr19066685e9.3.1788289482804;
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/16] media: ov8858: Extract digital gain programming
Date: Tue,  1 Sep 2026 21:04:23 +0200
Message-ID: <ec1729f6eb60f3d29707fc3d13e247d2b072dfc8.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
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
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0

