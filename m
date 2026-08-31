Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AA14766BB
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192487; cv=none; b=lm4Qmkay4oRkUcv9Kx6sbbIAgnNPkJ4krkHFZk490tqxrxsy5wKaPZIGrEATsT869SerMFbbZQKJrwmZc+CxvPdaYWjyjnphHZp5kWEOHYBC+oJgA8+/gKuBPQ3IiEnKIjqHn8J2AhVCxOGlhGYNK22uciNEZReJcuhQUJPAxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192487; c=relaxed/simple;
	bh=rixrGDaEFtrVbXBwzSvfQXpzKwFy07ICwTeW89xWQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XryrCp4yXd3KFuGoZjua6WSKwrodlz4vAHFMkNyGC/ffPGnrKUmqPAeqKk7tjZmFVl35U8Z6I9M9aOofZDOKdNacdHW5fPSlKrcfsvxAeXB0+/7xEvn5sT5u6dqYk95BkSs+MsRc0Hz7wbiQHlPlb7pen8qXfpDG8+96BEd6KAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgYnqY+1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgYnqY+1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484415c8cb1so117486f8f.2
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192483; x=1788797283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=sgYnqY+1nIN+Yy/JpGx+qrCC9cn/uyObs73JgKp/tkEZ7o4A0UMVzon4caTx7kbECZ
         5kDW/zxDyn+gya8srpoaUtB0XjsCNjZSv/F1IlqCVB6V10q16X/adnC5fPrvNjgRPkkf
         mnTDvcr85AXgZ6YVxoWOjyrCqAJf12XWXpzf9ZTtuGi3177igPeSn24dNfHAoZDjhJXo
         +DFoC+3QKR+LCHGu6nZFddSRrISlQHPoQdD1yGc6imjqKW8Znm+IpAESmAO6UaeFHpVM
         wR/gnPxwSO3uH4gmH7yGJOwtMWTCDTyYQUn2FNiAyfq9AooqblGytA00KxERZ5OpUp2D
         oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192483; x=1788797283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=kZrrKg3nw27LFLk0ugPVmeJGUsEvvL7NJ/FwLiK0UE/KEXqqurPsIClAIKAiMJhPv/
         mhr7vYTPGt7KLSPv0kxVrKdWKLpYxiD0kMv850E5TQ6IBKmj8rSbiHrWMdwBvOohWUPL
         netjC5cxYOMtwhjfQZFNDtk50PPQVr23qWqWLrPO3Ty9RnjPZudr8Mue1+4ezHTuReCG
         oMNsfrVrZqPyvy+eG548Kw9/dkMWGstdFtRpDv36W9YOwNJKq6KeZ7r2KtsyhKX+DNsa
         ycySG3GBnYXHPuFbvxR0B2O3roCf/nX+Fq9kfFH6BPKIC8VcK7+Ggd8SevwOWOBi3tnv
         FOCg==
X-Forwarded-Encrypted: i=1; AKwUvBzmBL2k2oU1ElV3l4im3/5j7UElpjFoOr9N2sSOmBFAFSgLiyIErWYRhNhu2saiN2/74+oKlE/AaEV0uw==@vger.kernel.org
X-Gm-Message-State: AFuF++nvwONDOA8XmvGDs9l0aZipIsgIIVozBjjp35nz9J36YGJ6WuX2
	8xtwo0HkKXjmupWwWSkcRk5sfJozyHhFAVcWfUJvnEniXfzlASj21ym8
X-Gm-Gg: AYBFou04mib/JFoyVogkjBkLyTQiLwMgk0yFLTECFVIaNPO3PCt9jRSzXb2Uce5daFZ
	o8J9R8ROKLB+qxJViQDKJaYiuhmm4/xt9FAGFXhQPYb+c/P1TdhSiRmy/IpVTUhyfnPVjfrMSDV
	/9K6yKj7LcQ7I4naLcRHaIsvJ78akkh7o+VB7b9udE7iWNW5ONb41+cylimfgaEnROT8lekEaW5
	g55gu8VNhb2TGtAY+Z8iipAoIdMKYu5b1fmXbeIw7+Aa+Ztlv8UWchT1zen7II/UYDNtVlxzvQV
	cZDplWICXgtGVIpBNHozBPJac1Cl8Jl/+DF9A+dpESSX9CZBl0ixIuH4ul28k+ArTVWPAEiJSV1
	jL3aB1bxuLSV7Famlw9+BGQ8Mq+/jBMe0xy9rJiwDLq1yHq7nbZGe9XTih55GBIpwgf1Qgp+sfk
	/wLUo4wVbHnXNXovPgb4GDNPUW4YwZxCItmIfYL4R9d5FdaNjjG45c34+Z
X-Received: by 2002:a5d:518c:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-4844102655bmr3118067f8f.24.1788192483493;
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
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
Subject: [PATCH v10 2/8] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Mon, 31 Aug 2026 18:07:48 +0200
Message-ID: <20260831160754.9857-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Assisted-by: Claude Code:claude-opus-4-8
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a77ed32ab..35909a683 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -234,7 +234,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0

