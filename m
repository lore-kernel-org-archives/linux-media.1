Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CD51E47CC
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434833; cv=none; b=FJJiaSwCRMOnD6kGbORhAovzxuDqWzMsHRCbtTIBVEel334+6/WnTe8Z0iOM31eJf+Boht82MPeLmK4tY6sclKVc1uid9HY06Rk63tKRpEDOuSU8wld9/y21elvdAlrYhK1XqmBPMx0kPMT3/aLXG4ti8nYM3vy65zPep2vCImA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434833; c=relaxed/simple;
	bh=ZdUW3KC9naKIDkAGSiGquiNX4Ac1xMCc60Ruj3r7Cig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTJN3nN3MrCWx6xbATFy0OyYwZ9X2wWblae5n/PAbEhIKRDWDJBNfsA42KaSgxujbpYpqYKE2fCpzlE0bcNe0eYKkXPf7paXd+ftNb6IL76Q6729hTERdBjAh8fJQYQiM4Et+XI0tPs76NJa9+kTxfvZ7zWzXMk6SFmNfMOsZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vb8fIm0K; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vb8fIm0K"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb766bfd3so29909081cf.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 18:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434831; x=1790039631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b1lBFng9K4L8nuKAcvrbbiVs0Np5hE/iDE9F6xQlyE=;
        b=Vb8fIm0KqlltjzUsM1wstLmLVsA+WIS4etrI/p4s20tVsFRITsJB0LVLNz7yudpc8a
         TNw0sLr8W1EGghpJu0wtauIDtjoIz3QDmBomwVaYFCVBfwPj3V5BUlp4dJX0kD8gBZHx
         Z9LafUkJmUeOmGl0bjNADjIRTE8SjfLkG/RZnAmyKdBo+v8wfeNoKL++T1u7ktb9Htwb
         d121ma3Qe0ayoZK+CWC8U6Mb5d7P5UxzQporUXe+bO1Rq3HGO3CwjgIDV6i+yTgCaF5N
         wzlD7IaYJlvpYxF3JQHptbhQp5CtNMVA+qMSyQd0helHTmTdJerHK98LcF3Lek4jVLfy
         g3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434831; x=1790039631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b1lBFng9K4L8nuKAcvrbbiVs0Np5hE/iDE9F6xQlyE=;
        b=ygWpaiLk1t+MumyG+10+a9q0g8QXJg9gd8Jtl6uF1ajXjA6LUZiICLSEVfugYC+QsD
         MLnkZeI74qixwb24w+M+AUTYWMfRYsMXHtlIPdn5GoO8LZs0fyXiMAyVgN+jKF4UYR30
         P72h1O7EgRSgwonNbd+6vLST3dUWmea7rpzooL5pm+sQD6cesEImuiLoNqb1CEsmeEQr
         +m8T+kpCF3KV1xMC2CQFagWci42WQOTvb+FBsyrRjRoEu2gIliW4m/E96SINL5dN6ZUE
         udjGYfdL96zsb37w9bvQU96jIcFAvzEDVkLi6fzLsg7SsatuCg2CIcjMEKRLEJL3YgGD
         6qtw==
X-Gm-Message-State: AFuF++mUwDNIeQA0WhnRnd1ahA1IdFjHykC97wGF32DE0SGoqcYHGx/D
	16tXbdQwyi3qLQtUiyMp/HtHo9uRSfEIrtqcKVzKyfvjdQqo+v05BbCLcVaFnVD5zw==
X-Gm-Gg: AYBFou3F4kmMw1DskFVKPWlXvm5776BcMB8mcvy+iymgdzNHP9JhwCKFx5r3Vc/NrYM
	1wNNtY8B0yKHJLCTdvKhGBWnoElFjTb5wYZqh/cr03N3A2VmGqKil8asxaawbRy41UsvABttW6C
	pCwFE+WX/QlA/nJq426zj1QTHakM1AVDS7vSLNyhikAQOz26sx8RRYNr+CinMECsfZDMf8Y3FZT
	DewFXV8jehSUpL/qj+V5FUUooq6jx0SwZOyasEkjot/uWUeWiaJZeMTjSyw8S9l1HopwHC0byS6
	ODwecw0wWifxVF2WXTFR6nMm/Kac6pUGleathMYhG5er6IuAOGFu+gvjMZqvgtYHxtQwIod7lLi
	/0pOQsrgZx3tcF3rBVgeS0AnJzjxOCYLhcv464zOp82ARV8vjzxNFfas70mwaWXnoNyORc/WGJb
	z5sBAIn7yEpbOt8Ac0P15pEoJ07uBgXOHtpz+UpeoOqdXv8SjiNiXxvQtkideiN7Yhy78cWPm8X
	cfqMCE80tyNBNPbLZJkbA9H0llNrn3t/RhndJIS3uA4OmgM4XQjNPwDj6udHGk5h5DlUp0ZRjlt
	Jc/vmCsB3AB69lu3n3kE6jhYrPeEyqcuXTrb+n7NBAX7fjWQB5waA455lv2vraQm
X-Received: by 2002:a05:622a:2b47:b0:530:e2bd:c272 with SMTP id d75a77b69052e-5310d0793bbmr102700421cf.52.1789434831180;
        Mon, 14 Sep 2026 18:13:51 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b699bsm109060396d6.37.2026.09.14.18.13.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:13:50 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] media: sti: hva: Release the runtime clock on teardown
Date: Mon, 14 Sep 2026 21:13:27 -0400
Message-ID: <20260915011327.57695-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915011327.57695-1-mhun512@gmail.com>
References: <20260915011327.57695-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hva_hw_remove() drops the probe's runtime PM reference asynchronously
before disabling runtime PM. Disabling PM can cancel the queued suspend
and leave its clock prepared and enabled. The IP-version error path has
the same problem.

Disable runtime PM before checking its final status, then suspend the
hardware directly if still active and record the suspended state. Drop
the probe reference without queuing more PM work. Skip direct clock
cleanup when CONFIG_PM is disabled, since no runtime callback acquired it.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/st/sti/hva/hva-hw.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-hw.c b/drivers/media/platform/st/sti/hva/hva-hw.c
index a608e35..cb55dde 100644
--- a/drivers/media/platform/st/sti/hva/hva-hw.c
+++ b/drivers/media/platform/st/sti/hva/hva-hw.c
@@ -395,9 +395,12 @@ int hva_hw_probe(struct platform_device *pdev, struct hva_dev *hva)
 	return 0;
 
 err_pm:
-	pm_runtime_put(dev);
+	pm_runtime_put_noidle(dev);
 err_disable:
 	pm_runtime_disable(dev);
+	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(dev))
+		hva_hw_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
 
 	return ret;
 }
@@ -409,8 +412,11 @@ void hva_hw_remove(struct hva_dev *hva)
 	disable_irq(hva->irq_its);
 	disable_irq(hva->irq_err);
 
-	pm_runtime_put_autosuspend(dev);
 	pm_runtime_disable(dev);
+	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(dev))
+		hva_hw_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_put_noidle(dev);
 }
 
 int hva_hw_runtime_suspend(struct device *dev)
