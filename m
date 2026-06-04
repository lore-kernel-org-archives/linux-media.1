Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE971FBEA6
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780533862; cv=none; b=V6XiSVWR/uW+gOry3Qgp96DqEwu2iQNPmM7TvytXG+nIZN9nYrz9tQfN2O6rLCCxUWGkG7piUjJvZ/m/piubSFIrrqhccftTd0SkCP3gGCLuAjYOYKNpRxRzwRlRP2ofHRGHF6KdriS+8ZtNnXmVTbXkG6acRKuLs5MG5AaCCw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780533862; c=relaxed/simple;
	bh=EbX6bgGsKAiDRJmfJjqbrg9YSo1F/W+zJDbNod2tE8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y6JLmWF2zSolE27EWFjbzLD17K+9dQShVrp1eRw3FTH1uZqi+GE3CTsbCbAz/AyGF9m+Nqv7RtqcJRNM/qgZ2tARle68Mu584SKaJP5jc6t9NU8KrPbBOLjz/7ghYUQHPMlbRrYTvVDK4yEfFiwXABK5+h6uJNmwB0QT+IMFuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfmcktGR; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfmcktGR"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-13721dfd471so185192c88.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780533861; x=1781138661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WU4xiLlGmzG30XmCR7F578csFbX0/SAgOHAfdp0NzZw=;
        b=KfmcktGR2zLvb4rt7Mz/LAX/WIPNMXWJRCIVsp7UHzas14pTQoh6c9J4Wkd+PkROo5
         Lacf4qqW/hCPA6wZ7vcgltKM1za2edMsP+kOhfuhE/k9QJ9skZnrgKa5jUBCNfGokfO0
         7sqA2NGj3DzzRadbHsPofvN45QDkxVQ8MyFvCIiF83Ic1s4mSB1pqbumv1qJ6qXuGV3D
         eLWe/c4Z1MMN3XDNkWkvAHeNAdKTJaHG6eGBOwLE9v5isvxcFtm0to+vhzS4hXhjc1wM
         rFgT5zQoHy4EbRQDo2hO5r7P7p78W/rxIpBYISZMAbw6kw9gJDuB/Jpe+l7nSrusry10
         hxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780533861; x=1781138661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU4xiLlGmzG30XmCR7F578csFbX0/SAgOHAfdp0NzZw=;
        b=FitVNhSIMicDkN1QlLGofD3odDGk0+NdE2jdHszgte7yzxg0txYvub7CyiMbmkT8eE
         FF3bOq88H+gK4doMvqJuoUpuCJy+l5APycsufqMbQasYMiMus33X6SQINJIWx8c+FuNa
         83VZgDU1j64vhATt8SrElXdTA2pgaW7VNTbqWFypiTgV5nr7pT1C78iEs1x7PREYPshR
         XFnSJO9wMQuO4NS8ZiCH0TWhS6T2jLlLr3DgnNrcN1tekgmqOWftLZzDd7oQIHVQ4AUF
         rAd55jzGrsZIlkx+DIbXTqs2KQwlzWva+KOzMyU1DFVlyGQ0ktz834p4LCChnMK+6SFi
         HwKw==
X-Gm-Message-State: AOJu0YyUUZptItweYk4xGtPgQ4FCKxNAY/ZtNr/+ADKpAKMvPq6IV77V
	NW/dAllJnH6jzRyz5pKEjEbN0PZ+Icj0+FBCF90mp8ZzPjJiQLzrMg6b
X-Gm-Gg: Acq92OHRhc85rB9/+VXtm/nFMv/PhJlyZQAl0Iz7Wz7mtEhqpLPnYGjIeQ+8/LVah4w
	R2jUSPrF5vZGtSNxy2xc/omPok3O5S5EAjybtGZMDsfYauDPNYgWEMvRPHl6P/vTeSR3v0I7NaA
	WDuMUeay14e+w3SxspwAyUPl1a5+Gv5nGxolHNAXSZyjBmAXkCdosmZfaqJp6tGrrI+ywtoxibD
	dRKruA1hMcUyhJhf01mPNZjzsNCaJwyn+03wo2JcA3P7bmwyw89Zihg81MEjG0Kkntv5MusI3hM
	fl+7ta7qElxoaNTv9vshEC63HrmYQkq3auWdJxOA4HnWaCYL/abA9eueY+mJt4fCQUHg6p+jTqp
	RjRXuAUGj0zvFDxSuGzg1TmB9uZr31c5SVc+7WKrGkh0LfzeReiNBoD9sV1Eiwzr10sa/eHxwLe
	C/vyi7mGFc3KuUbzwvi822j+ZOeWTHzvHn1WqHYZqitRbrV181I7iIewRhJ+pgl1znWA==
X-Received: by 2002:a05:7022:48f:b0:136:d029:459 with SMTP id a92af1059eb24-137f6bf40d1mr2620539c88.22.1780533860796;
        Wed, 03 Jun 2026 17:44:20 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm3108271c88.4.2026.06.03.17.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:44:20 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: qcom: iris: fix runtime PM reference leaks
Date: Thu,  4 Jun 2026 00:44:04 +0000
Message-Id: <20260604004404.34797-1-dennylin0707@gmail.com>
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

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
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

