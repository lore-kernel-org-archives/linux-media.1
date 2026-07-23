Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5A456DF0
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823547; cv=none; b=l/eccg2xKGvnQsc3l/o841tsuKolPHMHvPlYDdb/fdHZKDE7S5ntDJXUq3IJ1x0YdcyKfQCeDJtV7kDhQX+6Ns49E59MbUDJe+NTZUAzBgelo80NJcV8mFK7qdhRLZ9GgtxNqbYy9JmiKP03YlQXR3n1YXvTJSe7APlK6fzz13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823547; c=relaxed/simple;
	bh=m10Tp///bVXlhJUeS/SvBawigHaYWgIpfVXkHjjJJpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g8tN7Z5s1u6jLcfYT378kkjWIDDF1rsfMNa+l9PnLcRBN5B3xmACABMa46ad8H9/znFY/lG+EuO6SBodkdgr06di69rtXprFyFstNetxLp4jTLS+6mnRZHAxbROH/5mYQmKx6vq4pBMm5Fgiq9gDxRVDKPoomkrF0UKuPmXYmrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dc.uba.ar; spf=pass smtp.mailfrom=dc.uba.ar; dkim=pass (2048-bit key) header.d=dc.uba.ar header.i=@dc.uba.ar header.b=AB1m214a; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dc.uba.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dc.uba.ar
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dc.uba.ar header.i=@dc.uba.ar header.b="AB1m214a"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso418932e0c.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 09:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dc.uba.ar; s=googledc; t=1784823531; x=1785428331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zxIAIolpKE8AXCFqXAOw27ED1oOQb15jrnDW7oEkheA=;
        b=AB1m214aHMBpPI73CNAvG5K+THSwfNkTsYuM4sqMaSwYsw3EtncK03S0kE4ov7gIBG
         YYSy1VGwZgY1soew1FssI/eIfWTPa1wBG7443fjz0VW2P6NFSqJ0JAS30+eVL1h3bRqd
         PC0MuEgD4abhWIkSrqhILhUD/B1uZKP01njGYLm2ubrYPwNlGQm2PyrJXX3PI+bqPVJZ
         tYhDSsOdK4w8Dl3N0ib5fhLuGmjaoTjNuz59jBQ0WldOT7MXZpTgnOUFC8ihvUSb2BJB
         5Q8FDh+5dJiQp6jktFCWIfymRdF0Nwy5HYIR6TmnxW2tR+ks1dRuW5hb5vYziups2mB9
         ieIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823531; x=1785428331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zxIAIolpKE8AXCFqXAOw27ED1oOQb15jrnDW7oEkheA=;
        b=gXzoovBrHF/3k4pPhcMD+4O5LKsznaQEQczRsS0wgaTnVf/b41f4bIBHq1MMMAuJtE
         Gm5hEDEyvPJYTn9B9869LIy7uc2UE8xKDb0ie6EKcJG8UeZmAgb3fFg1Gy7Cb/JkTW2x
         6VKG6TBY/7oM/FL9ppIbyKkncEo0L9t3xutt59mH7+zDLgMYmSgLp2UCQdaOWllp5wgT
         8RAxUnP8c0Nj207abd90Av+VpoPtJSrdMKyDaYPuVlFBXiQsv00uVT8IRC4Y8WW7/R74
         9Y3IpvjR96Xs24r0/pShE6uPWcrTRr9uerzQz7i/C/Wp27FWFsffkzOCivsIirwVABAA
         7asw==
X-Forwarded-Encrypted: i=1; AHgh+RqsgkGMshC9il6kj07g7GBHrB3adxYJIezQNrD0hIklOCUFv4V9SaV75TyRxeZgYeSyONM9E6cDiPVUFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwczOPoPTq5VjQhbdTiwmm5uICnSuF9UuITsXzJvgU5NRG1265e
	o0pKTtOuRiq20mt5hasDHxXF78rZmJlOYgDqqK1fRBElzfy0IVUdL2Q6TxBOpRMGRWI=
X-Gm-Gg: AR+sD1274wrQagtfFl3+BSOtb99V0HlnHCQ1cUlE+JgxSNOCVTPJqDKIEuGdGa3COF4
	ib0L1BEnGAmjKcsiDk9xUeNAjMend6iGFpbjjH9sFvHTZDpSWFh8VgkPUg65G6UzTY44dmsxaxC
	bnjw0sfQv2A/kaViAM5QtkFxnzyTWwhJMRGrufy2uI6nPRNnWywSF53WFyndcsalNEBkxlzmetp
	2ZoCM9OMtO3Nk+OsplVy9erSijFg/yr1My0T4QLiiFfY0cYhGUcZ2tf+o+U5JgH62s/QyABkemd
	trVQnMHKgm2PiW6JhxEEWFmWgwnRBoPFuHxDJaYe0dWJyGZSMyeu7MRE94vTDAK7iUcaTgECTN1
	2RSTwVaXfE072Owh4WAbZj3cF3k9LlfEScfaBuxsUZTvgERg2IUOIbOnAvRzJSIjo+xeaK9zn3a
	RJQGV2w/9A16NuFmXMoRwaiCKQru2b6NdtGmi+GzU98uTW8+A=
X-Received: by 2002:a05:6122:6e13:b0:5c2:b8a4:95c9 with SMTP id 71dfb90a1353d-5c2da17b31dmr1841068e0c.11.1784823530922;
        Thu, 23 Jul 2026 09:18:50 -0700 (PDT)
Received: from juli-ThinkPad-T460.intranet.unl (fweduroam249.unl.edu.ar. [190.122.249.184])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c2c6275db6sm6659453e0c.3.2026.07.23.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:18:50 -0700 (PDT)
From: Julieta Goria <jgoria@dc.uba.ar>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Julieta Goria <jgoria@dc.uba.ar>
Subject: [PATCH] staging: media: atomisp: align * on comment
Date: Thu, 23 Jul 2026 13:18:12 -0300
Message-ID: <20260723161814.115168-1-jgoria@dc.uba.ar>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed the following checkpatch warning:
WARNING: Block comments should align the * on each line
in staging/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c:80:

Signed-off-by: Julieta Goria <jgoria@dc.uba.ar>

---

Hey, this is my first patch contribution, I would appreciate any feedback. Thanks!
---
 .../atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
index 177487b6b237..28fe34f2a848 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/ctc/ctc2/ia_css_ctc2.host.c
@@ -77,9 +77,9 @@ void ia_css_ctc2_vmem_encode(struct ia_css_isp_ctc2_vmem_params *to,
 
 	(void)size;
 	/*
-	*  Calculation of slopes of lines interconnecting
-	*  0.0 -> y_x1 -> y_x2 -> y _x3 -> y_x4 -> 1.0
-	*/
+	 *  Calculation of slopes of lines interconnecting
+	 *  0.0 -> y_x1 -> y_x2 -> y _x3 -> y_x4 -> 1.0
+	 */
 	dydx0 = ctc2_slope(from->y_y1, from->y_y0,
 			   from->y_x1, 0);
 	dydx1 = ctc2_slope(from->y_y2, from->y_y1,
-- 
2.54.0

