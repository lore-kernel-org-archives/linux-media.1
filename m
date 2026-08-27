Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B0F340A47
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835770; cv=none; b=cQqdn/5MElXRmY8YSRKCxawo86lLTZwzW6gJQA0ZL1Pw5KI1hdY6c3DXUw6kYRD3FIJhe9xLROfyxl3B9IkJ5Z6gLXj8Q/IwkWAhHiLKOrz7JHiOPoieaPlu8wO3K3k6yPX6fP46HAXGcH+7WbtOZlvlI3MJrGvVa+UJhkBbNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835770; c=relaxed/simple;
	bh=5o6ANdOnsEwvHNkc68cYshSKpXo+cUGt41qHOl1Tkjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YTpKIYXZeNQMhxdh1UF7vCNKgz/wcS7vBOQ0YAZrkpJb73WvQmQV3T0dpmM6B9qXOGrTtrJcQYSY8xK+co7UNeIMfCOq12A0svzLwZUMNNLbEptE/JGrmH5kysa9Q7giZbq7VLZkI+E9MaVcGsiTo/+CGMOyp3cnw5S3Ey2BOqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJsnhU/m; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJsnhU/m"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb34c17b96so2518761a34.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787835756; x=1788440556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=aJsnhU/mWHFN0gredSJKoQhgBZ/rL9W4AWSF5ne0MH5cB7Ux8HQ69+zjpUMCFK9QqE
         mSEf0jtrCnRRk3gSqymNEd5Yb5Oh5/uH09ryRBaAwev8UCP2ol9zcltMcFGy+Y0iYxg7
         I+KVm0c2F+cHhYv/J3kqjl0CzuA6/eXhycTdVmJPBt/cbojLqmPJbho8A7j4xQFKMpK0
         zfW5QpOdQvAoL/cMOwaEYDF37lXqAK7HBUmsbamoezVPr4lF8unD0iNMUwjEJs4Tw4sZ
         rZS2uYR44gFTzqa2lol/egznT4HIhsagkvdqmmDsuN/nULRHGv8Fuz9qh5ja5TCgwabZ
         zvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787835756; x=1788440556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YbfpkMbK/g+UAyxQUtADUS+ulixTWRPAVGbjBEwn60=;
        b=A5j/pmPv3rzstXsB5gSXEAyCq6kDlYPQjKlh2EgHwlQvdEtdnlSCkTyp3p6ZYc9KVe
         BjhwTCR5h/jeMrkjxGB0wI21RnKux9OQ54Ejvo5MEKtkEIHautPoulsbzDEPI6TkrN59
         Knl+ibQOOROPo/ONHKJyJcwGEgue+1UGmMMyll6fUeJaowckFQdwQXpPlCsFSa9YerRH
         R6zMOB5LIKazOGkvYKaVjabdnT5BxSUsyTIBUztJvWPuzMcZpk1QstKwBLO7lnTIDnSI
         seJAmdtAJh7GEdpfAA5sfjlC3eFPvnHP4nkXgx93BvZxLDycS9U99/9bfd56INXvBiBW
         rz9g==
X-Gm-Message-State: AFuF++lelTsFPej84o69+37Jjo/tXhG9h9yYC7WGG2JRZSZfYbUaSXmH
	v2HCLaXjdruEJ2BedLMRKmuejVA5Eft/HT1wj+KqiQTLK/OgcdltmlWtCMZSDSktNcc=
X-Gm-Gg: AR+sD11N9q2BBHzLsYmbZrXA5pXx8TcIMD7e8vV3VCw/Ue5KkvsYpTCQ6zwlbKnRqjg
	jte9ejYDDh0HoYCxwyAr2OFzSFs7KscvgIDmuIhnUdc2D86yT5yYc+CwmjLqxpbO7psNGL1ng9j
	ivq2AdeAZ3laTSlHHnUxLDqP0B5YwZOCtJxb7SYQGDhGRRhCxYjvh5uptIkq9qrD/aJOqoT8P6D
	r00NVk1xTzS5cNhaiLbwmccFr2v//+95kIXO1UGGpbeTsI3YwQ40Nyy7dycHL0ZmSasEDlpNAOn
	qHSb2mibloUaG8QW+hGjMEeBtUuSUN5m1r7V4tDIf08p+8CzGI961JpKodaBa+QUN7uZikOahgA
	Csb07RT34p4WP5/lOPkpsnDery+/11b/4KkaVlwOEd2wx8SsV/qfR4/9Uik9B1A0hSHsxfYBwG+
	RzTOfHwGxHlGUssASq6Oj26lw+8OXgzta9lghElkUjMUvZFSFX6qobcoIeYTyz
X-Received: by 2002:a05:6820:4c0f:b0:6b1:afdf:a01 with SMTP id 006d021491bc7-6b1afdf50c4mr7622702eaf.18.1787835746080;
        Thu, 27 Aug 2026 06:02:26 -0700 (PDT)
Received: from machine ([182.69.183.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm15598089c88.11.2026.08.27.06.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:02:25 -0700 (PDT)
From: Kartik Panesar <kartikpanesar@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kartik Panesar <kartikpanesar@gmail.com>
Subject: [PATCH v1] staging: media: ipu3: remove unnecessary dev_dbg function trace
Date: Thu, 27 Aug 2026 18:30:40 +0530
Message-ID: <20260827130040.117697-1-kartikpanesar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a dev_dbg() call that only logs function entry via __func__,
flagged by checkpatch.pl as unnecessary ftrace-like logging .

Function entry/exit is already available through ftrace's function
and function_graph tracers making this redundant.

Signed-off-by: Kartik Panesar <kartikpanesar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246fb..b2c8fb7d6813 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -290,7 +290,6 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
 
 void imgu_css_set_powerdown(struct device *dev, void __iomem *base)
 {
-	dev_dbg(dev, "%s\n", __func__);
 	/* wait for cio idle signal */
 	if (imgu_hw_wait(base, IMGU_REG_CIO_GATE_BURST_STATE,
 			 IMGU_CIO_GATE_BURST_MASK, 0))
-- 
2.55.0

