Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774E47988B
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612283; cv=none; b=TGlH1LBXunANOubabW7jU9sjnJQgOASM0LNqVH95zH/AJdrv8mwh5i6O45UAkR9j4PVldKPQIqBvLi1tLquyP2FonaR+IjkeJGWvYpNny3aCXeBcJMeyT47ZDrVATqqvgMT9rgU/71m4Lls0kMt4inqTEdG56XQ6k22duK2hqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612283; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVHkC3BDCV9b1zlT8XCcJ+wMwMoV5Mh4Zcfoc7USwgdBB13IRNmwIKmBR2ynFOfUmCkc0Qr4sQELNKJsd6WzPizMNCuhcIbfMr95uLIy99NN9RUpcu5VBcg6ZD621Utdkmv90ZwjogEYyjz6bz4hqkzpkhVhy1YKtmxB98xj450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzBSFuhs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzBSFuhs"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc891373e0so20864775ad.2
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612280; x=1789217080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=jzBSFuhsbkrPCo505JQz3G+xdlugkLc+IBPvSy0XsIfFSJd/c8mRnEylKYpvF/ZV+K
         iQUQvk2s2tPlR5qay3SW81SyUF3LUWrPBD3BL+8kQzuMGyi+PCzUPb2ziwy44odAhWxJ
         KTAOHC2ufuge6vYiRCOS/R/oyBcXjCrVSqvelyemGLd9ZIkupmKYvwNzB5GYnZNZPujQ
         Hjn7VrXRaVdL0DKmXwRFpiet0mtZDoEHvKcaCOFkF1M4dpc5T65ijaEJtaFuAXazWNgX
         EnDpoQPToYSNlZENI5dBX7MQGfVkGX5FExIrLz0LfI9EpCnPlAHcMuO4m31CgfjJ6jSx
         hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612280; x=1789217080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=dbeZN+p349Sdfyz8HsxxiwQG12uJVs9O0Y8bzMBXc3Pz7IpxXKl9ScVTbuAoIH96E/
         JszH70f570xwSAmFpGggCxM17MIxBvaTO5d3KzIFWCuxlENToT5UE6iDQb7negaSUdvu
         XlZZWVBEzNl4gshSwklI3crZERKamAiY+hqhmYtL+nXBtoRzz+4XsMnXYUaZWAT/AM3A
         OX1yYoHcMy/34GBBNhbe5tbz6cgxJp8Dz/iFpTd8p8kLtrjy8r0Gfhi4u0CWTMXC4A3u
         SbOFUY1B1tXtyglG5ljObkljmkul/OUwTDQ6C76U9XnldSKcr/rxSSXZ2PIREmMDk/B5
         cQ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzlkotcGmWMP9cBZbW4RR4D6zGUQ9MD5pFC++je/bhQFTRH0G45dbjV6HF8wT4kZ6u3YOk18noNcITWZA==@vger.kernel.org
X-Gm-Message-State: AFuF++k8cIRMzlF+S2ZP8W41w1tFOE1WDT9z+A+0bBBI7wPqbR/yb/bJ
	PAghctOmMUWqDU2TFAcMyBJ6TQ5t9gGRiM4ItNMQ+fkItb4IlwlIIjx0
X-Gm-Gg: AYBFou1X+vbaUYtAaXSKBKdtCJSZKxphvbNXApuPnernbHKbqmcjKWnFHZcJBbRciYa
	jry+GjKxhOhpf4xXUS77P6QcLhJ0xBCHdloIz0kgK2JV11uNkBzrEWBULiAhO8yTEJSS7JpkYNo
	uYpoAlOXcLLAqT5NwlL//zfg1hLD1kOgSiyG40tdUyEapV4ucQSalsV1Na6AKWUNTFACM94sTEU
	5BgQQ056C3bHaJ+HSl+4cgZJCv4BGtV7Fpd593pEIxhl/MGRD1PtEteuouBCd+Q5Cyte1KIw0xD
	BE58Th3UsMSDQkFfGqAXLfQzYV99GxeI2JV1q79KgnXRJLh66wgyj0E1EzDEGcYtZjWck7M7k+9
	GcK4/GCi9n9DImpTPXAouw98zc2IYQk6b7zoOn/Rg6IiCD6Al5jZ9Yq4ICbr7uwyprYi7yjhhTi
	vmBv6peQvdc6W3wrpGpr5295oPpK595cdVdYi/1d5w0PcYu0MHQGRFhsG0YPJi3GWGKEo9/5yz4
	b7Z4lDj9O0g9oNORn4Eq5/yjW+qsl1C
X-Received: by 2002:a17:902:e805:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2db3b351c2emr5928535ad.5.1788612279984;
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:44:32 -0300
Message-ID: <20260905124434.6163-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

