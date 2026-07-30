Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C13643935B
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421462; cv=none; b=SdEFf1CF3dediVF9U1AVlfdokPULVBTkZZ74M+GF7ouzoeAjrmkwcPN02SncDby1z0lnlcb4ehUAvpr4DeQ8lgSB4s8sX8vBWgAwOQKZVXdAfUNCUStn4oTb/LDv5axpIgJq5Nbiv0ewK+fShfZCjnEY9sNeKcPlK5Rr46MQO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421462; c=relaxed/simple;
	bh=jy6fjv0cfqK8OUdKs2LeSrh5dQgfNVlBq360uPZC/pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uGOA/pu0uT05SpXEg6WwZhsDYzup6BHpPj+5Q3CfBKUScGzRcYcXI5NZa6EbBiFz0xzN1R5NHiMh5pk2rW88jTGZqJ/HIWxa/wZG+0UCJDuslrH4xYwYTEQIPwdnzqPzFSeqPG7fV+i9g0zT7UpzVmi5Q+jXsNZXFx9zFuy/KGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=cWPTTCVH; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="cWPTTCVH"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-907ae240ac3so10636516d6.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1785421457; x=1786026257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfBND7/p3V6NTuW40jYiXQM7HXUmmsqIrPSWotD7dbg=;
        b=cWPTTCVHs0SRR0Pb6asxhPbG8PPRDrpC6fohJ0d6GgVoyU9w3dSaNzfS6OGLpb3BvA
         GEjpYr5B2s4nGkevCZYmmosnwXtbiPPv3J+zHB2SGYWMClkop5PiL2vToR05OU8xvEyl
         +wA6HgbHxqc1bjPJ9KQwz29U0NyiTF4wAMcQKRRWuPlxt/9nkzNQsIfWuSsgby/x5Blw
         DuMwUSCIMzKBVG1GDcPIi4uboEitKjrHT0Jyf0m8yaLFVFuNe3Hahl+lYRR7TTBg/hRN
         crRSObRzZXFaZt9QnzlOKKjwSKtZu2HaqTljrCuXEMxMil1gP5MBt7RONp2mBzWSzwYy
         j2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785421457; x=1786026257;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PfBND7/p3V6NTuW40jYiXQM7HXUmmsqIrPSWotD7dbg=;
        b=RG/eI0DHp3WklVlCbZD3GiFOBTxAmOWCZobDlEyC3zNMWvel/wOkKpN29GgDUZKq1f
         saxr7XMbmcGJYljRmYTYo0Nlg2Q06Hzi7Huc+tU0iTgWL8CXs+RRdLgTyoriVUFQW6ZZ
         fSQaou4Q5dwbRwziU/YxEQnjutkC7Qp6XqL4ZhlgTTgLJVQNcPKTcP6ThDPlqNzPUn5s
         1UcnBNf+asHZsrcjmZP7DTiJ7T2Ten3fyzX4iKcLhzAucnAk59Uk0qYy3g3iG1iUzehN
         mzv87+RXWfZ4yYC0wj5bLtbOB143T73TH9rW4drFIGILUUtrF3TaYsuIKfBjn7EYkAez
         oMEA==
X-Gm-Message-State: AOJu0YydAZastgMNvuYSgqPvcuDYdFglS43gsuXxpPbMap676roP/GxH
	efrSkte/U8kAH4aU0ZkocXCkeKvs5U+MvfzHnwN7IlVS6smYthdvN4RuMTT4IlyrO9QhenSwl0C
	qIOmfhBsnTKhtKqODgObHqyX91anbPQTJVkOL/US/CCTovQMfACFJYeQA2Vgmy0VwgWmcaz+gHp
	Ba8RGFrpJ4jZwdHk42NZC/nmFF49Aog9YGDaWnP+Hl6tQjePvt0Q==
X-Gm-Gg: AR+sD11aWoFGGaa3ZjF6OfBbqeEWx0UBlZemj21O6PioAAEQBLCmxfYdzNYTlsGqk1+
	nkxabROU3+bGo1Mir4/EWTWvJkb/hFFMpp7va/HNl/Ha3JUUupOKKE5R6lp+Lg05Xs3ttyNHz6V
	lTf5NugyJxuxKlYZvhn2HVNIs/exQF2Q5OY0yo9ZbkxeDpMaidcjAlGZoQ1S1Tdwj6tQ0FeWjvn
	ctR2K9wu+s+Bs09zezgE01vhPrdQ6CXEVaF5n+dyrvQZ5PWHud5+e1726TOhrAMzi311X/GkCQN
	/BsESlErTuphcd0dIWIZyfCiNKUL5z6t3HmCR7zTTrpxU/UHaGQWhtCL20kDTnjvuQ1V+C4Gq/x
	DsOeNLnoAEODMrFgpyx7V/U9HWBpfUwPsVp9H+O73jWDDoE97thIxEYP/NAug2zC7Fw2M/dHyzH
	9rlWumoufOtJjvAPBr3mHwGU+EayBQ1Muxvh5YdeLGEO1Ey+ywv+Uc/eRd5qsdfVIpF/wXOw7bk
	lHlIyTbb3IKPesba4qBD2IMkJ0JQkZW796/XQPpoL1BUd0WjinbGaPhuiRw0ghREYh7CsNvOrlV
	SYplikBd4DFpnsSqESNCWxnjRs0ugAZjzas6B/mijo5ciR+nXKoSJzs0KwaB
X-Received: by 2002:a05:6214:c8f:b0:8ef:ddf7:3135 with SMTP id 6a1803df08f44-908347862eamr25745826d6.38.1785421457024;
        Thu, 30 Jul 2026 07:24:17 -0700 (PDT)
Received: from jake-laptop ([153.67.39.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90832317601sm18929086d6.11.2026.07.30.07.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:24:16 -0700 (PDT)
From: Jake S <j@metarealtyinc.ca>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	ramshouriesh@gmail.com
Subject: [PATCH v2] media: ipu-bridge: Add Himax HM1092 IR sensor
Date: Thu, 30 Jul 2026 10:24:14 -0400
Message-ID: <20260730142414.1542993-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jake Steinman <j@metarealtyinc.ca>

The HM1092 is a mono IR sensor used for face unlock on Intel IPU6 and
IPU7 laptops. Without an entry here the sensor endpoint is built with no
link-frequencies property, the driver rejects every mode and the sensor
never binds.

Two frequencies are listed because the sensor is driven from a different
external clock depending on the platform, with the PLL programmed to
match: 180480000 Hz on Dell (19.2 MHz EXTCLK) and 180000000 Hz on ASUS
(24 MHz).

Assisted-by: Claude:claude-opus-5
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
Changes in v2:
 - drop thousands separators from numbers (Sakari)
 - move the derivation below the --- and shorten the commit message
   (Sakari)
 - add Assisted-by per Documentation/process/coding-assistants.rst
   (Sakari). Claude did the register-table extraction and the iteration
   on this patch; the analysis, hardware testing and review are mine, and
   the Signed-off-by is mine alone.

This depends on the HM1092 sensor driver, currently in review as
"[PATCH v6] media: i2c: Add HM1092 camera sensor driver", and should
wait for it.

Derivation of the two values, from the PLL registers each platform
programs -- link_freq = EXTCLK * m / p, where m is 0x030f and p is
0x030d:

  Dell, IPU7      EXTCLK 19.2 MHz, p=10, m=94  ->  180480000 Hz
  ASUS, Qualcomm  EXTCLK 24.0 MHz, p=12, m=90  ->  180000000 Hz

Both are the CSI-2 DDR clock, so the per-lane bit rate is twice the
value -- 360.96 and 360 Mbit/s respectively -- over one data lane. They
differ by 0.27%, but are listed separately so each platform matches what
its own firmware programs.

Worth recording because published figures for this part have been wrong:
V4L2_CID_LINK_FREQ is the DDR clock, while the vendor mode descriptors
publish the per-lane bit rate, which is twice that. Taking the descriptor
value verbatim gives 360960000; isys then runs the D-PHY at 721 Mbit/s
against a sensor transmitting 361, and no frame is ever framed. Halving
it produced the first frames captured from this sensor on Linux.

Verified on a Dell XPS 16 DA16260 (IPU7, Panther Lake). The ASUS values
come from the Qualcomm sensor module blob via Ramshouriesh R, who is
submitting the sensor driver.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -50,6 +50,8 @@
  * Please keep the list sorted by ACPI HID.
  */
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
+	/* Himax HM1092 */
+	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
 	/* Himax HM11B1 */
 	IPU_SENSOR_CONFIG("HIMX11B1", 1, 384000000),
 	/* Himax HM2170 */
