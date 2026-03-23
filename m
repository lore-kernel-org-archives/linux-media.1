Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9CE388E40
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271437; cv=none; b=gM/Ugy6qlNpwK13MTGDYvKnXCFQMNC5x6BWErxZoCm91EaiVNyWuDgW75Bynkj6JjRhjwzosbyFJKITPPIFb5hVdkHZ0tEEvjx0snRevM26/7wuVRBNPvuhjovL86NvWdFmfkRX2NSwQJ+eRCpfreqUp2vgVolXZL5g8VyxSDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271437; c=relaxed/simple;
	bh=ut4EjWQWHi2Ya+ADlwmr1k/l46CAguc9sBmTuYJuDxM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xhx+BejtFjUgZkVtdOX7ajO5/L/DP+nsr9LR4XZwl5ZD9gqqpiXp3LAglEK5Rjvne8JMXlUsdGPjzdRGxmjSQBsMvMBHZGfGl5fMSMnnhyGHDPV3vwidb4QCU7mTXdlmws1h/bFu3daUHk6bACpdgoJZozVVsk0Lw1XazlFrXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M8j3aOwK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M8j3aOwK"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a1307438ddso2913784e87.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 06:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774271433; x=1774876233; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qnsMyVmCtM1pLUefAOh/O2M1WkfX+KWuLgI1EM7KbQU=;
        b=M8j3aOwKWOeR37B10cizWsFRP9CidkvmtRPbUCX2yuDf1Z3Gy2CCKlhO2vTTBwzxsP
         YnKK7YX1TgX0rI8ve56FcdOmKbigzZVFBOJvjNSndtLysU0mUx+TKs/3Pcf0fxTZ3ggc
         Mjp5G4ZdBwg5jZwgHyEeobREt2xQOzS/WARjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271433; x=1774876233;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnsMyVmCtM1pLUefAOh/O2M1WkfX+KWuLgI1EM7KbQU=;
        b=dOJFOH3zb+UoWKDVozeqfpVL4vsFo/s4crQ9w3fBSmme9b6jNIkft2l2DGm+RUfWHu
         C5xaKVHJUmEn7dnz94eASp1waie+sK6czcgIyCMF7K9ETTyhIIPOjr4ItF2S0nqq+SeQ
         +Q2i8ZLNNs7i/zOJa/c6rkve7yom2bO4bhviATaY7XVVDV5Rxgbf/3WK9cgehBWDD+yW
         O36oYqB01Oe64yiMJ9l1GBuu/B4628tcuY0Oy8bI1lDDRendaHfVndkqK3/BmRyEC2UL
         bIgNujS7DAKH/BBnqlSuE8PecxvpnZ8OknGqZ+RvKslLABmGFLZ8BTCte8/m/UbaejKg
         pXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+Py9RZnzkGdZ9UWB944vmpS27bJuyJKl8F8SRXGM+m7HW4P/LvdfSrD0ojBxh4+7r7g5AIn+R/42hvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoMTC/mOO+kibrRZNtsAUS5Qua/b3V9mHeji5eq9VirsSHp1l
	EMTDN+xZr4QBhEkYoClJtTuBuZEDMwP6ZI/UO9xktq8arDOh6gwy0lABtR6qsNgbqg==
X-Gm-Gg: ATEYQzwi4KZ2LXXX/igB0i5xYUEfAlltYaQJ3nmAbgFrA4bJa5QySGgAI2MYPlbiwK8
	NjZ+izrrS43ihBiuT+bvse768JzPij5IWKfkOWFpGHdWSsKmQKZEdHQ3fFln2A3O3+T77xddJch
	9+mIJqvSUDv/Pj2JSbZ4gt8oBkMdt7dsXVAqcLCXx6gDztrQ5KQT3b8wHlY//lZuEqHgiGNOS3n
	mdaePHw8Hvvw6G9ZnSp75s+E9sC4OPOS3KuLkuHcOLsKf2Q1yhCP36b4WoPgy2ixFT/nlZ8R8E4
	z358tzCLFv+O/uog/pT02AAJGI2OPLLtB4+NRyuFP6H3LoHRkzSKQ6eJNWnlsrVDWol0c3Ss41C
	LdjuF5CXp102aEBMrI8sNKOynV8xIazOCX8pgivL7kKOk1k0JFyGnEI4pQfQHBRZHUuZVsYmmuf
	Ztv1oek4f4b9wWElLR1m5aw+lzU14Y9OC2eMWEkM2B7n+rj0pGr0fow46G7P/Qv9AJh6acnbsDS
	JSJ2eI=
X-Received: by 2002:a05:6512:63d0:10b0:5a2:86a6:8c78 with SMTP id 2adb3069b0e04-5a286a68ce2mr2847366e87.28.1774271432909;
        Mon, 23 Mar 2026 06:10:32 -0700 (PDT)
Received: from ribalda.c.googlers.com (252.116.88.34.bc.googleusercontent.com. [34.88.116.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285305e07sm2515904e87.66.2026.03.23.06.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:10:30 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: uvcvideo: Fixes for hw timestamping
Date: Mon, 23 Mar 2026 13:10:27 +0000
Message-Id: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMM7wWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3dKyZN2M8pLM3NTiksTcAt00I9OUZCPzNFNzQ0MloK6CotS0zAq
 widGxtbUAl1iBRGEAAAA=
X-Change-ID: 20260309-uvc-hwtimestamp-f25dc27f5711
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series introduces fixes for the hardware timestamp calculations.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (4):
      media: uvcvideo: Fix dev_sof filtering in hw timestamp
      media: uvcvideo: Use hw timestaming if the clock buffer is full
      media: uvcvideo: Relax the constrains for interpolating the hw clock
      media: uvcvideo: Do not add clock samples with small sof delta

 drivers/media/usb/uvc/uvc_video.c | 51 +++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)
---
base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
change-id: 20260309-uvc-hwtimestamp-f25dc27f5711

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

