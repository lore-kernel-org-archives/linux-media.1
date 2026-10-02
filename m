Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AF34F85C5
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958847; cv=none; b=UHAXyBoLMu2J5thBpvMIudMHHd+lL+InTegovA7TYoyhs8649siKFRIQAeP0LZb6SbWSfHYF6fL83/9CYx3uCPWFfb6vei0psO7xOAnTms5OESwBdhKoOgpTVAxGAt2rzHALQldJRdXxvb3sKBTJF9ddC9GNmH6XN5ZbJf+M8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958847; c=relaxed/simple;
	bh=pXDjUsyP9AXPKgYAKIBntuVPiUrCnKgs+R2mRsLwZuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4FSv8mVO4wMf+ncUWocUszyyYrgXp03ZPlHhigA+LseXQKqgpoGcjOXhMuLbBx9eXqpNuK65VR1/a/CTkOYzoQfR51LzNsnTZ2i2NK3YWkPDfxyfJCSWTg4gHz8hQj7Z3cRwPboL99Bs4mmHfXV6HG5I7duD/c/la8KczPbw7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnGtOV1e; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnGtOV1e"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so568002a12.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 09:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958845; x=1791563645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=UnGtOV1eLge+lvSlupNRPRoxidCfWrs/Z5ed+Iqqku7aundAhTG1QbFDmwQ5h4texR
         2X2hiChCnDaTlCScPNXty13hzukhpXqzNyx04SRC9G3qUn4nf4SiXrHHKslZxtlU6E/P
         hJzQjRFvLqfSijQdUndllzp7TB5jprWjW2Id+vfCYk8jsmU9gC5XF5MYRBqC9lvOOCRk
         +WOqcm69WgeqLy/EgnJHNpz7jOpBIXJqz47I25AxfrVyO5PWFzd4vOy3XFZXg0LNjNTe
         kNpEuCAp/5hAYPAy4/iASw2YNMfwETJckc1QC/120vWl43nmyP3DZKZDa7veTKJCLPJF
         VwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958845; x=1791563645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMm1bZL6Fbo8wjLXd9+f6B67RIZAPtO1SpB0E65HvaY=;
        b=LGRp0HT/efln/+FTuYi9HvBBOofq2Hi3Emg3zGJC1EbCeOG5kHK7w2Aut8oyqI1v53
         JwxJK0j3ArF06IXzh/UDUbFyAQKjE2mL0zU6fHKdE59Zr5eOszvVt+tGPUUpPa4aH5vM
         Au5uhQ4Mujpy/L5bxH3brVIMNV1k5hgzZmFYjByyrXwc8N71QM7tUI9pgMl8d7qpcFTq
         pCcXohjAz4vOH8plZX0oKFCQu3jhVpOSjV4PVUa5d8zcPRGzgzLMF2jl0WYwI9NTdFx4
         uRMmiDuCA2yXFA6gYSZW8uk4dFuoAy/nYUUmow+dWOpUh8vCyPh40EE7nPL2ERmvbSqS
         p6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIxfePY95e4TeJQ5PT5lEZ6X71/oWHwA2HSlzCIBWueiQQi4FIdbhfqK7TzUrFyQTPDQRn3iP3AuJz7w==@vger.kernel.org
X-Gm-Message-State: AFuF++kyUuzVL0DN1NP0PvPW+Rgv8D+X3hYZ8kBJcnMEN+pIBt1fva0c
	FU2FIPH7DJEWkRaYiT8HJKQuNPoTtHY7KthQzW8XaAcNVX3cwt9M4lQd
X-Gm-Gg: AYBFou0KHUP0zLGPlJZfAiV9WNJyljcZ/BlO74br+ibvuKLjffwQeLrT+7NYsfA3Q18
	7PbkusbwwF/xpWulq9bBBtUJ6DfjLj2Ca7bS+JToHu/CI6zVIr2P2rPO7CMpygJxbTnmfyIhC6i
	hNqVKFulcc+ccs30/WgqSmJkURJq94eqYXqjWN7qzl9Aedk6A+QMqH7ChcewKt6hmijhRH+PoKc
	m2mC15YAGCS+T3U4tZRECiJiMMyK3EkXUU5DVPcqyl7YT8HPD3TgZuwIk9efychX70fbAp/M46X
	7iFVOOQBIiOMiX1IO47BujUfMuDWZS5BlmnC9NLVgQixVMlM2cBtuQYLKUnvADPgEGTysxys3AQ
	Cf2ZIzt3iaAVceEIy9E5QhLaqB8J7daFvVbMnTJ2cQQzgWRhJLxF9/vpcUvzW0wJZUoCQpGPaXP
	RAI2MctxaUtvyYfQm2bZIamMh/vT3Pd57UW4Gg5K93LiDZhbirKv2nVTMv+o1lURh1WuM=
X-Received: by 2002:a05:6300:2213:b0:3dd:85aa:4529 with SMTP id adf61e73a8af0-3e0d6ba7139mr62306637.36.1790958844667;
        Fri, 02 Oct 2026 09:34:04 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Fri,  2 Oct 2026 09:33:43 -0700
Message-ID: <20261002163350.1248431-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: LLM
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 3f90942f3..720adb0ee 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0

