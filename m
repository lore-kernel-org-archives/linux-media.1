Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2975D4A4984
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360846; cv=none; b=gkH2uIBjYjq98BMFg2Dg1yETxoNngW+QHpVABp+2Msb6Pvjo6Kz86/BXM8ypJ1+ujvQEP38KmHXgIvUR8Ha1jUVKaBnfc8bIDHI248CdNaFm05ZSqmeDHx9Z2dGRuI7UDIK6SIAW6exvTfvFrrkY6goWNtDfFl6A5u8IQad063o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360846; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQwGHIhP3ijKFPy4ftT1C10cTYrPOVYuq9iekPrappQfC8hGLucv+xQNmggMNMDnyeJY01oVKkKEsxCheIP7NSq4Ye8NpFCuOGm53rupuxqiD7BMNYiSwYN1jfXi45AyXxkbiY+ua4TEvNApg0amRLd8ruSqHxPFZwJ+lnpVjAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0uc2rXA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0uc2rXA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1191958f8f.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360840; x=1788965640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=j0uc2rXAFpFb0VhCOi/yS0YHdIlhYhHeFZdH0QSUcsBjNGzfk/zfSxd9JP9Yd/W6Mi
         GFwAmuQRGvxdXtAf+j8V3vSjjX4ToXx8SrP6Sd5NKTjkkkkZek6H/rTYj0ccg1JjLv87
         3FJf92Wg6GhWlCkr49w/c9vilq53MDXCPmEXkVpDiS2JKyWtmJJFIbQwAFhFOrrhClXo
         dccKVrVofhuS+zBbnQGAMeeXl63WElEnJSGzWu8YjaL9seui62U+jYw85E5pVpHeH2eg
         y0jXilkPuoow0cQHAmqQxjohK6LuEq4OekH9a5TvHhhzILu5G0/+t3VDtmqy6slGAqDz
         TpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360840; x=1788965640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=EWrSigTcPwV4tLeURWOrl8AVAHZWNJrZJLQAtWSYYSSbtokslm6870hneu6bXwaXJc
         jWQHOSRtueXoAW+LY0zj3EVUgZyDs2n0YKyxTiEDtbajm5ZCiCv5+nHwMziufrEGv1Ua
         nHXuwSMzKT+k3Or+btCbM0iX+KVu2Km8HF+ojAtEiAOZhxdI/Nw3xATZWOG2hhQGf46G
         69uAaRLKOidPfcRQifcvtmk72WVVueijWQ5yt/B7dnO9Ot6eUGoEnOCXVAviaEMstjVB
         ZbL+naFCOZhiC7KcjeWPuWrB7bWy9RHP8i2rhdb6fuKYvq5l8vf7ZM7EGb8553kjv3LO
         7IHA==
X-Forwarded-Encrypted: i=1; AKwUvBxFHAziuQSo73faubJpGg1/OhLiYJ8x4Zp2WEt89CU3YeJmkTxY2oIMkfIjkfiVc4fRPSDbZKL7DhE58Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nKJiCWNyrRk/5H0lPqldAbRpHIwiLVeIkWVn9gky0N8E2Xk2j+
	JVWUNxoQ0h1SffDiF2SoUMjgIMhoWXT5XR+WCLyOGnMEpPRGcNABT6dVyKzZOMyGwN9ndA==
X-Gm-Gg: AYBFou2n/L2mG58Qo04sxS1M3+OlLodK5983FAmL6ZS+YLAan/bJGUJmo9HW7jAE9Kt
	+Nao7T3cXWq9+LvqEhKFi439Tv4HaMMUe5uC4ibFJqQgEjKOhsiAcMIciLZ1isQAXVHUqQFSTen
	+jFsUBaOCDJM8KHdZhBKqq61R1SSRSFpdO5Z+aDHEihpOwwx0wgdLrBz9qxzUW+UNKiamA34Hhh
	ntkoaPavHUJGPt8p8jQpiupeK6R7LGD8ew2hy8kXcrpzek2k/AlTrJy2EFztLdDG5oxCrInPZ9t
	Bg85WHtGFFW9Wdu3sqO3OkDnGs9ogcGR+q3aAjxRQYp2UqzQiHzlVscb8F2l6T1CC9/slvnQmsB
	yawkj1Po+4JhXKmkf35RXAO2NzlKHwQqjr3yEYW/nBONkjRao1NJ0a09cWw6oH1HDPsfT5HlDNV
	SkMcb1BA0Eq/XG/RSjNpAkJxmaKOgkWp8j0KvWiVc3HxxUGGdtGrvaU2LxL5T+4ovqbd1WOJ7Ei
	G0i0RiPD4725hfHF7RhnjCw1gHABtUR+FqzSBRbJHis
X-Received: by 2002:a05:6000:4014:b0:482:fb97:2ae0 with SMTP id ffacd0b85a97d-484913b85a0mr10022359f8f.14.1788360840251;
        Wed, 02 Sep 2026 07:54:00 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:59 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Wed,  2 Sep 2026 16:53:35 +0200
Message-ID: <4ccc1be17658cdf9ff1267d66db6c2b5a65d6e18.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
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
2.53.0

