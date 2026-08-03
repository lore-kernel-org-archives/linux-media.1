Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263DA43801B
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786065; cv=none; b=FJvjnzoLLQ6deULEgPF2UuAjU3KWhY2RxOZeCtr54pDzVS5wxE5G9kJa7qJEssAvUKzH/Rv6N3gqBl9Xq4LWOuslQFG4tnQ4UL0tlGTswJtcT48RUTJZgWqeiL2LDY92RjUC2LuM6FL+KGVHLlXuvc+l0wFUitNgkdRuc3rXghQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786065; c=relaxed/simple;
	bh=bGTJxYUhkdMuFVT0Yepk3qvMo6KRIoF5A1Hk9B3qPvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clDWbroBypm8VZANC+FZjcQ0Y1TANkf+AXdOvZ3Lh3vgOvj4Ph8Y8xbRBcHckYfK+FLkP8MafNbXkMHb/NqtDINUY6OzBCi5/BqaUgYzhKjG95iaiq0ZBgRH9nBEdaZPWLi64msi7G/pOyxklW/MP34mGE5TWfOuMaydHnG16So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGMFOlkk; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGMFOlkk"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c998fd549a8so2964294a12.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785786062; x=1786390862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lb+dMcWMfms0fNLLWQ3HZFsBohDm1qBxYxzySJh/Nno=;
        b=mGMFOlkkta79OWE0gnko2w2c1L931SWlQ4k5tWEiyBd1IDAyBfTF/LAnfgFEdDgTMd
         Q8hdPvKTVJD58SSOpB214KrJO0ox2QeHBIOMBdnokaj2XJiwfcsn3iMGEwIp7wjAVdwo
         PYiGCatkwh0i6jzYVLU1XYPZhtHLHHyvTYsL7yWCWE+nvRxu7HAZgj8xRjvMXlHEKXgn
         pGW70v6lh2SeRoDrt7Z1Ez+yoZ/eHI47Q1cPazvJaNZMPi8AR3bX0InwUdDcOPSRG8X+
         BJC6IAhKhV3vw8zWizKdMvY4PyQoYb/63XNrygAxxgwCvfHe8GdVriyi1lOFhitaXbEn
         jsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785786062; x=1786390862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lb+dMcWMfms0fNLLWQ3HZFsBohDm1qBxYxzySJh/Nno=;
        b=Fi7KwaAG7rSKuOYW0Tpb206wp7pvEYhuBGSp5pHroxo54rlzTa/YnhURoDWeZseXSx
         +lxxUsXEI2uoTDAQt8ofF/24+gZ3sNf9H+HwYk4JXxbn5Sr3zUbOFR/Vz11eK3E6BnyZ
         vRkR4Ag8hSF4PNo6qa7o3mCYy1aFL7XkyozYIyTznHLOnBoS45/WABCwrCUtj/iIYIRm
         jU8xnmH8s9RdtkhCQ+ERWCsrSXcu/3KxqVhG350lqf496za5dcJwLw50Mqg5zk5IqGrG
         w89kzMQU2F/WPe39nZaZlMMvEafdQYV3E1mAPykLX6pP06wfrcNlWNcdPbXQECXBI85c
         8BPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrqLpHVvA6OM5TTgvJt2x9q7mIepmhKV6iC+o4iJxuIvIvYtv8WlMH1t7aH9t40c/497bKwVNuqtMJDRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ftxnE1L1wMYrwlMXRFjFJJ5GaM2xgvKdpCO3VejZ6iVL6joj
	0FBXEWSVvgbPnjZAzL0eWLmjd/BdOv7L5eujA9khG6mw/r7+x+o9TFUM
X-Gm-Gg: AR+sD13AAzGcmb8TUCGIXXlXLNoLVI/JW84FIQyrgwg2qDmCEgUAiz2DH3H0ELewxYs
	n25+ifFTz2kzZPDZuPuRS49Wb9Et+SOxwvLbDq94uWWgKp2+Q3gId4R67c/uSLVXsWlW0TeJLoq
	bqiqK0grKjEfXo8wUIx4SPX8Z4KZ5SjaeAVHaUInOWW0ZDx+7i7LeX/BRoaUn3M7Rtb7l7mQsAL
	PpBkrYVBaxoltDvzVebVr7RBTe6WbAa/aX3ooM1DWFxD+mqXl+MXKF2VGoctrvQbD18rL66S2S7
	xieIAdIFVlxIinIiW3kUYQHdykmDItuBg23PJtDWPkrv3hpd5kcr/ACq8rLu1UJU4sRpiLgBjzW
	Z5rnq6P8+s+bB3JJRejZUiWFqzsF/t5ausuIt8Fhoyfey0PQXdEfE6rkH4zxz4n2AV7O+WQUK4J
	ulaUeHXIfYdNJo1+jSji6ghXl8tj1/QWopOq4x5EAWZc94RIbBokyRuNOY55Doga+gKSjer4q4u
	rOj0veG
X-Received: by 2002:a05:6a21:7d0c:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c92a836be3mr11724275637.43.1785786062228;
        Mon, 03 Aug 2026 12:41:02 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.189])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm40835326eec.8.2026.08.03.12.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:41:00 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 2/3] staging: media: av7110: remove unnecessary parentheses from return
Date: Mon,  3 Aug 2026 19:40:43 +0000
Message-ID: <20260803194043.11554-1-work.ashmitkumar@gmail.com>
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
2.43.0

