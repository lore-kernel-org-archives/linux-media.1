Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90294A0F09
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289514; cv=none; b=RW1xiLFYqPHjKg5WG6zEc02mKept3rhKdNvsDigaog1tqjMdG2ok/xQBvcG4l7WlJN5jvoBahCUC/VZoE8ZBUw8T9RB+wqlWRA+hCIZxdYpJjanv7F2odxdlVODUAYZsfqkZ/2MgjhSfKJU+dam/JLCm7epc1Hn55nfqZffnOw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289514; c=relaxed/simple;
	bh=oSQRJqNxqEh6/B1/z4WZhyY4jL7gQ546XKgY1JR+lhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HP1ALMfnhO7Dh1yzT+BMahsoIIpxo7yu7ikbHBQIAyBohNrkP8T9xGWoT+Q3jdVGDuWDeIXtIg7vf1M88tCXCvVfR+uyy8Dvk2AsML46/MPs/zlM/G2RxPqnvM+OTH0lUB4SN8fl4QNehu4asvmHD73yOIXdBgyLaWBp6lbdWew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaeuSaF9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaeuSaF9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso2001185e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289505; x=1788894305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=XaeuSaF9xoCUPt3YZhF/YlQipiPTIPLiNEIkDFZrWtnotHduJtO63F3A/W2IlJjqG1
         FFBL1Iscu6QvqInpm6WcHRMrEdl5TsG1h94ZDoC4nS6TjiTAe3xyam1PMQWNKCDK4U1z
         OcvdbMEKo2Ppig1XEpKLqYot7OWUpyXcAstuuqEQslVNJ8Y2FoCGeiYF2ZkrB8EKzGIY
         0r6MZnq2lYK8sZ2W0elLTdYvezjmu+ZZ+FrDgyrEM7ltLBXQFlzv7FBSGHaCvAC2YNHB
         Q6NZ4piliQKWbIoY7yWPkBkRH06SfesDHBc2iOgwHcvfNz2EAgpoFMhfQpprkx3ef+vV
         Vuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289505; x=1788894305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tu8WUi9HrdMM4KGqsLHa/qCPtrxMlvMbqE6rwLVKFtU=;
        b=iTKVt0+sVK/8j0UsN/jC9osGKJjcevXaFBkZv98vLwBazpCdykI9e1d9t//Apuvbq2
         S5hk/PXWM81rGdqxuJkoWvRhhJP7APS9FY5LVLmgaNerND6X/QzUJ0v48tr4XlHM/COF
         eM6mgfwl9nHaScuiC21FQNEXj5XPZ4p8YZsfitXqOQy1kirBBXtnInsIzECQO4fFXh48
         YQ4te72FgJCZesnhjMjZErTYrOfmKb93TtpbKznC/jArLddFpzqe+HYZE0D/I98dMZaw
         xvbIXDGxMH+Y9M5d6W+5s7r1BYX0MMsjxOpujxO8kNQBHllhQRf4+l0QwqX+V18nXY1Y
         Z99Q==
X-Forwarded-Encrypted: i=1; AHgh+Roc4if2uhOLXrQrQiIfCCU6vOhl3/vMlzDz+ivpHtsGc8NBW/N3TpeKVasnx97MigrLZzdOqZDW83Vj1g==@vger.kernel.org
X-Gm-Message-State: AFuF++mze55Tqao4++GG5ZmU41TzTaqHeb3bUf0SL8Ove/4ybQ0a/xdy
	8kf/oX7Y75Aw2IyECjzvoryzXDfgi3MhrCo7hMGoQ1OAnPs7InbDAzpuGAxfX/PGfYiODw==
X-Gm-Gg: AR+sD11NkEmKEiJliMBVLlHcRKuCruUddieRBhjaOWKk7p/xX8cxJ7kD1jarWMAZ5+0
	MOz8Tl74UmpQMJjyTwUbabnQAvjLTUXHupay0VJgWVfGO2KECg6yWFCY0I51SwwyucBIi3eQWSk
	z12gD6O9SWONIkRINzqfsdHW/QiOJovc9lAuDibrFLypbkqwl/3zTumCdEz0AYVPvYJs4ru7W3s
	2d8Z27v0s1LXq5aj+7dt7lxxYyGR6w0/j/2I3PP58eQSayJfF6HZhSbKEjmgYhwvG4znXUnM8jb
	ETGeIABPubfI2wYjSOvbpZZmEH8EMrdniuzdEqCgj3O2A3Cx9KE2kVXTdbS8+y70Imgre+3bqh5
	Tn3lyjSQwGp9xyIv2tCdxK+RQ7ocETPu8oN2U8A404G+apTH4euzewydEuLTY4idXs9wYxnZ0rp
	hVXZJUJQdPpKiPz+1gdOt6dJ9Moaoq9Y/0cCJqV7+MRRBEzST8/5xROZJiYiVEg7jLUKhiE8wIm
	kT1dpENOM2G9iMe6KPHRQ9Cy47XlJivvS+GhYeX2w==
X-Received: by 2002:a05:600c:3584:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cdada30e1mr187530855e9.2.1788289505444;
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:05 -0700 (PDT)
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
Subject: [PATCH v6 12/16] media: ov2740: release group hold after gain write errors
Date: Tue,  1 Sep 2026 21:04:34 +0200
Message-ID: <21c199748bf5b5b0c9eabfbe9bdd17ee665b39a7.1788286339.git.mauriziocasciano7@gmail.com>
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

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
2.53.0

