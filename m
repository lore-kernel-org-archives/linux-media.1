Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267973;
	b=01z0k3l+ThQ+U4Wk3xZuXoC7QCAEDB6bL3W3iSJUVmEpQL9Elki21DxlXUHfD1AhNsID
	 qOOrQLd4VdkdxqHvdA9kQrwOP5hFvBhQoJyzVJPmAySKJUErYo987BKcYF2W4+7bbytXD
	 SYq6krW2hI1zEZBe4h0qlIFvMu5gNgv38t0ry8DQewmBd37nmid6SCnIbsUufrlu0eSko
	 w67oxOIBI79ZRJr2h8EP1SNeVIcEmffiOAh8W3hDbAyfw0F4LlDJLHwZ40zqsnsLZ/5xy
	 W69os6ymcvcIdellL+3Ob+gcxexMAwB99OknsASJnpTpYgwY4aO05ul9svQGDli5HwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
	b=t1r/rrylX4El1DiZ3lrFA4KpT20vPhfF/A8H9vIXifJ9Uxk03S3RI45GueeYJkxzS2bK
	 /1RLT46K6BEL/5KmAyWS+Dl5svImcpDOu79ykZQLAIpjpiCIWxh2L0xBbE01Y1faYUtY4
	 zu9o+Zox/+Ppk1pSzs2WFqTnQeihzAB6eiquhODUWhFzgxP4dT2nkIySseE4dCG3vXpYE
	 X7wtn4Ah3cvM1cfxsx9e76NX8iteCDu6ppR1gt80OJq+aDUT11TbziFmOV8m7z/kk6YA1
	 w9E+Bod8zGnDimolcbbELtBtXd6rq7aRTaCkCnm+oGCUkSM7mM+3tZa3lQoQkXZB/Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfMYMwbL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED1606A68E
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5ED1606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NfMYMwbL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15742795e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267971; x=1795872771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=NfMYMwbLjkEZqOIODDnUgjkgtMhF9U8bnMkrljhiUKxSJYouO81VUoqhRNbPSFc2zb
         2vRr0AmF/Z7x2EYzl/o15bawy09Dm6OQNs4tneiBvFWjqnySR+WOjvqjtLR4LvZF23iY
         k2liVBRkoNC2pu64nfMsnfJzHpvtw4yhILuqXPbFZSSrZEFColEfBqaLPLaC/DCC1OwL
         ZYDBHFS0mvvKSOu2BVhdqBw3XH+Jx32EhyLaKAkm1g8SGlVwMSj1z2xkA52HRUnQwcyT
         J1r9SGe4FbefNjQep/L+zfvBJH/izJRvG/rh7nJCuU//kfLB8rub5qE+YBm1qI8HpORw
         rjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267971; x=1795872771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HnyebDCuntlbrCv9OQomxEOLXwBjjcdpAxNc2VsRr0=;
        b=Cu0k+t3JIEyC/5i/9kjNY4/Z1ZBS2lfh4WCIqgV87MfEJJvxHuV+4iA1D3jOY4pTlk
         1otVrK8DUqcMvE4kAt+5SaNV3KrWnhEk2VgZv32CZzN/vN2bNtc3rYS28BIZ0v8x+JCh
         68mQ0BHYVMCANKvR+iLtIenFd3WrpK+WXos6UK1dXpyg5gG3RpqxiGY1buDM9UvU635v
         0zHAv2eZCAhKh0fpfOZsh2Vk9lLxaFYnF18zXwT0Heuj9w93TrNe20LJZqQxFbB5Pm/R
         0/YAWiIXRitJ4MEKw1HW89aywGBxiNut3hUL/9xpD4dRhUfbKdC3hEaxaxwonDZDjpyn
         lEVw==
X-Gm-Message-State: APuU4Z+ypYkW52ZNakTQrtziokmgoclSTn0tbVBsuAHm9D3Oc1plgV5q
	9NjyzZcTL5Az/gRII4VOsh2w6dyZMid0RT7nnFK4e5vdOdFHyHJTGLK4bWR1yA==
X-Gm-Gg: AZFdTZfOOiij87TEZe6EP0QkrC0mDfr9YKLDyOxUAsToAVVahCgpr3sOLvC368ezfhY
	pZmPkUl7ZGqtW5xcp4pYU9ha67C0QuDTxBpw6L+LBWUa0OiYor6BaceDlN63rUw3jxpn/HIR/Br
	rbCBJ+WfYvZKBNgj2hzv9i1Sqe4Px+ok9cz4KDM8C041iwXr2oQbMz6HSU3TNVcoq/kwZb7PxH5
	+3HFw41k6okXbHgcurr2tQ/VdLjQKbGbh4x1jogT+jayaVXwuul5vVtTvgtqyxFdut4ZxahA+w6
	LkVT9XYCIVg6STzBUj6OmKVh/AMhezpej8H5ONGiK5btayH3zVycUqCuQWGYFh6Erzi8bF9VlFU
	vNyH7e2PaVZah1oZzPmdMNgwEqEz8yGpYWnuai/cUm9OQPugjRSHM51Gh+SWoy+N6sxREfndpHo
	N2iAMfD+bGiwaxmkRieSMWVf5UKy9juFnyRmdL1Iy4+ynvTYUdbGzmFxuBRhWNru5cEK6G5+iQn
	fZCaTogy/U/WxGXKh64VEruQ6wX3vZ2nX5jOlwfl9/8Dl9sxOYBKjq22jKBfrM+O/SiBrtm3mXH
	b4i0bNsANPSrYOLI9SItuj2q+VNza6ocPUVTnhI9/Nz7T38Pl+UGnYgjSVb7GWWHqLR1TiqIX0y
	ajJfjQ2/lluaLUlUJ0IL0HimEVSjbPht94w==
X-Received: by 2002:a05:600c:c4a2:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4bb88807d87mr146858345e9.7.1795267970892;
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:50 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 02/14] media: ov8858: Extract digital gain programming
Date: Sat, 21 Nov 2026 14:31:32 +0100
Message-ID: <9fde79c38b265442d4fba0a12bd1bbf04ada510d.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97448fa75..295c34817 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1525,6 +1525,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
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
@@ -1533,7 +1550,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1572,17 +1588,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
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


