Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61584285072
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784325830; cv=none; b=Bzo0rPMPtHpT5i+C5a5Lf4Tc7jjoIwGNPw+PsNjTcAGQJx8r9yubopdgzWN0Dipza1dsUcNBmw54bgUY38R3OThzJGmoIHDmI8VkhSp/QahaVG91YxBgrVCNLY1/RkWB4sm5vWVRGfhK6e+BZ6m9khlA9XTfoqCI5+YPQpyHQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784325830; c=relaxed/simple;
	bh=DxnR4sPEavpsxUjIRpACUHhY9m+jlY9ANb8OHnTCjqI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rQd/WVDpyWD2F8efMpju+6n6XSx3mquRrtG+M4TG9+DWfi0PXulr5r8/F3n3ancFgOBIuWNQ5lNKYIaYEfG535UyaO+B3wFO7UZ27ntx8r0VSqdbK4KrKfcyvbpFGfS6EdidOtxe7+gj1p/+wFHLMKO70QE7k8vBONjzWrGq2Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mHFFOefI; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mHFFOefI"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so11169744a91.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 15:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784325829; x=1784930629; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYYHYKAUeatpOn//IK/JH12B+TfsA27+r7dA2uby9Hs=;
        b=mHFFOefI0qpk/Ph9Rum6fJiLPhOQ3C9CHtWdfS1Mgj4FhVEx9JPdTTuGyZDrtSgdYX
         /UQwy7n3DCfWNJ/1NVE/NtWiPbEAHN366n00dhAVnNumqDyoze/EEr/r2aer3KzCLZCh
         AOjv9WhJGfv9akXFvdUVgosBL4pZVXmUg9QDBfPigMc9tZs0/gfb68mNTEVawmr9AVRm
         0rd2xXLkC/nUItD2v6Nz1rlTjuBEwb02KlZLjn/pFM4+zUJaQLTiGOjIMpjOjhkMx3hF
         O7BhPW+A9cA+k37bgPjX2vHFunDwHyJSuDFBlgQdZyexjYQV2salftedjuzDHyCB75GC
         p7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784325829; x=1784930629;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYYHYKAUeatpOn//IK/JH12B+TfsA27+r7dA2uby9Hs=;
        b=EcJ3xK7N0p75Cafjn8Celqq44nTkjml6wWKJqG+keIU8KtqwweP44hiiY2ko6eG/o1
         YMkGwtz0r5wl227llMA8jfF3zDnEfYSt1nKj91XXu894oRRfbc6iKv0v6nYfzKs/MSWA
         QtGx4pKjw0hGkl/++wcbJ1zjn/UuoBFGEowcjccuHb+JJ6EB+v7EUqGlJzlZOrtSI2Tw
         cGVGKkRwS63R+AgSKoQ0+lVWSsmBKDSgPIGfMLCOD+LfrYVzLl7ylnZc1OveU8pN6fco
         gQQpds5GNKPW67HxvLXFBcdpIu8T+rHPJtVQtryCPtjuzvV3+nmBl71MCMwhYiZQuiNr
         gBtw==
X-Gm-Message-State: AOJu0Yzj/rc3ckIVPWzytAri4yQBSB9pmnB3GN68i2YG4WKqeF9RiHqi
	r1Vv1cTvyUKHO6e2L4wfm8xz8/wMqACjAWGaJk1FlvjtKf0BgYX/qWWjyO88vmSBRYXBYENVdAy
	dtGi8F8VQi9s3JPu/IgiGOlbxLI+KxcrAl7pUwdRg20gVwbONpFCnwxOZgkyO52VhyCcR2XGMZS
	K7mi8Ez+heFeZOxlu+HR2Qt7yQ/NLRuWdyLmVaQvYeXBqSZ+EH2ajQltivKER5Oiqvondvl+tPA
	ic=
X-Received: from dlep14-n2.prod.google.com ([2002:a05:701b:458e:20b0:13b:a0d5:1dba])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:442e:b0:38e:5701:644a with SMTP id 98e67ed59e1d1-38e570170d9mr1541714a91.27.1784325828491;
 Fri, 17 Jul 2026 15:03:48 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:03:32 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALOmWmoC/x3MQQqDMBBG4avIrBuItirpVYqUGEf9IaQhk4aCe
 HdDl9/ivYOEE1jo2RyUuEDwCRXtrSG327CxwlJNne4GPbaj8phdjO+cbBBkFFbaDdbw3XC/Gqp dTLzi93++qDy8+mZ4oek8LzzRtS5uAAAA
X-Change-Id: 20260717-libcpp_transitive-0c6a9e39e5f9
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=O0COsmvrvggwIeEq7bAuRbULbXScoJmbNMYaRi6RFIw=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784325826; l=1560;
 i=ndesaulniers@google.com; s=20260611; h=from:subject:message-id;
 bh=DxnR4sPEavpsxUjIRpACUHhY9m+jlY9ANb8OHnTCjqI=; b=iFdGbQjgk8B9pQ3wEUMDsWdIAeSa873ZLTlEKc1cSNZgYiLkCSW9zl5f8rbPAJ1YZF/6Av3xb
 5qaEd4DGdNfDlb5bnYlVjr+vuqlTRhkQAvBY/0N7N15mKEjLbAxC7i7
X-Mailer: b4 0.14.3
Message-ID: <20260717-libcpp_transitive-v1-1-3af91860affe@google.com>
Subject: [PATCH v4l-utils] v4l-utils: include cstdlib for std::exit
From: Nick Desaulniers <ndesaulniers@google.com>
To: linux-media@vger.kernel.org, Yi Kong <yikong@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

libc++ recently trimmed their list of transitive includes. Include
<cstdlib> for the declaration of std::exit to avoid compile time errors
against newer versions of libc++.

Fixes:

    v4l-utils/utils/v4l2-compliance/v4l2-test-input-output.cpp:53:11:
    error: no member named 'exit' in namespace 'std'; did you mean simply
    'exit'?
       53 |                         return fail("couldn't get freq band\n");
          |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    v4l-utils/utils/v4l2-compliance/v4l2-compliance.h:286:3: note:
    expanded from macro 'fail'
      286 |                 std::exit(EXIT_FAILURE);
          |                 ^    ~~~~
    bionic/libc/include/stdlib.h:55:17: note: 'exit' declared here
       55 | __noreturn void exit(int __status);
          |                 ^

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 utils/v4l2-compliance/v4l2-compliance.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index b43c5817..7ca4744e 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -25,6 +25,7 @@
 #include <set>
 #include <string>
 #include <cstdint>
+#include <cstdlib>
 
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>

---
base-commit: b32589c514810daacc05a2015d205b997cd11970
change-id: 20260717-libcpp_transitive-0c6a9e39e5f9

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

