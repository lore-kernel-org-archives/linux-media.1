Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1974D43E08C
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784565519; cv=none; b=gRox8l3pMbIcjqlEDYsuVBNZTa9qMDK5+Os3g+zN2VQWVDWJzRI0SzvxQbT0MeJ2skBf/Q2eCsKsXlpbHeKdRr8q39v2l/G/Y/5O05V1HBghSjWfB6imRV22WcPdoZwi3baHmoAV4o+ywqj9/+xra/sf6WnmzPG6eaP5w4VvS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784565519; c=relaxed/simple;
	bh=9Ey8YntzkI2JjCM8JaIMzBfFBEia/P3bcp/eqdcteOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/+DAMUXf5fPsJvxLjo2ucaDzWn9aPQ/KuAW7DZoMmvYwg0zAC2Yb7iX1G/Z9N7PdGx3DWi/J6OpB/J7AIY0pMJiaUA0i1ABqjTcCi1v+0XH6A/DoO7084ddAKiOAfda0bWwi5TgoCXROnZflnpdnkczuB9/ZnyKrKS4Wh2V5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qscqBHkO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qscqBHkO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so16710515e9.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 09:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784565514; x=1785170314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6WNEDDiQZOMuv/0zXmxXmcM1lTbXXP2is+b4Ef7e9E=;
        b=qscqBHkO0PePRvW6OjWIjQzWceACEKpQW/6WKW1AeUyY2kFzs+1oqMJbdeW0afhxsr
         CNGkxCZosP11kil0iNtuF6gH07aHEhCUIEjpUIgsBpxIyWwShKhEoc9jCgM2FMwiDexA
         k/kiRN4YspvhR2x53a15z/ewogXj4Vz50onopLcuGh8YuR4ihW3z7P9uLbu/xPtHk5RE
         Cp9JRK51i2PoU6Xq+xRm+cznZzS528bVTBovJrz3JbxJsonuvxMKTwoB9/txtmLHoX23
         jfmjv3R4dwAdFzwSY4roqEn7cTO6w3ddQd+z1lW49+SL/lmJb1BdL8k+DhIG3X+ZvgVH
         vIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784565514; x=1785170314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6WNEDDiQZOMuv/0zXmxXmcM1lTbXXP2is+b4Ef7e9E=;
        b=jtaWibrmSrTwD30oAAWpbGsXLy+H0vRwdcIrsxCDETtduqXCm/cPZFd0GODNRuuZne
         pZ0ZLiU5r6F7RWGwbI0XnpMIaewvdD+S1Z9JUOfQouIF4dahLfNK4E7CKCoDFrnFHsW8
         edvFZhzqBYj1Blze771tExShB7hUG7E870ZbI3jq2H913z+TkvFWjeYijaCJNYyZgBHa
         M6uoCxXuY/3yejTnKEiuxJE9oOC0TNbhri6W1tEgpCebKz9Pqm5DD/aDGrag7o4sPJ5Z
         OtCFHr4Vj/xWAw0MlhOI+6hCChoxHZCqwaxRZAEmUjOUjEUl0IDFapPo6pw4rVDnpBCM
         fvyg==
X-Forwarded-Encrypted: i=1; AHgh+RqLvc/qu/p5vtEtBUI4cxdi0nmdJW3QVPdPOMksh3K5lb06TWqsQo6pEttSWFGakjjqpw6sMQXg/aBWJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTBEIiPe6oKTm5luWVTSiZ4NCs2PbMlbHXHHd73NRsfY56f+ST
	zFUPofj82vP6lhnCUPVVxt95c+MYTHGxpT9xvjhRaVD9p1qAFSwzSZRs
X-Gm-Gg: AfdE7ckLiu/VudoraBaxWdrRcDIVh0yUifs9e/nRbOpwY7VLZWKu745ozQ5za51PN1j
	QwChj2GowEAVNUBietmJlct3ajtWqrEXKVYg5qINDjxdB5ghRykU5dD/1VlU2vOqli4hj5eCJBt
	cT0YFWKkxuXtLyUJ/LwEER/zO0ccJKlXbfiG/GV8FA3Nai1SmAY6HhL6v7fwk0LeY52VRaY6Uxp
	5XjTzFJO6y62/KkXAyyxqlgRJNbPoUdn5lCs7/ADgNAGuw50sLnFi1Sfg6vYTQfWh7aNxq4gYcU
	ICNBP0694FiNhhMYzH9DVLdE4UR2EFVj//ODsQwR7PA1UhsUccxh939wX2COcatuXR8/IDkYPyN
	gwkZgzNg4RrvdUMMlhE4sODnaEV1IZXkQCztw4oOBrRa6vWviBk3w+SBHVXATnn9CpNojR5MRmr
	1jmPSBrgUH5Mbc6OF5WIIeisQAIV0=
X-Received: by 2002:a05:600c:1d15:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4954a3f4901mr184882875e9.9.1784565514127;
        Mon, 20 Jul 2026 09:38:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:4352:bba7:6d7f:5f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565373608sm2105325e9.6.2026.07.20.09.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:38:33 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v3 2/4] media: ipu-bridge: Add OVTI5693 to the list of supported sensors
Date: Mon, 20 Jul 2026 18:38:17 +0200
Message-ID: <20260720163819.104130-3-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163819.104130-1-fernandorimoli11@gmail.com>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
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

