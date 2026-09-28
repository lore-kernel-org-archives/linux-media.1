Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12984CC61B
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604146; cv=none; b=Ci8hAY0x/muKhmpMNYVnc/Xc8Hu3MVVuT/LQCT7UxNMNQoYS+Ogt5z8XgmQx15ksNTM5xYSEB7XLB+MI8Yioic9vxQvz81YYJLQDBO3Ye5ixw07nFrj+3U1QLpSe6AL4M6dZoaLjyzaeNd/NR2ldi894tppxgeI7DHG8F6i0zLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604146; c=relaxed/simple;
	bh=sDcYZUlaCQrODWTDQOdoGAqUtZJ63zUW+u7kJeDf6WY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bB2Zr8xfF8d3io7KvY+E8LZyXS29R2zZEE2J3wy5uBQUwEnCL8J4S5keGwuWQGZk68Pk66j/CKNBbcs8NODiHd2C6QeaAIVR6wdI5bCnkbE5aWvTtVjkuc1oLNn0jobT2bMciWWQNFXtCF0e2DmJup3szFj566WeArmPsPe023Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9GzQdFL; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9GzQdFL"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a47d5764feso406929a91.2
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604144; x=1791208944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7dh01dzLOouMVphsrFlQ6d9OZfrgH3444PU6KYEKGI=;
        b=F9GzQdFLr0cMvWe3TzPB2irprc87cGJhoD7ayjes1TfRZfqm3l8NcUN9vaqp3bZcqk
         WGAjXtEEIVwePDIg1XVOsePtQkKdz9HtT+KbVHK8b3q3r1zufijwxKvmZVi1ZY11gAS4
         QcWLCT9/R3v6MsyRcPwFf+dOmShTgLlGqFetBcEPfHIVLpqY+csdp0rL7vdSYaqdwyw3
         /On5Yp7QH4igcBnjZoPOG14o8XYPFyfgZ92ZNRE4ouc81E1UtfecSbL0EpnRruQUFo39
         8RM0iANOprBn8+9oaXQ5YGka2ZPlk1Ec/Hah3e33uBHsaR4QQUN5zX+gwJO2Na14r/PK
         QFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604144; x=1791208944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7dh01dzLOouMVphsrFlQ6d9OZfrgH3444PU6KYEKGI=;
        b=FZU8KSHJYn/Ye14XVxAICIgEJyBya5UZf/jK872md9p38R7UKME5yWwp2T8tNgHoJV
         jekHlQvfjs/WCuZGDGc/6HRddKwS35XUQznEuamtbd3LUg0JF+KjQ1P+A1ug6MmvD7i5
         jm5elxD+BzP7rjKlI8u6mZUzEulPtlyagF1VHxJ3goYDZw3k0U4tj+XjaGXrhWzJ053Z
         y5Pb2CKz8o0kckjSofU+s2jQfrTFajDhu2THE4gCo1P0PCsnEU7AFqfklawhRpr7g/m0
         sfS+lC/4uqki2jdKnMk5MGauD0Bf3MuRBPmQnYvRrBfT/tAFPLSrEFz0yARQtV1Nl0kd
         +1yg==
X-Forwarded-Encrypted: i=1; AKwUvBztSsDoGK8kpLBVumCK8Bnr83VLBeHdxmq6upy9siU/xuiNwEPXc+zN0rNHv6Q86Is2Wm8PHs9G7uKfmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI1wx+gTsk9pOVwMIj4Bq8et5n4Vg+cptj3FFSEibg8T0ScHshX
	LKGXmeGNDVOL5T6ow9VYfJb+1Nty+muyMbFTDyFPQzJucRqSfvEQHaES
X-Gm-Gg: AYBFou3eKj3GPzhmF5T/rMmiDoAlYdrttkQJSJAUDrGVkd9cPPPPzt2CaKpMpzcpdSh
	vueRcEgQ2+01C2/CnUxQk742riBZZ/V/jNKo7dsgChRQC9QZFAAu3SF1SWIW9U2mALd1ezvMa8m
	/jw82IOLd0iBbJItJrRT3bE70mN8nKuqWxMcVwQkKYdXxPz7ZFBr3OmHSYVIHqoiwZhnvdauDB+
	BSlIzH9zw7hw/Ty/u4rIM9pxazMw0Vl1PCfgK2jAy9P6LVjzrhmSUdx0eVd6gVfT91ad49tiJtw
	DDu4earsyZ3qPyq+26CwEcxjeMGzlsMxey2sbzJrLxycW/+ROyZrlvLJDAgNUSh18d41wEYlVUf
	4uwoS8QNc8QVnp9+YzDA4Aij9wHKBSbalva9QZ74Ewlo0+tMl5t/uhG1CtcfZ0bq7k2lLHT/O8Y
	s+wgh/PU8QL2ss3je3p03zXL8TfSpsr4dVb+rXKROJwyAXmJTYC1ixEmFmos9ptgMxxdIafFejK
	Z2A8/nfI+LLsX4tAOVWLbifP6I=
X-Received: by 2002:a17:90b:5806:b0:39d:f4a8:75ef with SMTP id 98e67ed59e1d1-3a098ae706bmr11448998a91.1.1790604143869;
        Mon, 28 Sep 2026 07:02:23 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm20657073a91.2.2026.09.28.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:02:22 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov13b10: fix power leak on remove while runtime-active
Date: Mon, 28 Sep 2026 21:02:16 +0700
Message-Id: <20260928140216.2396160-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov13b10_remove() calls pm_runtime_set_suspended(), but that's pure
bookkeeping -- it doesn't call ov13b10_suspend() (which actually
deasserts reset, disables the regulators, and disables/unprepares the
clock via ov13b10_power_off()).

If unbound while ov13b10_set_stream() is holding an outstanding PM
reference (removed while actively streaming), the device stays
genuinely active with regulators/clock enabled forever after.

Call ov13b10_suspend() in that case, guarded by
pm_runtime_status_suspended() so the common already-suspended case
isn't suspended twice -- same guard sibling imx412.c's remove() uses.

Fixes: 7ee850546822 ("media: Add sensor driver support for the ov13b10 camera.")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index b0d34141a13a..ab5cf9af2e85 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1688,6 +1688,8 @@ static void ov13b10_remove(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 
 	pm_runtime_disable(ov13b->dev);
+	if (!pm_runtime_status_suspended(ov13b->dev))
+		ov13b10_suspend(ov13b->dev);
 	pm_runtime_set_suspended(ov13b->dev);
 }
 
-- 
2.25.1

