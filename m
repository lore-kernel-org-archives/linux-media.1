Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D765383E2
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174625; cv=none; b=YZDOnx9gQl8DhqAlDNf/EkfghmfbDI7XkvNYLLO2Bt9Z9tglJvFd3lGO44gUMFuyLNI3u90GYnVN/neJNykEBNEt398Jqx8nqTbK+tQKttGEV0hofXqc8EsUSVLUxbx2VBGB4y3TjZrHosSHq6pX7zLJNFAssGPq3wenUo2dHUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174625; c=relaxed/simple;
	bh=nrMnlpMLPXWaLslr/6M2q9sRp4BcdeY1in54DpOsRVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Frr0heE7XoLLuVeF2+nlY7VeuQW+/45qmfX85l1PEN9KvvURfkgunrgpx8Q4TFw6Dwu7WtP6DLjPOP+K2FeXZHQmOTJ9A19RVQKkzb8dB5UM/wdvqOx9zChKgNqEnKzgbOgLlQiJDdg8miO53MqoPpJHPNXrlNxv/Q3gXAXf6KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ib1t+F1N; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ib1t+F1N"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c981b0d59cso775251e0c.3
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174620; x=1790779420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJldumoCtr7gLsKe4gWLJ70gEMUxGdP8Se++jExg2xc=;
        b=Ib1t+F1NV85oBt5b/jEBO0KcxeY8FGp5CsutEMaRgStFFCJw/23sdgdJafkzWYsMLy
         JkaYBBtXRGos81q72kzM00hyuu8FvaRYHcQJxmWVoSVQlu2MJ/z8GhuZ9nhinf/Rgzl2
         4SXh92Z7TOZmhTwwhtMpAWs2wzLuGtFZc6JnX2MStzlGeHFEBacL0EZVebnth0UYVpDS
         xtm9l6oizeD7C+8R69nOFtaznS5lGi0I7C/f7SC/hclsQPO52ORJ7xFUQOzOzqiSTQVw
         oaP7wBIroU8yoXpw4Ns0AEKea1dShjEMbUYFWrTqeA2PawBMxR+5N8+p8w9QAUYZLnTI
         4ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174620; x=1790779420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJldumoCtr7gLsKe4gWLJ70gEMUxGdP8Se++jExg2xc=;
        b=OaO1COuTLm21u6jUrjG7KQROyvmsVNIHnOCU9thbrjgxkjzOKEUTpLQRqCOL2Ebmrx
         eze36TSaudhMO+x+LU8daZ3M3qjTZjHuvwgPITfy/rn1s6Kyycq62ViS9ZuZ/V5lM+GY
         0/vteNoB9pQ7YVY2sEJlIx9o1uKFm7fRHOXDP8Nb2Iw/2rvCzJcd2r346RsA/D0W9Se7
         tZU1mHFssWYcX6+qSphyQsvgpZ9YB6ojIKdRzIIX+Lr7vvyEO+ZGWJ+fACDEKihv4jc2
         pHClpHcGcVLMYuy8PzTfPvMUYQdPIFurqJaoXlkVrlEE17BvhTUztU9BzfSo8zzH7wGq
         rtsw==
X-Gm-Message-State: AFuF++mgFxpx7XFBKxWHeSYj6dbL6hC3zYR6dkvxfdJ334Atrl0tfv9w
	XMKIabZCD3knWRN9CMTDrD56Gm6oKS8n9xvsYeu56YN+UiF9T2NWBDnNnBwjeMfajkA=
X-Gm-Gg: AYBFou3fCMIj7p+D5OQEyzNHuiej+ZkJEtrwuyEmg6j8JTZlXabCrOw2Om0ohkjID5W
	sQd6eIdrUvfRwbNgL57H1d5yqYuiZX5l0lkXq1TlesvcE1cB2pCXqOdf/WPWQYvZ7jKDCs+au7C
	0n3ZoMFUnT8kyW8lR5bseCdl7Cuq1IEzP0xg9N3Qv0MiqQ0YE2OZtYUzY5KPveOeE+H42OaFHkS
	di5R9hASkiM5kBgC4OxARiqczby5Lk21cDBzpbemN3WPmo1xujsZHGUfY8X/+wncp9EdLAY1FWZ
	x8UFH9IaQuspEp18H6kPZjmsdXLc3sTfmxjfcFM+SBKcytT6NVwH1gbDZufqurdPvk8wl8imfef
	sUi9txXjx8UEeNKp/6dR4ixjgfh6YF5Q6d2jpfleICT1mfzeJOJbg3eZkpOOAIlYN5jX/P3yxqw
	Y9Ygnb48n1pHs2Du46TAOOfSj8BDZkCUcuwylIbO4+CsrI5VRQOg1TOVJ9LLABK7HgiB806V8=
X-Received: by 2002:a05:6122:130f:b0:5c9:c435:e927 with SMTP id 71dfb90a1353d-5c9f159a246mr3262793e0c.1.1790174620619;
        Wed, 23 Sep 2026 07:43:40 -0700 (PDT)
Received: from archsung ([139.82.178.10])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04fb621sm3566169e0c.9.2026.09.23.07.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:43:40 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 1/3] media: ov02c10: Drop duplicate register write
Date: Wed, 23 Sep 2026 11:42:55 -0300
Message-ID: <20260923144257.119076-2-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144257.119076-1-calliarifelipe@gmail.com>
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <20260923144257.119076-1-calliarifelipe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sensor_1928x1092_30fps_setting[] writes {0x395f, 0x00} twice in a row.
The second write is redundant; drop it. No functional change.

Signed-off-by: Felipe Calliari <calliarifelipe@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Mars-Wave <tmorolias@gmail.com> # Samsung Galaxy Book3 Pro NP960XFG (github.com/MarsWave)
---

Changes in v2:
- No change; picked up the Reviewed-by and Tested-by tags.

 drivers/media/i2c/ov02c10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index d622f5dca..730a40e94 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -209,7 +209,6 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x395d, 0x05},
 	{0x395e, 0x02},
 	{0x395f, 0x00},
-	{0x395f, 0x00},
 	{0x3960, 0x00},
 	{0x3961, 0x00},
 	{0x3962, 0x00},
-- 
2.55.0

