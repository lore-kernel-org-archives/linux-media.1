Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4D361DA7
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784447848; cv=none; b=ARMDFAGBH0EcEvKSeJFSeG+ce5HQjv+WxxugwsWmQkgflxwHXls8Iinu3fKr/YzD2LhgyFr2qwZLenOXlbQIvu8m3yKs/S6R4CPkNBSKlewpl68Xikg6fgPqQdC0ChzUN8lRh9n/mvuZhQ+naVmES0xgE+QMfv5TE5tygPHTQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784447848; c=relaxed/simple;
	bh=3yxN3JLMz5HeMWbW4rU2gcByYCQ0hs2lAw/7HuV8onM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lRaHxVxqOmfkvznPmR3aBEoitQahqC7ogARigQnbaFpMnKXA5/JN8O1lPwO4PHvuO+HhPSNfTws6pidVbNtbf/kQjsBqUSI3NWgSXVbvXUtFa+lsGW6jzH++ZTFFrbqi0auujIIeVbbrWtFjG3jvY5gzK0GDQi6mQNeHns1Tz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC98Hcz9; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC98Hcz9"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0148201fbso4712438e87.3
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447844; x=1785052644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGNTlYZeZ9y5GtryS11RWRHWM+QBhlggNxIeV3niO+E=;
        b=nC98Hcz9TARrEEOxJReyutyWWAp9LuPsW6QBFlr5Ca1DG9SL4EjKso0Q+sip+S9gBm
         v+qa9Vr3bMW4Wo8u9fjT3Sa1dHkACFJkduOKQuxSHXReUeCbPySMwitsIOjeLc3Oj1sD
         DU29x2cbJj8+SolvwZio9fGeTSQA0lWMC9vbe2s4VyPthdV2dJqoM2FAmPrK3o0WKzGd
         g3zIjtcUM/MAx6L2PzwpyfwumcLXTQOahbMLij7YAkMc+gwm99j99NuLVPyV703wgHfb
         wi2QWwZwmrBfmAvWbBsrtrLE7giEpNCWiqpfGMeYhyZlKSu8Ia0MlxSvsG0x73qLsUAb
         JFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447844; x=1785052644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGNTlYZeZ9y5GtryS11RWRHWM+QBhlggNxIeV3niO+E=;
        b=k0NJaekMOb+gTsZh09T7XZWkirwxvRHC4Kma5nBz/coo3Py4gIGV3EoOevUt9cdUJE
         o/NhY+/hf1A3pRFghRlwrAAfo+iTVlYlG66Pgkyu7jtmBHVCjPiBMelZaLkusrXUlgAv
         QXLvSXLteOwI+ynpZDodzgdR+w895Y1tcc6qBPXjoVQxzJ3coZuCkXjb8n6EoAhOspxA
         bhtF9B85t7NRA1c90+k7xRC8A2xjWtm0CuOfzZrdg13LfKA6Nwqvpfrt8lw3Cg7WkYYP
         MBHWhcSnMXXt0KRzvemPJB0a+1jZzIIsEtCbYS4CfyoAToCH6cuVJ+d+2M7POu/kbFtH
         QQVA==
X-Gm-Message-State: AOJu0YySq0QE9rzLozgEUBKUCEWsR/B42dbcMDW6D/WYP/pFQeXtWygI
	vOFdpAebjI0V47LOPi9jkYA+aw3tlcd4C39noJA1564g1uqtwQ847U4R
X-Gm-Gg: AfdE7cmCwROIyGPDiwg3eT8j9QkNUNtKEbjvzFYsy1m3TzlZcQx++e/+1ZRu31yf8IE
	hq9qzducHa5+RwvrY9uEmDw4PL0TTsCSySR3m+YaQCZ6yxAWGIgxcQ6csP/Gn7epYOWbvAeLKAk
	G4AjX4dNpkDo/QWdAGFgd2dTpfIQJyLI3hUpCH1mXsCxFzDGqg6+h8JrFoCs43JgYHNoG5F8n6d
	w9fXoXbovYP5PYWFN1sukZIU5fPj2jxg28NZnFJcxLJlisp4BewoRvPpZx/Lz1T9cdH6FKUOVfP
	/fbFUTlr3Q2iAsslsf+YOlYA+hf9hfrRY1kcqOq6yyRHot8F8eHjmvjSZDv/2UHy2msMNX2Mdmd
	x5NpIJaAvGEQHT4OhXFEvsrGWc2uYqwCKpOFo/4AXAuJc0Ya6XTopQYy91e5+fmyqZo7mVfyOXr
	9pBeghqzxQOJZyc3psuHY0SwCbD3QOeSw+mBmo10S0yrjp/aMl9g5/1/RysGY=
X-Received: by 2002:a05:6512:398b:b0:5b0:eda:de2d with SMTP id 2adb3069b0e04-5b28f8612bamr1938538e87.19.1784447844204;
        Sun, 19 Jul 2026 00:57:24 -0700 (PDT)
Received: from thinkpad ([5.212.61.200])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e0ead7sm1555983e87.42.2026.07.19.00.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 00:57:22 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-sunxi@lists.linux.dev,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v5 0/2] media: sun6i-csi: Convert to active state and improve MC support
Date: Sun, 19 Jul 2026 14:57:12 +0330
Message-Id: <20260719112714.72802-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series modernizes the sun6i-csi driver by aligning the bridge and
capture components with the V4L2 subdev active state API and improving
media controller integration.

The first patch migrates the bridge driver to the V4L2 subdev active
state framework. The private mbus_format field and its associated lock
are removed, with the framework-managed state becoming the single
source of truth. As part of this change, the capture driver no longer
accesses bridge-private data directly and instead resolves the active
format through the subdev pad API. Since the hardware does not perform
format conversion, identical formats are enforced on both pads.

The second patch implements vidioc_enum_framesizes for the capture
device, reporting a stepwise range of even frame sizes within the
hardware limits.

Hardware testing performed on LicheePi Zero Dock (Allwinner V3s):

  - Parallel pipeline (csi1):
    ov7670 -> sun6i-csi-bridge -> sun6i-csi-capture

  - MIPI pipeline (csi0):
    ov5647 -> sun6i-mipi-csi2 -> sun6i-csi-bridge -> sun6i-csi-capture

---
Changes in v5:
  - Check NV12_16L16 format in enum_framesizes based on Sashiko feedback
  - Dropped Rb tags due to changes in second patch
  - Link to Sashiko feedback: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/22UBXCNQCK3JZSSWMDWIHRIFNAZ3EK6V/
  - Link to v4: https://patchwork.kernel.org/project/linux-media/list/?series=1129723

Changes in v4:
  - Remove sun6i-csi MC centric patch due to Paul feedback
  - Link to discussion: https://patchwork.linuxtv.org/project/linux-media/patch/20260509050921.22158-4-arash.golgol@gmail.com/
  - Link to v3: https://patchwork.kernel.org/project/linux-media/list/?series=1091921

Changes in v3:
  - Fix Media CI robot warnings about open parenthesis
  - Link to report: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99380724/artifacts/report.htm
  - Link to v2: https://patchwork.kernel.org/project/linux-media/list/?series=1091728

Changes in v2:
  - Fix indentation in link validation path
  - Return pixelformat directly instead of a pointer
  - Link to v1: https://patchwork.kernel.org/project/linux-media/list/?series=1054768

Arash Golgol (2):
  media: sun6i-csi: bridge: Use V4L2 subdev active state
  media: sun6i-csi: capture: Implement vidioc_enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 155 ++++++++----------
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  55 ++++++-
 3 files changed, 114 insertions(+), 105 deletions(-)

-- 
2.34.1

