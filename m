Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829349DB96
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304275; cv=none; b=i41rZM55XpVCGuCImYsnEoSmMDzKP5RkuKBUw9AhOmI2jqLaS6NJQWc6mqjLe8UmNQlGmYcAgFTqRRbEYhFSZrEnpaH62FWaRwrqGmmTAOUW7aU92UsrHcLsid0OjHAmYtvAblXYATpntGmLd4CQhM3SrjO36NQHkE2xSA/YzA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304275; c=relaxed/simple;
	bh=WXcly/MABuM+KHwXWL2hf3oERsAi0yaIkHJOZ6o97cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LWYJBcp50cUNJLalZYgGPnxfLf85htsggWJBDA7fn3f26pJEEOrD5fp/YIk7GKAORsk+0sSDVCl8CSRYFAP+Th3RB+G9kwrTzxoe3eHSGlp1Ss1LCVkVzvGP6k4yONhp7Oe5MGALU0RPwdhxyYgig+otqzWYTyqdp1D5CDHQBlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avkiv3Fq; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avkiv3Fq"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5dd8bbb2175so818838e0c.3
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791304273; x=1791909073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=avkiv3Fq+Ic3qrn+tYhqQDlFz4NBcxPUb0GKX0nj5qLqjCWcX7HUZvXEb+zWkxusrn
         1aP329WRFpTC+4JUZWpP4MzWwa3kfUx75Qy21ttDgXB7JhluFdbUTnB4NBW93pAhemq1
         OEr5TAFYvc/JFl5l2VCp/EaCYYxqYc5uBGJtwmCMn7YGoDRrm1v81mnQ+wwNRQv11DjV
         QZlv4dAI3GXIsocs8pMt5DAems9pK5nAs5z9hpevWw5gcsBmpND9a3B1qXpA69l5VoyZ
         Udzbn42XS9YuggQZVxNRFJP0kBKgNOZiagJk4tWnq0NV71LQUu60hyau0pRnlg9sgOtS
         t4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791304273; x=1791909073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywN4tNJNNqDRUPP3AsT8Nesevvk83PmWOswuYVqECKw=;
        b=w65s6mFeOYbsTpW+hLqtY6mNte7xnl1L9bXytvApoZaif3FvIbHm3f0Yjr85a71YSj
         yGiW3YkuVqxW6KXsON4VHDRD7G4cminv74KFrhca8P2Ux87MrOF0VQQJEpG2ilqqqcPM
         cLYNIPbevRgyZZ9AQzeCyyU1exs4ue8VdpnVrKuR65/m+hg+gfhbABInBQnv05xtyv3k
         5AABTIlYfN8uV977aWmF5rz6q7DNC2ScwGorfAZL/OQ06EaQPDUcoTiq9gVxS/GxJ8St
         lf2RHDXVekOLqIpO2CuDiH7EfNSAGiWO481TSCH6Tt5gFV/zH85CWtI2Y2ezXMhAtxlh
         203g==
X-Forwarded-Encrypted: i=1; AKwUvBwzf6zg7GAo+NzC6/bll9rMb5H9dS5nzlPy3sqsqhfHfQV5nkIVaOogeBdTe0XO1fFJsfPUubliw/vCmQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLalMWPlpkQppPEP5gprzp0cmxNuiexkQiLFwtItY02KflBd1Py
	BEeDbD0tVvT1AscEayg1jYn1Hpwl5y7xKbII/mwauzVNmNx95VrpkxK3
X-Gm-Gg: AYBFou3mnx9BYXuluQvIfhIs/jr1ftw4jLQEK0eM2MD6scO4s70jkT6pSzxqOKlLJ01
	8Anc/XVdpbFIKXVb4CXQPl6JYOVB6S5nvOSn9ThkdJm57SUSUmn7Q5maZRSXw155UhLhZMB0l3Z
	kN1ZRMbHQvPubaBfAV1LH84StfjrkANROpFGUGIiWotSA0gnAeXzYgzOtufUQ+4gXNzPcp/GsI6
	OymmrP5aj2sqZWdfpc79Pa/ENDiEMdLggTLuVv4ZiSrocdrtVFb3ab88R2D+i8dkuuPAWaM3lNQ
	EbUH9gRU1XQCixfbG6KSsfKNrZeCIpOe0hvXyf3ZQgRdtWN+yChMESjRWunWPCpILsw+Vx+wTJI
	/ibDyML1etSILRoJW0MNuXjThk0qxMz1tOasK/X8EwGV05GRB4RCCpt6x0cDy/iPkWIUJvA+K2E
	pKFU2BQtHjxvJ0TJmtX0BXwqRcbL/0njWUuJZRiemeV42TdCtpulI9rcarumDP1oy4GLUwSISw2
	wcuie3tAlaSPOdDPVR3UO/t0cDZrXJ0+ty4rKAw
X-Received: by 2002:a05:6102:1628:b0:7b3:32fe:77b6 with SMTP id ada2fe7eead31-7c875583d16mr612192137.3.1791304273204;
        Tue, 06 Oct 2026 09:31:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:65e4:8ceb:88c7:bff4:c488:f682])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ff5c49a9sm13562366137.4.2026.10.06.09.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:31:12 -0700 (PDT)
From: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
Subject: [PATCH] media: staging/ipu7: fix typo in comment
Date: Tue,  6 Oct 2026 13:30:55 -0300
Message-ID: <20261006163055.66095-1-contatocaio.ferreira7@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling mistake in a comment: utlization -> utilization.

Signed-off-by: Caio Vinicius Ferreira <contatocaio.ferreira7@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac0689468..d045e16bbcf0 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -114,7 +114,7 @@ struct ipu7_device {
 #define IPU_UAO_PLANE_MAX_NUM		64U
 
 /*
- * To maximize the IOSF utlization, IPU need to send requests in bursts.
+ * To maximize the IOSF utilization, IPU need to send requests in bursts.
  * At the DMA interface with the buttress, there are CDC FIFOs with burst
  * collection capability. CDC FIFO burst collectors have a configurable
  * threshold and is configured based on the outcome of performance measurements.
-- 
2.56.0

