Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56024E2F0E
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 06:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058936; cv=none; b=Ps/mmLZykDFvBxdlywWkCdHWRQK8oHV6BETIJQ0gFtbLdsJLvXU21d2depUmhkKoyVyIr9KKlTvHS/w9LKkzEXBt0DC7CINPYaRaKqzi+WUfci6xdwCd44l69L0TW6gspgkkZwNZb12jQ8TnEljCbpFNe3YjULMcMRcmSLYHapE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058936; c=relaxed/simple;
	bh=Vu+R/47nvA6CsyN0t24dTNOwXGk/oELWg6WxHC1bXbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERGJRD0gG6+V2ogM3XbEhB0JSlSx25t3XHhHXytCLMyo7QrCFs7kZqZ4yRVqkqoC76+mV2oLRVvuHlLF+GoCS9Cu8jGBjhgREkiQ2lGtpuBvgGyigU26i3v2/G1/J/h5zgnIYN8scIz9IQ+iNAkAGWfvYSuEPIFh6UsoX15QbCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVPLMb4u; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVPLMb4u"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so28106685e9.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 23:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790058930; x=1790663730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKab2b7lNX+8P0jbeNZOEIpA84gtvKGXxFn+uJOJkUg=;
        b=BVPLMb4ujhxO1Wcj3jVFcOgHrsyMCSPRKR8XXr+7CpJ3CnZSritiDShWuBD8VUYSWW
         3vk9XFdC4gBLjN+MewcW/K/Dt/0xsaZQexVZfcEK1f+OqhWmzted8Xv30ucWHPXs+JrY
         CGNE1+CP3VDj3eEPP9CZGxrCov7LcdvcfupjkFYo80DGMk04hHcHPqX74i7IcfOabIxq
         TJiBvybnKhPSDw2taf0sHRfPDNerrRI/091eSpT76KIbYcTPrX9e0O2QG4jX/xHJI6gi
         aVjJ4BvlTifQuG9ouq1ACLVlMQeNfNYBFPdcnNeK1UNMxMDvPa2HE40FaRoeYkpfi7H2
         y3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058930; x=1790663730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKab2b7lNX+8P0jbeNZOEIpA84gtvKGXxFn+uJOJkUg=;
        b=Wxokbp1ACEF1dEd20W/Bm9iZTe9iG1GIo5oXKEPCWBdGePApAWE3G7ZizWmzLDtexk
         G0t0zoP98rW+NNULz5tDtlGNIVddWIXFufp+DNNfAWB2/pMLJYuPCB2c318jIxUaVsyj
         8M+UDmciIZ5+wDZ5ZAuIxDgoLB3x9fx7BGFDYX6PwJeMd59pMPr3+VZhpoZi71hUbcU4
         TqalaNJ7fAEJH6CKL8OMmBP/eVoi8LAqBTBnEo1dWE0LpEH0DkNxFBWQo2cEPTlByd+6
         TVq0QrBbddP0uEt5jdQIGAUYH9Gj4CPyJlJ+7c4BSTvZVNEilKTg7puZnKgiMqDv7j/d
         K0dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwseU1f4EVlHPcbwPHXwLfk4DJWIKpNZIMDHt5i1feUIXmgjVoGcKNv1lzGCiLFrc39RiYxIVEh+8Iziw==@vger.kernel.org
X-Gm-Message-State: AFuF++mnzakgkPOIkMRjMebVC114DtBEFynR2w+R09p0yeUS9ocokx6a
	MyJupOCcNGG05fqQODE+zQMZE01DkdfzpZoLJM0WbVUilbUyP2si6z3w
X-Gm-Gg: AYBFou1GFTftZtdSVMxj09ceHHhvtOOhJEaIZ9dovFaQdrztydF8XVnIEY5A+o8Zz9Q
	DLuvfL9N8bJtkqtA1knq/Gy397MxBLKoy5nKfzk1SMLVNx/QCgUlU0isMKqew7BU4cQFvhTwYYY
	7emOlI+bfnhS2Rx3GY8qQUHRA0WDU07sP6iJlxcwS+46c4uQ+bsdA0ath+o0r5qMm9ujKcRUBxH
	56p1ct1V18CPJh/d6uS0zvLpepHecAaMVK/2XzJIRlLTpTpf/TmCuHUVqY3sh6wm7V7Vgd2pdYC
	Soj0eYDJ8SZYRrk46Z7s6wQ5csYZyC7yZ5kB5rNy7TTqlOh9Pe1HaJNLZ2FgqISDRIRjPYRVKoi
	xCsUucm0BimKjlJAPoSkGHypPMhI/DjMuNsuaqjgUxpLJrHk7HDVyaQnb3Eb2RWAKq9SjTAtvMo
	kGN20OZd7Labko8cNcHUrR/Na7DblLWrQoicteUH4bAD2ngE2R3G1Pz2bZux/gcFKFvTFnlFEuC
	jjakYsuglxErGyhu64gqIh2qYXy0FU9jjQpRfc=
X-Received: by 2002:a05:600c:3ba4:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49fc57414c4mr230924765e9.27.1790058929804;
        Mon, 21 Sep 2026 23:35:29 -0700 (PDT)
Received: from TMOROL-MAD.sanjose.local ([192.67.141.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad3669fsm28551575e9.8.2026.09.21.23.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:35:29 -0700 (PDT)
From: Tomas Moro <tmorolias@gmail.com>
To: calliarifelipe@gmail.com
Cc: bod@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Mars-Wave <tmorolias@gmail.com>
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
Date: Tue, 22 Sep 2026 08:35:07 +0200
Message-ID: <20260922063507.690-1-tmorolias@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260905030732.39196-3-calliarifelipe@gmail.com>
References: <20260905030732.39196-3-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Felipe,

First of all, thank you for the good work on this. 
I tested this series (v1, all three patches) on a Samsung Galaxy Book3
Pro, whose board feeds the sensor 26 MHz. Without the series the sensor
does not probe:

  ov02c10 i2c-OVTI02C1:00: error -EINVAL: external clock 26000000 is not supported
  ov02c10 i2c-OVTI02C1:00: probe with driver ov02c10 failed with error -22

Hardware
  DMI: SAMSUNG ELECTRONICS CO., LTD. / 960XFG / NP960XFG-KC2IT
  BIOS P07RGU.330.240529.ZQ, i7-1360P, IPU6 [8086:a75d]
  sensor ACPI HID OVTI02C1, clock 26 MHz (clk_summary)

Software
  7.2.6 (linux-cachyos, clang + ThinLTO). ov02c10.c there is identical
  to v7.2.6 stable, the three patches applied. Only ov02c10
  was rebuilt (out of tree). In-tree intel_ipu6 + intel_ipu6_isys.
  libcamera 0.7.2, simple pipeline, GPU soft ISP.

Results
  probe            OK
  controls         link_frequency 541666667, pixel_rate 216666666,
                   2 lanes; get_selection bounds 1928x1092,
                   crop 1920x1080
  streaming        1920x1092 at 40.70 fps, steady, no drops over
                   several 400-frame runs. That is ~35 % above 30 fps,
                   which matches the link frequency. Raw SGRBG10 1928x1092 capture works too.
  stream start     one "csi2-0 error: Frame sync error" every time
  first buffer     the first dequeued buffer is always empty
  orientation      image is rotated 180 degrees. This model is not in
                   the ipu-bridge upside-down DMI list; strings above.
  s2idle           7 cycles (rtcwake -m freeze), idle and right after
                   streaming: all resumed, sensor still bound, capture
                   works.
  s2idle while     refused by isys, not a hang becuse the running stream is
  streaming        wedged afterwards, a new open works:

  intel_ipu6_isys.isys intel_ipu6.isys.40: PM: dpm_run_callback(): isys_suspend [intel_ipu6_isys] returns -16
  intel_ipu6_isys.isys intel_ipu6.isys.40: PM: failed to suspend: error -16
  PM: Some devices failed to suspend, or early wake event detected
  PM: suspend exit
  intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
  intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time out

Same tests with out-of-tree intel-ipu6-psys loaded and bound
(intel/ipu6-drivers 71bddb5, built unmodified against this kernel):
identical results, 4 more s2idle cycles all resumed. The s2idle hang from
intel/ipu6-drivers#381 does not reproduce here on 7.2.6.

Footnote, unrelated to this series: I saw one hard lockup (no trace) on
the first stream after rmmod of intel-ipu6-psys. I think that taking it out 
might have given me a corrupt state, had to reboot. 

Happy to test v2.

Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
