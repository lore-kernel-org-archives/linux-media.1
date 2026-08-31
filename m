Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0236B931
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199270; cv=none; b=KwO2ztsuFwXGzKg2NarHaMALpKt7CPvqUCfu/QwZLiT4Ce222FK3D94OGG5QKKsMY/95u+w2s8mOMDDis0smGXLIczutq7qcTHFWZyHxhcAF5ssc7GeOxd/pWvZq4Cx2tGGBcnP4XOzHSwSmVzonV4DP2A9AyISJOOIaeqhJ5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199270; c=relaxed/simple;
	bh=+c4zvKKOzyTG8jOPH9TvfJgLdF8RPSCzmK6SpoAiOic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjyGd2e9YJE85a1HO1Eukx99R/TVMjPv6PahfYqncwjzp/2ZoHtfTv3WDuit7GdGfiCIru+o0eYJPQRAFsA1g1g93AZMPkqrODpn7kCDVBIsSzhfGfu74aCFVPE+rcY5uUWk2m0ALxlIwQfEtuJohmAR/ATsoKGn+4bfEI1IGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhEr+vQK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhEr+vQK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc3327fdso7298f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199267; x=1788804067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=QhEr+vQKYzUzknS1SOAlXxzmOT+DCJP0qSZVRbsZ4ELdgk7yOruQioGSXkc8UZTVTt
         /LnkdNtoO44ywz1a2mwFCaRLHQaekBA2Gh75Ug5Ncz1WHsL77dPGa1p0buFPPIUHdSxE
         xlUMm3nnKGKn3oFUQutJBjLO7lSNe9nB4tPDuHazsn+y0CPYYlarztNhF5NxSRTD9owe
         GbIBOOvVu8ANuZ29Fpx3W+xSA7lr+Z/+Q8a2i4iJUjjiDQ6k1XiGdaXFTdy/BO4KBXNb
         kuqYuxlRkXkvwcqXfUXm2JGh9wQQrGpk07E+jhYXX5VfIMZ+PtjX83q+ocKUJX+bu8YV
         +jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199267; x=1788804067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfJBnn5eTo/6C/oJ9YXkPmfh/d+EU+7KK+XPUfp9+ec=;
        b=L3k2xj9HA6cxpNJQ1X8rflSd3PaGKGx5GhV3JNQ2dXrZIu2stxCqzUVXGN4XuDiAxm
         OF4fanbAPuhbeLo6r9KJUoFL9F78iCqaOZhgE8+d5pb8ODlAz17AZq8EvTNiCT1vf1Bc
         mxmz9wtiU0kSEAHEcV9bFgf4qlUuRfz9LHkxMQHWS3Imas//+EQ5hRhwkU+Xh2Z1rL22
         pbB1BjmHOJGqeVfCGfq54DTiBG84RkgACP5gRhGyzBV57UArroPbGAuDv6ErtyCO22dY
         ucUhL/KI9uqTQy9ttHjsmAxj8R9Qw18H5KzC/8WtYgxXUO2zXs9OCKr2SomXXj6Czidg
         HPzQ==
X-Gm-Message-State: AFuF++mFShx0i4td9d0Wqs/DmyOvkHN/0/jc/3OlxELWglB17/0bJhhb
	HLA9G81r1qylEeg3KhQb9wF9fKd1X3PcuIZBbE3tcH6gTbiqhd9XE+iVwRTS2vCe2Cg=
X-Gm-Gg: AYBFou05CgcJUKwXKrU4IyLwby07KmjR6jjQZgJTpj8wHso+G0IQjQdF2Wff+p03vUu
	YEmrqpxXfWJ3HTz6o/csDGgloP71n+qjwp7IafnNpaIA6wjpCxI91RInRdXY9/KEz/mGuWx3StV
	0W3skkPOGXl22a9J7Fl//9YtwPVRC5qc+tp0MXQZvv01F8tUSXwAe3hhBroqPA7jIgLzo/H4ADM
	NfogCZJPt1DVPAj279owntwzdhNbSdiVl/GkyitJzv7GMLoepFwSHh3ChJ5t3Z6O5o1GBTJAAV6
	gr8MZmR4LLfQJhbiVtygpN13eZ3S3N8E7Ken9wDC/h6GvRe3Ht8aBSQZ1o/RlLKtkuLMMjFn1WA
	0NVza/U93yWk6jJf5srb4ZHUC1bVPQXkbIn0wmZhyJl1WQ8Z1A5T7eBnbEybqKFIDIF9DabAoDP
	5Zx00XArCBj4XG2GtjHEnePkZ0WCHzFdzVxgFCgmO6K8u/s3EWrhXoS/QxzMnkWwy7rd5cklExy
	ea6QoMVOZrJqsQSJjNAJ4/XyFoi+lx5xE7xnBjQCak=
X-Received: by 2002:a05:6000:4705:b0:484:3ad2:27d3 with SMTP id ffacd0b85a97d-4843ad228f2mr17224694f8f.2.1788199267099;
        Mon, 31 Aug 2026 11:01:07 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:06 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 01/16] media: ov8858: Extract digital gain programming
Date: Mon, 31 Aug 2026 20:00:46 +0200
Message-ID: <20260831180101.3109854-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
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
With Best Regards,
Maurizio Casciano

