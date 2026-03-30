Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F33A0B26;
	Mon, 30 Mar 2026 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858340; cv=none; b=ukaTQlutCcVxqjHY9xijGo8YIk7YsO5r1HersL0iCB77YlXzKdh2/Z4kXYedPSIbFwjyiGZb2v5mSP9gM3P37+1eOhO+vQQhgZsFFm949EEq8KeUHvyUQGkayIRLJ5yxvj/NIo4AGY2sg3IY708PmrHj+k/lqNO+dqkZSXDP/+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858340; c=relaxed/simple;
	bh=l8WjdA/LGnLSJKWiMRcqXRkDj2NB9fc74Y1QB17lwrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PkP5vKPp6pq58mXNmcprWjXWekNrFgh2fEmmF8+V6DJBT3GtaOylODJbyzJDen9s+A8NT2bg+KydWdERK8eZY3cckAt98VbAVBTnLiYq4dO9/tXZigoZtUoRBvlGhQZ7DHnfB1PcfuQdGdedds7IJ5b76XEj7sIFpqlFZHTBnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=LwQWJ/n9; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="LwQWJ/n9"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5HJTn174202;
	Mon, 30 Mar 2026 08:57:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=2
	iOJxisi8Kb1EN20/4D6xSszCHtx00WNhzt1fooEsTU=; b=LwQWJ/n9SLLWIo9UX
	UfPes8s3oOgLP/g/35Nr9Vv8PHXoo0sI0kGu5mAFJs0FWlh6X/lJmgxr4hLkEtlp
	u+JEZpUPmj2SAO7kvVPsLqqOLCeJYImY7DO74bJ2cLe4MvJAD+GpxsREUsigxcA0
	QwbFTruVtDYUZ55IMRiiOpiLMx4nYJTGx/PeyXGneEYT3hMa0tnTPtWXI/SlSEIF
	KnkLp9P3gfCVDOxZUHJHNBT2/170VAwBsofmrk2beIp+TyXki/VcysjpD9VLGMCa
	e68rPwlctLE4M6zebju/UGrquGIPtJD8Me74s7nhj0bsOrlCuBU3iz9NYTESVT1K
	MWVCw==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4d67xusfkv-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 08:57:02 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.6.106) by
 HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:57:01 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Mon, 30 Mar 2026 08:56:42 +0100
Subject: [PATCH 7/8] drm/imagination: Update check to skip prepare_job()
 for fragment jobs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260330-job-submission-fixes-cleanup-v1-7-7de8c09cef8c@imgtec.com>
References: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
In-Reply-To: <20260330-job-submission-fixes-cleanup-v1-0-7de8c09cef8c@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        Brajesh Gupta <brajesh.gupta@imgtec.com>,
        "Alexandru Dadu" <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Boris Brezillon
	<boris.brezillon@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
        "Alessio
 Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774857418; l=1511;
 i=alessio.belle@imgtec.com; s=20251208; h=from:subject:message-id;
 bh=l8WjdA/LGnLSJKWiMRcqXRkDj2NB9fc74Y1QB17lwrs=;
 b=z8djzyO2G4zfTYC3QPntznFWlddGiMJvj7Wn9vyopXk/AvvZu3sjrhL4x23TbTi8hmphy7MFK
 /izIcrDrmF3Bb7coenSG16XePHxjvtCGlRGSJ8ufb2OzsW/lf979rZu
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=2Vtuk+GKBRjwMqIHpKk+Gx6zl7cgtq0joszcOc0zF4g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2MSBTYWx0ZWRfXycd6f8OX4TvN
 u4mnd+3JLq/+bLyXD6S5eEJlQCe+rhIdyOC+ofK1HBhuFtHrzldzzpZF6D5fArJI6rW8ZF9Skr5
 yc0lFNJGGs766JE1sG0aXGy3k5NxoY9GnJosoQwqfg2jDJLaKGA4xxO3arKgpBlzmwYO5fbkbMI
 5TCR9DTBxMiuvQ2VAw4BWp44z4tGiGTPGft30fa0KGMMfJDF4eb2IoOZ0MUIbEw+UQHlQTA57B5
 z73D/2P8tXOlLQ0zFr+04y3/pV9w4Aum5tuGH8EzXoVqtLw8lndciJaAbKoRFAMPqCj0+y74aPl
 DqOOHJ1ve3D4bdhIFb8HHNX7HxbjikklW7z5eyJGLLcbyiiKGTnSLCRdL/ChbUN2P1/KxxFxYHt
 RNPBOs1cCzfIW9S8VkdVbIP1kKGJSVE1N2aD2AbubmSFrus2Yl37DJ/Z0p+zplp7A3SfQCKaIho
 5fpxJ7QZL1xw+u+nuTQ==
X-Authority-Analysis: v=2.4 cv=QO9lhwLL c=1 sm=1 tr=0 ts=69ca2cce cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=txNhvCuK94MA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=_Y7jKtEYzl7tsisHUWkA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: _AGAVqfJjxcLoA0Ds9QP2_y0SDZU1YsH
X-Proofpoint-ORIG-GUID: _AGAVqfJjxcLoA0Ds9QP2_y0SDZU1YsH

By the time prepare_job() is called on a paired fragment job, the paired
geometry job might already be finished and its PM reference dropped.

Check the fragment job's PM reference instead which is a bit more likely
to be still set. This is a very minor optimization.

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index 4a49d954562e..303f4d6cc09e 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -553,12 +553,13 @@ pvr_queue_prepare_job(struct drm_sched_job *sched_job,
 
 	if (job->type == DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job) {
 		/*
-		 * This will be called on a paired fragment job after being
-		 * submitted to firmware. We can tell if this is the case and
-		 * bail early from whether run_job() has been called on the
-		 * geometry job, which would issue a pm ref.
+		 * This will be called on a paired fragment job after being submitted
+		 * to the firmware as part of the paired geometry job's submission.
+		 * We can tell if this is the case and bail early from whether run_job()
+		 * has been called on the geometry job, which would issue a pm ref on
+		 * this job as well.
 		 */
-		if (job->paired_job->has_pm_ref)
+		if (job->has_pm_ref)
 			return NULL;
 	}
 

-- 
2.43.0

