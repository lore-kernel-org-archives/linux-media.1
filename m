Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2733A382F
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 08:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906672; cv=none; b=caCwiZ/8Ph7ymk4k+sgiy23PBb0VuhwhJ3Qp9zf2qk27N1e58fW0rReJbx89/W9JFS0smLFLkRGjldvi/OmbfvYWVwYccYHLtBWcHnGs/blJ1HMptbkUvXNxSDeq92TlmpSBR62fsUxi79KXVf1478rXb5tRWFrViROjdyBoq9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906672; c=relaxed/simple;
	bh=G3mPKW0gTsempXh1cngtGsHlKo8rWtAyp1QhWG0BVWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W2e/Q1aBS8P7c3Hz7GC75yQC2CfctKm9bAXb5CIGOzPeB/sVzgiNmmL7NWhjumjm7EfkcV0igdCnmWwuAozK/+29T3t/8BBXbZcMtsxuAcvafqygXQtrGI8CdKnfw56T69NqSBhegXHYtXotUMW2xBCTSoOt9K48vmcqXfS+Xms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQuSqOp7; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQuSqOp7"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-3045c195251so3551846eec.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 01:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780906670; x=1781511470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqwFJZf77z3gY890YdN/zmCB2I+TWixDM2zm/X7SEng=;
        b=VQuSqOp7V0F632GCcfLgGz8uS+4bjwt2vNVgXW0V//nWlhtOM5vIkJkOHhmHvvgQVV
         fZK1drAusW7lWZW3aMJKkYd18KqhG5/UUKl7pFqiGB02g/cz6K+PFoRoMx2kTkFGPbCo
         WZLVjo5RfCCfoAbU1NVV44Pg1dZt8ph+KUfjfVpj1K/4IFjCgiJdr8W+8yLU/7Dgpzl3
         CDRHFfHSK3T2uYgJvv0swiVtfTjRYbbcd7+LMjAjSTOUOGhv0E0jwT6oouHz0/ONs7lj
         7EIYtJHFKPl8ROZ5dywIXhwq88rQtVp+K+fvKfyOKctb670EIt+RycoDSWDIHmmOxq34
         wISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780906670; x=1781511470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KqwFJZf77z3gY890YdN/zmCB2I+TWixDM2zm/X7SEng=;
        b=cEz9Rdj6Onr4fnlNFr04GKGebKqU2md02zaVH01D9pyYYomGJPEKa+hiR7VQ7II1Zi
         lug8GEtbAa3QoVRxwej+Mf8MCQXO0jFde+o4f/T6+MAxiZX66WPj4XSbH9L3d/OAAxYE
         m8PoxY4IBgnXtZ1vnm/zC/8pX96i5QAQNdj9BYkdfXgngqQ4MRuyq7Hs9Y2EBSwTWS31
         n3IyTZpTFwv61dSYwqmoKyToclJEWggSJ6IzsdPm2XGmCnqeHifZYtkjRWU2zNxpxI7t
         fJvTSehbvkG96s3I4QIAspfUg60v/Xv0ZyaSsBWK7zyy9biR58SZ9ytVnyAS1bgT6Xwt
         ci5A==
X-Forwarded-Encrypted: i=1; AFNElJ/SD+c3P41ULnx7abGo3jwIH3/bs6jdHPr58IsSDckHhNjOtuIM/WS9aNNSEVZ+Sjle2la9i/wrK5RR3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVOuT1v2ZdRWFufK5RkPfzbBJr82s/lNlo7bvUeFpFlrJF0a7
	9dWi21jvJjJi6zMd7ejbzg4xIv0/PUVyslD/aJnui+MRD7WWIcwWc4rK++LOKuhj
X-Gm-Gg: Acq92OFbvSUJjOwYjwOxOAi0dtZJ33xbqqyZIIJk5ML1RHtvnrhLrXRK/cZswcOLZVA
	lfB8SFCxmJuo9fIPN0tYpfQcl+jHlGizs25H5A9yBrVcqyK1H7UnfXPueRXaq3BEBiOWlxxTM0c
	nDgVrrDLm/PVHY1+OvGg5WAhnApvR+tWsjzj0MrVasyUhoszF2i/AogDW0iYCvt0QHrlVW2B0HE
	gSOqHTNIwpphc5VhpRfPsHkZ2fitykEqR+YdGu5d5rkr8dihoZ7KVk/c7M4sfm/MhxZ31tLX6sP
	uwFZv/ms0SGAy7WH3SLF8l+JKnWQQxKuJEax25IV6AbS9+Un7bqX01VdtmLwrefQTS2B6HT+0IH
	85EJRtoSq7/rXxgp9+R2oA2F0ce35ftgwz/2UCv0TZfb+cfFUjulkXWNC21iiHcZsfp/rwx8rE5
	YeySk/KnL5zSNO89WF5OFt8RGnuT8A4aoEvX7Nlyv3mHPfUgzbEKYS1Rl4FiEQuhWcjg==
X-Received: by 2002:a05:693c:374c:b0:304:2cc9:2ba8 with SMTP id 5a478bee46e88-3077b32a2a0mr7233754eec.30.1780906670474;
        Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-138063de4a5sm7678245c88.13.2026.06.08.01.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 01:17:50 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	busanna.reddy@oss.qualcomm.com,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 1/2] media: qcom: iris: fix runtime PM reference leaks
Date: Mon,  8 Jun 2026 08:17:20 +0000
Message-Id: <20260608081721.82846-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608081721.82846-1-dennylin0707@gmail.com>
References: <20260608081721.82846-1-dennylin0707@gmail.com>
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
 drivers/media/platform/qcom/iris/iris_resources.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..6d3339423eec 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -78,24 +78,21 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
 	int ret;
+	int pm_ret;
 
 	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
 
-	pm_runtime_put_sync(pd_dev);
+	pm_ret = pm_runtime_put_sync(pd_dev);
+	if (!ret)
+		ret = pm_ret;
 
-	return 0;
+	return ret;
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
-- 
2.34.1

