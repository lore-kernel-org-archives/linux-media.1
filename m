Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E7943712C
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786090; cv=none; b=dXjnN91MMBPcCvZooRe9J6O6sY9rhqvy48W2YZ90QPNoa5jLfi2USFMOcNa2HVrkKtQ6+PloIpZCtm5LcQxars8Tiico6b07yLKkinez/y2hIDPHGxOXy0OYUaI6X9Guo+LsSMmG872OnXgE0kACw25DpY9muNM1AHrKcY+8wu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786090; c=relaxed/simple;
	bh=3W+dLDnDS1EUy5LPi+VX0Hl1AUX65Rhrr3nCsF9I6aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gix0fL3RFiRDWuYJpG5CJBEmgSwf4OF7CfkFEujEBEQQe9fSb6hVWb3gFSfULRk4onCYpnSvwHk5u+CMSc79RaE74ijARtTIQMoZ+YkKxUuZWSvMSeBW7/uEj73qh6P8GgeATfCaFsI3ejUZSpILc+NTq1sDB/EgRIEtM0l4lC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1/c9lVl; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1/c9lVl"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2005767a12.1
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786086; x=1786390886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=25CUOrNXx74WmCDVh2GTHaC+rHtHiIp0JdwVP7dUxi4=;
        b=Y1/c9lVlszvswypcv1ll5aczX7LyOZxyUjnFYu/1LxsSp7oUrfHnY2osKiKJZt4Qtz
         oGbSEXyf9ZK93+PjE74ap3F8rNjlxs71sHK8ZZM9X385d+OI6UCSwwyH/ncQcYG6fnqR
         WeIZQryoKuH3t3l0EZJNGXESFw/3SdbGa5wwcvE5uDaJTjSOuuoC14Al3Ttb5HXGk5gf
         s6cuRYM7vQM/2jf+/jdW2nQbpiJC88iP1BfyZywhQnZcaO1EkGr+o8HQ/CqaJ3Mmm9uZ
         5nhyEhQWmtG4O9Mvr6uyVdPb8483IG5Cs/SVIEW9jLsF5+FsU8urckZCa9wUoFL9vha6
         69pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786086; x=1786390886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25CUOrNXx74WmCDVh2GTHaC+rHtHiIp0JdwVP7dUxi4=;
        b=aRwhPgbKK2M8932ZyOsEiNuTMp+l7tdeXW1ASxc06sYHwEgbAQr8G9GyyfS3KixbiO
         G4upW+PEKFPZbgbsQ6pnhixD5d+BI67M+qlIWmdlpZ2Vgmf2rDPbjsu64F2oMxowC6M9
         c2rq2h8LBjAv5Ouf9E6vlVUqgM4JuwjdzQW1ih24y+zVW4bIg6iBy2/qw5QN7h+4mKDA
         2mh9ZXoVVazZ/ICV05l/M+CbybOrD0P1Qa6Y0FnR9p9BcqgpmDOpvp7iyojVuko//vww
         Gd/VCyWjSwmNPEE9F/eXieKMEUZp9IR36NxcNN43+/PSy1lPuZqqeB6ATblynsrN9YP9
         dzrA==
X-Forwarded-Encrypted: i=1; AHgh+RrjC0jBi9N2jvrnqrBdMQu5G4a5NxrS3LgyOJjOtq4M8//hOGAhWIgeCed3FBRAVa0R9VWp59KX2h8GgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3mYk+sOxbEt5iLc2J4tiREZOQ5g3jFvhA4vx6kIta6IaVBlK
	BTdLLxTrJ2IH9Cp2NfJkMnsjkbDsmN6tiXJibtkK8UaFlpCLKz5vL9ky
X-Gm-Gg: AR+sD12CAChkRwzIZhf+b5DwJVALhclEBXV5KJp578Wqq41XSu4X5GyeZGfN4y877KB
	VoaJ5LQavq/rzmXc/rzwkr3W6frHE3HSLW8MkpN2+EAkcGsGghQPRDGcjpq56KnIH3PD0bLcjnD
	ffDZnnA8uIltZ8Oh7hrRtrwt78NITHqB3YQaT64Q50QJo/ZVrHyWI+LRxfSzDFOIna883XQ9Fy4
	4NcdwW+AYqRVUwrZNneSRyaiuII4axPKwniaRDXmTxmSSePqK82ZtGcgbDSgJeHlOD2ZnVhopoi
	zCDCghh44DI64l4WdZ/R+5Rq1xK+IftDlBZNn0IGAAsxzLzVHI7eBClowsAklGZ3dFYhw7spjUb
	80WqEOEblmEvZXikdDf7NAq8a1YgwqH4i79vPXh4SOKhFFjdmqOFZHHhklaNQykBZ8L4QAxEqoG
	+DuMr6GyELoja4c4BoHOEewWZmwiTyFjLTmQdNfjzvPIxhqanbK/c/rcLAHKLkpzX0lrtDetjMu
	GwRYe0R
X-Received: by 2002:a05:6a20:b7aa:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c92a89cb75mr12196717637.41.1785786086493;
        Mon, 03 Aug 2026 12:41:26 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.189])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm58533977eec.4.2026.08.03.12.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:41:25 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 3/3] staging: media: ipu3: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 19:41:09 +0000
Message-ID: <20260803194109.11714-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-css.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
index 8063401246f..84fc98dd352 100644
--- a/drivers/staging/media/ipu3/ipu3-css.c
+++ b/drivers/staging/media/ipu3/ipu3-css.c
@@ -1400,7 +1400,7 @@ bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe)
 		if (!list_empty(&css_pipe->queue[q].bufs))
 			break;
 	spin_unlock(&css_pipe->qlock);
-	return (q == IPU3_CSS_QUEUES);
+	return q == IPU3_CSS_QUEUES;
 }
 
 bool imgu_css_queue_empty(struct imgu_css *css)
-- 
2.43.0

