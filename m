Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B04A1E13
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289497; cv=none; b=rvdFsgSW8GT2xAObfUHKJi41UnpO3YauAzFIfk/qHzS+zuHyjeE7ewsaI45IHEw3F72okTnsUQRET9TpUrWrCLN9Nn4nnKVrxUnfoD1Y43rBV8kf+65iQwJDQWAyhyh7RfBTvBI8LDN85+JVBPMJhqGeWhOku1sK4wMQKKaNi+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289497; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hmz2NzaD43EmCQ+rX13XLthwlUSI8/hKifV3HkQuXSzUmpIeUjCyZbkAmiHS16LOM5MelOs/VJWJhKF7vf0LXVdiiB52JzUwKtJH1i9bKe3emxvGctV1wl5qg6ren6nI45B+CImJ7ZcpqCNoU6SHEBWhrq1Di3CkjEEATbuAfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jj7A7mQa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jj7A7mQa"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso1205945e9.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289492; x=1788894292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=jj7A7mQaB8H+YSOvaFUtGiPW7JAM5dj6NWzgy3avgUzGJxjE25DyBDYfAhWwIWlYJu
         /bLroceMB3Fp93qXeLSYa6MyyBwdVw7yZ7BfPS3MrIUAAHCamsA5pczQ+HfWSaolnQpd
         Sad2T8BiZZP39gZ3G6R4jhMb+ZdBooYdg6GfvnzZ9+Ddx94ddJMPNKlxKw0p838g9rus
         dGuBAHTQWSITPfgfxH+vnBhz/1eaiqo2mRyHTO6PNGXFT3ivKmhvdChOgKXCM+iE28/3
         QQpRfQFJe1AKSGpUpFtoKh7Ph2yKkK4oAWMYWki9A5ZZbtqavEl5jrUkhcQhr39QoyAL
         Oqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289492; x=1788894292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=qDtThIzIoou/KQDd5Ra7dmsAffd8OgD10etyv+5yuJyuS3lw6KVKlHKMVKMFUqS/Ky
         jqkygLKEJw7CjWItFClprO0BZZKayhENRxGZ8wnj7hBGYAxriC8xlY/OYHYk7fGX9Q7T
         hmYsV+p30+8bzfvqPPZxXTQNsbPyvd/Co+iL3iLLdTfwGBYHlWzalaWdV2MT6aLbjeFt
         KOfsvS8yk9JlPuaJiige4j1Qa21ty6pSnIbdEZgSZnOdKtJu8TurvF70bmkyzyRjwpJW
         YtANcb5AUtDmhWhNl2SIiBtJcNpYAJEfc+/dDsjoeu4SH8q3UPUD6Cj375AuhuYIXVZR
         FpKA==
X-Forwarded-Encrypted: i=1; AHgh+Rq0DIufDA0eMgfd70kIu5BIPIbiKsQqgq3eTMFFLVqX6eJ8kSkYrpnIpTERuYPoJfp6cwqI+b51uP+AFw==@vger.kernel.org
X-Gm-Message-State: AFuF++meTSC6On8hbW6mRqF0/9QUtHuKnVCeiIfn8oiOqNzRp8KmjrZf
	le1I7cZNW8a1e8kMPWLAV6GGO44ecmZd93igAGOQ+9gRQY95C3WxpXRa
X-Gm-Gg: AR+sD12sZk/QrC3iDgYo+IItsRC3VZP0SoL4UjL5PF1URHR2+yXOmQb0NhP0ir+/K+Y
	3fTO6Abi1wm0tc+76+xA6FMaNTZewE3ZwBZTzpQqP0wvO5FMbn8vdYbkD3ege9MvuovIkxzq4HJ
	UCk24d8aQUFiui371cmwEcYaWgOfrdfoh4DD6F7DCscnYnATmuMgtrhRzNxiHLi17D1UbSP5u2d
	3vxAF6xfYIlzrp4ENCgYDL8dA27FQRSm6CVW3x1MbfyLypUKT6VrehSZPSBsGhiLkWghYE95pvm
	dd2I2RDCJuQjhJYevZqSUHr2zzAbZ4gnXnjf9MFMrebZyeSKwf9teROVZKDojPaxRGZBx/mWvLL
	4pVokwltxfXsr0//iCUL94ilPztt18mhMfSUp6daw/TCb24+jTvJALyH/ySPNmHp8S2UKQIbONq
	Toux5etwEFVyowN0DTOGOqJQ/uL5GclxL8Cq02JbjOB6xEAOE7r66coM4HnRp1p3ybMjdQKYFal
	aVz/rayv7qnJ2MFwbmpg/woiXdK5hNOZxQamRw8QA==
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr573053315e9.13.1788289491923;
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
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
Subject: [PATCH v6 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Tue,  1 Sep 2026 21:04:28 +0200
Message-ID: <d76e894ab0bff5604856d7f165da1c4ac7055a36.1788286339.git.mauriziocasciano7@gmail.com>
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

