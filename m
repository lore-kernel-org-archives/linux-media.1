Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7338B133
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616896; cv=none; b=clonB0nYeW3PUe7H8LErkJ2SiWcRz3ml43WCU/1Zx5FUL2EYSVMuqUTfsD6iVlQDjVn7quaDcTc7k50ckp08jyT35KVGz7a8epesPvX7p/6dH26KWemknO4szIpLAdTZiMmXJU4nK1LkheBv53pm/lJ3icStAikcdAGpbxRhtQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616896; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cZhs2YUHknLyhNKvuQKHVjHys8D8bpXUHbxd08zBIHl0B6nC/SqZhFbuGNIHuZPpPNSg/Z/xfh0lmOmDNZ4G+5ESIJgTxr1ULN6WvH2CKmSDD/bEqTnPDfOwS0a8sVG7rv7l0AUIDEDE4MTNk3eNGn/2V4W2+rZywQaqH1I0LlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpV17zU; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpV17zU"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-785073ad5ccso1450684137.1
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=MZpV17zU6O8ZzOYCM6mSh6Pc5bMWELB+jnQuQi5HQCi6EKwnfgmZ0AEBpaSpAQDW8S
         16IVmCmWPcQCQ7FUoAc2mjdXI6Vun4CESOtgp7TZ/BbzPL1ysQvKYMFBk+jIWWhuCbdj
         gBI6DgINw00GjdIA9p44lmwqHYK57/id3xwbTs5uCy8v4cZNIxLxiIv0AMx2XLjAnH3C
         Ea+l+j6WgNoLX1w28TuRU6e+lpGdTNOmLFjggreQG9OFR3L71bhcUPSJ4VvBiNxuPuvq
         ddKBGzFKZUmonKqMeFOYYTi1Tw6vtCRVa1cj6NAo3DraG3ex8OCKO8Q8YmVB4pM+sOEV
         hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=E46n5WN9/yP0xP6bZaBVaM0D6so/WkPRX0/jwQw+P4dK53cL2X15PZgXLzaRtnbMwm
         BAsnwPHV20uqO0dLYBQNKwFv4DMifGDvYRWhbRgDTh+ymlHHodRBSaT5vr8eS1NW53mt
         stV0feIOwYCL8I6gGWEtZe2RqBwholRjj9smdETCmYeLP8vzNkG7KSX8Xzi4/E1D1YyN
         9vpptrZROGeKIPHrAIQWpCIpqPpGC61EcRViBi2phMGw53bt/P0wGS6TrrYWg3aIVCbL
         lHyWoDr3ZSJrstVqCEAAdb3Jro7HiBe9BLeW0+NlJTNitj7rCl5htF78i663+K1LaNZV
         IurQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeo8YNwphulH1ZalYg3oz7DTP0SjniGLjCYoV+PzpuKOtF78He4nFpbseIVfqCSQTqhMPX4z4/t73eyw==@vger.kernel.org
X-Gm-Message-State: AFuF++mCdpS8RB3bEBuPrH8+Q63HWLRAe4jD3F7cLrxuRU7uFC2w/4fR
	cOUqiGHMvUJNtN8FPgxnXNGiXdwq32dBrBFxBL/nk55meMgJnrg7NUor
X-Gm-Gg: AYBFou3p4fm/+TEVwEaR0MbTIp5y2f1qd1vWFdPCxK6cFhpzP/VfAvOf/9h7Mfg1ipX
	Bc/9Kmtja/vf0peRHgfXHatMbjNfmaXPF6I+pV57krZUIAkTxnuslMX/P8tkcioBvN+Z/WJUxOv
	wGqIrP2MmFx5FFl/DP1UwuOm4wwMWkAU39z2AqUXnJ1rdKVolc4TIM1SojsXoLNSa8R8cKhb9/n
	yt6hWtiPuYAxm3NwMWyqCKAzKzzR2PyHxSdoiFvwTz5etRahJ9pBd60HRGYDHU8KboA8lDY0tc8
	QMkO56QZTR43OrSnXs8r7ZDdNuE6ASzOlOOKllPmt6asrhuTkhjDvn5Eep7yhz6/7c7vpNZRTXi
	9jfJTeIF81S6MQEkAhXx1+WKa/tIwGgReG39r+2CK/xH+BPNlDbz1YNVE7CbHoBe7EfoAwzTcHI
	tD2o3rZlXOnLgRP+6N9OYHa59Qp1Aac3OqODh1m2HchWSvidJNpkh9m0z7fQj/kPfNIZaM+Qrv4
	H0QwGKlkSU2Qv51aQBe31qGseIc7sVB
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

