Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155A3783CC
	for <linux-media@vger.kernel.org>; Sat,  5 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616901; cv=none; b=Vb3ZFpHNkoIODlBAmhM+DmvhyApfeWSW1t2RbNAML7DybzlHhM4OmODsWEKxp3EppyEwmZc/o1hCXdN3zzht1ojy/+ap+qhvGS09E6jrM4C1r3FFq0c6r3mbGXBA6XdYKDalvYbNLT2DDu/bRlACANebmvM2AD6IxUuPXXHyvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616901; c=relaxed/simple;
	bh=EizzPFcHBTIh2Y7GKphJQqpoh7RMlGuXmOyHqJPayZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8PfIjE0FrOCloEE3RhueQgI+Gao7p0LxGg2YiYbec7oFG173lRjxqdG93vO/sedjxmBTdmnHqvYBRd1WE3gC5yotzbUx/GLoatk5RvMzncOJ//BuMGS9wXeb63tqPSDMxoppcftTWeEFShK0s7dlMlODwjyTNoLoz7viIzUctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAWHDYpH; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAWHDYpH"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-783d429d0cfso1589010137.3
        for <linux-media@vger.kernel.org>; Sat, 05 Sep 2026 07:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616889; x=1789221689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=ZAWHDYpHOMJ2pb1rznJGqWziVaas9dmvZpinpC8dpdVqj28oQXoc8EcWh4t0vpBJzr
         OfhyVTe5DH/gmR5zTbIvGvTij3vy5znr4MnvveqiDbMkf1FnVpTTGTs6pPzlKhmqp3sz
         3YkwoIj1bZPG4c5xVmHJvjO423C0j8ygBV7y8w96COK+Mrg6bjL66EJZ8f6zhaipTXCA
         shq6D7fnizDyjnuKBYcpdih1sLm8oHZjgJYRBxZorjypAjnKdQNVQabQdDtTPlev5008
         KLDjEmNRmj3wxviz0WV5c0/pYxoL+Vd+BAWA+ZhPGQWWDpR2WZGmObxm4RgatpKhkaDT
         jmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616889; x=1789221689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1isrg7TbqEnfLRqiu7vL3P60u+Hz9D9A7/6IXKBZk8=;
        b=mplJpsBn6tODbGF7Ze9/sWcbjfNyEheHEU0q5aOYTZWKDPnPTFe5tmKHvLWmuOY7rf
         hb+UL47LQRohcm/ktx60UXr76VZ9ukIWvif7Z14ZU1tPJ4/OEQpcw7djbn3ettNqF0WI
         1XB4BdTClZT5aHbmSG0WP1FOaXGu5202K8ei5LO0aIRfQ5XPetWqU2oXnQqIyF5vRbDd
         mRYUpXwLdUHOrQALNJSuG1MerbfYECOgToNUic6EAKb7/QGp/eRS3ODuiCXhQpSktJ2k
         u8wiB80fMMsSRpEf0EMyTGqLtDCqiQB3KVGSaHp/qWIfKTLiehqZpjqvU1t1/yMpg36I
         E21w==
X-Forwarded-Encrypted: i=1; AKwUvBy1AxiDSAZAPnaHxvRdaorhujrUIKHhkSR+3MXXRX9X7Oh1A5G7f1GNZNFf6hToHCUj9AAEpYiL3xzlLA==@vger.kernel.org
X-Gm-Message-State: AFuF++llW+rMnpp1JHAG+5KWPFfDfSQ1nWFjb2/WM1el8cH5xwANpMI5
	/ua8BYxKNdtOMftdMXa29c/yNuwgr2DgvIjfCVM4QjcsKgHAtzdMgXTu
X-Gm-Gg: AYBFou03uQvPznKmqAjju/6ebXvufXkDaYl37aHz+hAxmQuwn2E/25uYh2bnifs0dal
	D9TOch8P39k1MGcFKyQJNjN324i+PGncbecJxBqOK3wdSfrFbIOHHHdUNYGJ6tSweBmcwmQlewA
	V+RkY7QZCsm1BI9HR6XD/exGWMEaYi8KlJe4jUqZpyjnB0DeKOZ43t0oQemJoVL2ttnbxQs5ECp
	P919lScsHRDgeM5Azun13BSOW5cDwpEQMGOuBc0EEjdMDT7H3cnE2Wlfsni/lHfk/D4WBl0hUxP
	tCHIqt89G27aLTe4uo/IdVUmn+Z5gzF4qmrjiaviWPlenHgZCjwoO4lYmcl5j1qX37u0mhqNAPp
	PLzUqR2l0VZmY0vFKt61ZtzgTHnpHG21PLoMN8Vc+n6MAvdPKne4kluGTe8EgCs/1MiKHxJxkgS
	F33sz9qBDBhtkTiHX1+cNmncMuOp1dND8/lNRRit2I4LuNbHYZUzrem/J5RBYOZ4hEBL2sU6geW
	WjqNLFgVV9q+q3TtMe3EhOP8k78eNoR
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id ada2fe7eead31-78a4a90fdd3mr5362480137.2.1788616888537;
        Sat, 05 Sep 2026 07:01:28 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:26 -0700 (PDT)
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
Subject: [PATCH v11 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 11:01:12 -0300
Message-ID: <20260905140113.21638-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905140113.21638-1-breno3011alves@gmail.com>
References: <20260905140113.21638-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..3a0db1be6 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316) += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

