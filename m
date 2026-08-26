Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA13F58C9
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743574; cv=none; b=QDvpBCaR9iSFx54O8vALavh6LYAX1xAf5WPp9FxbgKqVm2NMPhzCF/gp6MtJtfFNrVaEPfKc5gDdfFMvUnO/H9hYbLC0xzMG48KjoixqXCVnsWQl1BLxTkLpfH3/nr+F/9MewQb+tT9cX/DsI+ZskGgqGH4ImdVRLmhYiZCHufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743574; c=relaxed/simple;
	bh=R0aukX/zIQ2bEID3vNXnke9so/nvJk7DHA7cnmMxUGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJkaE4l56GjFbtRArKysmjARpTiEJ4+tiZfgK5oCsMDAHK0sj68MJAmHshY+ZD9No94VK3bNB2GSgvLjgkstsDC9mcgP52N2yCIEgG1k/h+aWid1YKM9ritHKW/zmo9iNPJiGnvUz5e5ty+W8TaqmGstDMAVf20GWtzEOq/Vrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvuG5iDI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvuG5iDI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482e067e908so513723f8f.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743570; x=1788348370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vggLaey4qEZ0y/Rj4gMOUvoOiUc7EX9K2/SF4mvODwc=;
        b=KvuG5iDI/OJ/mQEl2OP2/meX4tclRBiXeaMMxgFWHCrJVfptQmdce3VtI3kV7ptA7r
         hewHDnsVYHZJs22zdmo3HCUtIsyG6qTAGeBE5HkV8hKwVHahaDne12HxjpnGBA+ZdAWe
         bIS6JLQtaa8rbROxeg8Ih+76Rgezu0IUZgyH6AQapOz7BSoeP1UC2LndN8clDCZ1MxOj
         jy4h1eheK2cR3HR3FLNHXSASqU+Gu4007hcXJw8SWqlwfgS333c9g9XJPPhNx+fXHQdQ
         2GMF5h6KNa/zRiGDA4QIWaLZFywrn/5SYjg4u7nHeCpZyGii2cmEtnKAGYgg8QKkKg4o
         bj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743570; x=1788348370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vggLaey4qEZ0y/Rj4gMOUvoOiUc7EX9K2/SF4mvODwc=;
        b=iB66jdSsXFndcmtYZ8OtDWk3xOhl6hWR4udusZpGDsSGqGoke0ygRu+54OrO9Jxqbu
         Cw2F3KxOw9gXDgd5gewlbt+O3nK/jW4KhGFd+InFOQ8Ei3MxnzNZTPJTZYhwjVFZnsUy
         wGJ+j6BV/8PWZA8xCzBHBIS44jqoTK0n03L0cmZWPY1keP58FHiM+/EgjlLHD8F8naJS
         xKlnUjRlH5tia5BMRvDZcuMW5srywysVtXvsV27ENfJwBSReT5jLRr6JrA0UOC4adqcP
         +UIekUovrCwmyv08rmf8t7W3f/wja/502jKZd6gsikUgYGGbxOHN1YVdCTi5XfeK80OC
         xvyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+TiEecRAP4D1cYuSsmpByZUbVFZtiuCsPJaGboPhRxmBGHll+5cQBSEYJmdYmbneMGZukCO2ZTQz8Xg==@vger.kernel.org
X-Gm-Message-State: AFuF++nIPR5Xmh+6UBWxFdZIZboKagxKV4RhE0iV0k65UQGay5DP62c5
	Js/WBcPQW5MM5dZ8Dc+gBr1c8iST0OrLntxDy5HtEKtYJjtW+Qf3slS3
X-Gm-Gg: AR+sD11fpJCbwGsZSubkMUMUtX7JT95rIAh1tBrCbcuRXuM7GKA++Keu146I/AFd3ur
	bc3T47JnSgrEFW9Bo7U1B2Ekf2bNG0kYKzQRuGYZR0fN6RCIOuDS6je0O/KI6UGN3/6rxXckR3e
	Qokgce7pBkA3EP7LUCwPySkSVAQQMKaWpTYurBErYa2bEcvL02PnRwzF8RL4r2tAEyIoIuX17zQ
	tJLEftOJDJimPxt1dYjoQgckmkaeb6iOBdv3QRzQ0y/buroY3g1y8uJZPhu6plNTsrzxJIy9oQM
	rbzR3VUpE1fzOsEp16tO0pkjiuzBcU0etYkXTMy8jojq+04PCg0MeHWj5ZahE9YQDQDD9qfMjik
	IgK/HY5nyQNeN1OtihWcdJ+57wUCHCUXCShqv94xlv/AcLmpe+5D8+joOgiHhLG1LG+LfVkAGEI
	N6AY4vCtGV6CP+IQrnGHw0PA7WMroaJ4TN9HgbR8Rwujb2YV4klQSopQ0BnQ==
X-Received: by 2002:a5d:5e01:0:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-482e26ed76dmr6833931f8f.16.1787743569734;
        Wed, 26 Aug 2026 04:26:09 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:09 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v8 5/6] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Wed, 26 Aug 2026 13:24:50 +0200
Message-ID: <20260826112452.13539-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

