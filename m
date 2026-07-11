Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05A346E40
	for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767896; cv=none; b=YGt2SEfZMy10hEL5YxJ9bVYYs8P363Jc/0rdcqvzYujOXc8oIvYjgIDjweURHBvo/4U2neNhB3YETfSQrT9SVRqTFgjvV3EyIQIEcQ+x9aya+SmvfkRv8lBiM3JBg3tDY1c7Do+coEAFpAQGzSSEKn3uFbUNqq7e8c7bjjx/V/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767896; c=relaxed/simple;
	bh=wBRJCLK6TqNt5PR+YQgWd99ahf25bxxMPE3POQRppiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MXqNbXAsSx0PRyInmCWfcwzKLYnB4gKgSeZpuvZlEdUaaJmXI6W/Af2Nc6JRj2WrfI3PrCvaehQvWeUdhIvRP0bWFViBe9CN69i5Yz7ozm66KxQ5deBXq1/6n6oV4YtuFPWg2ZUSWU7mDRPB6A0MPgc7wInAdUHnNlHRFx+zQA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrqGhus9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrqGhus9"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1578378e87.3
        for <linux-media@vger.kernel.org>; Sat, 11 Jul 2026 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767894; x=1784372694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lO/PS92+hnAQJB9OLkVZCTdNK1uV8XgtWZyPzd2I5I=;
        b=ZrqGhus9N7V+vRzdmz+265pSR5t3Pm6ZXu+KN4ZmBlZCARIPlEWokzm6QngcVigN2e
         mle69SsjuTBlZMualctD9uo0XcaVvo2TIHgAuCAhieWGRAg3Ozm1kQ9HE5ZF3WPOOoaW
         bayhNGJ823pQZcBPmz06894KqHKSw3BPfqjfdhLFR7qmBB1iEeJ6j8wLtPjSTID6wSVJ
         8Q+nSQiT3IPdvvzOQDNSK3H6kGw/5DwVXj8IHLLF/WtlhkETlU6E3y09wrGc7aprZybv
         Kxu2PB0Zz5ch5NEkt5ymaobiUg5qYcucWUiPBv82nqR+mgFPS4vo2OdbyKMD2gZ8xSxq
         lPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767894; x=1784372694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lO/PS92+hnAQJB9OLkVZCTdNK1uV8XgtWZyPzd2I5I=;
        b=laarmNCSotox2++jk36j0q+Un8FNn3pXb//xr/6koB68b95NDBQBHHxDzkiC3PpvBe
         nnwYsnsXhMDGgiqplku6ibxc3ntedOaRqeNE2TvzT5BjfUPPicOx+/+DG19+mUb3tEyL
         mLcZ3LQG0FVaIx4y8nW2wAFJUoOnprqF7k8K06OOjtrkaURxFtqPi/E7IdKPNLmDG2sU
         bmh3wEm6x6g1CpRp8trYQftr617vFj3sJZs7jed/fST/TGBhRx58f+Sp5OiHfDXMlhj+
         dlDWx2JfzVjEqZjIl8JEQ5UvGm4jMCbcOKM+G4BwTelvM3rSUYR9x5Qq8vvBuK8wIxT4
         +Kng==
X-Forwarded-Encrypted: i=1; AHgh+Rrd4aP7dKIv/Xhn1/V+JzyCH7NAJ/dyK41TO0SHa7aAFt3C+Khy6ehwgoVjKIpHf1mImbCKH78oErj/KA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCvP6nPZOQYr3s6nb5mbF2fWrSi7qA2W3u7A5UEPXLUWKNwNsq
	dPAMg87BgaIZkKCA0YoZEM+3au2wCD1juVzu9DlJ3QhSmwWKdnqaf2eg
X-Gm-Gg: AfdE7ckH5LPUn4CA4vZflDULSZTzVC8CD+EEFxtJIkuQ/uvPjPVrh8V5zF56zj8YPGU
	/BDW1RUK9T/pVdOauR93VEFQ8NLE82BVVzp488JESDFlkBPCEvci4YT7+/vjV9s2csby0+cwIhg
	Sn2QC+waKtPgA1QyJBlS5QuUJbqucBTv6L4AOWjCOuDR4K1sMS1hN6kckYa7TY5kE/3kCGnGo8j
	2lG8mWccc4nocz6+9aWwXZCRTYRik6NIN2BbA9NF2Po9WKP0Vrx1SERb+AVSI2F3IbT5ZkVj4yw
	EP5rTGawSVWfSj0Au8xHVc8c3jw954IS1g7ZOJu20GRHljI3/v57U1SQejwW4EKmCcu9XtL7A6F
	YXGul6RLLlEl8mLZe/zOJ+tvSIOWdpQpp0XkhjEa+ZJ7dolhk2JKg+OzgVek8M5xxiGsqCQg3
X-Received: by 2002:ac2:4f11:0:b0:5ae:b4d5:6e5f with SMTP id 2adb3069b0e04-5b0236c1866mr738062e87.40.1783767893738;
        Sat, 11 Jul 2026 04:04:53 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:04:52 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 1/2] staging: media: atomisp: remove unnecessary return statement
Date: Sat, 11 Jul 2026 15:01:51 +0400
Message-ID: <20260711110152.66188-2-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711110152.66188-1-erqeon@gmail.com>
References: <20260711110152.66188-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..81d0afae8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.53.0

