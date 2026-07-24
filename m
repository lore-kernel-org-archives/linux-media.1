Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E142124B
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 22:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784932553; cv=none; b=fdOf+v95tN+ViaQuNoN5OsLFQoZAt53E0MS8N08vjSLtV9mwXnvOMSmifkfaizaJ4BRBlr9qkKtCBMeoJbej/w04ZWN27KD7XEtubfy8xS/tzl02lSiLNQVik+c5ABeeYfOQ8/l0pSXXKzWYcpc5o4u9W9FVFDa8b5yMmv6NOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784932553; c=relaxed/simple;
	bh=PQKOye00hfYUqvepuyNeAYbvVGeKygJ+fGqD3y1Pnrk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mkpeBmsN75KdMVs3KYLz4iDrOVDWBvSarC2zQVgVv96o7sv4L7PRZOphlD8Y3HtGeCJV2xiQWHx5lQM12Gaw0Tsa9oSec1eWsNyem1su5FleknnWX8oewMja6mu/3KfXGdFhp9EdMwGYkfGeVEM3z81T0wWEP1y5dUCcIxd2Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bIGse0Up; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ndesaulniers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bIGse0Up"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1367252a12.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 15:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784932551; x=1785537351; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iq0FahCG5nNuT9pXWn4/ezJoittISfTYPTakB8Ile10=;
        b=bIGse0Up8O4bBp+0CXZ/G5vAWmW3MUKWe/RoGT1EXKagLzx+hgQe8PiwZ1oLIBZbCU
         BRre5raGgkCrR/GxfuKNz93P9jpa+X2qY7hl5OBteXSr5Q1uDHQGihKxN7lK7tR9IPSB
         GfSCU7qr1NdUJeyjMSGWm3y8CC3fwr+XkY3IRz2NIymj+qvJ7RxpAsTfVN3BwQ0bdD/L
         n3DtLqKbVG2LTjm/Uj0sJbzxuHdyhsV3BaNPO3EoqmmXSb1WQdZDBuKdZQ0utpkoMPtK
         yeZWdo4VZGEeNlKt3J8YcoUr9EUivwt2IdQw0rWrpPObJIWQ3Mt9lT/TzdcvXuzSHlDL
         b/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784932551; x=1785537351;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iq0FahCG5nNuT9pXWn4/ezJoittISfTYPTakB8Ile10=;
        b=Atk5yHXRFklktCd8Sw8JHZ3OFBkAtMHH+Oq9P/rJCzGxQ944bksv4V1A8ECVBNxcUm
         LIRuXsTbS/oPJkmBoqxiNMIQgJ8r0t/C23m8OfqLxcNQ1l6aX7rX//7KfaMaPxb/5RME
         4jkKGQ4wq8pssak0CeLHlfh1M7SfFAMKF/kTyZp6rmch/OHHtOSBD07ImJby5tPmrTo4
         L0VwcttYh+7Mn7FahuH27q5WISUa3UhMdvlpl4CuT/hxyOjla5TLKsIWr6tUbHEngR4Y
         Cg9bNlscdx0uAcJJIBRWRsnA/cVh2xDNtP4z5fnok1SSeXE155/Rf6XDXACnbPSBSoaC
         K7gw==
X-Gm-Message-State: AOJu0YxX2TLvKoE4LMr6+fOFcQRWbYQK8ywcpA4RYEvPfz4n1juD42kw
	8q5qq68Ogl743FyFbXcG/37dS5dsdQX77FVyQAIC3IX/XazvOqIXD+JtIGXfTt7EKojDQ4DQZci
	G1y79cJr8uowEEzW3CsExjdfYoDcrOUoWlWTL+KPV9q0mlZCMNnUbixYwnoTiyX5FUXe3iMBcAg
	2JQ0/aWo7V+CiDrLsLW/i6wbEU2t7QbR0p8AAc6WWLYKI7B7DRAzwzMD5Es1Tsj1WVVIJoDoDag
	ms=
X-Received: from dlbrc12.prod.google.com ([2002:a05:7022:ea8c:b0:13b:90ef:7999])
 (user=ndesaulniers job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:380e:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-38f1eaaa3e2mr2437643a91.5.1784932550667;
 Fri, 24 Jul 2026 15:35:50 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:35:40 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALvoY2oC/32NQQ7CIBREr9L8tRhotZWuvIdpDOKn/QkWAkg0T
 e8u4QAuX2bmzQYRA2GEsdkgYKZIbi3QHhrQi1pnZPQsDC1vez6IgVl6aO/vKag1UqKMjOteSew
 kno2EsvMBDX2q8wb5ZNk7kY0wlWihmFz41rcsauGPOAsmWKeMFJeeK2PwOjs3Wzxq94Jp3/cfG FsPcL4AAAA=
X-Change-Id: 20260717-libcpp_transitive-0c6a9e39e5f9
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=O0COsmvrvggwIeEq7bAuRbULbXScoJmbNMYaRi6RFIw=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784932549; l=2226;
 i=ndesaulniers@google.com; s=20260611; h=from:subject:message-id;
 bh=PQKOye00hfYUqvepuyNeAYbvVGeKygJ+fGqD3y1Pnrk=; b=brF7JRagw+IpHuMNfuNiCkLq0beJwjEQSA0tyAVO/bUbRs5hrUl9WT4LTbfxfkMO35C2cGx3T
 8O4dRVF6P9wBUF2x5nu8U0aUcEdIwtAwhFIxXj0AfWxirZQTw73cjyO
X-Mailer: b4 0.14.3
Message-ID: <20260724-libcpp_transitive-v2-1-87a2d11905b6@google.com>
Subject: [PATCH v4l-utils v2] v4l-utils: include cstdlib for std::exit
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
Changes in v2:
- Also fixup v4l2-ctl.h; many .cpp files including it refer to
  std::exit, not exit.
- Link to v1: https://lore.kernel.org/r/20260717-libcpp_transitive-v1-1-3af91860affe@google.com
---
 utils/v4l2-compliance/v4l2-compliance.h | 1 +
 utils/v4l2-ctl/v4l2-ctl.h               | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

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
diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
index ae6f43f3..483b2c36 100644
--- a/utils/v4l2-ctl/v4l2-ctl.h
+++ b/utils/v4l2-ctl/v4l2-ctl.h
@@ -2,9 +2,9 @@
 #define _V4L2_CTL_H
 
 #include <cstdint>
+#include <cstdlib>
 #include <linux/videodev2.h>
 #include <linux/v4l2-subdev.h>
-#include <stdlib.h>
 #include <v4l-getsubopt.h>
 
 #include <v4l2-info.h>

---
base-commit: b32589c514810daacc05a2015d205b997cd11970
change-id: 20260717-libcpp_transitive-0c6a9e39e5f9

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

