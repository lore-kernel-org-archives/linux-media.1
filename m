Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF2A376A07
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 18:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199280; cv=none; b=oJsSz7k98J1zfjlSJwZEQgNtQ9slP7WpoXw7dOUcHHzMzQFQ03xiNIzp+Vo3HUahPEQwRRBQx/GCjfjwKmnRZWdcAZCh0iHdtuB42nKb6YcVhLOYOOTZROp1LdX4zAIZCuTy3QhEsGbZLtkp77yVL/p8gUSQgEV2uZ/nS/UQfqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199280; c=relaxed/simple;
	bh=WyTLm3nJrWyEPC1OlppN/k0EgaQgjfMDm7WlJrB5cQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WLY7eqYsE3vjBQMeBSwB59QFnnLeToD1PzJLoUz/0U9CcxoYv4Iu7rI0/89dmg0L0N7RSgkzelvijfm0arLuaUVBki2Fwt9I3KjnCNNy97twFG7gbgS8V+wyV+fQM9aN6UunGVNPKfYaJB46L0iEg76VP/mp2XMXkCjvjZWaQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVFOhfVy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVFOhfVy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48436216a98so981977f8f.0
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 11:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199277; x=1788804077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=RVFOhfVyiuBLKVMcE9W869HhgXwsmvhC33RHBi9A1O8FINvXt76H1FD63nkDcoEsUm
         3VcQqpJFOaIaUbqsguu4rOvLBtswj7O6uP9dXr/6l1sMZkeBYT8TgfQldtay2TpzHU1o
         2Z0pvSfYWqYCLkQgX1fBsh2HD0maLmFLxInV69O8Bk09qsECnM8uBSNBuDWNHEO47c1p
         xC9w9JcR4TccXEGIe4JukTDzgH8JuZk3FOEfIGHxA8JawS41Xm2hlXx75+2ubIvYkTtQ
         eCLKYJj+KJw3zU8qsT9iBDO/7gZP54/L6FZXheVBBip8ZcFBS27qPkC7cEw4+xE+d1ev
         B1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199277; x=1788804077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KzgUwaQwZkakfwcRSTvIoOI/cqYjfJpPcdCsGPGI/Pg=;
        b=PZZtHkI49P9dDo+pE4oCZv/39RMr3mOQP5/FsRm55hf8/fX0OBvoEbks9p4intLTG4
         AeAzkdwGloWCoJW8S0QpYPdbW4Qlo82F6wSanB/Oq/2Aoy8S6g0TFQGnAZP2jipJFjnD
         zNR0Ewr82Bt8eytYorKEZPHjQcMGYuSQA1wkzRacTLyms1LVwNddPa4OTF9vw1uZQqoz
         i8iR8MhLJj8le+dHX0Y7As8dnFBcCc/DvB6n42QpuMEOpgR49IxvIkqsqfFFp1ExP7v8
         NjmVkI8+dUaTppnH+WHnxV6JEV7SqU39HMFsJelRZPkFA0YtyGToeten5C8ST7WMsXcs
         kr1w==
X-Gm-Message-State: AFuF++nm+MR+iPPjprOkBjCsgbMfB/D0c4PtdcZFkQjOsFEQgj5dQbL1
	mnt1ccYDVh4lg30OAIn5kM4HOF12/3EY38dmT8mWcE4RK8aUk8s0Vc7FI1r4bJX+yCg=
X-Gm-Gg: AYBFou2NkJ5GnpaXct1FxI0uLInCwJcVpFzPnv3CzntDUTXJ0Ob5Q+ZkBF3G09QhWR8
	4IZDeZ1i6i4aPjQceFxVILxhROEng5mH4D4Jht+BPlz6Z3Q+zf43GKzPaRkMtoBRsum+Vl2vAxf
	cBLqSW9OZSVOcfJA7B9o6yhSHv2J3Jd1+foGB68bk6j9/0snN/mzRYkdERHYvDRjp4KssEnRhup
	XJK4GK38tR4ksA3VgeXNVS2WUwOxwB4BMle/NjRTK2iad2dEYUZQ5gr79LtkeKpsn5On7rZsTgf
	7jAAUTAKjr/TA652Pe3jzoy8CSxAEF6PVv4J8ZmuunRPEYlgHfpB00/PmIAw8krLJwHsOFA+fEO
	RGzI6ZHamV7fFHMH8hw3QXvxgV8JKGq2QEDbqyZ8xAktsJvo6IcklsoTOguO/brH8WJm1bhrwsW
	mZx0AX183tnQwF+NEtTJC6ogYlqvpDxZeik+JkxzfwXjosYXEjh6RCvy6yoJDFugQjr6c3Hb5hp
	Z+8J4+1mpttH4/GORHcOMemRmamjf1XLqt9ew1f2+k=
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr43581557f8f.19.1788199277291;
        Mon, 31 Aug 2026 11:01:17 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:16 -0700 (PDT)
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
Subject: [PATCH v5 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Mon, 31 Aug 2026 20:00:51 +0200
Message-ID: <20260831180101.3109854-7-mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
With Best Regards,
Maurizio Casciano

