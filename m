Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD49643DEDF
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206927; cv=none; b=HBQc6Y5jVOAQVP5UY23Q4nKoxITTNr2WZJpK54b21sLcvrxOBCIjR5Wr0ZBmOMtdNKNs3dT8XiCBBSdFtnOIa3sZY3jyy1ipiJ57R0D3A9lRvu5l+indPxTV802RZTEpj7tKPgpfmdkkecyb+uMEZGP1LoEkq/+Z2VfPoYvy658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206927; c=relaxed/simple;
	bh=u9MWO6G5WgY+wqpwg5Usmi42msdZA+YxJQLgulJg7+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQg+/+vx0VyPnL0oW6j41EZdhfuMAQpPNt2vHNVyfmidhFp8k7erD+Gf+jwXVmto48nrvmf1hG5CFV/W+sfwf9N8qU6yFDsS6fuqqhIlyQeKjj7sQz31rgg51ivHxi0GyYndleZ/fJ2IiYtmkEMq+y7/1JudMBTbG3RLYee/DOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZmxxA3P; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZmxxA3P"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f089b1e3so1317948c88.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 16:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790206925; x=1790811725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3WhcGmivvTRyeXr5ABFsXDjq+w53c7qwY8p1nmGDGk=;
        b=EZmxxA3P9llkwhcIVMKIgM9HEDzfMmC1AmVTgucsWnGUhVlIGXCJVarDCaZQdepr9T
         G2C6QeaxLgM9cIQp8nmYgqmJ14Dd8ax2ckGJABWlak7khCLAf4/dGcbvOxUNQF1R/MVS
         iS34v7pxMOe4EC/coYPv84JC42i0i4OoyelTvT5MQjXHQm5NX+QhciriQhQm7aUV5iJR
         gjRCOHJj9iA/zPsUDEzYaqYQvjdhTA4hvs+B8UJWUUIX9SdugxWBX+WLotvr3WL9/rdu
         96kOOl5cCCJXg+Rs5g2P7PdoeR4gBfZJvrvdSrJLVw4FAtEjfKwQaVESsNQpndgX4rin
         pLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206925; x=1790811725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3WhcGmivvTRyeXr5ABFsXDjq+w53c7qwY8p1nmGDGk=;
        b=y/xRbHh4ZTbspQ0w7Gs9Gh49BYUyQWv7Obntav1TLe1AFEZvxTcP1W5+O4uy7pbYXm
         xlShl1pmFy3BpL/X5SoiGVxPIx0/Ih8pRK5UVjK+hGpsa8mYs8AwSke/LkoIuCJL414g
         BzHWa+PliB9t4MiwV9bRJH3EBNBaKW0y2HvlMoC7ZrWuerH/dXsykMWguFO9/fFxfYNx
         M7TYBLeKOCVKANHDt3ZBcJ9IFREk+/m5jK4en2cmANzQ86dNVzcKzgfpUW8EqCX+d7ww
         JtkAJYpAlhaiddr3EQIE1w1YaSNd/XB59TPoywX8hhNq1GG9srK5LPnx5ZTTPO7pnAKN
         I8Tg==
X-Gm-Message-State: AFuF++nEzj8wHCvQHA90c92oh2ZiDA094vFtiqu3fW15cNoPBa9wwfnA
	7PhYU5JjOogJE7LK/amNzngsSWoH1NgX1332VKUwosyTxKjlYkxHXcNWQWsP+gG9
X-Gm-Gg: AYBFou0+Eli2MUJlHX+J21CKmv/S32ssiRZfkL41Lu7l7vI6hcKLxxRfw6+ZJRmC1gw
	k1gAXwJpRuElAwsWs1GZ3runzuLv07vJjRwNiJ+QMKQA6aFa0DGazfCMP83uKa09Svzvgi7wdVq
	Foz3XOoHFwjWHmqrB/ZxMp276mnVtivLUql7z9ass+BFnVoHXoFwOkL6XBbWvPSxPwEUduofykr
	mQ6jl2ccWWwxyu+CALMlAMOd654xozhZUx1tJ1LcKSqWYAL8vWp5cSsHpoE5SKH8HnSlz90Ni6T
	wzOdJibON+ch1BgLRQv6nGmd30MEzi+b6lvgozgoVVH72q7412WZ7zS6fyAUoHPHdIM209eGrHp
	/jgSInJcOvwgosIM4c1hg1cuyt11IfxaTJdJWo70RCwdLACnnnp3u1ZzQ5h1dG3sy/nC8slkxib
	r77QmVQkr5X8oAUUmMDjghFM7Dcy2fjX6Smxycod75vYbuEP6ryWA7eA2zO5fnvyKhTMvNmVncZ
	LqAYFONtJ+YhrZ20ZaQ6A63x/ilTgtdrawCKSsXo7OvgbM=
X-Received: by 2002:a05:701b:4586:20b0:143:7001:7645 with SMTP id a92af1059eb24-1450401c5damr430174c88.47.1790206924708;
        Wed, 23 Sep 2026 16:42:04 -0700 (PDT)
Received: from archsung (186-244-17-112.user3p.vtal.net.br. [186.244.17.112])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98209ffsm8100182c88.4.2026.09.23.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 16:42:04 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v3 3/5] media: ov02c10: Split the PLL registers off the mode tables
Date: Wed, 23 Sep 2026 20:40:58 -0300
Message-ID: <20260923234100.318151-4-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923144257.119076-1-calliarifelipe@gmail.com>
 <20260923234100.318151-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL is programmed partly by the common mode table and partly by the
per-lane tables, which override 0x0303 and 0x0305 with the same values
for either lane count and also set 0x0316.

Move the 0x03xx PLL registers into a table of their own, keeping only
the values that end up in the sensor, and write it before the mode
tables. The PLL settings depend on the external clock rate rather than
on the mode or the lane count, and this prepares for supporting clock
rates other than 19.2 MHz.

No functional change intended.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
---

Notes:
    Changes in v3:
    - New patch, as asked by Sakari.

 drivers/media/i2c/ov02c10.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cdccbdef3..0e5010303 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -89,12 +89,6 @@ struct ov02c10_mode {
 };
 
 static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
-	{0x0301, 0x08},
-	{0x0303, 0x06},
-	{0x0304, 0x01},
-	{0x0305, 0xe0},
-	{0x0313, 0x40},
-	{0x031c, 0x4f},
 	{0x3020, 0x97},
 	{0x3022, 0x01},
 	{0x3026, 0xb4},
@@ -303,10 +297,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_1lane_setting[] = {
 	{0x394e, 0x0b},
 	{0x4800, 0x24},
 	{0x5000, 0xf5},
-	/* plls */
-	{0x0303, 0x05},
-	{0x0305, 0x90},
-	{0x0316, 0x90},
 	{0x3016, 0x12},
 };
 
@@ -330,11 +320,17 @@ static const struct reg_sequence sensor_1928x1092_30fps_2lane_setting[] = {
 	{0x4d0d, 0x00},
 	{0x5000, 0xfd},
 	{0x481f, 0x30},
-	/* plls */
+	{0x3016, 0x32},
+};
+
+static const struct reg_sequence sensor_pll_19_2mhz_setting[] = {
+	{0x0301, 0x08},
 	{0x0303, 0x05},
+	{0x0304, 0x01},
 	{0x0305, 0x90},
+	{0x0313, 0x40},
 	{0x0316, 0x90},
-	{0x3016, 0x32},
+	{0x031c, 0x4f},
 };
 
 static const char * const ov02c10_test_pattern_menu[] = {
@@ -601,6 +597,14 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
+	ret = regmap_multi_reg_write(ov02c10->regmap,
+				     sensor_pll_19_2mhz_setting,
+				     ARRAY_SIZE(sensor_pll_19_2mhz_setting));
+	if (ret) {
+		dev_err(ov02c10->dev, "failed to write PLL settings\n");
+		goto out;
+	}
+
 	reg_sequence = mode->reg_sequence;
 	sequence_length = mode->sequence_length;
 	ret = regmap_multi_reg_write(ov02c10->regmap,
-- 
2.55.0

