Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B48372056
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829809; cv=none; b=btGpHcqzR0KQAPxFsIj/ZQ+O+jjQxjB3D9ZGJd3MrLXSzJUMIFMT/FN5Zcg0Ezu1Np5ts2Txf+pa66k4mwSK917g+lMOuun6GodEuWWDfgc0nszcfrOl2weguJbj4nVshDwmXWdkaFVvCFviPbGGLPO2fgeI/iD0j1HoQ9Vb/RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829809; c=relaxed/simple;
	bh=KW69lvg8TMWXr7DI9skS9q/ZqrV9+YFodEpT4OCc98o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QX+wN34AysXgvuapgpm8ibEEGrUZZTYtFj91cTWcZemg1pqX7xnMvOCClLcr3/H9KyGV69gKraHG5Ym1rPAHdEryWowhU0J894l7Hlu1Z91MOQlNCF92j/cbcTgg4SJxJf/vjpQtf+PCizkcbhhZ0fEpLQVpaJtekmJbRRSUB6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffe45oce; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffe45oce"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so58382035ad.3
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829808; x=1786434608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSs5ij29ZrMcyZFf2/QKPoy3pslOiUQ8/h4fua66yDk=;
        b=ffe45oceQnUNIrBlc6wXjT9ta0kvrDZeJnzew3wMk+ppy96M8pHi1/LYcZk6b8z7pv
         qTSuS9gv2iMs0XPhnkZTyE0X2ufagUW2mBHoCxnvCxX0P47MJje5CTFWx37HgO/DczjU
         MUCus8KViWGdLrTpaaLurY1Kps2WWjNqlHIAj/spg5VOFSBVeW5yzZgKG7edDESUIeMF
         5GLON2DNcp1Ux3XFCGC4uTyHNGbhQvutD34TeX/4tdFiuyAg7WGwPnJJWjycEj9h3CGD
         Mbxa/DUetQLDaM9P6McgOzETYJMHfBsrPkJv0vYKBNmhyESJKPyedYRaP4NQ6A3+3wot
         B7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829808; x=1786434608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSs5ij29ZrMcyZFf2/QKPoy3pslOiUQ8/h4fua66yDk=;
        b=ANkqfvJ3ArjZcttee0t3gyNkaRYsvcRtuByyJ2g+uTVszxSZzxEPHkqoUVznBfusGv
         S8Ej8iuMzPEX+huiiOp8hTyQbc8mTQ7oY0Qzq4Se/KUmCZ6Dm+s3hu2KKIbvokpP34rm
         LOm2GFkmqTIihSlPXJLIDrnm88TfhdgtmWrVf8dxVha4BZhoUZW725epCZxWkZAyFMFJ
         ox0Im14f7Uzdu/ByKztzDPHMvEr9ewgBWczJCLOmKcHAY7AFkHBAI5Cr6TYtmkjvhH+1
         kseBSY8+B0xncdoHgbfQOkx+TgPN7ywQGZbWd3u/V3Er+9qMei/xqaT5pfCBdoZW918u
         0xew==
X-Forwarded-Encrypted: i=1; AHgh+RrUcMtAKrvUSNfaXeMqBY27Dyf7m4yo65LgcYxcgD4ZHDWdUiDrOHmJX8fl3WDcr/rfmze9KV5bDZBFrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfI7iYQRlNZz8ZJu4278tR9FNx37bzlAmJOcKeFQc/JMIRmNh1
	ri7sC8mVsx3mFZi9aSG5PkLOKzybCVIxCvVNOyi9jBTubJpDhNIo7Z6v
X-Gm-Gg: AR+sD13MEpTmF8FvzT5RQPvx8Robxf7y7Q5v9+7pP8SUpo4cqpFPCDskB9Y8NFhewth
	SLIHa4w4zrPC8O1sbqRtAscEgVRkrwa2R/DB0eY1EBV4CVIOz0xjbpGDotayL4Z10eSudsrFVmg
	7a2FFUq1IFXo1vvnosXCuI/csRjONm8QiakVRUMEMvjUQFBKDpVVafHtXDh04m9FFOBj5syxc1/
	B/n+mpOk8N/TMGbMiAl3CaoVO46On1jW27/BUQpNJkWa7H56AMoOHZAVzBooWdd3xbc1Cv/+azZ
	Jl3ZvC1oWE4iBd7DiqumsSluuOOGr6Nguoq3l4jKdzBTVgn/ADt88e/yQvgHAdI5DMEhfVmHdNH
	HlvZ6w/CL5r2JuLD4pb4ntd1zijO3CLnx1/TWSzWkxkc3wzVsXNwvTfhFksUBYp49eiAyouxXQK
	e44qDd05fDWF8fL5cZC8Gh1PfdlIz7mY1ODoX4JDlVDj/y7A+kIeI50F4EioqofLG/j3WEuikkH
	/YE348=
X-Received: by 2002:a17:903:46c6:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d0521ed97emr119765655ad.13.1785829807354;
        Tue, 04 Aug 2026 00:50:07 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm1444852eec.19.2026.08.04.00.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:50:06 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v2] staging: media: av7110: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 07:49:51 +0000
Message-ID: <20260804074951.14915-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c03..83c6ee305d6 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -92,7 +92,7 @@ static int sp8870_readreg(struct sp8870_state *state, u16 reg)
 		return -1;
 	}
 
-	return (b1[0] << 8 | b1[1]);
+	return b1[0] << 8 | b1[1];
 }
 
 static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmware *fw)
@@ -167,7 +167,7 @@ static void sp8870_microcontroller_start(struct sp8870_state *state)
 
 static int sp8870_read_data_valid_signal(struct sp8870_state *state)
 {
-	return (sp8870_readreg(state, 0x0D02) > 0);
+	return sp8870_readreg(state, 0x0D02) > 0;
 }
 
 static int configure_reg0xc05(struct dtv_frontend_properties *p, u16 *reg0xc05)
-- 
2.51.0.windows.1

