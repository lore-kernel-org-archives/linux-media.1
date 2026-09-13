Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4A361956
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 19:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328848; cv=none; b=SYtAJzIVrqf6AVbwnySl1ssQybA09JooeMVFkHUF7PrZn8hZpJXB678yq81lMQbQSpgXt8n/KeeUIPx9VDeC4xx4gtBipsCnqp0KLC9a2K9Mo+g//IWUIxVNX8hfROwbtNheb7yRd7JLya+rSk0bm8K5rn0cM92cmEEI1W8Dtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328848; c=relaxed/simple;
	bh=Hf5//xZQxmAF2LZTyDFyBNRdhtnQ5F+VLZ4/9MieGHM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QeUiZ4C6x75ylbv8wk/mby43Fhgo3ZBx8RmUvwF0/owTuWVmYPr6L98lJn4XTAA+npyUkewR3VWXw3FmJcQ4JyTYemKothoDbpc+2KCNSl2c4HHX0H9xwD+l/3sujYYEmGiJd2v5elfJWoO5ymd8mehz4FrH75T7bPr5TKn65sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Jlzg+Fha; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Jlzg+Fha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789328838; x=1789588038;
	bh=JxLG4Tep6DW+sI36wXIZ+lrFVw0oeZkOeqX6BfKeLbk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Jlzg+FhaZk8rP3gKiS5KSa+P9HkRR5sLfD8C43uAPeAWZFGA48vKWcLKztLxZbbxV
	 VM8KDjS4zzWFyOFMOcGZttndtEK1Tu9X5V1Mxi0XK9nlF0zSMf7dRa8d8svR1ob/LD
	 5/ZhEZL6d1KBPlxSt3g2IOCONtDytWoOt43lyiWfuQso5CVl/JZL1Z7C9TJVP5y7xR
	 +by9M1XyJrdbktHS6wz446gnGF+BcLkZXsPUzsTeVpiZu4aQNdfs9naBDLhoTtR0FZ
	 LQ9HtTSPVAhhf8NwfppysCFOvWoDBdqEwEqvaCdQiT/uZHVccCGSZdFVB2v4K+O4iN
	 Qw+N8iFut6JiA==
Date: Sun, 13 Sep 2026 19:47:14 +0000
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Question about Iris SID override assertion on Yoga Slim 7x
Message-ID: <20260913194707.91885-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 549177cca1e981bc8bccfe0592ecf664bd3987d9
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Vikash and Dikshita,

I'm testing Iris video decoding on a Lenovo Yoga Slim 7x (83ED, X1E80100).
This is a request for guidance on a firmware assertion. It currently
reproduces on a modified test stack, and I'm working on reducing it to
an unmodified-driver reproduction.

After repeated runtime-suspend/resume cycles, VP9 startup intermittently
hits this firmware assertion before initial stream settings or CAPTURE STAR=
T:

  VenusCoreCtrl_InitSS(506): un-expected SID override configuration
  WaitForHWidle(462): VENUS is idle, no HW is running
  assert_loop(500): FW Assertion - venusCoreController.c:507

The first HFI error is 0x05000003. The SFR names the same source line.
Later venus_c2_parsing.c:1550 assertions follow automatic recovery; they
are not the original failure.

Could you clarify what the SID override check expects on X1E80100, and
whether there is a known firmware, secure-firmware, or resume-sequencing
requirement I should check? Which diagnostics would help distinguish a
driver sequencing problem from a firmware requirement? I can test a
targeted diagnostic or patch.

The firmware is qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn from
linux-firmware-qcom 20260810-2:

  video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
  PROD, build May 9 2024
  SHA256 3456a15e01528c2ba2957ef2b78daefd875841b262dc02f0c3bb03c33cba657f

That hash matches the current linux-firmware main file. The BIOS is
NHCN62WW, dated 12/02/2025. The device tree lists qcom,x1e80100-iris with
the qcom,sm8550-iris fallback.

The test repeatedly decodes the same synthetic 1280x720 VP9 clip, 120
frames at normal speed, closes the decoder, verifies runtime_status is
suspended for 100 seconds, then starts again. FFmpeg is 9.0.1 with a local
fix to requeue empty non-LAST ERROR capture buffers. Successful runs
match every decoded frame against software decoding.

On one cold boot, three 100-second idle trials with power/control=3Don
passed. After restoring auto, two suspended-idle trials passed and the
third failed. On another boot with auto throughout, two passed and the
third failed. A separate codec guard removed an unnecessary AV1-only
partial buffer from VP9; its warning disappeared, but the fourth
suspended-idle trial still hit the same SID assertion. These comparisons
do not establish runtime PM as the cause or keeping power on as a fix.

This is a modified test stack, not a pristine-mainline reproduction. The
kernel is 7.2.0-1.1-aarch64-ARCH-camera1, with camera patches. The in-tree
Iris and video-clock sources were built as external modules. Iris also
has experimental initial-CAPTURE deferral and pre-start buffer ownership
changes, a bounded HFI/SFR diagnostic, and Renjiang Han's firmware-logging
patch with an early debug-queue drain to retain the pre-assertion messages.
The failing session receives OPEN acknowledgement and its first compressed
input before the fatal error. No looping or seek is reached.

Testing stops at the first failure and resumes only after a clean shutdown
and physical power-on. No clock-module reloads are involved. I can provide
the synthetic clip, exact source changes and filtered HFI trace if useful.

Thanks,
Birk

