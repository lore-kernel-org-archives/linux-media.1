Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4C4234973
	for <linux-media@vger.kernel.org>; Sun, 23 Aug 2026 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508748; cv=none; b=WNBnpLNDUwUXevTapj70cdcufbSglMC5CznLguOTsKipkowuCEeLNgzw8pXbpcW6HnCbRYLINLYi5Hp00lb7VHjqMqB5mEsyeLUV/9rhJG+4XPadrqSMna/rXftkem91VTMtH6RtrvEom09iZ+Rnr4JA1jUFsvVDPVctAPX9mt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508748; c=relaxed/simple;
	bh=yT4hv0raBUjv6lAEEObzu+QtflldmZdO3JERLBCiaZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IsQk0yeKwnTh8YMZ7ZBVMor7ObY5ae8N1iRZ5IucUny9CVZZZZg7rCtM0kxt8Upilg1JcoFIGm4dTz+CTkosbXNeBrhI7aElNWGPs0+xSPR0CS5qQWm+Nu+bt6gB9s1MFJPlK9cYQVV7atycLuU/9Kx3VXB8UZJdNoPgKRkV+gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz; spf=pass smtp.mailfrom=post.cz; dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b=hRWQY8tc; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=post.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=post.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=post.cz header.i=@post.cz header.b="hRWQY8tc"
Received: from email.seznam.cz
	by smtpc-mxd-fc6854d64-wssh9
	(smtpc-mxd-fc6854d64-wssh9 [2a02:598:96:8a00::1200:701])
	id 65a51f66c784453776df1209;
	Sun, 23 Aug 2026 20:12:03 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
	t=1787508723; bh=p44p+3wFj3y0H8LSg0YLSfqEeayBrTa/HtbLimWYV4E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding;
	b=hRWQY8tcwxv6/I+omYPVqcd+uaPFG8NDwUqaAoJheziGaiUD2ozXSn/XxDk4GO25S
	 6Nkwlr7nabPfK9jTYZ5gOd/bge9Yqp9r7z93kjneFnpsVVcm8vrT6UjqJ1tgPfRIIz
	 B7gBp3PajIg//5DLghKplAIUVYqWmcl/tE/kFAg5JfCRpIYLTrKUdhfs+pS0wvbiYB
	 J0X9nIFQUzzeA8ztGQ1IVGBy4dD7NNkLdcE9xmFLCs6wS6aFvBiljQLbSmAzEMS+se
	 Cuk61ho0lotaikmuBMBzQEBFVtAo0j95uT4dajSesoyoQR6BJk6fJplSWFNE81YMhT
	 L3+OyknGocbmQ==
Received: from raspberrypi.tailf05c2d.ts.net ([185.155.34.10])
	by smtpd-relay-86c88674d5-79dbn (szn-email-smtpd/2.0.80) with ESMTPA
	id 149242ff-bbcf-475e-9e11-728be5856f5c;
	Sun, 23 Aug 2026 20:11:51 +0200
From: Matthew <matthew-kernel@post.cz>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthew <matthew-kernel@post.cz>
Subject: [PATCH] staging: media: atomisp: remove unnecessary void function return
Date: Sun, 23 Aug 2026 20:11:41 +0200
Message-Id: <20260823181141.265635-1-matthew-kernel@post.cz>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unneeded return statement at the end of a void function
in atomisp_cmd.c. This cleans up the code and fixes a checkpatch.pl
warning: "void function return statements are not generally useful".

Signed-off-by: Matthew <matthew-kernel@post.cz>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..81d0afae8041 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
-- 
2.39.5

