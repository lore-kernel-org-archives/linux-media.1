Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F4357D00
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 13:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613776; cv=none; b=izPZRZCC0D0j9C5GlSklMlJVXUB0sHcqvSHx/JeRSMENq/lQGEpq4eFseR0u31blF6w3ppsQRDS9qwf1Gc2hpsAxR23OY03670WT8svfNvvN8S4P285g3AewNkb0pe5pflcdd8ixuzlReNn36HYelMmrch+Z3UMeU29lVPaTVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613776; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FigqNdIBBbXKgWykQzt8Wq3pJbiP7ARVhUObUakjZrhV0J4CNbyIJ0EPVuZUQlhvIsf36Bwcb/BxB3EqCmzH0bJ4tiFWPfyFAXCvWpPAnggNyKzidR/pBMSsGnAhocikmIpdj8K6GaeKgzU3mCRUOZY26uLcqQUXUnTbOLxwBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFmFRufW; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFmFRufW"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98077ac9c49so534980241.3
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613773; x=1789218573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=IFmFRufWLG0nOelfApNAMYBwtNqPS5XbX6iUCs567RT7YFVK1mBje84aIG564HG/P+
         cqHPTtZRGv7gomM/WpPNbdm23lL3RGugWACjN6+YfjDO81+/nXu1KtSWGjVUkDNh7AfE
         yepfrBT+xkK7IwcDNyygSGqVt+Q5B3ue4I7QLXaBaCbzNM9T5qES6NHiV0Mu8EReRdD5
         Ah+rAKxOAdJ1NYQiaz7c2kSX+3ATsIc2AVK6n5nAOZJgwDUa02Wi3tBamQ3p6flRZH42
         1jK87qFDvjYdyY0WIw4RVZcgFMEgFZgv5WinpQcXCLT4BI42K6tfxbYALSuZ9q/94kCB
         /4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613773; x=1789218573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=kXA/M2JK+/egp9h8H+mJXvOjZe+ZO4r/Is3eQjiCAZ1FeLjVqrESUjaa1+XOMnZYnA
         MjxMSPS4wpaobwVTbx25xLClq3IbU9oFb07JOJv8BwAlyDjyZOnNjEUGUVfyO2UbQtEe
         Eg4S1eyTjFuAKj8AY0rERxHUB9Nz0O7N6F2lNHa5EPR3uu2coQr9km8cFgV5rBjeC7F2
         MXSxxrfqTA0acIEhKLZ94YKxmNxToCx8GfyMCrQwM9FuzfhtrGuO9WX0YVOM7BS4z1mO
         MJZF7t5/oFxXY7d/J28T1xsFSTUlv/A0NZ/GHS8yJAG0veXa8yGi/W/+wm2y4leCjXtN
         cTNg==
X-Forwarded-Encrypted: i=1; AKwUvBxKhGmFhc7SF7Ar/am23bXcRZetj/aqCAwRW1wG6R6HcvFanBrbB6pOaqV28f24cLNMxdpFAaED2Stn3g==@vger.kernel.org
X-Gm-Message-State: AFuF++kYHItAWrpx3fp2HNoftpLn2hHtjg7QrDpFSd76NE2Oa/2oVol+
	tiaaC2HLBDdRDbeuwS3fpeY19icXNEPFs5sbKY6b/8x/mRG9lmzK1a+r
X-Gm-Gg: AYBFou0qkHuDB2NVULnwFpq7+mFdI/9zqS3F9WgkgQ9RkKuPTvxHujUB1SiCQxpLrjA
	/tyUHiZmors5+JxhuGYi5ehujnZpms4HAUZ++Cjdqa417g1eY3yLc6nMn86xxU/gQppDdn3jf1K
	R+VrvjsKcFhr7oQ4bG7A5UtSuI2b5fyU0V/XDK2VlBZJE602SZISxagMzbagPwuvY0K+EbqvJz/
	tfCP8oUWi43bL77oT1U2Iuv/LRz3hoSmMCVLNndQFmMsmdvX1Fns4Yl8WXi6PuHCXwTsgdAYEBx
	tT2wy32lrqjdSa9Sq8dVkzNcccahAS/jpd3OS0FLz4vE2rZEZrQafej0c5VtvENTBXaO6Glw0rW
	fDJ4c5Z+hwZjM4kZgSOPj9wo5BNFTwoHYWSFPhuHsqyzHzVfmHTfOqmurlijBWbGzON1IlJA+yq
	pQJepRs0E/9ASvD17p1mU0Fi8BBCTPXDvyGh4lVxVpI6IWFx4Msow2P+b4QYv1/6lmUlWTEi5+M
	NNcc079zZNSE0nUMb/Bscfb8RncETG2YzNPRU9dFeI=
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id ada2fe7eead31-78a4a880ccdmr3889707137.10.1788613773006;
        Sat, 05 Sep 2026 06:09:33 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:32 -0700 (PDT)
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
Subject: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 10:09:23 -0300
Message-ID: <20260905130925.7115-1-breno3011alves@gmail.com>
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

