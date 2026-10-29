Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292867;
	b=NqlgDvnAljGnGVzXz614Ggwfg6CSS3L6s/d8sTIang3XwUuhj/7B6ts0QKXNRXkEzNgk
	 VUdgeFEC3ZH8VI/ExVqr+3ym2FUBi00gCsqdq8NDAFgw1lfVWA3LYuEYENOMA6DJnqHNS
	 wbPvzcyNgGecHyUlLFY8F4d5k/f5El+Kb/UxYgw2fit0rV+OZQTmwiMWzrmBUHojoqq14
	 HszKwW37uQ902MABcQsZQWDBQd6bii89wdX7/AIvCl1dPwQZEtZtZjjK0tWA/shA1QE61
	 d9FNlzzm3rpmMpKisq615Jo6tHnpLgqdy+mIl2WUtVBgZu9HKQikAQGk+ThAxAv7OPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
	b=kalvD7hzRRDJ1ZqvMxwTSG7tPgonvJkU8aD6neLrNw0YcDOlBa2Szmki3+WJAg/D+eEr
	 9yLxsZBiMjly/8UZVE+wIxnHMis8SIIENXEv6eBcolFgheuBRFH8SdiR0jqhe7XTmkPc2
	 7HR2BZQLTDNWdIEd54NabkRYgcezgYkElnDaVAaMOgA0EgzCJzDnN7S3dRepHF50hDnKd
	 arw3GOYnsuK/PMUctomEMkxCUNic+kWmvNXmwltoqM5NRC5tHTNuEqigD2hyX+Xp1YjXo
	 ysZ6+kh3lOaYxclormmzduJtnYjdunB+ld4rPwOUlz4GygRXMDMAg9lWcwzq3jmqzwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HrnU/kdv";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60760A262B
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 16:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B60760A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HrnU/kdv
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18040955e9.3
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292860; x=1793897660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
        b=HrnU/kdvVEzatdAaxNWq3NsjKCC8Gd/tNnMoRvE10fQ5J+XPluirky7nVTJpRWg2m6
         dLQ07T4Rri6jprY29dYU4lydtgVDBjaCDI+Ex31hxjS2Q2iY+Xa/HzWQew7QdtdhqNmB
         zqBD9fHlohHT5VhSe6RVFJVI3RMhKN476Zak8nPvxSIfrbzQKrKa6zfhhhgqEwvjc4Vm
         s6RihvxtanAfWtXvsqfCEuZUEetIlhrWcBMHTh7HNlaM0jOOTyob65fBB6TDr1FUhRhP
         an5if5Yax+nVjIkWlAV5NkBNJGbZYKlEtxm0EoX43N4EUCn7yMkh3ADIppArXPCvx3WP
         8Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292860; x=1793897660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4pAOPgS9W716epwH78Po5MHQbnVReeqlsW6HM0gOd8=;
        b=LoojyIiB8CQB3OdcT9iq9wWYWms3CGBIrUL6yFBeIcX11uB3MxJ3V08sJpDmaujxbT
         NjKa3PxFPSZKJs88opzf8x357lOnkFCFerUcjTvK3Vh2AdIR9dFq5KVa4uU0dGlZ5ITb
         5fI9MRSejrOTJyXj3B0dHkD7OUkn9YBajabOa/kPbqohSWqQKV178zCD1pa6UrHp+2IS
         yXNNBTIEUvZIFIjv2lU8uENK31w+hI+5H2153R/gHI7HrVDIcQw0Mekc0QOwODIRgTYv
         MA5oZTT6T2PTpsuP/zh7oAmP8UM4TAy2FPZtIn1LIHxSIYOsVc+6OhUMdgQO0XtLe9Ql
         oGBg==
X-Gm-Message-State: AFq9FYKrKCHx58YIKPc9dOUsfLJ6HykCUaU2DWDObxTLYj4i8t2bGfJ/
	wPshTdm4SlXtK+iFWN3ftEfTKDEJIMWAbLIvUy/nKM1OqaDU1k/5ft10T/Qw6aZe53M=
X-Gm-Gg: AYBFou3358BtrG6UPQLwTs/a/jYGo2vvp9TUVIKfECMBmQx2EVsLdNLeki8t5KurISa
	3PJl09cGJviveoVGjzr8ef5FADCt913qVItzVBEF3AQn956Ec2HR1SpcqNtvvTPSNqaaSll/DQg
	ufgGS21XGfM+/u+Ewa8Fi2eK4HNjKThVqJJtvxZgmjJZZFUTBxyASYSjrf7M4g62OvfCJi6GmgI
	PntcMVwXvHSa1ao+AZ3teR1Ohw2u6ulhhRE1/ORSiTylnutHNTqSPwsf0WmW4Jy5CKbTFoE8pbf
	+KOf40WZnqhay6jwfp8oDp7cnIMiXUbXhAOz0H3ylVFPHH8GQ33ytxD2M+WZX9xCYqPvgei1Puf
	14Ac4VZ0in8kJP9/U5GE7PD+dHng1ZOi/tPev6LB7C4nzwQJiolTM+XaNCll+gDtHF4aaybf05J
	iLbVsvNrORu3WgC7E3GJ3CRWeFFYxKBgSN2YhK37559yK5K+AC8/B8Oo5YL995HVTZNHhQpBGw6
	eTyAbABTDasEEML4QxiPlFBik9qQbWl503ogxVg0HYW1kr26Qw4iaJbWIywdIdPpCa1D43RR0xo
	EL4DBe1h09qLKs/GqBx89sThAnKZaCV9LLtM0tj0No8=
X-Received: by 2002:a05:600c:4f95:b0:4a1:e6c8:ff74 with SMTP id 5b1f17b1804b1-4a9674e5040mr148100035e9.29.1793292860727;
        Thu, 29 Oct 2026 09:54:20 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:20 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:15 +0000
Subject: [PATCH 3/5] media: i2c: cvs: Use named initializers for
 acpi_device_id
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-3-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=1024;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=8HOI2v0oQLToY7ZJC/9gFqHVqIgcGwCN9OivttsRFBk=;
 b=PzlE0YHa6iBN8eGWQ32ssMk0D/RIi7xpbgLUYxn3mBTapAhw0oz0ZTibY8kd4C02dHrQjYpXf
 FlLJVauX6DsBksd5kJJ3R2NC84X2KslwVXJNn1vBxi1nDgZd+9Ex0EK
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/cvs/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/cvs/core.c b/drivers/media/i2c/cvs/core.c
index d9c51e1c0fb5..ce9f45cf942a 100644
--- a/drivers/media/i2c/cvs/core.c
+++ b/drivers/media/i2c/cvs/core.c
@@ -961,10 +961,10 @@ static const struct dev_pm_ops __maybe_unused cvs_pm_ops = {
 };
 
 static const struct acpi_device_id intel_cvs_acpi_match[] = {
-	{ "INTC10DE" }, /* LNL */
-	{ "INTC10E0" }, /* ARL */
-	{ "INTC10E1" }, /* PTL */
-	{ "INTC10FA" }, /* NVL */
+	{ .id = "INTC10DE" }, /* LNL */
+	{ .id = "INTC10E0" }, /* ARL */
+	{ .id = "INTC10E1" }, /* PTL */
+	{ .id = "INTC10FA" }, /* NVL */
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, intel_cvs_acpi_match);

-- 
2.53.0

