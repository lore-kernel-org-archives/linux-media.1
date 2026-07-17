Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A073FE35C
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294447; cv=none; b=PK30HRoVdZwD2YExk/ksC6T++wbfQtIgbV9IrK0OtD5nLr3hTkacelN25nHPM2jZwXWjFYdJRl9C/t+6zyrTlTbF2fatmcqlW0lspaoKRCMGhM0wWhZJRPiCILFmKWKwePPqfhx/bvTuglSqoTCCtKuaMzsKyje2pHDgv3Xj+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294447; c=relaxed/simple;
	bh=9Ey8YntzkI2JjCM8JaIMzBfFBEia/P3bcp/eqdcteOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETGNrubY14WftX9xaAlmZavx0Fg61uE4bhh8ObdnH9dzT3dv5ZgVyX9eDgv4twGjlANWqkYjac0QA6Y+VvgshuD/LnWnkX+qcFCdUDWpI4VGNs8d/NqCCFrYlSK9RaxxhdyWVWZTjMA4TSqW2C/lY0lXkrJvz3PRtNDkXC+SDwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFdxG4R+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFdxG4R+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720d22c94aso4951323f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784294444; x=1784899244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6WNEDDiQZOMuv/0zXmxXmcM1lTbXXP2is+b4Ef7e9E=;
        b=gFdxG4R+KIdRqQkAuazGH5AfVPLtTf0Djy/L4L6AiP9doYfUSHsjh4Z4b+AHRLjp/3
         Iq+qeXPO3ZHBg/on1C+OzjpgZlelRa/ZfRz2F46hZM8x8pnY62Sc2vdWIR9XqZrPK8ub
         X5wXDYjADsUMhMHaXJX/llNY+QLkL1I60iND8orL5EQctGwlZ5WK+GtTxiJpoQty9qBr
         d6VKrXYwgQs5NwBpJuOUvE87VieXRs/4LFy7464jLD2jumK6TyCkzW/yB8a7cm3Qxb/n
         5bXZw/xI5Y76tixxawKE5Ji1uPn2ol/RgCaISL6LSqEOOGKGJSz7h0PuuS6QYjXHC+NL
         VQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294444; x=1784899244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6WNEDDiQZOMuv/0zXmxXmcM1lTbXXP2is+b4Ef7e9E=;
        b=nh3+lOsF6eNgnhE35VCwr5jgr3qE+3CWIeXMW7jcSBSIftHqGHZ/WY6ZHZBG1k9ovZ
         IqEAYz467VukzadZwaarSs6y8jIAzWvtlqkC/88noQc123blkUDccquECzbBoVwlzTm0
         hBPwS27PIXwFmxO+M6bbaKGv3jIwAPJ8N9Nrts4LEKReD8CyWwX3kwQupNOe6rbg8weG
         C3lpr9sQoa+qs+ZX2fVEYaizfBCqCgq9Dv/xjMw4dQgoQm4tFsAGSXe49m/PE2liReZN
         X8TE+Mb4owKsDgnq9O2m0JL1YKlJbJBMzUEB+s/zhEdJCAob2lkTFyKY8zRHfmKBIugl
         6u0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8lbze8DUysDRW7WffnnZ3txBgq0ZCPr9ebOSBxqcX8ZQRtaeYFATmOGVWAkyqZRDxhL0oGlcVEsT1fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWOYgw81ZxEwMKDnuEJ74I0qSvvuVDIIoI4CPtp1Pb7vuiZEr
	nzYCSU5klvonUiNiHNXzXdROUxE7yIst+xvx9GetjMNgu/rRVoduvcz9
X-Gm-Gg: AfdE7ckEaVUjK5FXQUVAlUWYbmaTQcYjp28tEnp0G2UOUXAps0Ex8YW8PKELQUaagAa
	BKuApinkQEygr65GWz52xwiPAus7VeId8IPfXPbbwb5miGsTY4UmjbnI5RvTlni9o3aO+Rrbtf7
	ZvZs1N6yAWQuvg3R70zDnY/PN51B4+h2XyVe/WMWUFNRKt7nKWDHh0Z+YtQWCC2wLKOU8FbGuX+
	ZXfg5uzOMMhSm67HNrZxp6xw27kX01qEpkxTGIf8GYrdz2/7kIduPoI5D3aUpLEigdi/8Uk0zvt
	TQdlisGOy1KcMzjQCLEiDTGxj/H01F1o/p7CAaVpr0/kOGQkx4sCisCKzbEdqvmEo9/6nVLoYR/
	yDk6LjsEpJKItlY2tHh+5QYAPDUNQuAx7tREvHA8y3CRNgxuoN0OyPeh8Eq9KGgFV8wn8Vh64ev
	6FS2oU3n3mRIf+d37bUq/cnvy5z8o=
X-Received: by 2002:a05:600c:b8d:b0:493:f0f5:f2d7 with SMTP id 5b1f17b1804b1-4954a3e6e97mr31165465e9.7.1784294443571;
        Fri, 17 Jul 2026 06:20:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:f8eb:f0df:1ea8:edb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2eddb8sm98841705e9.14.2026.07.17.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:43 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v2 2/3] media: ipu-bridge: Add OVTI5693 to the list of supported sensors
Date: Fri, 17 Jul 2026 15:20:20 +0200
Message-ID: <20260717132021.18034-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717132021.18034-1-fernandorimoli11@gmail.com>
References: <20260708213633.18392-1-fernandorimoli11@gmail.com>
 <20260717132021.18034-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IPU bridge builds the firmware node graph only for sensors listed in
ipu_supported_sensors[]. The OV5693 is currently listed only under its
legacy "INT33BE" HID, so on Intel IPU6 Surface devices that enumerate it
as "OVTI5693" (e.g. Microsoft Surface Pro 9) the bridge never wires up
the sensor and the front camera is unusable.

Add an "OVTI5693" entry. The link frequency (419200000) matches the
existing INT33BE entry, as it is the same sensor.

Tested on Surface Pro 9 (IPU6).

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4c0..b70d61099 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.43.0

