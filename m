Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48F370D7C
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861795; cv=none; b=CCNfeVCAGjS/0vBKtwRMseQgyv4wsP+oD1hPj8ddJdl+WvnDbcFSFIRE/Og9mLbgUFwsHt2un3KJ9V8Wee+6zJIXEgVHX8qPJ4V5IIRb9BWGMhXAGdaAlvjCEhZx2j60TKdSd9k2KTp24oDM/o4P5aMFfasgclsIT3yfLaPyQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861795; c=relaxed/simple;
	bh=ot5s3z0y3WkGd23yN8si0am4L6kSSGA+LkIE6cUufHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxaY+B6Zi8rFsIqeUyR/DjxiEd2W4XjwRaQpwDui13SfsBYGRy+4+A/yhvogWUCnxD5bMEhrWN9inCOU8ZImfJzV9nr7gQsfRD9l87nm7fxJsmb2dzuH1e1fGUc7cJBPRYkPUU0rM5Nzd5VkA6ixYNi0+8GEbDtrqhMjAzH9nhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJUZwU2r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJUZwU2r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso2036215e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861790; x=1788466590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=bJUZwU2rDJFnl8s3+d5K7JXhpl7Rz8mlCo+N+ONlPsz4N+dUHFnOPDrHRXOMhoZ3Ku
         shu0tGRol+sQ/hnauYN/dO31fnAB8O/PBdwu9bVZuWsETT9gkQDXrHAnIr5bTHk+l+6E
         5JZI61nkeloNejkd3Diz7Lf9AZf1NFCJ3JuOqDEaOjrkzL9YZcephkrteVgRlfoFNUeo
         qc/7o1WYIFLtIDTHGiQ9/9X1m7UJGAZDVD0iNyK1sjmblJtRKLTyyQGCJoqVwXjtmrxu
         ctu6eOS7psYfRv89pR64l9TTPnoAui+C8Zu0EtSgMg/4IinZ0zS2h5kpTdOD6PZXeUah
         flqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861790; x=1788466590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=sEV8a75Ycudn914wQ1e7kQH0AiO3eUFR42H6jYhCjZehTelRnPvfcr7V6awmRLNGAx
         syB0uC+IQR1sVeBeJ7Q9yeszeHHbU1XDoxmTFE4scJTvJIkdGXKc1Ya7QxSkFMFajemq
         cGFAT3DOXHdNLMiKriNiqU+nX4BVS3GehNN2EUSTkoRwOhV1Z0VncKtOD47go3KB2Vw7
         4sHMMetYYd+cEtZppj6URgLtThTKaglQxNbeZhMcPDSX6T4KM0B5yA/S8rN15U0U32kG
         j3ifz7cRTYN6RoFY3Yn+ofU5k+0L8Ab6qlyMM/7xgD351O9KKiia6umd6OKoupajsTw3
         hAfw==
X-Forwarded-Encrypted: i=1; AHgh+Rrw7T0LnHgZfeCJBAGdsVRldU16m9FvaFZJL6O0zFilidIVRb5c6LSVaFkZ4753vZC+oLctMpGX5GzYAA==@vger.kernel.org
X-Gm-Message-State: AFuF++kr15yNOv0A7dEpD6ktt8Be9TwbrbHfKcijp50/J0zYvUEM1zOT
	vZy/asaiUdlnNWDnZXZcYme+3JGQqrJnRwzbQHl3ITbh4yUYJ+PHxSub
X-Gm-Gg: AR+sD10RqE110UBpYbQYkcwGW/H8IhKqHA2AsyQoPvmJS4xYnaw+OTSWcgksm1yStso
	oLSow+6CPfaZn2N/B7ZmZtAePqnH91fBG1kte7P3SMyfVLbn8mXMTFx1CVEHdgKbxztTuRldvNs
	r/CkoigCjbg8Tun1fcSxMAdq1sWi2M+gdETyAjyXZQjjQp0m8VN68+hHYiclb2i4K5TRNI0rzCr
	EuqrSO67yqvMG7iNj8Nj3xcBp4lirdUULmQSku1ykV8pu1vIQViLCqh7DAJboA1VP0YgSl5s6n8
	aAxtIxvPh1i4yEeHE1/mtxuWr6kQIQVLJOTkSGwjdybKRQxGfWUqCn0/MOvrO0auaO9WE1+KmHU
	I+ekT56u51ZNucFneBJ7yKl+XFvUu7sHUJJkPkqVjnirZZCuLu2vZtkAZ3GsXu578E+c4JP4hOp
	RmtRhtdwgEWonT8DaaWY+UqAYikerp9cRJKrsKUyzZKPargyRN1nNtFON0G+shLwsja2mT
X-Received: by 2002:a05:600c:6215:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49b91c1d5f4mr21884975e9.3.1787861790049;
        Thu, 27 Aug 2026 13:16:30 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:29 -0700 (PDT)
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
Subject: [PATCH v9 6/6] media: ov8858: add ACPI device ID INT3477
Date: Thu, 27 Aug 2026 22:16:11 +0200
Message-ID: <20260827201611.99825-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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

