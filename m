Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416A38D6B5
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872668; cv=none; b=sXxbvP7N90/4rmTp0z2Hl8p/pne5nQBaBiB+zQktr5eBAkiyMvafD4Crv3Wh8O4WaYNzjO3B+/hMF4voF/hyhWAJrjQ5NyNgiELitJIlQdApuMatFI51w+cyefV3ZYTUR7gpVV3sjOCwx2n0/EvNbRFQfCa208EhKZxXODJuEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872668; c=relaxed/simple;
	bh=P2vAhkjwfZLpGHwPw59L73KMSOIBIbwxnRr5PopVIrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5c/LnejxMMorRzsjTF2wQZLhlYYMRMPZfpiM4+XRFOemwpO6TrD5nFtNZ77PJhQhV1zU5k0xBDIAPT2ZYsS42y6Yx4CizzhD7l+XrhtaxC1posnuN3IxInntMSsuv7YzRozO09Sn/ErkwrnKeNnXaUqqCFMs+aDkGQup0N/4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcB/bLYw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcB/bLYw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b966dd74so1482145e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872665; x=1788477465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=UcB/bLYw7kEci8E5yyTnrqt9dMLB/GWv3rSmY6tkr8MmMikoVwYcgrBRLIHrngK7lA
         IQtubkj6f9diYzvlP3zBQh/g7K6Y1dFRvSIEus5vebBj0WHD5WYXnRIHMRfBQJEaAPJf
         3EPSFoeF8NyMDR+nlMFLDGNAM1UKvgtwZgudIjN9B0ZUjGT/6C1aRFlrd20MOynX8rXl
         jB2rJoDHFNOAAJqP8VtEZXqkUp1ChNiu+qScHyUw3IuQSoAUz8n8HpuVEYu2mL36vz+H
         rIqIaKqNc2ZXQoCs+bTDolgRiAmIJggmZ+UY7aQ1v8CUKbC78H1Hip1BlBtP0p/0ILq+
         8Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872665; x=1788477465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/Z0cnaeaBdqm8px1bR7dodj1ScgQOWcRfeLIXj+wSQ=;
        b=CswSECby2pRP4YKsbqSmUbxYhgVnh6aYlOjbof6mEuYNfKBFEi4NhmVqegs+aX3cWN
         BVTeFvBvpfhMheJ4Y7/6DCI6bli+CdVMGqgwPgay9lS5y0rcJ7cu9Ln8cMLtVXVBj9h4
         byZNf1yAB9HrhlgcZEo92oQjutLoKzSOhyTIHOSj3t773NDpXRp5LOsPiRhZH6t+q4nr
         KQoiNuHdNmyX58HRWNz+nRGrU/+Q6JcrmDWffbhXDSwLFpwZxAQZtcMcVX6m5MHAHvJW
         8I9qJ1DqDDYtoPvvutSDFZ5lufx+YNsJbKtgXWowBFw8Hn/1UINEnYArfjNII/9N18BV
         e8pw==
X-Gm-Message-State: AFuF++nSWk95ckr1Hhmp9n0Ql/jR/1YR+fYdGz7Mx8PGk75a6RvQuKNY
	tIzgK442ipdwFGEC0VNtCRpmIdnhlsMjRf8hp9J9K1SAN5tBI8pNK4Rkhfj1MtwJ
X-Gm-Gg: AR+sD11cGH9ELSpKbDYeJWa0fekvvSL5VBqhayzlxVQ9jfKIpvXDs3ZTBddFJ011DDg
	LFkFWEYR/6O74yeYxK1kUaKfPz1uJKETmz8plcmgBOSQIFqim4LRwsIsAUsw8faHT1oIpW30R4+
	Vm0PlDSWAzN8Mr8ujnPq/x7ljLnHnKyFnmWbyXO/mvm4xT/fb9I/0fU6VpinM9Va3NIqvahDUT3
	5sGwhdIaq0wWgt5jCDRfsRFfF6MbR0pQATQkcURWab7zgLgrqOoS4PtgNF6K9pUkZHBICrNZ27Z
	SUz3ueseGvsvhHQ+pDskCWIsalxujGOFMkpPAlvv3fkly6qNYYlNHkb/g3Hj+hv7Fc66IufnEF5
	9m49bfgzw86Sd4oTwtYehTWoqKj6eMj7C8nbCR9ZdBY7+S/FFul8hHGW0VHm3fLt+82fHwwgSBx
	/FZx2qgdliAOPXWHMkVEjKFZDQeyVEaA0/gpa4sJRF0w0Y7y6C6Mqni9Wi5dQxvOV7c917lU3RL
	thWAyU7pLsaZd6s0aD9ZZurn8ilQEAq3atP9znmFlz6
X-Received: by 2002:a05:600c:19c8:b0:49b:c8e:a211 with SMTP id 5b1f17b1804b1-49b91c20bfamr36205905e9.5.1787872663612;
        Thu, 27 Aug 2026 16:17:43 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:42 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 03/12] media: ov2740: Use C99 initializers for ACPI IDs
Date: Fri, 28 Aug 2026 01:17:21 +0200
Message-ID: <b4d57f1498ad38e024d3c16038e4688aaf452db1.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 39003c1632ad..8f0ad5dbb245 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1461,10 +1461,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
 
 static struct i2c_driver ov2740_i2c_driver = {
-- 
2.53.0

