Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BB2F6577
	for <linux-media@vger.kernel.org>; Sun,  1 Mar 2026 22:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404275; cv=none; b=R4cIruS385l/GrzizLStiE5vzhPXYTfpgn/gYRgXPO7RaU2XyII6sJJtVRrAvUIe45Q/45MquSwIksY5OLKNMQNymwu9lpW6yopslNL9omy7UOIhe98tcSDX4KfZBrtM18tYH6COIkUkp3LSLsknEyQcG28sZqh1hYuRxyaNS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404275; c=relaxed/simple;
	bh=W4c/RXACKX1jHr9bJjsr+w4HrkxRmjTR+oPdzT46pVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRzP4vtNAtfNmbOZxAFvV42C6JujEmJiuw/bckUC4d9wVRdI+Fvpz08vPsOLYDNBiGIy65EuLBUtvIaRYSCqTcdRiEpccOAGlOjhRA/QwcFPDXRDgIVAdRanIig6QlwF0ODSpREWVGnB4cUrpwaS1leJGj0/RNRSiIvMNVX5+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7qytvzW; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7qytvzW"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38709888abeso54200101fa.1
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2026 14:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772404272; x=1773009072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKMx/xZCiCudfP4Yqf9EkavRqjzsW5f9YLVYfmiQHxs=;
        b=i7qytvzW/iejLMXuQER0S22f2Estc5iLgm+k8KeyRQQLjrCFhsGG+BcPMjHPhs9BJb
         zQmJh3WKFQPBFJdqITMfnydq9gdCuZoK35nwqbS3ELxqfyvLq7kxzu5mD8bXbE1O1cFy
         F4mJBiIMWWBpp/tRAdJMnxZqKh4Xk1+EFreOX2WDV75nxSZ85NDK9syvDSRC0vXlSk52
         O0OgnUt+dBRZpsJqAfAaJaM0JkEPbabprcJZNghlL40HZx+Drp7llOR5qD6vqGXEBo1o
         phQ1XeUGEg8MnyZy+GF1ewZqa1gxF4tBExkztKJew2qctTbVcMB/uhxpn0tlZIdLEdEI
         QhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772404272; x=1773009072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKMx/xZCiCudfP4Yqf9EkavRqjzsW5f9YLVYfmiQHxs=;
        b=IkH4NUgxz+zqVU3UNL7eD61+cl6MycMODShDYttlTwK/G5VnaS7qAQ8prkAMZM0auO
         NDGGoOyy0Km3xYkM2mNLdly/WsQKKNbuKWAswv8fGEO7VvldfZJvWhfXXf702hcMw8nZ
         RzXG66/bw7CvBYiDvFaTJW5F8EoluTWowhorixZzt7NLljKlMJZDWeSLzpX84BaocTnv
         vPzDuFKBfuC1ZxUmNHIG2fED1QUdM0/HBgckXr18iDHi48SDqFgKlOWcbDVYUsWqH+3g
         GrfjHeCzk3uUOXFg9Po63lk+dLoh4lbdZKrVkF77/+vfMcT4798LCdsS8eUbLj8AKbi4
         5CuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm2vNU42RZwIClvoVO2gtPpNRF7JOw8OO5uVUURH+Yudjet11cRm2ucUu266pk3bBomcB933VAfr2epA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQKEWMm64m4sXDrhZHUZ9DMI0MbEnHnaRyeZKJTY2xzCNojWex
	CxJ4Dcmxb9r0lATlihI6M1w+URQDHiOJt5HHwfaQCefHVSdBBHJdV+fNfyPQnw==
X-Gm-Gg: ATEYQzxP62zTnOK2FNxCRGOQXCa6O6ObpG7XbxZbtVFvFDMcGcEYzeWLEX7EdCwRrak
	nWrMH+oHx7GW5JpGZnbOon2LtoFf5h2p1chIutrmbsNhU3lB1ftS6QbumtEExhaz3FYAQJXJw1n
	oypvrsJ+o7GwhUUo8RR8RF/gQh1HDp3qc/5uxSwFQkNaEOEY0PhKfWJ68VTpZIesDhVaZAzomvq
	4/sgmBqdxqYYMUQaVhLCsZIoUpPBpfmvunw9pNrVO90B+ecMwC+ToNEsO6Pll2vBjuc+qtCBTya
	jhJbh7JZ2BqxsRxOAVuqapLrlEDykMD8Hn2u+DAJF82qh+J4AjinRcuZ22ocYNoJDVi+XwMisku
	EnC1mLg8x807zYdQMfiv3HH0IENU7FAU920grVgZeQ7S/dr5ksQQd8qvvrrHcOkog7SwxKHRaLB
	NlIVElWWDfBBu30K2IDF1LL2IULZrg4kkrBnUIr/ak3haR9IuXRQtaBjMG9FokpWVupanAvdfEb
	A==
X-Received: by 2002:a2e:9610:0:b0:37a:45b0:467a with SMTP id 38308e7fff4ca-389ff116e40mr51883051fa.5.1772404271598;
        Sun, 01 Mar 2026 14:31:11 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2ffe01fsm24634001fa.26.2026.03.01.14.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:31:11 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH v2] staging: atomisp: remove unnecessary else after return in atomisp_cmd.c
Date: Sun,  1 Mar 2026 23:30:38 +0100
Message-ID: <20260301223038.5103-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else clause after return statement as the else
branch is not needed when the if branch always returns.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
Changes in v2:
- Fix typo 'alsways' -> 'always' in commit message
- Add blank line after return statement

 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9d22ec27ea76..088aea327b9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2035,8 +2035,8 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
-		memcpy(to, from, n);
+
+	memcpy(to, from, n);
 	return 0;
 }
 
-- 
2.43.0

