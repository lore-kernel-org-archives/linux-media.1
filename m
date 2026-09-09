Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32B43BDD5
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939733; cv=pass; b=pWBhugbQCmfKEr0AJVtcwzE+8ghz2teCZCkUtPxDEVW3wyoj/csGnmIIuQCFKio2PuKumgNEoDtXtgg4tPVPdJd+ogKf9rbxQjVB0nykjENJ6vFDPF6n2c1XRd+fCh2sjXEWyIC7TJuK9MQIyOZuG6I4x4qaqKiHEZaKFYXhjAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939733; c=relaxed/simple;
	bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=phelLjm9egLCG0Li6L6SOYDWKeNJkpllSeV8VcsKQDWCsMjym0Ac7wuYrIgDOyTfv1HZ9KuYtg5SMcNME5WYWkNfDMxz/V4RJrPQt+y+g4TllXVLvASr2Z3ZKhHduA4MTajSjDsHEmaG9ycHqi78B9p2XP1yedH4SYDW4oxsM/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFOG1k45; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFOG1k45"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66c9995ca60so5195759d50.1
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 00:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788939730; cv=none;
        d=google.com; s=arc-20260327;
        b=pxbnfyhim0jGUljQeUP55j0fVe25QYsGVdxJT5yvjoqyo58bqvlv3RtIPtvDYaWLDV
         5Jwc83cWMxPOqUHRt0PV02JDBCyBkT61sUk2N7YoRIF71dVSuTzLJpyhZ5KJOQ2W7992
         vE5xfdPxBsQh5jjL72avd7EQ5hErO2CwmPsl/RJ49PZSFhyplhoBSYUYc3zpwIY/v4Bf
         V3iozvPg0h2Yr4Rh7ZFzcv+uTFmxEiwq99HCjq85MjHp81JTrBIZXx+Ndm/g8ZqH2x0k
         buGjtyWzgTl8Bh4Fu0ooIDP4ZxQ3B2wyockCEryCkp7qpgI5KSqM0G6DxXOF4ggYuQLR
         Npzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        fh=jxtLuWna0ve3boVr7lcmwLvsbPVhQgL1cFQbspykM5U=;
        b=kfsbNNtnbY/B8fh14/wG6sjI2r5yUMp18nmVHSIc98DG/3kC0TKth+uzikGX/z46ZP
         ok8X5E+Fz9cDtyzXEJHubSbtWJo9Rshcbz01lPhqez7Uw9v0YsFGZdvMG/x8phgc1++q
         VQxya4Sb1q8SQEscx3jU6xR0g8pz3HSHJU8AtHK8P7iJCBepR1eg9TQUoTIpDD3zQjh6
         Ty23kECE7U2ko8V02vVDVS0FD977kFndfq3/gEJ+IVsGIrhEzrK78JIosZ+XAyFUiHab
         giRTkaNU/keRyWfPVRKrPsEsQzJTrHAiI9FqXpKt3ihXw4qBoOT+vzeGx0X0Do0fq+ZW
         lhGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788939730; x=1789544530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        b=ZFOG1k45Lpv0l3/VgXMTjunwQ6GTosElQXSzDo0Td7+P+Spq7h2dDBZvcOYJ0pNQpo
         ypdlakuzJh4Cgxn3xMnHjpkNVs6grFtxV9a02RxvDR9IJgnSAJcafLnmp5vrEt2qJP08
         EfWrPeiNuK9P06U+dWITqQwq/xmgRxYfGld/N9/h9GrOy/v4JFu2s05hEzzBEwyT/XF1
         T4qSAhlVrJF15l9FpGoKKUm9rCs0XR2/4RI9tBtm2b+W6fdD0ImU7ixCgUepGfZPM8ij
         m2on/qUN5X3sNR9RyIEqUy8tDuKkgmk+nohu3L8E0hSndwkSqfjBO4lmkmMVjgYnPbB+
         eEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939730; x=1789544530;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3523oMidcQmtypT8PpooIe3em0q+Lkry14jI2PZd6R0=;
        b=fadHnklRvkI3L6fbsN/NXW9tXkLmur4vmI8wZNy1TtbcEG7TIjxMK0xGxnEGAE7gYb
         /piFOPNNGwM3tXijyuSlkccKOVDUP901g6QyQ0uEVxzDX3Xav1PwoIXvici+/txFIY/K
         4HUEIiMaSTHOIsioABTLYHzOv2EnPZsKFEWxqLtn8u9vu54f/2Jv71jrh/q/4YhjBgQw
         dRJJRwM5ofyEW6X8KeVSiJEys2UzsaHZEiPLKwPWCbWymTXo1CztNqRyge2ZyRXZENHu
         1XYBACKAg50/2yGQHF8u0C04OSvEtA5dqbmU4XyQS1R4AtfhGL0hsio276GlIUOrEZ7M
         qY4g==
X-Forwarded-Encrypted: i=1; AKwUvBynjA3NeKULqBHHoYdyDpJ/Gpk5u0svTY/PjyYWD/Eff3E4h2klVArpLON3XEecBQZEySL6y2/Ve2Sh7w==@vger.kernel.org
X-Gm-Message-State: AFuF++l0sQY5qcHv0oWaQFBdfRIZge0hGgHU4R2wpGRrRnAxCg2Pe8BF
	slPFy/3ao6Wnym+h0lg2BBPG/rO1Vi5gYcvxVE2IA1XKSqVAQRH6QZLpVNnTCIeomBRwtnddARv
	j/D7UcDcB16bsrORzN+oXTbMIdbmSBiE=
X-Gm-Gg: AYBFou1qrLyjbqbVNRLgZ83NrYWIfPA9CpOv+cVxQNZZhg/eHnReaQsL4FHkhIHF0Z2
	DTx2Wr1EOuErHvL47tKemAEPgHwMZwYRDp3c5ZhF2YPhTL6I42015kV+QrhC/2qnLfCHesyj4XE
	z5C/ONBpZ/vvKRhZCpRJJzvwtUzBaw3gUgK7PPB2PXV1KHiHXr7J3MbKZC92lk0gK5//CtNkEim
	2nJI6KI6kqcpcSBQA/1c64c3lQ7JiUDxSll677TGyI5P0k/AvOX9DwZr04bqGoe6n+fmf6mo2rQ
	GRsJcIigiAE9h+aqvMXgFTS375iW+APaKmaMLrtN70ZvXIDgpuWs3ZH6+dEEdN+TUr0mmebDmHN
	UQjIFN9z6cjC2
X-Received: by 2002:a05:690c:26c2:b0:853:fc17:6054 with SMTP id
 00721157ae682-86e6c41ee8cmr133970117b3.3.1788939730075; Wed, 09 Sep 2026
 00:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: AHMAD YASEEN <ahmadrandhawa01@gmail.com>
Date: Wed, 9 Sep 2026 12:41:58 +0500
X-Gm-Features: AcwNN1XiJtBTcT3xawx5grusG2FkFugR3RRjLRX8Nh8TiraKn5Uhw98BhRMFfcE
Message-ID: <CAFJ6yro2PRQAsNwDMRmU8sve6nrXXWVruStgyYVRMcYeksdufQ@mail.gmail.com>
Subject: Acer Swift SFG14-01 Camera Support not working on Linux
To: loic.poulain@oss.qualcomm.com, rfoss@kernel.org, 
	bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Acer Support and Qualcomm/Linux Camera Maintainers,

We are working to enable the built-in RGB camera on an Acer Swift
SFG14-01, board Bluetang_SX1, with Qualcomm Snapdragon X Plus
(qcom,x1p42100). We need assistance identifying the correct hardware
configuration and Linux enablement path.

Current environment and findings:

Ubuntu 26.04, kernel 7.0.0-30-generic; device-tree boot.

No USB camera detected; the internal camera uses the MIPI camera path.

CCI1 at ac16000 and CAMSS at acb7000 are disabled in the live device
tree, with no corresponding platform devices.

CCI0 registers adapters, but an experimental HM1092 probe returned
timeout -110. This was based on an unverified sensor configuration and
does not establish an RGB sensor or hardware failure.

No RGB chip-ID has been obtained. No media/video devices are present,
and libcamera lists no cameras.

A controller-only CCI1 boot test has been prepared but has not yet
been validated on hardware.

The Windows driver files available locally contain multiple sensor
profiles, including imx688 and ov08x. We have not established which
profile applies to this exact unit. Existing experimental GPIO,
address and power settings are also unverified.

Could Acer=E2=80=99s platform engineering team confirm:

The exact RGB sensor and camera module fitted to this model/SKU.

The CCI controller/master and 7-bit I2C address.

Supply rails and voltages, power sequencing, reset/enable signals and
MCLK requirements.

CSI interface and lane configuration.

Any available Linux device-tree configuration, driver patches or
supported image.

For the Qualcomm/Linux maintainers, we would appreciate guidance on
the minimum CCI1 configuration and dependencies for this platform, any
existing SFG14-01 camera enablement work, and the diagnostic evidence
needed to investigate further.

We can provide the kernel boot logs, kernel configuration, baseline
and live device trees, minimal CCI1 patch, and Windows hardware IDs
and driver-profile details. Serial number/SNID information can be
provided privately to Acer.

Our immediate objective is to bring up the correct CCI controller and
obtain a repeatable RGB sensor chip-ID before proceeding to capture
and libcamera integration.

Please route this request to the appropriate platform or camera
engineer if necessary.
Ahmad
