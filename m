Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856143A2569
	for <linux-media@vger.kernel.org>; Sun,  9 Aug 2026 04:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249628; cv=none; b=LCgyAsMvpEfYnuf58CmeLib3OHYy7dDiMv7gj6REyqGPiGfmWVaCgbALl5hT2vzs9HlqhHK21Jp0aM/PQMuPdZ95XMc8+Av7S+VB6+zKWYjJMYVULI7kt2Df6PO8s+5q7uf+bnaw4V2YgJMEaiubqflXZBp6SWyA2bjcjoIzRvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249628; c=relaxed/simple;
	bh=3BLRNn9BFgWPIcjS83UUdtk2AE6DhPirjaUW6ukskX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cjl7qAG+1uPn6U2MUEWprq811oddj1hYVE0WcItZEbPmXRT/XIJGtgnvV8HPuYo2SAD3GnvGpAkY6HrlcJu4ZvcRT0xjB3ojoPav6R3ZfIbghSmmyaDnkeDSQLLNBSOcXZNf1D/1QRGgAUp+61cmiC9MjDCqWggiuBPZh6+X8iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dI65B5kF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dI65B5kF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caea3f742bso13406435ad.0
        for <linux-media@vger.kernel.org>; Sat, 08 Aug 2026 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249627; x=1786854427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hoKe5zyW8uN2y0zixFka7SwpyUgNoPXFgQjUlHoz6IY=;
        b=dI65B5kFr0zS8rqqTyxfAWjU6TLloVMTiFsB7/K9embJBbhLbrgLPvcE8h3FFeOv67
         3krTDnHDQUkiyONcbZ5lLcjypO9pMuCuLFInzLJGHr2HwTGvvfygOeFuIlW97jkap052
         AnIcXmtykopC+EgL0OV0cScdZfmx0fiOVfBUnV9aFslpaT8jCkIjffmewizLkLgaHOnM
         V/FrhndyAqlqzTmYcVUZCfGL+ygsy/SK1N5AVSTyFgCpt0c5QyAv03MElmI+iAxj8ScR
         mAdfurGEalwMd8B4/lEglS/Szd4VO7R+EpdraC6zlpt0rdFKKkrxV8Vg1GicKkHbZXQw
         34Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249627; x=1786854427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hoKe5zyW8uN2y0zixFka7SwpyUgNoPXFgQjUlHoz6IY=;
        b=tE9Jz6eYOIWyqRI3HlIkYHYQpmFO3tbHXq5QIr8MnQ6KqURbYywbzxYq2C9Yyfut4o
         Pp3XJu20fTSawK++TJn9BfxKWRICus/IiS5dikijy4O598RNCwt50DeFRhGIRgStCEZC
         bX2HM/jILAF9BRzekHIfqK8ZbMVxcqK4ZWOe6l+QIHMrDezLQ8T6XNifdmtolFmN5YOg
         MlHCj3ZHYTTe3nRen6AfGZblWvBabaGLe0W0NWErzSeKv2Y9EbtHmmwswWyWRqiQ8VDD
         DtuRo4VTfEz1YGLwG+SvjxFgtUfv6h0IYP5ApQEu4Aouy2jFJa39S1GEVdFCJbTzZp50
         ZfGA==
X-Forwarded-Encrypted: i=1; AHgh+RpbRtSyLASsjIcoouupRYOhn6DbauGg44Mo+q0CQvaPY2ui9XgRChScsYGlxzwLnZpsDqYWqT4jXmgnag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxemYjVS8JN7HpdmbgB1dtf5mgiC5h8S3HDF6de0Qp1i2ZQ7VNM
	xl/fDybcQMp1jQY5/rjuXXfgIFDMI13OkHU+IU03xxHqKEB0VJ6WEv7LCf2PpIbU
X-Gm-Gg: AR+sD12g7cBvw/rU6KRqmsZXDf1kBxL/yuOqQ0pq/dbYKFFu2rwbWGactketqm79xYp
	ImEv8rMcL6FHFCVbUMfw0HNBeRh8A8oipuWMPjTjHY36BQKft6tGmY3y6YpfWhiSvzxds/lcHHC
	ARwwf/CbPnrTFoG2lsqx8N264ABk7M6pdzR0189ci/urvBO4+W2W81vzyzTHtc5bbIrndQJA3MZ
	0KcuQz6vmVnw6a4wR4AQr6wLVHLogdPD4koXz2ZaO3PdafuaQtSohuCMbwLhGlhO8ykmQY5OiEm
	LvW/K7ZUMB1fzu/1GHIR8aRr2rOUmzt4sZwzY3v4YCrWpfG0enW10B3A4dLZpxUpwQK3ifNPIPi
	25RQd4dExIAiKgjvec/USR7Nuj5tdf1iuAV/y348tLHqcr4rb1JBchB31yS33lf2T7XTlv+nisa
	xyAY/Y5FAe64d218idShEomgLVH4qQ4+f5eBQq3bgnVxJfFHS9LCUyMfgHrCmEe43oiOWDfnFd5
	mlXwxvOaND3eX5ZRaTEc41zdVg3d94hON9AfcJd9ALK1A8bWq2C
X-Received: by 2002:a05:6a20:6a1e:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cb85ec567bmr31633197637.18.1786249626830;
        Sat, 08 Aug 2026 21:27:06 -0700 (PDT)
Received: from prof-g-y-land-Latitude-7320-Detachable (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm21659516c88.3.2026.08.08.21.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:27:06 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: ipu-bridge: Add sensor configuration for OV5675 (OVTI5678)
Date: Sun,  9 Aug 2026 14:25:19 +1000
Message-ID: <20260809042540.15849-4-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809042540.15849-1-adee.sahan@gmail.com>
References: <20260809042540.15849-1-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The front camera of the Dell Latitude 7320 Detachable is an OV5675
described in ACPI as OVTI5678. Without an entry here ipu-bridge creates
no software node for it, so no fwnode endpoint exists and the sensor
cannot be connected to the IPU6 even once a driver binds it:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

450 MHz is OV5675_LINK_FREQ_450MHZ, the only link frequency ov5675.c
supports, and matches the two data lanes the machine's SSDB reports.

With this entry both cameras are found and the front sensor appears in
the media graph:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 2 cameras

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 9cebc6a..78fe1f7 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -101,6 +101,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV5675, described as OVTI5678 in ACPI */
+	IPU_SENSOR_CONFIG("OVTI5678", 1, 450000000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.53.0

