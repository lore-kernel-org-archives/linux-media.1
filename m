Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF74EC67E
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674118; cv=none; b=sWpJITWSjPwJQBM3bhbvCtoZ5MP59sMyRMHPqoGOYBHxu2EHGrLVadW5BdhUozS0Rtos/BuaaHWgwwG7NCULTCxIi+sIdXcDqgX9xA5GYEuitsVfpt1ofGjC6PKAHZlF+yh8dAHnIwcE5+qnrvHp6n75F692TpLU17PoERiCcOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674118; c=relaxed/simple;
	bh=GGKmCLiVvtDvmlz0XzH+SIxoxbsri4p6O5niGHjqVvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1sH25tMYnQ9Dmx2Vtmsq+FsO+Vsss+hsTiBB0f9WTqKNU0fqcFQp4csJmpuaTvSix7KSCeMAZBos5ohsucaUPUNJ4FWG9lV5yoT45oaX4waPYCgvyzcAvDvAFK7PyqBGElDAGx6LpudblGpjrYcQhRZbd3BYz37ArdriJsspYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TupxW+Cv; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TupxW+Cv"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so264635e87.0
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 02:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674111; x=1791278911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=TupxW+Cv0fWO2GSrILruXo7jMsq1efBBhH1qgxFWkmnTAyv4rjyVPWfCzPpFlcV4Je
         lwJe9oQ2gdNqPNi/qvoY2bzF0iCnmOcxa63vLpLFzerKoPv8YNqb7f+hfwemu6sVgQor
         qWn3aqx7ObHv/juUrbIPG6dX9qgvVk17oN2xfJ4bKMkv21ZiSxX+vKbPeVmW6q13/x3T
         w0Y1ZCUq2gbpVAVmUls+aqYu/bXwvRUZLO8tIG8Gt4RcWKjUxMB/gDy2vnSQxGO4ElTi
         3ewvhwXgtNoj+Hea67vqc5G+5pt/KOs/1tutaoEVGbjLuCVQgr/o29JwGa+TUZ4z/i3g
         QAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674111; x=1791278911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=VGJiNW2YpnYHs8Ic4J+kP40anbzmc0vd37vsSbqMB7vycx56U9kUO4B71jw/NiAQUu
         B1vnSRMga6uAepo8WDV+UzsOj7a3qejDs81MK7RCG8IMzZ3KSbBRFHLwAV/SekN5Y9iJ
         aXDTx0icA/nllr3+owh+9PU1jNdCfoKohCTVdqgdd8qiKut13dxUuCvZJP//daCOWzyy
         3gcO9qYccV/3CHkgiAT9dkyNXWp/wTt8fN8ZE6ZSlUn2S246Mbdfv8a6xFchim6jYXY1
         Qhsi1MjbCcqyYNMr1cMAudiroklyozESa1xb+y6dAeFK3FZAKDNE/rV3lIGGiY1f59ib
         rnCw==
X-Forwarded-Encrypted: i=1; AKwUvBxFAjCdyXo4L+NlwMzpJuKdqpinbR4aTavRbFeuY3MrXyWDuTMFtROe7CdaTVH7RPTKYzYkt+FkYGhC3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKwaxAitPXNTAmO+toh1n++TuqZ1EDGN1YQy4B9xm2fjBNIfqAy
	GyQA+/kRrqSZ+bJo37bRAyflszh/C61i/M79m8Qim8OLYj9FeQ7pakpl
X-Gm-Gg: AYBFou3fgpT80csGtAFSNmD0r0S6LFIoPh4SPFXth0FVGAIEjwVeLR4gH9qI4deEANL
	V1YgKQ9Zlvzhhdls+Xt8Jw1V6hSAelFCXEsa3uuuHz4PmN6Hlj3N186/7FgPsnFj9tPQHBgMW7h
	3RT8v4HewXBtFmlAPYdS0u0QtT+WhC/Vq7IDL1w5D7AMUUKBSlrZ3psmu+Dzw1ycVld0mLkq9Tk
	ZB7cCxPnbF2Uw/74y+iTdlndDqTkiL6Ze4doeU5+DbWmx93qPC8tMhF7qmL+QwbgrF0wksD6HmX
	TLL+r9SfloqoWFDYZ0phqQXwtMbVezDqc8vmUBm32UMVi41AAkBEy6zMB+g+uqgS0uSo5ndbOJJ
	tPpnDytb5nbZ25heMDsg+ft1Ntph1UcKSU4RBeLDUAlqdhtDyyzUDlyUVeCoRnNY1/VgoGteO9x
	yG5fAnGkwQNP4trHnAgwSnHvCGFyKGYMRQXFsM6LHXnNvdp8z1y7InIllvUs0jzlQ3unfIhh95c
	9eR1jAsvfw=
X-Received: by 2002:a05:6512:15aa:b0:5b8:e83d:6c13 with SMTP id 2adb3069b0e04-5b8e83d6c86mr4110653e87.56.1790674110672;
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Tue, 29 Sep 2026 12:26:58 +0300
Message-ID: <20260929092700.1776966-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 (ACPI
HID TBE20A1) gets its analog supply from the power enable GPIO of an
INT3472 discrete device. Map that GPIO to "vana", the supply name the
vd55g1 driver uses, as is already done for the imx471 on the same
laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b48cf1b7f..b19ea6ee3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -131,6 +131,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

