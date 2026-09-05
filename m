Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882E04A0910
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611705; cv=none; b=biwDJ4CksDyFgdruJZLjuPEoBOYlmYbSo2pBf2S5Ah7ZHg0E1UOeD+xWcMbAFewqkJGoCTBH7Y2Dz6sWEYox+ZwXrU0lqjAPWk8x72t5vD00NA4wDyudw1aHtFa4IAHmMB3JGGoe+RQrw5o+ozbXbipSj31uTAEBVjzS/5NNzZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611705; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiehRhltJrtFtv5jaPqLqhkXUr9Jf6tZfInyMi1ojCWAE96pMZkC6zYR7iuYMkkHgubgi2Jgax7h+T884G+yHls6zHPCQEwQDI2gemtFxhXn4TVbFxrRBHdR4ipFEcMEdB1PSd5sml66EJd1RG+B5+kNk3Lp4a7/MKtSK7l6EwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfFc8NvH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfFc8NvH"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2473816a91.2
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611700; x=1789216500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=KfFc8NvHycwffxp/MuDnnI6GzEu6tIHkW7Y9k8dKiMJfZJeskPB3P5q6k9dVF+jvmM
         Ydfr1SY5F1o8KsO693B+bapTI3AmcIOQ12mZdNgtxBsDzt+uI8iSj/szdJu6H07pswID
         u8iCSNqEj9vr68rZF+sv77X7kqqF5mgcH6wEp8ep1ZBshraYqUf6C7sX5GQFyCG6wSjl
         dfzPw+cDm9IQOLhTcptEpWKPK4shPYU1u3ooFNYAlUKrOtMEVQvSj2jq57ArrJsZdR65
         R3YTlfJcbI2egUYL501e7Etl32DKVwR7vi6VJxGAv2j+HB8slAKHeTVFYzsbD9isqzK1
         FW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611700; x=1789216500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=r3dY3NoUTuYgNqUahp0DVlYsrcuQxc/pPwuNjVcfZxCHGzAVl0mH1cZERtfdErqqOH
         iVmXZ5GUdtP/fxZ8knW2SYN9H+F5sDLUo4vb0xiwIPp2Cx+GeGH6HSrHSEZ+LUtPDlXb
         9wPoM+efQug98XeINKJcKbor5QTQXZmDAmm50OdlnN8r99t0XGM+1stMY7pwtGKaMukM
         cbvp0MVNpTEZpjMh/SRxbgdGo5R7hwjkzUrvYjohLjBmLv6W7csDiySeOYPWTYzv6SMx
         OgHKNyx2o9NymlnUAxblQ0oNNAObWpO6JZzYzQtEXc0PWZsUUy2iA6aKH/oGz3l0ipYy
         8Skw==
X-Forwarded-Encrypted: i=1; AKwUvBzmKJwD4i4AiuYAATVcynWXV6r2tlMJrF1n6w/75bOOTHwuYKuKtsbZoiwciolHHNDpzMHDqdsS8PfvCg==@vger.kernel.org
X-Gm-Message-State: AFuF++ly3Ye7/wPzdLub6k3rl42Ut3w6j9MX7yo20kBDoZ9wG5+Q+4/i
	g3VGb80vGUl1NtNVQjzjDO+zbvFUr0GzOwsVeTPJ++Z7xn4NHm/0ZFpb
X-Gm-Gg: AYBFou3GyxRCl2MkprLuGaITSK0hZgmUNdlt3c4aEXUb+L/6drdUNYRtQ9e4msdjIwU
	BGwogvSm9levUvtO9udTozqCXIFvk5Q3vLaDHgC6QUTX2XqRtfbHO9J0sbQD4cWmdpSj/5eIgtD
	ge/7cXzUmQRe2YrysOh6kLMsZb7M4uvKWqgTPF961qZOVhBVh2hzjWypDo1W6WrAe1MHIr2l4/x
	HKQw1AghM+vNOiGQpI6qTN/t3lwJfFjD+GgF/I27ybS0+LDGABRXJPUlz4dmMZHE4eOaQRYBu4p
	O0rhQNxVus9NTRIC5vPiGJM0O559laTvtKJR4HLBSlD/tNvBy5UgN/P1vdgO6LY3ZHvVLPRv3hl
	oaJetC55mSJzoKbd3Led1QONqwgTF8cEzBkajMMxzQJAFiyomPKU3911HG8eLNSWdHFDHhGlQMH
	YxYeaNMXkuDlRsBHI9l4qvfLOBrLhZuKwINu1+7MZ99vwaY4dDiTTPQ5WQuk8PMZlgXQOv6B/Yz
	p7D1wMIlrdFRuWaGvUy3XkWu0dSBZnC
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr18508993a91.23.1788611699999;
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
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
Subject: [PATCH v6 2/4] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:34:48 -0300
Message-ID: <20260905123450.5620-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
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

