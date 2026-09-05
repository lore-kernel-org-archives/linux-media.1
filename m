Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7591ADC97
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 00:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566826; cv=none; b=Yz6ECtP2UlwsLNLAX03u/05Q6fn94rjw4Y1PR2Hrq52iUMTrr40Wz/2J0mOH0QB3N23Hdvn5oRR/dv3ntQpTjRjxdOwlz+1p/GWO6m3L960cZQivXy+bLVzfmJS7MRundW+3M+8f4gk1iMSE2tmA3z8RfStXd6IHC2hnMVPtZI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566826; c=relaxed/simple;
	bh=AbGCPD867X/zR4JWWABXmcYRuDetze/f0050Gy5ULXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F/+YAX/GJfMyJ7KfUc+PTvU3c0SLFFhRVg8Wv0VhKldH25T+CqIY671yzz3gVLuRVz6oy6O4ZQ0qXrv9yeXleVxI0bHurujPU9+pkcHuDkhOvTnCE9sPOAEHMhg+xkLSBSdNnZXc6497PwHZMZUafzGf3TUaSyg7xj76wQ8D4hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbtPtVDy; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbtPtVDy"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-746d77537f8so1041050137.0
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 17:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566823; x=1789171623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=NbtPtVDyUe4EiV1PyvB3ifcEKyiJkW+gPdb9/8kwE1w7b+jj8eHLByRqzahzHJTk15
         pIyJyn22VdYuawT7Wu7McepZpzTxxNWtIXnjjulX1BXc5sfUDt4Ua0VQoy/Zzco5T6b8
         /G6318j5/Q09afTMClrwY6N8L08CX75DcCgXZTYmFqOr+JlJojzmeI9WRkuwpGKqbJLe
         97oXpAptFxOD3WzGPCIwetnSUAhotj93foByJI1FxS2MsmRRxUNJXyd0D2V1KxqM65pL
         XTE5yntgRUyinSXb++6JwefTnC1DwGNHHK511HWMs83Tzn/HinnJk5r4Yvg9O4fQ6E4V
         QxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566823; x=1789171623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySdxtd2OOrMzj1/M4oljubzNlyC8qvGXvin601ESwdY=;
        b=qw8XyFjbr9jclfcgZ0Q7WBs2lkn83fv1FrV/AEV7I0hB1wh0bn9NGjjVPjebMI7xr3
         aufcnrZ+/cbSDsmWJ1NnMu//Aux3hQbPAjRqkKSa00rT+mnJ+Yf+XuZI33aEO+CAi0JL
         azWdm28I25AVCDV/xU2CHRyW0IVCOYQ1jdclBRTk2RY4ODxSEJvYlLYp+tvLpNwp8n+D
         xMos9b23UVNJD7GDceXqTmYHK15++qPrmKuxMhX8C+89FiiW8BkG/qJ1zuR83IPS2S7L
         qfZ1dSaVrSMcvsNcSIWFkf7TR3Jbm4w1mFCOf97wpkjulWJe7kdqhOhGnU9FMI2lcU5T
         B+sw==
X-Forwarded-Encrypted: i=1; AKwUvBzA1gbDSfdQBqIWu6D1dfF1fSHuPywXL5E8bQpIXfgUZTRfN5iMkldwzFD5fnTouCgNlqCAJP1TAHSYJw==@vger.kernel.org
X-Gm-Message-State: AFuF++nP+68InzE6OXxnqzvr4MMSyQi5FEBnA7y0U/D+iuWT1lDMiCyV
	vzAaPkKNLj3ueC9pSYCdGELRnP2+9YxBOxOMiiWRL7NDgrjh6ssrHizc
X-Gm-Gg: AYBFou344FdwOh6EeoLE8t9juX/jF6OWCDSdJWVa2zrU+se4/YpOfQqRqzyvb0MdRRl
	cCpVcWlbSL80IN153rdPuDDnm9DpweMFor0zpMSZ4DbwU2PiX+XgIOjk8zNDMYknrS25d6THVeX
	WyY0pg8lZfuLFfcHG+gAMZrL12ORoHcGR7o5hQbJ2VL1LiwKJX7ZYz4xLRupnhINHZ2oT0HmAj1
	H2EmM4aLMaffKAkP2LB3V5gbjYyEheXqu17of0QgA6O+fa7mKyHkYXwFWrn48e8zT3foi9m6Fxz
	l2zqQQk4VTzUVqjxnl2XNQ0VPBXI/x6AVE9MbDFTH3Nap4yDFES8bGfXWa92FL9DLUK9sKTQYKZ
	63FcqUWhBenIBrtxjWKZJ9gEHgYAXE+J771kpb4TS9i2p+kY7/moy9qcYElOwBmo6vCJedRuFWc
	Lpgp0hKsOVJc9lkjLdzYRPvHuuErqxbVPgXlHo/pgtz32WZdA9hOKXkc1eRBAUD4nuKApX78gw2
	F4zFEFsDvyl1DaUlwNGBOhe8cYuP6Tl
X-Received: by 2002:a05:6102:554b:b0:786:4607:bdaa with SMTP id ada2fe7eead31-78a4a8983c7mr3967271137.4.1788566822540;
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm2735870241.13.2026.09.04.17.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:07:02 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
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
Subject: [PATCH v3] Kconfig: fix typos in core makefiles/code and purge remaining ghosts (v3)
Date: Fri,  4 Sep 2026 21:06:55 -0300
Message-ID: <20260905000655.103429-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analysis from Sashiko AI revealed that several legacy options were not
true dead weight, but rather victims of pre-existing copy-paste typos
in Makefiles and C code.

This patch:
  - Fixes MediaTek interconnect typo mapping mt8196.o to MT8195.
  - Fixes MediaTek regulator typo mapping mt6316-regulator to MT6315.
  - Fixes missing CONFIG_ prefix on DVB_ULE_DEBUG macro in dvb_net.c.
  - Retains critical PCI_IMX6_EP and Tegra audio prompts to keep hidden
    symbols selectable.
  - Cleans up the dangling comment in drivers/leds/Kconfig.
  - Purges the remaining verified ghost weight.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 Documentation/admin-guide/index.rst           |  1 -
 Documentation/admin-guide/lcd-panel-cgram.rst | 27 -------------------
 2 files changed, 28 deletions(-)
 delete mode 100644 Documentation/admin-guide/lcd-panel-cgram.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index cd28dfe91..70c0bbc87 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -152,7 +152,6 @@ How to configure your hardware within your Linux system.
    gpio/index
    hw_random
    laptops/index
-   lcd-panel-cgram
    media/index
    nvme-multipath
    parport
diff --git a/Documentation/admin-guide/lcd-panel-cgram.rst b/Documentation/admin-guide/lcd-panel-cgram.rst
deleted file mode 100644
index a3eb00c62..000000000
--- a/Documentation/admin-guide/lcd-panel-cgram.rst
+++ /dev/null
@@ -1,27 +0,0 @@
-======================================
-Parallel port LCD/Keypad Panel support
-======================================
-
-Some LCDs allow you to define up to 8 characters, mapped to ASCII
-characters 0 to 7. The escape code to define a new character is
-'\e[LG' followed by one digit from 0 to 7, representing the character
-number, and up to 8 couples of hex digits terminated by a semi-colon
-(';'). Each couple of digits represents a line, with 1-bits for each
-illuminated pixel with LSB on the right. Lines are numbered from the
-top of the character to the bottom. On a 5x7 matrix, only the 5 lower
-bits of the 7 first bytes are used for each character. If the string
-is incomplete, only complete lines will be redefined. Here are some
-examples::
-
-  printf "\e[LG0010101050D1F0C04;"  => 0 = [enter]
-  printf "\e[LG1040E1F0000000000;"  => 1 = [up]
-  printf "\e[LG2000000001F0E0400;"  => 2 = [down]
-  printf "\e[LG3040E1F001F0E0400;"  => 3 = [up-down]
-  printf "\e[LG40002060E1E0E0602;"  => 4 = [left]
-  printf "\e[LG500080C0E0F0E0C08;"  => 5 = [right]
-  printf "\e[LG60016051516141400;"  => 6 = "IP"
-
-  printf "\e[LG00103071F1F070301;"  => big speaker
-  printf "\e[LG00002061E1E060200;"  => small speaker
-
-Willy
-- 
2.43.0

