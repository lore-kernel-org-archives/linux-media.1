Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8D3002B3
	for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 10:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789209277; cv=none; b=dFHrZSGbBk4w4hxjRXrVXO65uemA6kk9IKPvZp7WdIbNjnePcFxWTJ1aNTEiY6+uJOV7sumDwol4f7n9i93XgiJbgAlLbTBLTiTTF3ws1PvOZuwWe2i7gz+Ymz9L3MhVfut+KOioilWn8BI0TPW2FBcxe4jUXKdueWTKGjCf/E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789209277; c=relaxed/simple;
	bh=AkHj1D4uvAnTsmY9xvMRqq1u98CJm1B/o0kzjYgyjxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tos51jDhXF2E1tx/YFZ4avmDclBgXyiBGlvNoDeWJXtudvxgY2AjEI986v2JNTsuRlPL4vdtNw72YMrlPWHOJPFpy0RgK37ZEgEZXD3HUMHLAVzboSJMQ47QhvqoJ4qw69x1FOe0uZwjSd5epaAAJ0a4u+QF0vl4YUG4mFqZ+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCl+RJe8; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCl+RJe8"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so249408f8f.0
        for <linux-media@vger.kernel.org>; Sat, 12 Sep 2026 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789209273; x=1789814073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lT1aNi2yWSuhDHg5i67jYaSBLUSPiuVZ7hWziwrLgCQ=;
        b=bCl+RJe8/3SbHbUIgnKkxuh+PzDGeswNM0rNqN0QOEMgzFUYow+oj1Sy9WcIp5k1Fd
         XLRZ4WdzgC25QpEzObEL+O/84i0VRxDX5HuRFTQYyXJERK0qgJ0IlLqATceNZce5yQCJ
         injDVfyi8oCWydJCv9YrFsS/9XKgejz8cNE910f/ESogKOBTy9Ue1TIT/umikgmhhCts
         Y7U0HA7OoLcGCrWwDBGccTK8yKw8IFeFzunDSwHF6Q9nhLeiV5fGJkhO8HRq4zPk3FL6
         M2ngDoy40sB4HbBJ5SHP3dAMB9dFYffWsteCcgwUO4cVFHot2EzyS29qMDhY9/KjA0a7
         sccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789209273; x=1789814073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lT1aNi2yWSuhDHg5i67jYaSBLUSPiuVZ7hWziwrLgCQ=;
        b=m4yvvVTk+DfoknllrJ1Y67d+ic/MoQ7Mc8gOoDQe0xIpu4E5BL4/j0MpktGysJXkAd
         bpEWQcFj7e4K3P+hh9jikIee3iRgl1frVP6oq8k+3zy4hJquhNc3OX4OuI7xSV+dz9v6
         sznsa9yXn6TKdFh5YKK1f1NWVjOtXZOi24NNVPQ9orPxEDf0iGM4UCKycqm1ZFlnTJya
         yVNH+8gbR7ePNcagu2uUkXI3g0KfMUDirnCdH7HJdVJwd64sgHpqCIGoSNkNpAKjwKTd
         b9jCq8DuBhkzocxwZpRUC3cNwkLUJsTahZtnRm1pPFCU5Cvi+pRhOdjB+pfdZUP2uEIi
         FoRg==
X-Forwarded-Encrypted: i=1; AKwUvBx/52BkhqjonYuhJ9uHaMv23T1s3QJKELmRdBLzDd7SMaVxPc4ivyrCoTpGwHGiMfiXqOmwrNObcdIaGw==@vger.kernel.org
X-Gm-Message-State: AFuF++mJXKVTiMLiRwtH3YT9YTxjyov7aNuPuuGZ5bUzJCwpMPjJf5HR
	Z8JPS6ZovtUPTY4MbgjaO5QTxVvshMEEYsu1csQ2gsy/tI314XeQFq0a6KN21t3TaYpKFw==
X-Gm-Gg: AYBFou2m15qMJUfO8YZNHpxcHVVrC4s1CTNm3OTzEUiQKaqm/R3F56vWB1VaX83ANUM
	KmvVHc7ubeWltevO2UqqGsMCG1ZzFKHokGQv+gau5t009t7v8pyVxhomBFACDoPAKwaxCqKlOz3
	ZiatSbJ5n7DR7H3Fh70UodqP2+3THhS0xpHIJEzRL6BWgSjrLmsQNNcEgC+PkvZpohqD5sP9BQg
	6wkrAirYvsrO8QPgNrMX46kgCynuRN19vSEXh7g9nXW7Caxq2Ivp9DhnlKVRfAqhv0PfBQZl00y
	7NwbfS1qZUEoI1Rfjr1spw9TPpdlevmoqaEGdPP1rDSxNIY4E9qBcCK+ivrxSpUnQJ6Jyh/urVK
	2s6u/auytVmHdOcWW3Q56vZCk5CJ/9w4J5Jg9lqbXQovGtcZqJTO1DJ1azBKAS4nmX21LssBsBj
	2HzUUoLnD9HfO0sxJEc3GrXM6xtq3pHVLPSmgLE6ZkzTCnXEDgfp+5+1iEsPpVN9tgltsLwusmi
	iGUc0+kiCGQCxc7peydpSGXkO1nQt9FM4tFpDs3o5lMJwpIqmLE3ts=
X-Received: by 2002:a05:6000:2501:b0:486:e5f7:89ca with SMTP id ffacd0b85a97d-486eb1d99c5mr9475191f8f.8.1789209273438;
        Sat, 12 Sep 2026 03:34:33 -0700 (PDT)
Received: from DA14250.lan (tonb-05-b2-v4wan-173165-cust581.vm24.cable.virginm.net. [80.194.6.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm11641445f8f.4.2026.09.12.03.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:34:32 -0700 (PDT)
From: Keith Harvey <kthhrv@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: ipu-bridge: Add DMI quirk for Dell 14 Premium DA14250
Date: Sat, 12 Sep 2026 11:34:31 +0100
Message-ID: <20260912103431.15388-1-kthhrv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Dell 14 Premium DA14250 has its OV02C10 front sensor mounted upside
down, like the Dell 16 Premium DA16250 and the other Dell models already
present in upside_down_sensor_dmi_ids[]. The rotation is reported as 0 in
both the SSDB and the _PLD, so without a DMI quirk the image is presented
upside down.

Add a DMI quirk entry for this model so that a rotation of 180 degrees is
reported for its OVTI02C1 sensor.

Signed-off-by: Keith Harvey <kthhrv@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 7 +++++++
 1 file changed, 7 insertions(+)

--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -145,6 +145,13 @@
 		},
 		.driver_data = "OVTI02C1",
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 14 Premium DA14250"),
+		},
+		.driver_data = "OVTI02C1",
+	},
 	/*
 	 * The first four characters of DMI_BOARD_NAME identify the Lenovo
 	 * machine type/model. For example, a DMI_BOARD_NAME starting with
-- 
2.43.0

