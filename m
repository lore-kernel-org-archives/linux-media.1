Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE802FBDFD
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545114; cv=none; b=MK9hyqOq7UcNZ7igZYkti0od9kHe/uaykGCy1P2ylERccCyWeEHunolXkLQwOdLSoZ2xkWC82QIyU30KcTqzXTpajw1XbBOW8CpTkzMCQRrVpl5MpvX9rGnNB7SiIm1tS0ZHtiRvZL+W/dV1eUOKYZ7ZCSI8f4OUWt/ibMEmlvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545114; c=relaxed/simple;
	bh=5Xwn95QTv2SaZnnoatHxG/UMBvLc0GnNX8aMIGUQk2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bEpMPdRMu/AADCaCWp1Iml/xl3fUdYWYd19HxD03SQ9cehvBGVyaE7mu9Qi0xquu1IwJwybI7o1aFYV/098Q6LjrxWZ0jst0TKM54KfgnzUi3cYVko9Pm6haAa+6CvLHI+WoW2CzcZHSn2lNxUGrsfG5Y6iLYnCTCYsjSC0ZKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNAKuKm/; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNAKuKm/"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137335bc3caso331136c88.0
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780545113; x=1781149913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTNM1PBuK92bgU/P3kzPwXTUzBRzY/h/x6TymISVLAU=;
        b=sNAKuKm/4waEBQJB7/COpOJOvS7df1NGpjs7mvLMfK82iYtIduhNbT4kDHojwDYO1X
         P2EAmT0sM31WPPiOumQE/7zdBMdXsfxE5xyACb0Xiomy27g30mtivHz2iq9Q6LP5vmmo
         WEpCKBFAaBlbUbJsdvSd9PA4BWVwot1WYSYD80oWXbWXOQURz5JC/7HW3e11XsDOdVY6
         2yf9+rhEWLTc5Vcf/H46ro+4dux3VK3UM8opC9hZn0ZZjN0pCaeCNc159iFClZP+rOyx
         xkQKPojcsqDBBCNLEhMlalL8wxfagPBLL+Fm23iZ7rvCY3qSaBhWYJwnY+l+kZrb/jUz
         v8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780545113; x=1781149913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTNM1PBuK92bgU/P3kzPwXTUzBRzY/h/x6TymISVLAU=;
        b=Lbz+VwfeKzuPyxfMtpu1trH/Do/9Dbkr2bf9yUVWRfHMLISZSQ5+CXkqcbermsLb44
         eonhxn0UcSyv2lU/qhR6/G97/hElBNBtpw8+I/m1UCm1b4597L9VxFTq6NWT1fp/7bkO
         +CmCtiuQWBKqSBt85hYHykkCfmYbEKkCTFsd6w9ffFqrOvgSECLUR8f8O+fJoZWy5jI0
         3XlOQF58bSF3Wp6RuzXFYJFc+QVMdF5z21K/VKLADUejKtgK51qIfmtBxZUGtghvIUJR
         oeOq3WecUVukeOkn4XBuCbZxU9KOp9DMTekz/xrUZ+n3r7nQA/lxDJGA/Xo3jwvyVsVz
         hPNg==
X-Forwarded-Encrypted: i=1; AFNElJ9V2DztBoef797Dx57VjrBhv39/YkcOX32zw/B0Dbh9O7kEAypEV7g9+JQlqSgTb/BBXMux3Q6ulOp9Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNycaWgVo1nWuyTVeWvslSGEMudXDcwB7iIQBWUNY01AyRAzB2
	8EGmrXhkcc08HeKcTp9MjRa6BiCp1uFni2ywTeugsg/tQhhu8ZGh7xb3
X-Gm-Gg: Acq92OHAa0wlpkfP2Dj1fIolBtd58GJ9LuemvM3DmMkhFXAKeXk4mSwJ+tue+qfGnNy
	ZidFkjnAhuExbAn9v/xq6wvlS6a2cBWNFwsQ3u+f0jswyV4lICC3FFKxFA+rQnJw7Kc8hh5ceXT
	j3JNa6uVUgHkv/lWmmOgVViC08bu3eW265EJkkdZkFbkeTDuF2Euv/sCURip6NnnE8/P5ipKahY
	pVXBWLMSXLe7hinunqeQSD7sxr5I4e3OCwwuFdnPagbPwDTQFSfTxsuHervAOT+mBLmEPcLw2jV
	66jpuXUfIJ7lv6+AduORFBqry82XE6fPky7V0LizFVI7lcr7EC5pItT8O5qH+F1vXzcG+L6FHXx
	2ueqxnsghkLBHk0c3kfyxHcFLMnXQVABO4wA56yGINHJrivIaUtyXm3nAVmrCRMq3BPkYiU0yfR
	ht8JkufXTWz2sTuaCMo2MrXCZ+YfpV+WhDfVM6JjRZn0JxYpY11mUVhzi1RW87tXuO5Q==
X-Received: by 2002:a05:7300:3213:b0:304:5a9c:6479 with SMTP id 5a478bee46e88-3074fabc095mr3275339eec.9.1780545112598;
        Wed, 03 Jun 2026 20:51:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm3771487eec.17.2026.06.03.20.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 20:51:52 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: abhinav.kumar@linux.dev,
	stefan.schmidt@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 03:51:33 +0000
Message-Id: <20260604035133.39825-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pm_runtime_resume_and_get() in iris_enable_power_domains()
to avoid leaking a runtime PM usage count on failure.

Also ensure pm_runtime_put_sync() is always called in
iris_disable_power_domains(), even when iris_opp_set_rate()
fails, so runtime PM references remain balanced.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
- Add Fixes tag suggested by Jie Gan

 drivers/media/platform/qcom/iris/iris_resources.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..f5e3341e1430 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,11 +78,11 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(pd_dev);
+	if (ret)
 		return ret;
 
-	return ret;
+	return 0;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
@@ -90,12 +90,10 @@ int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 	int ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
 	pm_runtime_put_sync(pd_dev);
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1

