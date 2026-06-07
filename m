Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE1632B13F
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780876373; cv=none; b=unwDoRIu08y7EuaxSRobiMmU1G2csJBBssJTpmKg1aUhGICWmkb5WXpW7OvrBtiAj9F3hX53R69HuiAwU4w++mQwa32xiJ7f4W5fbfCGavZszu0hDSArr4TrEziFoeOmMZKNoFhS5obZN5EELYiBodyW7yOVUV0ZW7qMq0aKqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780876373; c=relaxed/simple;
	bh=ufh/bt+HpOnmdu57+G20N867xveHC6B6siktFqsbY0M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XcNlFKvpFurPzeZ0wdo9bZCXiS0PbJFTO67DJjcfH2o9mOIRCrqNyNQSEb58Q2uZTfAErA/h7V3eo37Q0JTDXXJBE+sb+GnevavV/2FsPCkir8X2/Yy/EqNrc4A1gUw2ydX3QRSMOXnHbRwnSXGe9pMu8YgpSe7yfQLk0+oZacw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy63BJJL; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy63BJJL"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-13721dfd471so4781686c88.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780876370; x=1781481170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1CEBfqUE9wIECCho6qMWghSYdfdGpkpNmzKUQLuRmw=;
        b=iy63BJJLXD0DayyprD/JEq4LBPg5qqn4Gzf727wvYs6uWKRFmxOBcu7Cij/u2BUxkv
         xoWB/f4mTBqdfVLL4v41rEeOp1GKHe9mWFczhMl9FU7jk8SWEy1yVJR4IoOhdYWRmTXW
         ogNC/tMi6mrI4T6zz45+/9oIqNq6TvQ4fktfEqdebMZMz5nyGXGaMQr8Isf0PYk8m1IA
         YZ8tyRz641Ke1wlYtbERJKVCvAIMx+Z407kVRt00Opc0ODv2t7YOeaX2hl0yMUXCHijM
         BcFJJLvgHHdvbVlWHUp35LIUI1ThRR6OMq+R1QxldaWKnmy8AZZc7kkTCfFXWSOlsLhm
         Xg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780876370; x=1781481170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1CEBfqUE9wIECCho6qMWghSYdfdGpkpNmzKUQLuRmw=;
        b=gPFcdmcXhSQDkF+nCzLoICLm+T81Zkspu3pPqLWsw+AAsCWzs/gfkvCkpZmcXgjrXP
         hwGT/mefZqL9HEsJjq1Tyi6kZdlVU8/vNA7YUo5PfnPj0pe7ADs5jluGasK0KeDkMea5
         oRzUvJutPuWOaaQ6QdJG8lBarU/vnN8wN593LVp3pTlUbDVPz0055KkcCeh3/cOj9Zv9
         SfSLtaKzsYSNIatIPIuZ8TmvVvzVyHqABGcS+2HzVr2lU6PSYPqkE6rXJ61fh9R7Xo+Y
         WJffwWufNLE8onRD9KdVNNm36CjKhp7wnfPzbt2ilQBiw5Gq3dne6Vu1N6MMbbls2kPf
         N7VA==
X-Gm-Message-State: AOJu0Yx10VnF9EOKTZeGcB6d0N2NeLWYvTkKo6pnDtvOeldwK3Rrxroq
	216+sR/yCVUsKy/VLaMqGJXUujjfWtsxEud9gasdJ7APFXZPLXO1EjxAz0xdUeQS
X-Gm-Gg: Acq92OF/+sPcqzgQ+pQHuLfnm5edJ9KNj0QIeMkb2WtGURbFpaeVAgHgc6MxpThaY/B
	UOorxv5INbz5IUdg/X7htBcTnOqwskCvi0RvtHUd+0N6q/7kXlpk80h2FBnc5WCs45dI9Pgn0Jn
	9qlqWgWnn1m8VUAaPWOWHM81iKWveEulP3rdTHDag6HejQUy/nIUnDCZ0KtdIaVS1S8n9Voz7jY
	hqgA5Ju9cjhbutp++fQP89eJjZSvgH8uYGDTpnK0yOcKAuV5vrX9RQMfPQA1HbbOS59uk33YwBG
	o6qchLCvWlRbP072HCH8b4CrAkCcsNH8LAt0gT0/F0bAz946jhFI29aMaGcYFtG+fdTpWy5NK8Q
	9vHH9GAstqO2HuQer4X+EnLgug+5pk4TpI3hZTohtPXfEGwWuJT+9RjNSL1NJs/DjBUkdYGqvn6
	1Pe4LisDeg7MBPiKdsDBrS3JryS5iKcx5fELCaR9m9Wmkje8Q6xN46KoYEpF1J93bp7Q==
X-Received: by 2002:a05:7022:618c:b0:138:717:9ae0 with SMTP id a92af1059eb24-13807179f75mr6321868c88.12.1780876369797;
        Sun, 07 Jun 2026 16:52:49 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm11250980c88.4.2026.06.07.16.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:52:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com,
	jimmy.su@intel.com,
	kees@kernel.org,
	ribalda@chromium.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: intel: ipu-bridge: add blank line after declarations
Date: Sun,  7 Jun 2026 23:52:40 +0000
Message-Id: <20260607235240.79804-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line between the local variable declarations and
the following statement in ipu_bridge_get_ivsc_acpi_dev().

Also remove an unnecessary blank line within the declaration block.

This addresses a checkpatch.pl warning.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Removed an unnecessary blank line within the declaration block
  as suggested by Sakari Ailus.

 drivers/media/pci/intel/ipu-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33de4..bf6b9e5ca722 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -177,8 +177,8 @@ static struct acpi_device *ipu_bridge_get_ivsc_acpi_dev(struct acpi_device *adev
 	for (i = 0; i < ARRAY_SIZE(ivsc_acpi_ids); i++) {
 		const struct acpi_device_id *acpi_id = &ivsc_acpi_ids[i];
 		struct acpi_device *consumer, *ivsc_adev;
-
 		acpi_handle handle = acpi_device_handle(ACPI_PTR(adev));
+
 		for_each_acpi_dev_match(ivsc_adev, acpi_id->id, NULL, -1)
 			/* camera sensor depends on IVSC in DSDT if exist */
 			for_each_acpi_consumer_dev(ivsc_adev, consumer)
-- 
2.34.1

