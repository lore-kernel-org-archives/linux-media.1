Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6DC14ABE
	for <linux-media@vger.kernel.org>; Sun,  6 Sep 2026 00:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788656023; cv=none; b=eodusFFca6Aj/dAAPaf+T4eEvvf+IQKKX7HWHt9XyJpKICSZZHRHi1i7dt1q6/qlIrxDkrYisHYDDuU5IYeRVh63kRTMpN9qr75XM1XMW+aYNVLp8JShBCHISUscIkrlV0zm02IkaSyPPr29KCBafMuqFQhKcIxPNX+4e4n6SBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788656023; c=relaxed/simple;
	bh=rBXUUvvkerHNhThNqGS5MYoS9ksLclnjJVKvR2FDQT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vxm72XfKFUHhOxYRY1XZgL3TTbNM6u6ZX4RpUMJD0SaHAvHmL3aVlx2Vms8gpt1adAGZbWuGNKh17zVXN7z46uc+zWdyXBaZlOE90IAMJ9dlPKKun7JdSDRhRRd3EKA95jW2T435w+rotPsKcna1vJIplLr6oZzjnM6Veq0fW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYsnn8lO; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYsnn8lO"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1785218a12.2
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 17:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788656021; x=1789260821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=MYsnn8lO3HkRC3ZDCIE3r8uQO6S0n4j176zu4D1KwKeC+U3yPsndQzmCoRTMf2ZU7p
         11wDJr6skOtAPv71gLnsnLxEFtVf8ser8R1H6jSqA15JRw7HP7IMN/u/R4NQelR7Y1b7
         1YW73u6fq/X+8p/QCLnpV/Nr46rywlJDT3hVhN5VsSqHpzwvCT1MiHFatGrOnu7caCxX
         WMsU5bio3USbVPEHx26e5o9cGa+JkJOLrGmEkMvq+NWZZAxa1kmO/6YM/DvkHrm76auE
         gIIf92i+LOddFGsXsnmjU+Z+1qOGI3ObywO1pUr2mBJAbhp3SVP0ox0nwt7QJTr4HmKG
         og1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788656021; x=1789260821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPwTaXDwrhHArbsCgN4N1e0e3zBlfs7GCg68IUwyQLs=;
        b=TwuC+igpbX0Xk+14nM/lZjE0SY3LtiihsPZMidsS9s6dfSKggVU4QRAZCVEk4tXP53
         G3gDwgh62mTodBvVUUOFSznuJ5marGNQnqGHtl29MSVd70ib3OT6QyaZz4ZU6tjmIp3Z
         rJcRyf9jItTBI7W1bD01T1U4K/kpbXc/03DX4AymRmQdoCNAD311tpNbhl5MfsNpOvYT
         CZT1lTgvPKR2OEB1qFF3c4bPwK1IW4rNbSDlMMekH6e7Ho1R4pe/aM6SW3rVWnOEPyPT
         tk+LMpnJQxsO/RHkbOaz7+LmVQHcd+aU6ZAAuj0Z6D1eDyMTRQbupC8XuO/VHHvC9OA2
         n3Yg==
X-Forwarded-Encrypted: i=1; AKwUvBwCmYOHT/r0iBfqpYuQykIRP+VC1yDV1oJN4+on2Ig25q0MrzTJVq8O2wM2HYUUXNotkjYKPHlV/PjbFw==@vger.kernel.org
X-Gm-Message-State: AFuF++m4WJ3lsci34CukoPWvWhaw/4e04sc7fZS1xd3rJNLjV4XGxCqQ
	C357dEHl3WnMV/eWiMIliX4HOJ6oLSnrXYrjOOmfYs1/j3GdZBxSuOY0
X-Gm-Gg: AYBFou3HpJwfF9QYpPAT16Lpc8ZKdBnEd1eC2LtbRMNaWvYOvVDYLuPcJTg5Jt/PPSZ
	jpZhxKnfT14KS6OpT3KfdGG7IpE9BSFCMVM6PZxcv1LUqZMDPN2I0ySeK3tv3ihGpwMyOeuUhVW
	5P8tSdDsOlqr5KQxhFnxEZdCC7nHLZ7OF1/p93roQrs3CP9vKiWkYQxyoe4OoijO2I4Iq8xiDEa
	ns7Zieft1QGKa8iYwHDZFnRzSDATvAZySrBz3jAozHiei0a/UVrzydnoqKL15lrYn2NdGc/SOUN
	X3gbX2Umk+VKqr1L582GO9JT7bgYOQggulcW8DLeWyYJb/lVjW3HEdiZTdM91xTRkQIm48QkIja
	6ceerDVoMpbdKzJq6AjZW8W2D1vawZlZhNgrNoKh55uCLo3AKG6n8jtpGcW0ZO/wyxKq4bpaxDi
	waZCUg67DpMLqAufu7BSmE2EJ/NKbhe/jQvXj8y8MeEWcpeYR7RzwSASCf2fH+gfrS
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr23964308637.27.1788656021393;
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
Received: from G15-5520 ([103.246.195.200])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm15261476c88.14.2026.09.05.17.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:53:41 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use C99 initializers for ACPI IDs
Date: Sun,  6 Sep 2026 00:49:58 +0000
Message-ID: <20260906004958.26041-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers for the ACPI ID tables.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 4 ++--
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index f9cc5f45fe00..588f2f90a884 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -857,8 +857,8 @@ static int gc2235_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id gc2235_acpi_match[] = {
-	{ "INT33F8" },
-	{},
+	{ .id = "INT33F8" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, gc2235_acpi_match);
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..b02fe0c915ab 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -995,8 +995,8 @@ static int ov2722_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id ov2722_acpi_match[] = {
-	{ "INT33FB" },
-	{},
+	{ .id = "INT33FB" },
+	{ },
 };
 MODULE_DEVICE_TABLE(acpi, ov2722_acpi_match);
 
-- 
2.53.0

