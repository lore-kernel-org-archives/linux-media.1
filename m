Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79A340416
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154133; cv=none; b=C1ZM5ouci42MGQQQWunhZn3CdCY1Hkb6bk7AA1rdkFry4cwC2mwnfT/FCNoJW0K991VQ8XM9aWoo9gSg4CQSot7QuinIBmE1suA91BSCdlmlkGxhTdcC03SuanusbALU1X5uhSP+gfL/kszEZQB22GvDru1/Tvert4Tn0M8P2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154133; c=relaxed/simple;
	bh=T8esV+O5VeAEnhYo0CvVH6ObWnqomx3sYy3+gmHq4CU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TawjRrgrk1EC9hyvB3DsGu6ukcjEKswDKjAefULwjl0Q5DjVRSKupNaHRcSs+M9oTzfBsOEhW/7qHLnO009uR122rJGK/F3SuPYjwu8RFAW5o5k9+6Dn2sM1jGf+KBR/N9cICWzcO2dsI1fmg88dA3zasvB6xb1H+ftdc/RAloM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbgYIjmj; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbgYIjmj"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37d700363fdso886188a91.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154132; x=1782758932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xCvssNQne72NavhMvuwUrx2Vh4KYhQUGV0pglyxelQ=;
        b=mbgYIjmjMyovi/g2A2mr5lzG1Kpe4mxqO/Ifvn2mN3R9JwbgywZmVdgYvGzcnEwD3+
         Y6aWEMXF18hbYROMO3Zt4WG3K8AZoFWoi/S0Fd9r5JDrRK4pN3hCGRZuNibAh8BTEPO1
         bvHPFvnmtcr3tXv1rFYGZHaxvXhJZNfkKTsFU1x9KTdzkz/bxENEkwKwoEF74hhC0dwQ
         Uwr3B1L1/EUYtJk+F5+FBIteOib0+OKrnNA797BRf7s2yNG1HZAWWcJ7g9SLg0exKG2R
         VZv4PftexaVW812M7ZgyktYAGOXWYrlzd24gFPfvkizDNOPxXkjJ0bBIGn+d2En/aYqJ
         kvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154132; x=1782758932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xCvssNQne72NavhMvuwUrx2Vh4KYhQUGV0pglyxelQ=;
        b=VheU7wm6Bg3/4vYk6vW1dXl+X4HaXel7yLPGF1YLdUhBytFSCoedXRZF9wZ1vF3IDK
         THlTAqjjZ1bKVVQlKL9ljmXb0PbOKRxDv9hmR423sWsgDyPAA7kngAUsjsXnMpfdPixn
         oidUzqM+3CXPcgROjb9qdMVoaYd5zl2WN/K489yT+htkC4obCYCZ0zOF/RWwTNEcBqYj
         P5jb6CNBauJzkbt+BChkfAH7e7/TyzM5/9DuNjQbYlVGXCnd9AdTPf6lx8xIaiiJ/suR
         0Pa1UpqahPTfYBp97AOWd9SQ63LMrtIcdTODtB3gEBte3GAiczUxkCyxWQ6cBat8RjqT
         HuFg==
X-Forwarded-Encrypted: i=1; AHgh+RqL76LwVW67Y9cd7PAH/CzSOxrcKNAIux0TrKZucJR8FCITg2ouXqx3aLZx9C7eOrdQAEcjAToD8hzvhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsfSoDsk7xJGK/GZCdOH1QYWQA0Ag68sBG9IyN6SEnD5OG2KC
	kFgmY7hg6eLGmuCEGkIcu7qvN18KOADY5PfF1uELlYP602ZvtN3C1lW9
X-Gm-Gg: AfdE7cnYv0TYigFDklrDP1KlSJE0eUBJcw7AejKr9GGWbNbzsFn3OIo2K1aYW7TL98a
	zkWJQg0VZePAdPAzNNwbAATeIU+gEvEt8lopdeVZE5f0G9ADHAn+q4bV3eBqJug4aX43aXimWhw
	u45yO3XZ5nx3CVJpkm8Cl0YWrGesAfs1mOs6EaDODiQGB4zmWyaaF3eGbVPNlWTEsATSgGVX/Mc
	fkNdxHlvhOcE741KKBicBP8rOhJeoczC0+ciIUWo+iF5nHztOr7xsgWmDCLn/P+ncd4EDOW6N/j
	n3HD2xEteVMdkr0Yc5MT0IwxKXvxx2nzVSAq6mTHLs1cb9Mzp3b62J90+I9yAW5aw6smgKe1gZ5
	kWTmU6959+N7EYpP34oa7J9WaRsahR5684ofRYnDepGZFnG6nK7j1KTDVtjjhsdZARYFI8/GoXM
	xGiHOp2/0WhP56K+uiHs2+8U489PHXL9Q9gSU0dQ+TyQ==
X-Received: by 2002:a17:90b:380a:b0:36b:7ad1:df70 with SMTP id 98e67ed59e1d1-37d15688cc9mr16655816a91.2.1782154132136;
        Mon, 22 Jun 2026 11:48:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f222bafsm7780517a91.7.2026.06.22.11.48.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 11:48:51 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	birenpandya@gmail.com
Subject: [PATCH v2 0/5] media: i2c: Add missing media_entity_cleanup()
Date: Tue, 23 Jun 2026 00:18:41 +0530
Message-ID: <20260622184840.66226-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds missing media_entity_cleanup() calls to the remove
functions of several media I2C drivers that initialize media entity pads
in their probe functions.

Changes in v2:
- Dropped "prevent memory leaks" from commit messages since
  media_entity_cleanup() is currently a no-op. (Jacopo)
- Added missing cleanup to the probe error path in msp3400-driver. (Jacopo)
- Added Reviewed-by tag to max9286 patch.

Biren Pandya (5):
  media: i2c: cx25840-core: Add missing media_entity_cleanup()
  media: i2c: max9286: Add missing media_entity_cleanup()
  media: i2c: msp3400-driver: Add missing media_entity_cleanup()
  media: i2c: mt9v011: Add missing media_entity_cleanup()
  media: i2c: saa7115: Add missing media_entity_cleanup()

 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 drivers/media/i2c/max9286.c              | 5 ++++-
 drivers/media/i2c/msp3400-driver.c       | 3 +++
 drivers/media/i2c/mt9v011.c              | 3 +++
 drivers/media/i2c/saa7115.c              | 2 ++
 5 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)

