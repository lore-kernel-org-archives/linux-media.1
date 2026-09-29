Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8D4F4029
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674063; cv=none; b=GmNx8S2qbM7wlcAYVA9nRha9DVC8JJdDsCVKQwIGJ9/0NfoylgWWSKjeej48TRthoN6KjZsPIQ2g+dXIXH9ovdgpqXYKMixoFbDg1wWT86eSgv39RSs6GNe4mjGgdnMet+EV0OKiWOW075OVzAPvxwo/hDRx/yUmqYghK3sF5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674063; c=relaxed/simple;
	bh=O8PhFpxI17oW/vbzW6HN/MPMmKUlMGYmDzM7IKeIbfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BnXJj1oCz67mNGhcmOSQUlSN0G/tajIyZ6gamuS4Kv+n29cpW4ALIqxi4mprxSj1+J/hj2PskqMvw0va/zWckByIvYljtMYHD9OthxN1mfavt+rEsHe/INKjBTlBKOCMH/WBV8vZDFKOa+8gA5uvAydHgNhxMRW0trkw3qM0CL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qn8KNB2m; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qn8KNB2m"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ed020ec6so2652012e87.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674056; x=1791278856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABjDV4UR8/eQ3hvNLqGbMylL6htZv7lqq13CDQYKfE8=;
        b=qn8KNB2mwVpAsk8t4oIXwDd06xCCcls3U2XQgFE1CsERDrAnvht5zLeqMkwXR0y2wi
         SIuuc0zV005J1XEhv6u0KMzEMjAhfI+AZ3uMJrq6dGm0W/a5upqINcxgAK4NWP/aQyvR
         thZDkmcMhZnybsEwhGjErdJttcgKNzBaqgT6o5ZZ3V2RqQhXU/uwzk6/Zk/6oO1qM5im
         n1v3gxDrtOkiGK0mwFPfmlqCGvHiggy+XsfrFrPGyThz+ukn5EikjSbNqeBF0wqb+AXW
         qnWrzyW63H+n52rII+MWbNTZuJITxUvoMSAQicfAtUuJVMJna620EVyIFVqSdIyoPZKM
         4UVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674056; x=1791278856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABjDV4UR8/eQ3hvNLqGbMylL6htZv7lqq13CDQYKfE8=;
        b=A7fEs3ZnjIb2T4NoC8DhIyU73HpTmj7insxpvCBKfOi93WR7fzU+kXBKxcD6i7Sd6K
         ZEcf5im2xLs4CVL+K6+Ul7Cf+8LnjgDNGvQK9GnQ0biH2sm+b35e4VgdbzGD6ZTT+4fe
         wW5Z2J3Ex7uCWbvGvp8oD8pV4seYe4HveNJbdFa3WCbv5AvUsc2ZaawFrHD1ZZq42CNH
         bANHw8vsTQufYcpAAR3omRQCq8d/FQmfjltTJZEu8QmP2yr22ODQUMaXfUcQfvITDNip
         W549eVPOECt/ICC+D50oLiS1I43yj6c8dsR8w/RwLz2+1gUSLa+MlSaKKk7o2O4Q95iF
         LmcA==
X-Forwarded-Encrypted: i=1; AKwUvBy2JVXxPMPlrgLDoORp5odM5lHz4bo/lEfBMyyhNtRSyEMz5ega9p8l3rJS5rPkpXlvFMvezFOy1GK8IA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaevx5aCE6uRay9fpzsQov9b4Nlz1H1E2sxWJ1OdR7J/4lGf8k
	LvW+08sNnDvzdluhbKHXSwn/NL8BuE+NQi9w8V+hFYUouoFxcfF/5uYY
X-Gm-Gg: AYBFou1zxY4zQe/sdgNWeLjGgZ/8vRDI3kdIij5cf4NvKdlDdsfbkw4RET9g93BaRNu
	JeeGTwdLhZZZ+gZf+3fhK8s5UKdpBBry0nHqyDgxAx6ZxrY4Cp6ffJRPNsw7hwYaKCmltOuBF0h
	ClRZesCugIBCYGecrbGFYcsrVCVbC58zoofY8trxq4phetOO6XMOf3QFYIgI57cQmWfJuN+kFzv
	f9us9OiIcLxvGEs4oQQeIuKq7HrAidZ1DqLnbl4/kT/tsr1QSrx+Mjx6buWc6aiXfqt6GGC5oHV
	rg6BvXd7HLGsSUr+XXXefrSkIR50tNS0moNJdTN+Sib9r17f+4CmX9GubSNpctJDxYfuUlN4SV0
	A6eiA33NzpHEXObEkFkfUxJujcm0AQOsaKLpa37Ys3Dbd60DEW6wGSvzrjaSZvi+FO/YGpa0TZQ
	RUhf+CsNHrH/UABJC8Ixi+nYeyt5AGK4W28j19pLttgAOdV0eYoR7/JcsZjv393GJMFq1sAkzST
	jgtBcuYdEKcrCb/QN8eWg==
X-Received: by 2002:a05:6512:2c9a:b0:5b8:f4f4:ef23 with SMTP id 2adb3069b0e04-5b8f4f4f06bmr2313674e87.3.1790674055569;
        Tue, 29 Sep 2026 02:27:35 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:27:35 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 0/4] Lenovo ThinkPad X1 Carbon Gen 14 IR camera: ST VD55G1 on Intel IPU7
Date: Tue, 29 Sep 2026 12:26:56 +0300
Message-ID: <20260929092700.1776966-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X1 Carbon Gen 14 (Panther Lake, Intel IPU7) has a second
MIPI camera for Windows Hello: an ST VD55G1 monochrome global-shutter
sensor, enumerated by ACPI as TBE20A1, with one CSI-2 lane. It is
powered through an INT3472 discrete device that provides a power enable
GPIO, a reset GPIO, a privacy LED and a 19.2 MHz clock. Only the analog
supply has a GPIO; vcore and vddio fall back to dummy regulators. The
RGB camera of the same laptop (Sony IMX471, TBE20A0) is already
supported.

Patch 1 maps the INT3472 power enable GPIO to the supply name the
vd55g1 driver expects, patch 2 adds the ipu-bridge entry, patch 3 lets
the vd55g1 driver defer its probe while the bridge has not attached the
CSI-2 endpoint yet, and patch 4 adds the ACPI match.

Tested on next-20260924 with the ipu6 driver handling the IPU7: the
sensor probes, ipu-bridge connects both cameras, libcamera streams Y8
804x704 at 58 fps, Y10 and Y10P stream with plain V4L2, and with the IR
illuminator on the frames are good enough for face authentication with
howdy.

About the privacy LED Benjamin mentioned on v1: the V4L2 core switches
it when streaming starts and stops, not when the sensor is powered, so
powering up at probe does not light it. vd55g1 does not hand the LED to
the core yet, as it registers with v4l2_async_register_subdev() rather
than v4l2_async_register_subdev_sensor(), so for now the LED also stays
off while streaming. I can send that change as a separate patch.

Peter Marshall's VD55G0 series (linux-media, September 2026) adds the
SMO55F0 HID to the same ipu-bridge and INT3472 tables, so whichever
series lands second needs a trivial rebase.

Changes in v2:
- Dropped the staging ipu7 patch: the ipu6 driver, which takes over
  IPU7, already has the monochrome formats (Sakari).
- Split the vd55g1 change in two and let vd55g1_check_csi_conf()
  return the endpoint parser's error code instead of checking the
  endpoint beforehand (Sakari).
- Trimmed the commit messages, moved the hardware description here and
  dropped the comment above the ACPI table (Sakari).
- Added Benjamin's Acked-by to patches 1 and 2.
- Rebased on media-committers next.

v1: https://lore.kernel.org/linux-media/20260924171820.1179823-1-koreev.r@gmail.com/

Ruslan Koreev (4):
  platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
  media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
  media: i2c: vd55g1: Return the endpoint parser's error code
  media: i2c: vd55g1: Add ACPI support

 drivers/media/i2c/vd55g1.c                    | 14 ++++++++------
 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 drivers/platform/x86/intel/int3472/discrete.c |  1 +
 3 files changed, 11 insertions(+), 6 deletions(-)


base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
-- 
2.55.0

