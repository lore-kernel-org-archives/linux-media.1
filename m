Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6C2D9796
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604655; cv=none; b=rEBPIZmoLpntwMuXNSVlthARGF0UfQDQAep6f/AA6SpG1rJJ6xBfz2FWjxZXg2lJyG8ZFkU30eKbig5AY2cYKDUftOZF+CuONXVJ7djvytMuF7QNhr/ziJRR5QLsziwF1znZp2rVkAj8N6wLbQwjA9DS7KJ0BuFBl3ke7bHaR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604655; c=relaxed/simple;
	bh=911/gGTIVH/XBaJWfHJBfLJwVyKWC97NEVkQjJT3S6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KK+57Lh0B1DKCI1VRkhp7bQpTU2bNnlJYmfW+6monrCGglnnM4j71vrtac9dRDPt2tvZrchwYsF4W/rIjf1gzMs5l1K9bZ2Xq8be6jcPC7acrp04dTv1GFd6w8XXQR1r+xqNTWIeJ1pXc5d18EOeDuRZk9S4kNkOfraaabMaiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtKUnfY/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtKUnfY/"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so20980665ad.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790604653; x=1791209453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzpzLV9YSjCLUYBpVj6plH2gR9G8MGLpr4Th3PeANto=;
        b=KtKUnfY/z8jcqQvJH8kIqwSISBGOjCud7ueVnF2bcdwLPQVwpWscNtcX6IHVyAXO+Z
         MEri4xMKCG4lTmQZjz+mxt9Tp5nhG7CqvncmUmMZDbDmTYVyTbTis+kT5PudkyA9JzMB
         Bo9rfgeB/wRKUMB2TIwkODM0rH1eH8KvtQ4ehvP8DL442k0Fc3rGDJRzjYTnHeqxZS7l
         liiTHWGpaqelC+SvUbiAS0fFR+LhPT+R571xR29NFr/5Ht4wE/LREU0ghsEN1WczjEoF
         UN7uMqW4j8p8bZ1UcNZL/fyLGQ0mF4x45RZNqCd8i+N8R+q5SnMUpxa3iJ8ETMO3PPIt
         YVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604653; x=1791209453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzpzLV9YSjCLUYBpVj6plH2gR9G8MGLpr4Th3PeANto=;
        b=B8IjDwRUSIcjC8bCJzPvVg1SsAlRqZJkQGlcw0oJ30NlTLm3BcUtHjTtxwrXLwVi56
         PbGjA0fAAxHC/oYlX0kDSHgpR7kBZGA7Q6Y+4cSpi+8XIyFqAUJRTEh4WipcRskdvDfn
         RnnWdK8hFEbpL3wkx4jBjTe78F3veo4/RGybu0az2OoiC5FvVRnCXUPsD6+AtCoY/QJP
         dSt4GCD3OkhLurYm5AHc8Nss8tEjmxSwmxcSse9SlhEGcnUFXWwrRPaCYVTRcIeHN8yQ
         mUH/EpYNBMZ7YCN1SOjpRi3r2updmeDx1bAl7Xu2CT8Q+m83DiepoUlZnnWvhf+7koF9
         dpmA==
X-Forwarded-Encrypted: i=1; AKwUvByrfxbPLLvsD3/RJ3mElkCpBwjWDlS50f9BVywIYSZeb9gXaGkGzzZHtG1DbOwTIfZmH+dHE3dEeRxmsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYoqQcl0CvDW4ufQboabbkyEurpyMRyyxIp9imVZQrQNheuyhB
	c3OH7CyjMuu4ld7GLwtbS6XI6rn/7xEmtuWJ5RwO3VgtoHTks5N9uoTB
X-Gm-Gg: AYBFou2glVzQLhQ5O5biMtGdF+1tm3vM90v2AFOz6gH4KjKxKyWgzrxYKFvUy4F6eJ5
	yldsu6xayOO9urMSxirs+tM5RQQu1M3aLDMWiyYYoZV+PAlQ9ndegW6kaktZqM97niwHfnMhkWo
	SJNshDTlMVTQc2k0Qxc/RUQ0vbAWO3FWyqk7r3YZel7aRYVoS+3iMfNGW84shJypPZ01QOaquoY
	lujJRuxtNDDZzEmQBO39cKCYuk3hAknMN246t7WXdUP0gFimb/Hh9+szWre0EHm/+p4xsfmZZjt
	f29N5fwLW15cXqfFxCtjyzGNxjmnd88VMKi/xpMLJvBqJzaMXVqhmD9GY9vKJa8MfUnW8BNZFR8
	CPYgJkHadP6Go7AWWfcAbBoVGlEPAZY2CVhcKWEF5v5Oqyge9DLgZ47KAD8QMVtp0wbUoywi7IM
	HQx6pAIX6Lgh1kBLVbvrvco0Cf/MqOx2CvMK7lYwtVgQPNKIniu/zj7b7SlRFjO3Iq5idWBp6QA
	LPpeh1Z5DZ8iiXn
X-Received: by 2002:a17:902:e750:b0:2df:81d0:7c3a with SMTP id d9443c01a7336-2df81d07e13mr112334595ad.17.1790604652846;
        Mon, 28 Sep 2026 07:10:52 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9140545bsm41966305ad.39.2026.09.28.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:10:52 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5670: fix double runtime-suspend on remove
Date: Mon, 28 Sep 2026 21:10:45 +0700
Message-Id: <20260928141045.2436838-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ov5670_remove() calls ov5670_runtime_suspend() unconditionally, and
that function has no internal "already off" guard -- it always
asserts the reset/powerdown gpios, disables the regulators, and
disables/unprepares the clock.

probe() ends with pm_runtime_idle(), which drives an immediate
synchronous self-suspend (already calling ov5670_runtime_suspend()
once) whenever nothing is streaming. That's the common case, so
remove()'s unconditional second call clk_disable_unprepare()s an
already-unprepared clock -- hitting the same underflow WARN() fixed
elsewhere in this tree -- and disables already-disabled regulators,
on every normal removal, not just an edge case.

Guard it with pm_runtime_status_suspended(), same as sibling
imx412.c's remove().

Fixes: 62ab1e325978 ("media: i2c: ov5670: Add runtime_pm operations")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5670.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 01fa892de079..a08bb4e9bfca 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2784,7 +2784,8 @@ static void ov5670_remove(struct i2c_client *client)
 	mutex_destroy(&ov5670->mutex);
 
 	pm_runtime_disable(ov5670->dev);
-	ov5670_runtime_suspend(ov5670->dev);
+	if (!pm_runtime_status_suspended(ov5670->dev))
+		ov5670_runtime_suspend(ov5670->dev);
 
 	v4l2_fwnode_endpoint_free(&ov5670->endpoint);
 }
-- 
2.25.1

