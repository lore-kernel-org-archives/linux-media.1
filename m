Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE15443A84
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923281; cv=none; b=OhwcqC2djhKRrVS5ws6wNmwBH/yIctw1g6jAphJTDneiRKcX9ZZ2hbvd90B+5khM4Xfa/b218dc9HzFr3aN74QVHL0lxp6gQtpR1H7HjAaiEA9VYbvtiimrzIqbu/ukQGvbYyk7XsGTE9VT60ZgNYzFsU1nEW8W4W4u+xvTjg2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923281; c=relaxed/simple;
	bh=+QD66ohnt4455myiMUe0r3VX+Y06LKc4EFoNUQ4895w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFt2E7QPyeEqpiW/pyPeXgolMajiRLLWoA0kUdUg4AHDEmmXOh0ccVc6FqUzQYSo3wWPvhK/3j+hI+1QE2oSD7av264LqBs/jtge+FlOlJmw4woblhJZ3KNCFeQajsezAPklwy9rpIMlQ0YgxT3nwh+b8TLTdchtvMpuNlP5FFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Piu+G5eo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Piu+G5eo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f96c5b722so615830f8f.0
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 06:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923275; x=1788528075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=Piu+G5eo3IMV7Z7UYX4bDR+4m2xxiXktXBtcmroZkTq+bgzpqlqmtgD8SOJb3K5UBD
         C1/PROj0ylfLYDBMqfPX0JkQiXlOSpCBxe04B+4381DOReKIX13YHM6xDEUUQgKDy5ss
         gseBfYahYdkMK/+Mj3LXAzuKYbq/c51rIik/ZY89uOyhs/j1yG9AENQ8A8+SWLBY6b8h
         iNleWGEgDoLRUgdAr+oMbrbPHePPuj14nPHqQtR6BgBqdhRIrvDfpF+qz+myBUkyYi3u
         j38oEDBaY0uAurVMmRQJ7j+W5IuC5SX8/KmYMn1d+5h4Q+4q+d9NDha7Jdy+IfLQa+eg
         oOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923275; x=1788528075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=C1Wmmw5+zbyyD/fLOnW8iDDJKuB0LjW4DfZuT03eWugCCozpVb9GRhawf/aUxi5HB/
         rB3sbEdCZxSOageNZWSdpsLXOkr/XFPVnTDbFLz/UzRxMJf5UCIMsskZ1kmpUhFRYzCV
         SNpYUYLBymx5NUNlaSOCIOLGK3vPu9TyikCx4jly5Ypzr7M/mUWEvMMmGAK6wlD7s4Dg
         qDaHgl3l6mEQffGQQBCmxbJircV08W9o2htL+xJPqdwJjhPhErVeWnM8kkSA0kesIytI
         +R0s5SyqbhuMWSe9SPOptNrCkh5HqTZQj1FlpNIV+uIJQo2uwNg4xlTrMwT/MzCwkn41
         enpA==
X-Gm-Message-State: AFuF++n8KyCcRbcgYC5s5ntM8zQ4wC+SArXe+Q/oeOHFkSqim8Q/rPX+
	hQA4m3AuF/wJVonw6AF8ij4iAuQTCMZKcdBiFIliHLCyrSvch6KwlnFn4kCPw5lUDcM=
X-Gm-Gg: AR+sD12gD7aqLhwatLIx9TV9UH1W5WcNRnoXZokNtqwlAMRIcsv9EqdADu7rOI7VDpr
	f5eA3p3xAfdYrCrFDxM+GERRjT5TO9y/TyIp0e/uhDLSLVuVsgvBcZoyKJpYkav9BEiXeaGy54K
	eRK/CeWgDNrjNFQjvVr5EE4UCjXZW1FJiGx099gMf+8xh5dhwfTgc5vaUwIYEfLKAM+xs9tppW9
	XRWj2b746nFLd8QFndLl+7LHyybTYfFlACpFCJDAzR4GbfmFYJDAPBPRnv9Aq3aL/B6blwK7EWU
	JBMMTN07OlHRUMrODVfYbT+fapf1ycFbM7zoPvSTI+oRjvlzwaOXGWjK7rSN7eIpfYdKsUP5wNm
	7pZYSYzgCNqXKZMlruGglbLvuhv2cL48T1hR4Zsn8xyw1d/jetBPVSIhkNdQSaokXBbD81NHCUf
	gIu+zBewH2ErRFLzcEX0owgOr2T92uJXQSLhcx2wbfEXjQEcZNI1/F46kOMBsILcNI2AhBFpeOp
	P1YwETN/G5kITA1Gk1TGGlUFlS17he2+R6xFUimaUEAsDYDgisvXBuKzS/MgfE9mcHmwgDYg3Wq
	huXoFyXOVVHmhROb9jb1FF8a+g==
X-Received: by 2002:a05:6000:310a:b0:482:c0bd:42a9 with SMTP id ffacd0b85a97d-482f7992da1mr8545056f8f.6.1787923275496;
        Fri, 28 Aug 2026 06:21:15 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac526dsm3997335f8f.12.2026.08.28.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:21:14 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:21:04 +0200
Message-ID: <20260828132104.21473-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828132104.21473-1-robertbozik@gmail.com>
References: <20260828132104.21473-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v2:
- Signed-off-by placed last in the trailer block (Krzysztof Kozlowski).
- No other changes.

 drivers/media/pci/intel/ipu-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..7d3c7e09f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,16 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/*
+	 * OmniVision OV32C4.
+	 *
+	 * 400 MHz link frequency, i.e. 800 Mbps per lane. There is no public
+	 * datasheet; the value comes from the vendor Windows driver, which
+	 * carries it as MipiBps, and it is confirmed on hardware: the IPU7
+	 * D-PHY locks and the sensor streams 3264x1840 at a measured
+	 * 30.00 fps, matching pixel_rate / (ppl * vts) exactly.
+	 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

