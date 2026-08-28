Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0563812C2
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933707; cv=none; b=itcsPIbWbiGo+KUxz2JEKIyeUPuIAOipek69YmH/1oLRHCiHNO++ITPyAdqR/BQhUCsqf/ASp7Pjxs+vJfvw9JIZ4GoH7nJ7BUhiAod/MDxz9cadL49/aJaFYM1+srLhWWjojVr93qSN5rHpfjo+QXz+xgS0Mcc3bWC9WA5iNoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933707; c=relaxed/simple;
	bh=xhrDm+Mv7c74PMtacFvusD+88J1ycuEMG7fJpBlsDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3D+rpA3tMmuCyMTbb9uTizZBYA7OplaWUHWYhrjq9fp9AE7JxNeylVvWbb0+BdqQNQ72maPLJ7U3GQaN9lcV9OiCisIsVtv6ZFC2O9c+HB+ZxCYt7PoCL9cH5xrhsY1jx/cMIj/EnWipvzqTt32fLcR4ZfMgVd1hWNlPKufkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQyPFXz2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQyPFXz2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso5968695e9.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933703; x=1788538503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=QQyPFXz2NVslEW+QnLZWvKzzqn/btq9Msxr/KYCrFh/24L6BvjJw/5bk1Q4EQBt6GJ
         gRIWqRKFgMOoUlh8ClCd+bDFqSGzNIH3cN/x78g/K7SWq+10tuJ1mzdeThsU15HKyu1Q
         +d05E26zQsBAMNWAn8kV9OrrSaaaVdg0dVN36MF5iiBVuPcb/FRQkiwRnOXk7I0sBUF6
         ErTcWkg2ekyU97FbgdT+575tZx/QlGLJwgOPH2MnmrdMq7uVaY8oOiharCgobxlrXj1+
         z+8aDNkFgCfJe9ZpKaFnKHU3//G2+ywXw4qsRwRjL4F3sOhdehck/skrxvFKoU15CJ2S
         QlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933703; x=1788538503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=MrW95KirSuWKyXxJCNBCY8kbSP11ge9C1obujsUrUYR2rGQ2k7819CIaA5oVkgJCFY
         0/NMU7Nxjawg1qFCavx5czqVsR/fziZD5HWjsmwf58IliU1USfnzh/fqQlTcKk74Fwen
         U6kuHA5BesJvjX3UHofPY/be3wiJ3DxG+AAwTUntQvSw7qoBl8wPa4qdv2WfRn4TEGx4
         8mWjEEF+Ri59UpQgs73GBf1eMYJiKc9RAcz8rvGceRxyK8GlziE7VAlIafZxL6yld9oc
         aK7bFhrB5o0riHeomc38+6lLKzbFOQ/FVTJXCui8RL7ipy8S25WSXZpD/jWpGZ78jg2C
         hPBQ==
X-Gm-Message-State: AFuF++luuckhdKLp7ntWI5lD/iIasBy9pVCbAFbb9fpOPtDlJSi8QUOx
	2KiPVHuI4SkCZ2C0PNjU82U+62jhUcrihaN2KUyvKeUjzDiWqN2WybrEl7Gkb2O+
X-Gm-Gg: AR+sD103pZ6wyMf2F8kGjjEI80/VZCOnkb75Z6Fpm+jW14YjHuZ+xazi5up+QXt6YEE
	ptgE8HqrG+B1KjkZcTn0xt/NYRWTkl64MC5bzMhe4vDxIrAhyfiBJTl7k5O6Mh1ZmnoqddtuPIb
	bx1SdaIPWs0oNju6IH3NYfKWMPwfh/Qbv8yhocZgTrgd/uUUAMVQc3vqSVW5ewZvjpRl6REK5MW
	D5xXnCxP+JjKwuRCRawsL3UVCWy5k33QQG8BtK3JFHFsxPRbiYZU0P7tKT/29TAf3bhLUECmJ6g
	LDPNNV53EetAKX6ir+BXK7l6fTHsRxSTaF0t38H3RxT3O+A0Vy58jeQ7uyWt3XZJfW+CWoSVyaz
	WtjtVTloTnTf7IIgeMiFiz8PQ4vq4dsBtjG1dOuTtGIjsbAksU/gmKosCaRQY9SJGXPhQ0lcFIj
	M3Yoo4/vQbE8T2y1NwY8c/CVDR9m0ouW4b6Z3pSDM++fKmJtVZopxofGWNbSpkN4/FawyMb3v0G
	N6/aYieSyeBImFv5kUJXSOJZ9peo4JtMvAZWdsrUw==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr134990155e9.5.1787933703419;
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
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
Subject: [PATCH v4 01/15] media: ov8858: Extract digital gain programming
Date: Fri, 28 Aug 2026 18:14:43 +0200
Message-ID: <1a7c8fba6835b2191b71ae1d903734621626e1f6.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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

