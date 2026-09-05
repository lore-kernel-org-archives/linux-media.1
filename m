Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64014A13AD
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612286; cv=none; b=oP3izVozXPi5BzSwWnvPyn5xF0BbpBTxZ7l494iSQZ6J/BJNtu/Pu8vrsuQOFpuz98bXWiHVV/T4r2W/gCLBqJZtbW9HiR3oOCICnHOBgA621s0HBFIYiWCfOMOKD/M+JJe7pyDaev8PB3YdI7iSVhcOz+YYRIkITm5J2eL+u80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612286; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYzSmqw7H6ClE/ejV0jCFs6gLUMRUNaMCQm7NfUkeIfN53gexoDtwKKtSgjgbW7u8y1HmmGszMQZWiH4oDv2hzC+uiLX/kRjAr3wmD0l1u6bAosmFcthDu9hD9tjEdAYJnNNuree3MHgeU7CgseH4QIYvyPSSBClDrd52QKQ5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxA+t2+o; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxA+t2+o"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-86309e1a213so115810b3a.0
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612284; x=1789217084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=kxA+t2+oXL2x7EMXQO7yKd8Q2TsrzpN5J8KcJOxJtzo8UCq3Pq/eQ6OvRiTbgGBKxU
         FG+jB4lrUw+ogJbMGc97bJp0QdX+qQ3BK2GPWguDm7swABoeHQMsqmGcQmA97C9Fwg87
         4yx1Ama1LFuuEwDwqpCNuCA44gll0EabgP7oCJwFKGpQ5NOlDYja3XbJ0+PkaGDAt5RZ
         +xf/jqCwbhA94ngMM55TRADZAAVSgHx55/KmIatYzZFnJbkstYvE7oH1T76VfioL9+T8
         Fv2sShwtLS4PLZy6xiVs5TQmfgI+fDgrCi1pWTrl0JpdRy1g+SFUxkjJy4RjNKv418nJ
         7V7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612284; x=1789217084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=pH1a0ekEUjyeJd1De+s9i5NlTz52NWS6wZq2rf3vjz5pYCLldWulJosX1ZkCQ/CAMj
         tQ88FmGVoGt21dO92w/fnnxPrNs5R/XJHt7dzkk4IrGc8va6NgaApWzBk0STVLJZyqcQ
         +fqcV194dtDu750lgwFJFdzzcebUvCMvO8U5RX6jyB3yiH0hIk6NB4bygDryW1eW2ZCU
         gUo9wOCdjJN6yxO//+o5pXASGKnmnt3FAXlQnBHcjiaud9KBXO5SJRAi0tFNtEH96XRF
         EmAX3SMTTwvyh4r4aJ1QR0O8Z1CaDHMCdUK0K/oVbCHzeZ3H39C4uhkVHdEJD7AUMVuf
         l57w==
X-Forwarded-Encrypted: i=1; AKwUvBzFzkuCukRU0rRv7+REXLaL/ebCPGXWpa569wzD4P9QmCrLUxvXZcv/wrTgIyyW7Xov+cXJFN5ldQSN+w==@vger.kernel.org
X-Gm-Message-State: AFuF++mkTnNgWuYCWV7z2iVbZ0tOXn7ZFWwtqfBoxJGjEZV5OLvv5aa1
	jcdxBlE3EzQ5+sNmQcdRC4qnTLQQS1WUHJaxrr74/oLBrB5yxQFxdRZj
X-Gm-Gg: AYBFou3z9BohyeKRaogzNDPSuBbytFCn3ALefy4Ryyjtd8qUpyrOiZ77cm3udbQw9p+
	vWSZ2M3ZLN9jznOJ1/MeA/tRkCcLyop4S7C61l6VqYq3lor0XgmGFEKDhtGtb4T4S4BTLCoftgW
	ecfUjoDm/yL8zjN4xTyo08QKvMHsoQIiygWaJb1heQGHc4xkrTDPsO1wtWPjKXjCObWfjKURiNu
	Fp2fCBd6kofL3DExNoVtxsz3FDKPsUJ36IdcHDeXPGXbPOJ7CpCYgW1HGMmoVtEDVhRjpJLbp8p
	DJKAZAAc4IZM12g0mXkp72SJW9lTuSzdufORS0QZ3nFFflStxko8aZhHi1CCsDufkCRwG08Pbn5
	geoAxkf1MlP9VBQkr6Af4qLtqzb2UWYTwYU5U2VQE6jbvdx/dxw7Nf3RZK5Cb6tLNMubmEqsRh5
	lx5d8xZ0cJ/3ohexldXvlhwiULdXFouIQJqZrONAUjgtFBob8UmtvPhfqJmfv7y5rVzeKCRvGNz
	1EV8/WgwIyz9vgpzMtgI0Rvb34eAds7V9E0976goFNR
X-Received: by 2002:a05:6a21:b97:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3da3a0cc429mr18182599637.23.1788612283674;
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:44:33 -0300
Message-ID: <20260905124434.6163-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

