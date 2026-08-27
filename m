Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DB23515D9
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861791; cv=none; b=iXa0n99IRkLzih6i3QoOgzu0arfxYydtBViRylU3z/5FfnCvSFz1Ic6eg7S08GbyYqhWYOyLS7wvvTrCCpmCSh+nVlNDmkPzQFbiiHB+SPRyyhZz5NPh4MZdexP1lUHM6GVCFf+5NmMoNETuTGyl3EpiASqJyTeNvnE007hh94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861791; c=relaxed/simple;
	bh=EJGytrLx4MzUVYSMul27Z0ukuwJPgE4MBoPNMvnDsr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBSPTk7wo90uECRCoJwiDPYD8iznuYUkP360oUEcWzw5CYvqT8BSj/pG7ip1J2AQOPXUSgUcIWtIqzVGDKbKJw+oicZ9+Kr4LTHY+xbHbCGvMCnBwBW+WEaMYsvlmfWzi4MxI3jKMl8z0TnCHz/rW/S0ztHkJsLbC+M+4cl8BII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdQj/ULZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdQj/ULZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso934115e9.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861788; x=1788466588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ptohRIkOkqYrjTOru/sCBYU3qNV90a3HPO3XEYdQu0=;
        b=HdQj/ULZ0Z075T/6nhzfQ8fY1MsXPeaOEOqDEOc4HMnue+MmM4wfsbzDfkS+aKWwm5
         ULZZAlODoOx8CKmWoJBP4tFOHSAj3PRabsPg5cBxSRwIzcevwsBEFyfmdgQuhtNmSCXP
         ky77Qp6G0tu9Ghv68iU1VEsri9MTfcw/oEKe0UUIXGi7x3bRbSsJ/YG7+21ucrNKN0s4
         0j6HHRBFtkfvmUr7l3G9df/Ku1ygcTUCmgM+rK1HYS01KW5EL+KuR+BFGbrqZXMmmpwk
         zFjLqylzjt8ATVMz6QV3JfqbAZzuKphWx0mC3hmrLUGk0nAUn3AghwCkpRDV1u8U3+LF
         73sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861788; x=1788466588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ptohRIkOkqYrjTOru/sCBYU3qNV90a3HPO3XEYdQu0=;
        b=irovgXBS5et/7Ob9crfW4AlAXuMFTXpP6IEf2KByeCy2BnarUHPcK45CrreJvF1Stk
         NLC1SwnfzpSwB19+BvFazbOmWRCzPyweIXHGNfPPBEMAHl8AakzvGN5Qz597pMYkOTS9
         m8NeWe0nYwq1PCnRIcYmCm/Ks+jaJfhssVhA6DOatgvTBaJGMO4kbBLqYoy+rAn0UzJ4
         sb632XPXqmg7KmPbZDt//1rtAxlwOd9vrfnYKWnNzdBwit8l5H7gGBDBvoGf7NK3XsGe
         fPaM3+k1NlIc1au2nX6GZmRKE37AumdtJVF9wiXMsjZuLlXnNagYkeSwfEw7cTxebnJg
         Ir/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Y7jCN+eoeatM9JfcijkLe1hZ51S512fWTR6CY978mNQIdiChq0TpoHw4IHwGVeRzNw4Pt13HXsQJug==@vger.kernel.org
X-Gm-Message-State: AFuF++nCBubErseN8ROwCfMby0RzxZ5Pu+1AgeRWWSoAmtvXXoUWFheB
	sMuJnqHFxjED1P+FO3Rs7GHyoudhxMK+klONE3hKao+ckItm+Is+5Wqn
X-Gm-Gg: AR+sD10SBR5QvRoSOfq7TAF9uv1coYtljCY7yCopnJzT1RPnqNMooAQ4x5u51ZQb5Wu
	bbAAUCMQV8Xps+Y4h6MFe+pGXdNuWprG1YZI/rfQ8WNSZTR0ELMnpIzlsv1KFPNP8t5xvwGY7Jt
	WWcxIZ03eNg+CqTCMx+ZIY3W9R/HOwwy10v1s40mj2TT/YDxv7uid+XCiFYaWX4CmX07vfawCWv
	M+OGWbUEIShirYW3JauGdnECpyBXJ35hVfZXvlgoo9gm9rc1dtNGKLnNKPGxWq4vLd/KyipQmla
	6962+4T6artPe6+07diRIl4GvhYiNKidXCLm6Um8C+ZmCKT3xZXqslujqr7AbBvKAl9TDu9XvaL
	PcNjEzWlEhbFq3S8kMqFIaJNzYtY7IleNGeJStiVPQdDzLHW46MLT9J0Gm6OJvUljFKqC10xmuV
	E7dSmKHQc79oZNflG/AqAXSMTRWJsrj9Br+CRWptoGTKl7Q0T+XuAmqb/I
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-49b91c2777emr25791585e9.7.1787861787967;
        Thu, 27 Aug 2026 13:16:27 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:27 -0700 (PDT)
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
Subject: [PATCH v9 5/6] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Thu, 27 Aug 2026 22:16:10 +0200
Message-ID: <20260827201611.99825-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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
index 32cc95a76..bfca63a31 100644
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

