Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE104B5CCD
	for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192499; cv=none; b=aKVGC8/Q+EZvs+LUGYDqoqbAyRLy7hdJ61U6MBZ3jzh3iQPFHCx/wdjpN1W2kE+JEMwwzYedyvlhH0J9CVipknTSrnXY5HAB8M37d7GGAx2DQN3gdd2kcJkXXXv8w7jCoaB28xdTYPkKA6/G/523OjkTkUgRsmtN3i1hE0ymDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192499; c=relaxed/simple;
	bh=UmS+Y8EHGYdZm3il/1GKD/s6a3f3J8OBYpQA7/B897A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGbsrKOKEhOlm6tqIuMPl0kvaFTLgyscvcQztNYVrY03kIKgVqZX3Utj6t5thynAD4z6a13Ac3xYxxKLxmPpcQrQkwGXwDBzW4LVXjD/FJz6SSEBqG0NubyJm5cAbY45UXxOl0LJnsIzkIJ3xO0IfBNSN+TQY982FwBWts8Z2Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD/4TWH4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD/4TWH4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3273010f8f.3
        for <linux-media@vger.kernel.org>; Mon, 31 Aug 2026 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192496; x=1788797296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPvwlP4rGOO2+Pk+QMwFAR8MHWtVs+GCtUx09ytGEmc=;
        b=XD/4TWH4sQEuGJMsc3ysZWFAwA5qqwcJQXxRY0crFpDXZCtxwCc/KMaQ8aMgxipeCc
         l4Y5z0a5oAZhl3/PyvLPu5Rf/ZXrntz2iUq+IXPOzkvCK6RnZjsoJk3opguMJXXfoG4I
         Lp+3FKunYr3mbYR4pIteLdqUjzHrN0WaQiykUw4zZzjsxcYO6lxTt7PS7O7yGp9ac0Xg
         srgwoXotuCS7RN3hHfaWAqbSDx9I70dhseu8Jeb3x4Go5KjyXYo7OpZZ9VF2w9lUoMzE
         OYQmoRLYNw6yYKpcGBfr/gnjxS19IvImcXq/yu/Z30t1WfLMeNBosdjKK2I0TxEo6xT+
         fxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192496; x=1788797296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPvwlP4rGOO2+Pk+QMwFAR8MHWtVs+GCtUx09ytGEmc=;
        b=RNtbLovE2xjPAe8yP0V7SwgoIWbt7qAdO7pIHhZg+8gAsXw7J0LVw3+cBXQ6qWPyFX
         HuhUXAA5mdFwO+EkHPfwbg9KgJCqo/u2gHRd7sQuzf2gRM/4+z3peLQNtDhhfId+xW5a
         Fs7VMqnBiY2v4sz9StApH+b40vkg5bJNvknYCpKd181FGOvt67M+mRyB3NRW4LgJukk8
         hifnieiKq+ZsSw83bitb6tk+tpHiGK2+Yu+1Abh5AalSvEQ9dFZHOSCbPOmi/hdHtQj1
         toYOw5Pqc9A/om1daPFMiTjQWmLv9VCtfYtE+IsG9GhJv5IJHvDSyJrea50LCgxeGWXn
         2/mQ==
X-Forwarded-Encrypted: i=1; AKwUvByVqZ1Z5hhg6xMmNblqSMAHx/RV4yXnQHAC1qqx5lBZ03/IWMoIEr24FDm1GmU0xOwQIx2xMdfkFmtQMw==@vger.kernel.org
X-Gm-Message-State: AFuF++n5nD8eYoPMllxZj5/iJALYr2AWDz3S/ilFVzXWeOC+ZSe2TTnC
	jEOxuxYh25vj+MEq3/2qhYhJvvM5Ljo1N/whfl++TCbQpQXGYwlafdsVqvELPDCExVdnNA==
X-Gm-Gg: AYBFou0uLSWhUW/DgUklqOsgIU0aXyEXYRTXuRgLtULmrDmcPhWqt3ViqDX4dcLYhj0
	BSo4bKT+Nfjhfz80P55TjF6y6zdBiIes3J5jbAJpiGYBw/Ma9SCKI7SSTQ3rE7hnzizFJ7HQxrg
	q5LzEi3z6imqOavmfZuc2NtFXGDYRRlEAI5zmCFqlI9PGsF/bDKiYFiLvm2uKH0Rnhjb3SW8lhY
	8dB25tlTtYMrUzlU5qdARnkDjsqVa7fwtdkOMs9d/uGWbYvOaiL/RRQHtJjDvjHla4xJMelGUwB
	O2zh/zMh6YAcqaX9Sd5y8IcEoZKxoR3Jjqzjrc2L2RG6VttRI1+8zXTp5g8DH5Jbx1UyjEOvmpK
	awN6fhd25F9YFInr//EchsErZdyFiUrpS4zRcOR2ByPwZ4NnHgaCn3n1o9UUNczcK1WPQgQWyJd
	+c1RpLpubfoMM6tyEsgPEZvcon6JaSsoi30wloeIrvSJ7QfpuJgQPhjkBH
X-Received: by 2002:a05:6000:2890:b0:484:3311:3176 with SMTP id ffacd0b85a97d-48433113230mr21848864f8f.23.1788192494991;
        Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:14 -0700 (PDT)
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
Subject: [PATCH v10 8/8] media: ov8858: add ACPI device ID INT3477
Date: Mon, 31 Aug 2026 18:07:54 +0200
Message-ID: <20260831160754.9857-9-tchatard@gmail.com>
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

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: Claude Code:claude-opus-4-8
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

