Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93E3314D2
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 23:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874946; cv=none; b=WiEVOqYhnDelyencdtrzsm/SAuAketW/Mm//dNfwO38xPYmJZmbrJYbvX7WW9nGYPiVZHlB2i3C1Tm+CJvZzBM6jw0B7SuFbJo0bXuWyjbC2B4fVYONUesVOhC0kaG5GLKoQj3O66gy4d4k5s2GRY50cqlc9bXrPAgKMol9iHwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874946; c=relaxed/simple;
	bh=uF2wjp27XrM7kHX8L5fBcMf7DUs8iOROkUMfrrvG244=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gFlQKmpMI6yZLajTpV9osb7FfC9/Cs24bjMS9bjbWSEWJmPVae2yzIw5/7Zrjv0cwbUBmKhUectG8OjxZ19bV4tA5gApZ1RCWZs1HfIR+U5g21Ce9X271Rlu43RmS3SSJA7rWarV+1B5rWhWOj7BlnK3yzuCxj7NzLqzIzF8NSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tdr5/Ljw; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tdr5/Ljw"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-1382533d428so1022983c88.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 16:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780874944; x=1781479744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47lZbQjzRT+z7mXqB+2Qw4HmxmsdDinlE58vVE96Z3M=;
        b=Tdr5/LjwLn9OzOyOnFElgchxqVxbkztJW9iR+j+Ka7a1ge6jSD6IgCP2s+5Lqu9LFk
         jZM674W8tqT/oSBH1P+XllqSlFBT3zSk8zKxNVdidHPDPWWJZFxR0HJrl72zzeWbxle4
         XiQWplFeAmtXcQpOuiqOLh+WoHNGLpxtJbNb4IgP4xS+7xnct3T6KZGypnaNBhs7/Hvp
         oyI0DteJ9l4TxW8Lg9KXso02Md7AFP/BEIc1d+xA/lCeZS5p2Y687io/2hWeNm7MP3nj
         m2fX14qpoPZ3KWNgrddE704YjZb1TpDSN9RJPTjpb24QpPn0UiJZhDvK9oEf9MIfIgId
         2ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780874944; x=1781479744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47lZbQjzRT+z7mXqB+2Qw4HmxmsdDinlE58vVE96Z3M=;
        b=hf5SjagtmggrnuNC3b4MDN7pJLNguxx1Yt2fa/8X7SLpEl1MrgzXhl3p1i+EIyr+9b
         2gxd2xotOzqWkhL9STKM31XekMp1Z3uCHlTw+AMTPh2xxFnEsgqIfpMCahrQhzHBPK9f
         P9qknfu+6Kr3UcboemzKUcMmYzsS+NzyM+4n2103bqRcamL9ONAIwyalvSeaTPZCUApD
         M5EePpBWIwOQhzHn+4l9JXdtN5P6Tpzij3lVP/flG4EHwMdFiQEGWBoAcHashKBF0twf
         dkckTv6GKccPWl2emHOu0i/U57dJf5EfhAtGQhdUl4NOfO0FiOpdRXmsF9r9n0rjOuU3
         ROPw==
X-Gm-Message-State: AOJu0YzO5paFfRdiJp+XsqU2++5uvb4pyiyfF7uJJQZyq3FeFqCJrSP3
	0VDaaz6VRE2YIvKUlj7CdiObVcgetVW7tWhCTFfcDlNFlQNHbL/5d+UFCsMfUFTC
X-Gm-Gg: Acq92OHhfQJ6ZMzSXcqSYbmSsPoIWocrr15staoAoab4mG9FizDmresUEWYITLWwwDa
	q3CpDdZxFnHiOUNWMKPFJ2adVojoaiC87CzmjkyOtrBPYWyaqA26HvR6WtOiJ67ciYH35q3Ygfd
	tnQoOwoq0S7D0ZmMb3RtIG3q8pXeHz9Fscy3clTLGvtNRs0o34dhas15IwMiKIW3jK5cdP1lvgA
	IhajWe48Ja4xjHa/W+siW+/H59wyU2xvYGiUm4ZWWVDbYce/8i1sC/2bD0IhRxy7KGXftdNmi71
	sCNQXJk0Pv8IqXHF6/MibcAFTNAQNH/WA/b4aCfgPGHj7v1ZnmQ1pUD0mzEJwBZnDY9a3TiRSVz
	44UTBHMq26Ca8EmfOhoDcV7g8YWTwG5ijuFmvsIMF5zLLZACFuihW+Jl/lQyXtX0fw5NbDKx2Mv
	cNtG1bjRW4yC9nH04sTPuX2fhL0hils+Ub/S3fnNU/XCv35tbo71JMmSPOJ/7MAs+hPQ==
X-Received: by 2002:a05:7022:3d84:b0:130:9b78:b17b with SMTP id a92af1059eb24-1380673ac40mr6778942c88.38.1780874944050;
        Sun, 07 Jun 2026 16:29:04 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm11324554c88.11.2026.06.07.16.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:29:03 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vikash.garodia@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 1/2] media: qcom: iris: fix runtime PM reference leaks
Date: Sun,  7 Jun 2026 23:28:40 +0000
Message-Id: <20260607232841.79275-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260607232841.79275-1-dennylin0707@gmail.com>
References: <20260607232841.79275-1-dennylin0707@gmail.com>
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Added Dmitry Baryshkov's Reviewed-by tag.

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

