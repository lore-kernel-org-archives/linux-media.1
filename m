Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765223A874A
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568118; cv=none; b=TZioYVRItvmU3+aSSPnK+fDUhhppVERyl7cmRKDBIBwLLrZ66rWRTJoOVUeSlgL+61hUWm5ogc5XGVeCLQudKEJX3K/vXTp5EGewTLsJseHR4Bd0SRhPBn4DnHGegZjbbvWuVVcPxKqJ3xw3Cg2y7JKcVqV4KGHXQErfZsPfNP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568118; c=relaxed/simple;
	bh=PfcYP6H4inJEoqY/AAT8PiQXeTTNIx/6j6aalZLG9oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjdVonCXmLLZo+YUo+XS6Spb4+zOUyJTRMywGenti0aeuBF43yw1HJozpcRkMVzNYr2e/l9w2Ko/ebMtZ/9e66M7YshLwY53o/hlxag0bioRV/xYOL7kudAksSLzRo5x92pzABNgyFY9mZKmq/tfPDR5smmhkYGM6WjaCiy5Ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir2srz8I; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir2srz8I"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b159850b16so1402625e87.3
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568112; x=1787172912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMlv8yck8DnDJ5KocQRB7E2A7xY09xdqY5AZ8i/KHD4=;
        b=ir2srz8IR2wkXqmVgAvSgiqqBt8qdxL5/2IIQxIy8BIA9TgdTlN4IhY5msqPNcKxiA
         qHb8JCYUQCptK5fzejTe2Psmu7rfnElDkvL561+GSsrpJerXIEWsOfGR1ksHIyfxjLhU
         2Wie4Me05u1sjkQhA4l9j0lwQu1E6x3s/IfGtfJoyQ9tfx4Yo77pA0IWiHrPPdlmPH4S
         K9cPnYhEkPb6KdQFtr1KKJGbeMnWlXiKJdACMWwm0DKQTNII7TTN5pP2hlmcTL/hf+7A
         n3y766gLXcYWCn7gmrdGZH8bxJ4IbYysRLdYkTTUFhTRB5qPC0tYJrSIeHngMR8lvqCT
         8aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568112; x=1787172912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMlv8yck8DnDJ5KocQRB7E2A7xY09xdqY5AZ8i/KHD4=;
        b=h17JWaYuKpfWmtKnHv/Cg8hyr/BlaHGLKEmhndGo6gQqpD8iQArQzjO7Gf0s5xXDjQ
         DX0pwShJqLfVVyHPCRuKGgyw6h69ZBElIZYnRbFDSR4qHo90py/e2JUbkCtRff+nUVaA
         LDeCW5+9bQrW0wSuv7+z26Q97d/5hwXSJskbKz5nOfY8OEPHpxBvt98zHBEH58f1AwdP
         tkKxk9YNsQeRY7Dp89axPCmuDUavfyHqb+HhPnnPWwFtG3Dh4Y20WcGVmviLMIgR3u1f
         D/o0ihHiDM0i+ND7DA4EAXJLFuYbZIrNCSo6Kij5j8D9Bsaiy8gRXW8MpKQxZ3XaBadR
         99pQ==
X-Gm-Message-State: AOJu0YzyIb7bW4LnSTfucVDLgFx0WkImX/1do0abZULvj3Ak5Lj6bXKR
	vUc4MDeFqf22MdDe6oZr5zghzqC5LWNF8DZ2dP5Y36Q8YThEaq93qtNT
X-Gm-Gg: AR+sD11VTNBZZukbKkeNupGS/qnO7ykTEd8Nws9x1Ye4UTFSmMM6s1Bx0owhL7Ooo8x
	TpeifS8PUXy9I0JsWixX8XqnsHgWblPEjqqPi6DYTml9nwRDtap8kXzXlR8iOEaZEJjlAe4ShEA
	pOKbZ4KaKx/N0a939Au1q4/p8KMHOOdqJfT4veCbFBJYsbIBJKLj8r1XXnz05gg9ALjcMalAg3W
	lUxjUeODbByqaR6py3bVGKWfM9rfhfKcd6XuVMSCs0I+c24X5sQc3mCwKvufZmw+1AZNNTTegTd
	U3nEdRUN0oJ8eBoturqkRRdkDuMdvgXseYNOYJ/cgLeAREAEYtX9dBO171vbF74Hj/RQYviyRna
	xFodb4loNIfZJdPo+nDJCWaT3lYXsaXqQXEk5SBYoLMITBkihpUSQGPAzuPoG0OgBDnoyrBTKRs
	WAZdO/oFEHuwVIP4O4/j9+XO5vLDwKPBdP6p+u2GvPK/UwtmU7D7kk4u22AOg=
X-Received: by 2002:a05:6512:155a:20b0:5ae:bcc4:c071 with SMTP id 2adb3069b0e04-5b453d065c4mr52158e87.0.1786568111514;
        Wed, 12 Aug 2026 13:55:11 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:11 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Date: Wed, 12 Aug 2026 23:51:33 +0300
Message-ID: <20260812205429.39181-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused functions and replaces obscure
variable-checking macros with clear conditional statements.

Changes in v3:
	- Split the last patch into two (inlining macros and removing
	  the file).
	- Replace variable initialization with assignment, followed
	  immediately by a check.
Changes in v2:
	- Squashed the function removals in pci/hmm/hmm.c and
	  pci/hmm/hmm_bo.c into a single commit.
	- Add commits to cleanup macros from include/hmm/hmm_common.h,
	  as suggested by Andy Shevchenko.

Nikolay Kulikov (5):
  staging: media: atomisp: remove unused functions from pci/hmm/
  staging: media: atomisp: inline macros for checking the bo/bodev
    pointer
  staging: media: atomisp: inline the check_bo_status_*() macros
  staging: media: atomisp: inline the var_equal_return*() macros
  staging: media: atomisp: remove hmm/hmm_common.h file

 .../staging/media/atomisp/include/hmm/hmm.h   |  17 --
 .../media/atomisp/include/hmm/hmm_bo.h        |  46 ----
 .../media/atomisp/include/hmm/hmm_common.h    |  60 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  41 ---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 246 ++++++++----------
 5 files changed, 112 insertions(+), 298 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h

-- 
2.55.0

