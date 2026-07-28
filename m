Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBEF3D45E7
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785265699; cv=none; b=WIUWb9mLlZM2SEjKYqN9UBUsBVqHXCkb8GEbcHTyp7M38eA98ZRI+UDKlFGi2UsyXiwK4IgDKUHg98QosToaqCu7c+MMB8uBflFvgJ7zoFX/1Aa1pHPB3Pmjvf4Dr8LMsjYn61fHEn0MXMHMs3+ubCNxGRPnrWYE2rLDrYGzu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785265699; c=relaxed/simple;
	bh=C0aNUaRR1UlcZgfZTjoxt18esB+0rm7CJBlEEQYVGvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWWywcp9R3KMUWVDtOgCLWMIyH0jE3ucBNygIk+R/HprsDzgyfB4TRkTtYvEGfZSiklhg8HOT4cGSO/5AI8Zvt5NUwnCMjnKiXkHpbA6nA1mFTCJ9kszBfLWF1fAQAsm4aMC0Ub8dA/KtPtFKbYzYqt4k7Sv3KlUnID+ZdQ5rtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwPIzy9h; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwPIzy9h"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9063b380982so1583846d6.0
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785265696; x=1785870496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVZ6pIwSayMA0MEYw9sT7Q03EoLYjNgoRfp9OrMyddY=;
        b=rwPIzy9hRg5BttFXRT1HdjeFuBGZ02CWNHQcYb1P+1QJpcyF5zPoJD6GO59ydzw1vs
         aHqpnd7Gz/zo5XscDsgweEY6M3NOpJXkTGjrY3GqGqEyJKz+B+s8M2gDWpZXsLO6ZVnt
         pdFHwK5tElnaCRQ7agQr9H//Jnvl9uvxKozf1xxGWY2UQvQfef+vXw6tBBLNUQJZGOYD
         YACnYUgilFAWc2h7u52z9obDzPk9tk3hDOKLQsWDA92emTQfk0ivq7gwbXIKUKAJqVZw
         WTAzNlryYhFYELxntxZNiRj2f1WykUE2SFgetnq3Yx/7G1/4I9fkKTLhFCfWS9BcIK+g
         ibKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785265696; x=1785870496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVZ6pIwSayMA0MEYw9sT7Q03EoLYjNgoRfp9OrMyddY=;
        b=jHgDcugy2Fm393S2ztXU5ZhmtFeaIqCIjlwgKF8U7blnPhnZTB3IlsGXzSygIV/Kzr
         8wf8QsU0jhciKkMzLYdXTOjDSbambXX60mY2CS5jpdsXLG2YxwSAIswO8xFHSA3RNkJC
         irXhZ/niYfdZ0XaU2BNwAHldkq4yOEq1OLeNG/BGTy7JFg53ZC70/+Pcslaivp6OX7vO
         KkOUkvMQ3sBapou08NpZZN6oqvZDMtN/PIxK6Tfq2sMofPvAxocfIQ9IZJ30IA6TFVLS
         ALP0tGkNXtYqTbpEvCaqCQs3fhMg17EkEyoVAjTOBw0b4XEBN9TDe0GvMyB2rZZ0kAMC
         PikA==
X-Forwarded-Encrypted: i=1; AHgh+RoQNGCRv1fq7dsg1d8L3fy6Fl8fVBi1Xa5pL7Le1XYdLjN12aXw06Rj15aM4suzhv7w/nTUgbgIN1pAZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMC/e2AaRE8KXE3MxzJ6Wr0FK5coft0mNSKU/Gxxju3+wol4Kz
	YQygmx/2O1tZAqIZ1ynXiUG5mkwA8vXIjXEB0A/XrBxXWADgxsQ2xyQS
X-Gm-Gg: AR+sD11f7PFWFeJmLXUgrke+V3Mm7mmKRFkyQRrjZKKoH7m5/xMxQcH92Ba2iPrzD75
	Hwnam/BiBugZqaZ/rID87RjfnEMyBaGtnbmuibE6NfykpmQJFS+17j8fvcemet9B4wu4h8UD0hI
	HBByylPa4otmxr4U5c5wDqVGKjZ1//Jx5rn+J7H44SCSTpL5D/hdoRrYqpc55jChGT8I9mslnXS
	qirIP463BOvU9FjM6DAgABNsyfaEl/iH98b+I77IHxEDazKuEW5iDxDAmGsYwGh2csneLBw4WyY
	//MmcqSfPasW+aAEKaSoAwHl8LIQIvk3rUkzK9DECyGH3y0tK4qrUDk9iGBSL3QnzhPeghwp7XC
	KKAC0wyse/cCzgGyOKGEsL8zUzGCkq7qkfGZU1qUJrs3G1jxg9wlFOyK94Y38XW6PCj6bH6uVVk
	863y63ttByqJVkXl9AfddHCp2vr9MAWnSFk3FBkW0Jp0Os0knhq7bLc9v4QuvhBMeJFa4=
X-Received: by 2002:a05:6214:54c3:b0:907:88cb:2ac7 with SMTP id 6a1803df08f44-90816fd59b3mr46466606d6.24.1785265696133;
        Tue, 28 Jul 2026 12:08:16 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd68434sm5556936d6.38.2026.07.28.12.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:08:15 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v4 0/2] media: amd: isp4: fix error handling in isp4sd_pwron_and_init()
Date: Tue, 28 Jul 2026 19:07:38 +0000
Message-ID: <20260728190754.363464-1-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728141659.62310-1-gyf161023@gmail.com>
References: <20260728141659.62310-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the error handling in isp4sd_pwron_and_init().

Patch 1 makes isp4if_alloc_fw_gpumem() release partial allocations on
failure, an independent leak that was previously masked by the deadlock
fixed in patch 2.

Patch 2 reworks the power-on error path into staged cleanup, fixing the
self-deadlock and, once it is gone, the runtime-PM imbalance and
unpowered MMIO access. The staged path relies on isp4if_start() cleaning
up fully on failure, which patch 1 completes, so patch 1 comes first.

Changes since v3:
- Trimmed the commit message of patch 2 per Sakari's review; no
  functional change.

Changes since v2:
- Added patch 1 to release partial allocations in
  isp4if_alloc_fw_gpumem(), as pointed out by Bin Du.
- Patch 2 is otherwise unchanged from v2.

v3: https://lore.kernel.org/linux-media/20260728141659.62310-1-gyf161023@gmail.com/
v2: https://lore.kernel.org/linux-media/20260727183500.298036-1-gyf161023@gmail.com/
v1: https://lore.kernel.org/linux-media/20260725203640.915626-1-gyf161023@gmail.com/

Yifei Gao (2):
  media: amd: isp4: release partial allocations in
    isp4if_alloc_fw_gpumem()
  media: amd: isp4: fix self-deadlock in isp4sd_pwron_and_init() error
    path

 .../media/platform/amd/isp4/isp4_interface.c  |  1 +
 drivers/media/platform/amd/isp4/isp4_subdev.c | 28 +++++++++++++++----
 2 files changed, 23 insertions(+), 6 deletions(-)

-- 
2.43.0

