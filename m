Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31826336ECF
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874948; cv=none; b=YxLnOlbyfinR3IXbr1nywszd65YYfD+ZFRMszSiaMZQfoyqrGasBrr52oJ2ASdRa3O1o+e5UTyW+m0KJfEPnH3/GB0XEBoRoApexzscmzeq3YaZBuLpRJJH+AFBxwUMryNoXbvQLtn32/CWUu/lWeV8tLjTiLZd98tp/7QPuWX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874948; c=relaxed/simple;
	bh=Qdn7lfFv1Qy9y7QLkJ6IB5ugP3HJ7KhQ77rqkSIgdAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G+NBXspu6YSCLu3OI6bV22JbGQMgpuoApN5o//qRCH1uagZItZVIKKFs2ytYOi8h7c8UPHyKVK+HC696LuKX59VFWPo15dUsFdgcLC6Ewo11RXfbvFHpbS3NdJUiAOMy9/3xXqTfz/6phIIIUa0KIMgVEWHvGIoOBErL1MgQyxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmf+b4bb; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmf+b4bb"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137dd3af345so3321337c88.0
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 16:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780874945; x=1781479745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb7ZJjfKb99h5+YHieJkW6NM4/xOtMM48PIruUZX4LI=;
        b=mmf+b4bbR1lSOK0qHt5r4p5O6oABcLgznR7CBJHsDVo6vU+PxV+/mHpOYURDarYgEr
         8ujCQfsayAZaXTa/sItNdP2Y89EJFvtvwC+TSmONcxDYfqNAG1DBW3U8jl6UavY/5if6
         KWMBZrx5sy5YXomT5FtNkcyliAcNoIl8sTT7xyw6f/mbUvtguBiythQiMvQvgxRGebnO
         pQC2E3iZwODYpe/YG79S6RWoK7sRPcmW6fUpU0mnQoUczsrKx5bKdoHMH8/euYSMrjga
         gcaYEEp4CZnrNwzn+93pv5jN+zhfFD7/CMrEeI7HnYthCPTJFKRDheuG8sbKcjXArysV
         k0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780874945; x=1781479745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gb7ZJjfKb99h5+YHieJkW6NM4/xOtMM48PIruUZX4LI=;
        b=c7gIFk+KrvB4+K+IM2XF8mwVecyzaZ8lI9/NYl9xxxVYIvQdwH73vMZ14HFwIjR0Tz
         1gdTMSUHmSOvUXPIR0I9O8euXhfWM7McNTUZDB3ZSHg/FdP7BxfCVMd6CVIWq/G9/Y3a
         iumEfq8QfUXonnDoj/VST6TKbGbXraCKr75YUJ6GffQ8DiKcVjtwwg4Hn4OJexoJ5rUx
         AyUlPLKZYEWYJ6y9FA3J8gSjX8GIEPLMS6e2dS8y9lpDw1aZpsWgjyiFu2L53JuMlzAG
         pFjIbQngW1GOYRmMkagfL4bUGATRKWKrpNdMHYsQ8ma2gwx1n5pekIRSlzzqrmPQN3Rx
         B0dQ==
X-Gm-Message-State: AOJu0Yy+4Domyg/I7plL64YhT7Ffxkpin0HVux8t0QEKMJ9kjEeAMU4d
	obYIhD/ZalNulZZysxepR+KLQcyIDLx2iLTpxBZUIBhUMTL+Pt9FxxgifkU+drQO
X-Gm-Gg: Acq92OE5hskqTxNidyhK1VnilcHAlSAkfxNhhFi4DhMkl/cppiyUJdZ+eoQTIjfnm77
	EexTRAGn6+DSIF7nGt7Vgu9yhUxNWxtsZfyPFAlA6q+h+4FqXC4goLMDuvM5UEoy+xSyZBrNKfZ
	UVLPXKfrey8dXE2YM+57wHVHbiX62t1GkvhLU175XkPDt+zIh7ywQM2aFHyAVO1pMyAJBISKVsA
	VaIwXdHZfDxcYHSOF/uSOYRfyx66PTLlJUxmcN7ukw5TgdmKyGX6O83L6i0ktl7sC25ZzxdqQ6O
	q0Hw8VB6zhTpEs08U2Z+anGI1aJ7Y/C/8oVQYVQA0Im7MWPi/DSGt0LBN8ibrMpVvtfg9XrHrlW
	qBwODNRf/baUetfe+9hI9nYzPKfGbCF0etKsX4wyBCC1CFrBeRbg41t3kYhHx6yUq1lMvC0horL
	2atCQhsZz8Irlyf8QP3IBk85qmG+L50by8uCWRrdMh+uNXPVEdY/rx1jFzAwY+fJ/EFQ==
X-Received: by 2002:a05:7022:6899:b0:137:edfa:6f34 with SMTP id a92af1059eb24-138066834b9mr6466787c88.1.1780874945236;
        Sun, 07 Jun 2026 16:29:05 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm11324554c88.11.2026.06.07.16.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:29:04 -0700 (PDT)
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
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4 2/2] media: qcom: iris: rollback OPP vote on PM resume failure
Date: Sun,  7 Jun 2026 23:28:41 +0000
Message-Id: <20260607232841.79275-3-dennylin0707@gmail.com>
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

Rollback the maximum OPP vote when
pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Use a standard rollback path to release the OPP vote when
power domain enablement does not complete successfully.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v4:
- Addressed Dmitry Baryshkov's review comment.
- Reworked the error handling path to use a standard goto-based
  rollback flow.
- Roll back the OPP vote from a dedicated error label when
  pm_runtime_resume_and_get() fails.

 drivers/media/platform/qcom/iris/iris_resources.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index f5e3341e1430..9059cbe8fe5f 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -80,9 +80,13 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 
 	ret = pm_runtime_resume_and_get(pd_dev);
 	if (ret)
-		return ret;
+		goto err_opp;
 
 	return 0;
+
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
+	return ret;
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
-- 
2.34.1

