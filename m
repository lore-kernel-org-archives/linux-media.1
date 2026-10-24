Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809660;
	b=jIhMJpxBE2NOjaiY+DZKbaK0aBD0WUEUearaKnuOb/oJZM4nD1upbcewU7QwdOK+o+Rn
	 14RvCURGliy5O0VDkB3nvPIII0o3oS8G49uoFwePXTW7yqAUPF7EJENXK2ci2PoGTsYNZ
	 3sbk/bhre8PJiTUYGFp62s3x8mDc5+DUZE3PmUJsCO55axY9oqWh8Wgxf4w51ltMJrcvy
	 VJaYa1wnrRbq/Kkzdj9rVgovA2BA7B4NeS7R7Hsfix/Nrzj8ZKcMGg1BcWkWRDf4RZLN8
	 RxSGzCLYmEVJAniYbPXDVGSP8OiWNthBB5LHVdlnH9t/o2OnCmoMQ0pLFmlm1ZU4sZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
	b=iF0Lxhfo4dNX80XL0LtUwVEUZzbd2PVRKcoA2lM/nFJJM8AlNI7mcwLASnNYVE9dsrp9
	 xrrRZT419PLmHLrv45+KIhzxwk7uKYM0Zeb16VYW1fKoBDJqvn7Wjs3FIuG/5k3qlGvZb
	 1xEEabzGM6dz3ab/i3/g+ixrxlR/gPyNNBcndwcucE/Jkip79h/mxB57c50naWZKzF/R+
	 0BmkQihh0V17LS65xRe/Uobb4LNXQqMaN7lgQmnHj9SVAHU30s8oFhiffxJIcXDwrHY5u
	 7khi7+s06TvI+Zh8B1iofDQTDBfrsLrFCoDonaMI/LSS/Ip74SOVHClu5PmtgObvivg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58227606A325
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58227606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b1jx1KTN
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917a6dccc60so16522346d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809658; x=1793414458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=b1jx1KTNxpYtk0D26oCx4jhvPEk0vYhRmZpnl5znUQg3qNFXmRrBjJntRKJJkfCVd1
         2FUP06UB8zo808hn+ke+HEmT7VKYpChDPP4k25cPQqi3apwjTmsXZLyIDzjo3atPyzKv
         t+5oLTjVY4ZQbtq+fpS8jBEfXV/SL7vMIMNhNnBn4BKwC59MO0zyA28u1heY1u5bpY0B
         Wc4qiqBYIUTmpfOrrx/lbiUihMi9lZnExf45fzvqXsIPXEkXWn90UgAGC1wn68+cP0Rm
         0QWgpcYEc+7/0FuxPVsPe92Mjk8lqo9J8OdFoXhFgOOJZj6BJAhykZ42RJcld0v0MZru
         JOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809658; x=1793414458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyxLFL3v3aOd1FtHeGOANRa81M315sVflTjGuyXXt9k=;
        b=BEtJe3OcLrGcpA8+mEIbqMVIYBy2Feujp0/qzKW+q0OovutthFOajLHnrVQV46XDYK
         uH/u0dKIie+mfoXljMNAA30YsVdjbgOta9Vq/1Xmw0+rGmp6RVjEIF0Hmo0etFVCWE2F
         FbXQqbfcgLg6tphbkqv5340BOrbDqAQ3IU4DGMVIUooNH+gg3/9fGRHF2Ab11Mctxsfr
         gT8wybMCZT9v0COTkwrUoR0WdQGAbqkXzyqxTard3x5W9d+e7UVzxMCFz4watx51LgHl
         NrEXddMuXiEN6zNr1STBUL+p+W7g3SJkHICm+BcMzIa91yNjALK8in8YvkIRnYdkKk1B
         HBKA==
X-Forwarded-Encrypted: i=1; AKwUvByDLJQEHcRGM0of6WWAc1UmdwYv6kgEP6+flA7I9sc6DNrsof2LibOW1obcAUITFUArl6e6xVvJhYYUJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbMqDrhRzp7VEuiSRsEjk0hL7fLUDUX+4iqhrM5Ny6Zaq03MFI
	g7PYLo5Yf3cl7FJ91uTVGSlF31c/isWxOkwCiJrOUozeTCS6M5lweAHwXdvy4v7DJA==
X-Gm-Gg: AYBFou1o/blQpVAjNlPYS37FTIX8wvAz8+7c7FV6ddLbQFPB8YOejekhGuTEvFBdIzm
	4FFKyL7N6pahn0IxOfpU3OKWyyrKFDYNc++W/KxxQRH+yZB9OXlCgA8cnSygi6c9WAMR6eq9MwY
	MQU7s/0bA3bhBU4FSNjOr4gVUokFbi5baMFVo3ynX+ToztM+UUysbAe9Xy1bQGTkl3knlrsOfrL
	KpEWoO/Pco+kHdIn4a5WjiWLbQTeogR3SZ2SLPAu4JTAxyY3LpVonL5FV4Hbnx3tpTv9WwYR2ns
	G5NXLa+E0MsVKVSn2JkSsyMowjD6Gd6d1kVzZgovPo53IcOFTr5cVMJOT66VMgil4C/TOc2L9AA
	CBQlnQB3bEqN66dIQ/MJrreeeTSKp4m4utg5URydgX62epDB1oH5XFqr4OK3iZY6pYt+Qhv6nU4
	ATmyUkbAeIhBv+ywnmqvLQLx/sdRCGYplror+8l6f1WPba+4Y2AZwYPSVw9o0T2v44FkV5mkaxx
	XCk9+tG0gFqyUaaBRdfY88xy6uOClb5buYREOic5Dnf8AIvxxQItOMW1rEyQjo2tUz2BhXyvXr6
	wkz3CLx5hXXkUEFxtPgu5Ig2Ynjx/zaLwWonFoJdIKQdJFAs/1B0F2ATbSTIaBi04DPZ80gGdF5
	y19XK4F28JGc=
X-Received: by 2002:a05:6214:d62:b0:917:a7a5:af08 with SMTP id 6a1803df08f44-91c48f16f2bmr13423826d6.25.1792809658336;
        Fri, 23 Oct 2026 19:40:58 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 2/2] media: venus: disable recovery work before HFI teardown
Date: Fri, 23 Oct 2026 22:40:51 -0400
Message-ID: <20261023223635.3c895c4752c4-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

venus_remove() cancels core->work while the IRQ can still schedule it.
A later IRQ can requeue recovery work, which may access HFI state after
it has been freed.

Use disable_delayed_work_sync() at the start of remove to drain recovery
and prevent further IRQ or worker requeues. Drain the work before
disabling the IRQ so recovery can finish completion waits that depend
on IRQs.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7087af32060f1ed4190bf9f5d4a58cf88dad537d..6e495bc046913b46c926a498c062a6b55c6f7b64 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;
 
-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);
 
-- 
2.53.0

