Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2444B1261
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443571; cv=none; b=lC0215lAdB8Ehd6ODdLG6VXe/0uHRC4Nov5EkfKNpHV5I1sZedi/P3HrOG8Ch0lh6q9+dtzAj98Girr94CDIXC+apFr2daCeSNrdQfOby7qQyoF14S1pU4dtYoFs2nErMSMgdu04kzCv23UbNs0910l+MDvyV9c4o8kVHvjwwkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443571; c=relaxed/simple;
	bh=A9tFXtu0XWRFcdfwCqDHDr5yuN/58LVPsyUpMIW1Ps0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCRAV1hI+ybucyOczLnE8ql10hYM8fcTTeDLUdadiav9/4sgbix7CFgH7BwWRcnuvjBdAFiQwpaHpETbNpL6I4mvDETnAPrxwTujYYiTzWQ7Sy9803yUbPBiNzlHsPY2d/6qunwOJwQwT3KpaPLK8mX4Ftr+hw/p+QXoqKGdHfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxDtd7Rr; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxDtd7Rr"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48584dc164fso356011f8f.0
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 06:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788443553; x=1789048353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=BxDtd7RrTkSLcDHlzFqae6piLIxi8lklen/ukPmCL4yQ08H/IOd+MDidvLFiQ0me0f
         QKMo5JLGhZS6WRMECBXIIr+ke0mUNF+6ktCQby+V+un0exzlbpJB62RmaUAqRWjp8EHK
         WI+FRUHf7dg30Q99Lpd6ffB3vhlaRo/cQcKzv7pDhCxC8nS4TTtLB1gI0u/tY23P/Vk0
         LmIhZ4NhcIdUtpNuwk+wGLYd/ZJqAEFY1/TEU1nShT9/1AVytLb6UvqYJwYykXmat3oI
         77w8rcJhceYhR/SRuv5uX/xGvaE8EKQGJv6NP2O7Po2oHow+sNnZG/mGNU3osD2uw8xU
         6VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443553; x=1789048353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csh27SRclgEY3hCLE8xf3YTKQW4fhH5v82nkgEIQKps=;
        b=TF0CI7OUvDRov5BmdBRTtJ49qBm3GVgwsrXgscEJOMZ/k5FIJN2o4E7rylYvVNlrFA
         Il6kERi1BnpZ74Z7aQpvjegYRC5KF6T5e3V0E2r2qXbQGontRWrUde6/1uY7pbkJO0hX
         iXKmoKmsqv1E2OTJfFF9mnhyEHwnCVGu8721XZVa3caOfjZTCD7f0fEH0aBV1/Kuql9+
         H6PBxfSemlzoc1rVKLLGAjBnoWzxluzFM0mzfBBc0bgMAP5kUYgbelC5LAfqY9nhhszB
         NGMOEqGakU9akvIM08GqL+Vgu60lBsx/P7YrvPrkT0tWuyny6cItNHbEzhZjNasgLjcc
         l7LQ==
X-Gm-Message-State: AFuF++mYCAGqnLojJPd0CfP26xvqeCmCo7U29NYiPxreTkPIYllVoKNk
	CjaFX8mVv5lfOqhKK7asmxHk9G9IbimSrRqpa+KjYTZRiBqV7y4vilrD
X-Gm-Gg: AYBFou2/U9lSvdVPIjefuf0FVEKCUFws8R7WPm0ACt/EriEf/OocAcxrsZ/j+5Kohm4
	ZkbjjpK+B7dllSRi4P4iXfFzDv1r9+AOqma4DhaRYvbLrm8MDz2snDHC/F76uC2mWQiWynjQH/2
	Xj0Z/EruCpxYuE+KuTG16H41krJ4iUu0H05/EeqgArSqek9cKM24jeC1/kLXGmH4bu47qyyUFh/
	TT/oOdiNZtUTliTLuWckLSmyOXEre/c+zkdIOZBQW5PmBOb2eD4NTIwAhG58yawz2AVIvX7fHdr
	mIS22rILfPW1qWrPslRt01T9Pu1QmxsmQ3JeCk6CmNBJD56WcdWWcQVAdZIu3qB1/cc6oPud0j/
	GeaoOvPFFzFDbUfUNV1BkUu4jn3I+GYbKvPcu4/Yxa0DO7zP9yfSHyzvpiRlTEflXnmSOPFCPvQ
	opTbVqurMt4r2fgfEMt1DD1mNwj5JKo1ryq+9a8YOqykxzr3+AK8rv2zruwsyg9fcu9TEqEim0U
	PXcFGq6jaCHO74xXdBjNqDaZAXd/nBdXxeY2SKv7PZyQnXK4eDSss+U6dYS3w==
X-Received: by 2002:a05:6000:178e:b0:483:3695:6ea6 with SMTP id ffacd0b85a97d-48488f1b111mr21280968f8f.20.1788443553101;
        Thu, 03 Sep 2026 06:52:33 -0700 (PDT)
Received: from chubuchnyi-ThinkPad-P1-Gen-4i.tail30ebf2.ts.net ([158.173.155.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed2edfsm13597771f8f.23.2026.09.03.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:52:32 -0700 (PDT)
From: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
Subject: [PATCH] MAINTAINERS: add Tegra CSI bindings to TEGRA VIDEO DRIVER
Date: Thu,  3 Sep 2026 16:50:58 +0300
Message-ID: <20260903135058.2598642-2-chubuchnyi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra20 and tegra210 CSI bindings are not listed in any MAINTAINERS
entry, so get_maintainer.pl does not match TEGRA VIDEO DRIVER for changes
to them and reports neither linux-media nor two of the four maintainers
of that entry.

The entry already covers the VI and VIP bindings, and csi.c binds to the
compatibles documented by both files. Add them as well.

Signed-off-by: Aleksandr Chubuchnyi <chubuchnyi@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fc320b373..e4f50fe24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26924,9 +26924,11 @@ M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
 F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
 F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
-- 
2.43.0

