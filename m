Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682273612F1
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148080; cv=none; b=pm967ahXVF5n05+g57ikarzxz+qBXLsOKJDaZ+dzi/EaCnwfp2bI/hJz29HFVc97UGE/ncMlYMlAoMfPEiQs4za2L/MJhjXYI6D4xodVO8ByKhBncfu9mKPmAnHY37CqiLuFiqnnHl25BY6D1Cejm2mfdbZ82qHilEoLMbvDQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148080; c=relaxed/simple;
	bh=itH5vmH4tVR+3dyIjlnE+VC3GoAp1/pzlJwsRfBI9QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foKBfuNnfMqA4gxPDlsJPeoo31xsquoCniNHLvJIfxULkrKurPHLabdXM4bhge3cQri0RzgA8wG3m6YfCql4j+6MnbjuoG/f368albAvAI+mPnc9IWP4YXC4VP5gqq8QuU/FrGEbqHLAjdEhs/XmRxautWS4mw/FKQPkGjSYqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqyQfNtw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqyQfNtw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so7110665e9.3
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148076; x=1787752876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rV4HdDBapWRU7n3smij5X8vxur3rm1zQnAK/uJTwVYY=;
        b=rqyQfNtw6SE55wEtw85kpbWf35WR6bwClsJcXROraDRNNnZeoGeWlmyfADXuzC8iO2
         NBZINW6tTEAHnw9YmYhiZfwQgvuLmouxVmQ+WsHoDSqdMFv+oEzR0q3CmMt7dpmBz6cJ
         zMLbx21Vs8LbjrTwBytAG/SDOIoZEC02Mt99fTmDszt6Dvfyivb+S7Fpnyyac/P1fiXD
         6/wwJENvVe6fqY0FwGSfrThuBG/8K27x9Z0k17IvWvDIXwQ3iG7Vzvny+2qH7+Uz2P01
         QPHsKpSbHlwSDxM7jlFjOIi+a+RGYQ8tcyyUmqksvCe/vbIgFJSph4GnvU9OUjsnbhDB
         /s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148076; x=1787752876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rV4HdDBapWRU7n3smij5X8vxur3rm1zQnAK/uJTwVYY=;
        b=N5HeuaNV7gk3TJhoEjzYR7RsVXgbzz4QmL9qsux4bexjAG+Lr+qw8MmFIQJ7B5wXZr
         pKLHFyUHti29W3K9yqV1KIKv4dYDkgu6a5iVb8diFkVz9uENTsU8ssPEdFSl7ZgwE+v0
         YLZdJO1r3aMNXNxhOj3pBOqDQ4x2s81TX/D/0EpTitfBTQYzlP2M67U3cdhxr9owreov
         rhdWSArsSH2Sg75AdnBFY04C+M8qkirQsr0p5xVxeC4V2Pbji8y9gzuJC386wUtQUrS1
         1YR4ECOF+OVQW5DvA5K7KN9kVi6txCm6J1aXbvETyjX2VJ8z2n7JgncuL2CXNSihM8vf
         xbsg==
X-Forwarded-Encrypted: i=1; AHgh+RqxkbJRN8p8FchGDInZmy24Os8mmLBFRZ8w0yPRW91fQ7N6L7zlZ4UjeuX28kfacnxI+MqMMg95obulEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JS/YVvE4Vc8F1UufLPQSWQE8MkpZdJFIZ5PTQIxBYm6/bV88
	jIRJuctNiL9jtLSsevdR4sek3KYhuySy36maaATfW0MiXTXGI4hE0HJg
X-Gm-Gg: AR+sD13qLY5l1hoL1OVQnuZSj5ikyI0xfRTwX5bFhSfTWuHXv0W94IXVxMts6/gp1Pi
	N88v3kWqyqpRWHcVZ3hyfhMfJHoRZWwb125vAQPxw8DMoVAt2zkxAWMK5ZtdLh8/S2tgyH4FCLs
	2d4hX/bajnveXbLqJkUxe3LIZvGBwDH/8cxlupNLf2MjVCmEHPSFAedpLNa1d8+0KSClycmqN5j
	Mir/Oi/L+FBYTSup31uzU7dTOAjDhbhwyjQGRAXVxpZgl34+Ie1hynRPFRno8drii7DUl3bB+0/
	pcInvCJjxYNOalr35GIrnPP3VXQ4QNSePoOkKY8+eZt83w7q8/xPHtzHgNBS+O8I9chZehNcTl+
	RyuT3DQnXjzHRPLqjDvLsw3OXJtsRPlcaUyC4zNJjYw0wdPqjQ1+FN9smErGtjVH60O0QCz96+p
	/eh7AGPbwDeBqX8glLKn/XZQIJB0Vw09DKLDN6UCR81+nZxGtXZ7qPFqo=
X-Received: by 2002:a05:600c:5291:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-499aa189357mr100576965e9.1.1787148075598;
        Wed, 19 Aug 2026 07:01:15 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:15 -0700 (PDT)
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
Subject: [PATCH v7 0/5] Enable cameras on Dell Latitude 5285 2-in-1
Date: Wed, 19 Aug 2026 16:01:02 +0200
Message-ID: <20260819140107.1329091-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

I prepared this v7 at the end of April, then went on vacation in May and
forgot to send it out - apologies for the long gap since the v6 review.
Nothing has changed since then apart from the v6 review fixes listed below.

Per Documentation/process/coding-assistants.rst, and following up on Sakari's
question during the v6 review: this work was developed with significant help
from an AI coding assistant (Claude Code, by Anthropic). I used it to help
reverse-engineer the ACPI/TPS68470 bring-up, iterate on the board data, and
draft these patches. I have reviewed and tested all of it on the actual
hardware and take full responsibility for the result.

Changes since v6 (addressing feedback from Sakari Ailus and Hans de Goede):
- Patch 2: Move board_data lookup and clk_pdata setup to after the
  device-type switch, so they are only reached on the Windows path.
- Patch 5: Revert the supply name reorder (avdd, dvdd, dovdd ->
  avdd, dovdd, dvdd); regulator_bulk_enable() does not guarantee enable
  ordering between supplies, so the reorder had no functional effect.
  Remove the now-stale paragraph from the commit message.

Changes since v5:
- Patch 2: Use a local 'tables' pointer before the gpiod_add/remove_
  lookup_table() loops so that neither call ends with a bare '(' (fixes
  checkpatch CHECK reported by the Media CI robot).
  Also restore the missing VSIO->avdd consumer for INT3479 (OV5670):
  the v4 refactor dropped this entry, leaving OV5670 without its analog
  supply and causing -EIO from ov5670_identify_module().

Changes since v4 (addressing feedback from Sakari Ailus):
- Patch 1: Drop the data == &spt_i2c_info guard from the probe condition;
  the HID (INT3446) + DMI check is already precise enough.
- Patch 2: Revert n_consumers back to int (unsigned int broke the
  if (n_consumers < 0) error check on skl_int3472_fill_clk_pdata());
  restructure probe so ChromeOS and error cases return early from the
  switch and the Windows path follows as straight-line code after it.
- Patch 3: Correct the VIO description in the commit message and code
  comment; drop the inaccurate "no enable register" claim and instead
  document why VIO is kept always_on (voltage must match VSIO, no direct
  consumers).
- Patch 5: Drop the paragraph explaining the VSIO->dovdd mapping from
  the commit message (implementation detail belonging in patch 3);
  add an explanation for the dvdd/dovdd reorder in supply_names (core
  power stable before the I2C passthrough opens).
- Patch 4: Unchanged.

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04
(kernel 7.0.0-28-generic).  Both cameras working in Zoom, Chrome, and
GNOME Camera via PipeWire.

This approach has also been independently tested on the closely-related Dell
Latitude 5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by
Vitalii Tytskyi, who got both cameras working across boot and suspend/resume
with additional 5290 board data, and who separately identified a
hibernate-restore fix for the TPS68470.  Dell 5290 board data and that
hibernate fix can follow as a separate series on top of this one:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

Thierry Chatard (5):
  platform/x86: intel_lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: fix clock consumer registration for Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

