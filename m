Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B6341DDF0
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579490; cv=none; b=bcQNARc/T3SygTxVYMO7cKcU8MuHB1BmnuQI9FtceDUcI0WHXI9l+pQX0lubUjT8WAMkom5I01BzZmF3U7lHKFX9OMHDaYU2A+4ZwX3wvkN9dYTy+uJayHzsrK/wO7gkhDvk5WMNzFNh5lfUJwOA5nkTqWiRaXT/sJXGUxR1v30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579490; c=relaxed/simple;
	bh=iaN3lkHUtw9LcR00F1Y5+Wmzia7syR+lHqf8s3/QTCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQxCT2UJEyjsrSAGk1YmNlgmWd2FIz0psbTyzlwAYBeIs5KrL1chUvn5JjllsYHnWfdaJsaRUDGrjaKsP3e8ALqVgP4XYeDI+/HWbq3pi7ZXUb+8nWigzbO1IHgKINymwjQgqICjWsE35CFACq2ev8/6ehiBHGa1MJE/3+f0EcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwq+cIR5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwq+cIR5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so4013920a12.3
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787579488; x=1788184288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dQQnGMOBsPPfE3BN6sWk+ZzltLNdJU7Eav06Vv4Dcts=;
        b=Uwq+cIR5vfpeUD/+hXJ2sfRRz7u91Aq98+N4PfGphjqypNlH0QBiwMGemOZn7IvPwN
         afPDFwHgpHJ9AcjvtbJwCUUSAYv45T7LN50AwhIRuLL3ecLeShn0ZLioneiR3ulLwwPC
         ZmlT6c/wA5AVBFaGeXo4bBnrbTiBh4AMBhErjJo9wgwSVK+PStKyL2myYtB1xlC4BS71
         HoCB4fmZ9WdofWmglaCkvZ2m4nh0Ta60FkKpjOay+hPwuxXHjX2pnbWodOOzYsXcgi6U
         nIQW6sWVSjHSSm0xPz1YY1WOrDcr4X60M0t6UAGHyekYOe32zVlDOdIaQeKFf+ZvhdF9
         E+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579488; x=1788184288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQQnGMOBsPPfE3BN6sWk+ZzltLNdJU7Eav06Vv4Dcts=;
        b=aylc4Gh3KJLLnZQLVRt30kmodpLgG7OFphbXttARewQ/wQ4uJ6g9stQ+E0toXDG7sl
         Yjh30Q9mBLK66tF5fu/ZY11kWJ9kjqEPciLJlgx1yetQ0G747/G94D9roXLaboB7QLkC
         EzsJdDdTUp6zMZg1JeqI37OcZdlm4fpe8mmzm+t9Vrqi5yrvgOvE+wMq9t2796gPqhTD
         l/zYlSi9Bv71hml7fv0nmywDFjv70Ig24563y1Gf6tp4dHZEri9CgYRijRrlnc+AEfW/
         eN0b5jxkEzYuJtxNOGBIeu4hg5/fDyZUcCZuzt17m35prDM3R9R8XhnGS1oHbllDGptE
         T+3g==
X-Gm-Message-State: AFuF++k59byts0IPufYVpQ1G3eCRyzcKVok2h5Js/fLjEhyTWFi5a/WS
	xYDBomGW/kJlxOlpMJQf1mfS2Dp6Do64H0MeUAoxl0s8rgHaZAHa4sYZ
X-Gm-Gg: AR+sD10HfCITR9cbZJ2F9D/9wNhmMbAgC2hQ6rNRY8gUgAbwlBGu4KDg7/+Uz3Xsetn
	J2UVg+3TYm+okSWxV8EuNyMPNWpcIXwjdPa9XJqRCrcmuYh36/7cyrRMTnW6Ttqzd4xDu0s5QMA
	syHSd87lz0alIIBkLg+yxt+AWzgkjYwacwbwUzZ46oXlIATMFcdWyKZxJgm93y1cFm2a2ZdRkSw
	pQbznyRZoI2DwkxrDeSBzc+zRNSaQwY6I3qhBg2OTwFRUU2MMw6u6UrPw3vpFF4RqoutHbrMpLX
	GWb9wCUI5oxBWk7Fo9+7uPv4OiReu8uTLHAr8vyd9I77OrYZzkoIIFm0KRhazLK4YMFvdSVrHqZ
	jh0njetm7L8DXK+C85R10Xo7dDlvYkSodL9bHq2JcWq4AuqVUffiQtLbk1SxSujlqS4mvSFo0Df
	JH8HPldElSCtJRKlBPcan1cllWo61pcfOejgfUVjTPZu8FwBm5RfmzHvOreTDFejSq6KNb9dTGx
	i+GMkPSQqzSra56ExjfwmPRXQ4qlK40x0btGnJafyEzMnFx38Jc785b+LTK4RUzVenfkjK5HBeV
	GAUn
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr47728782a91.12.1787579487878;
        Mon, 24 Aug 2026 06:51:27 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c0:106e:f291:ab34:e67f:7052:1767])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860c6e6dsm23487071c88.1.2026.08.24.06.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:51:27 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+32f018fd65e799f79ae0@syzkaller.appspotmail.com
Subject: [PATCH] media: vidtv: fix frontend reference leak on unbind
Date: Mon, 24 Aug 2026 19:21:15 +0530
Message-ID: <20260824135119.488592-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_register_frontend() keeps two references to the frontend. One is
released by dvb_unregister_frontend(), and the other by
dvb_frontend_detach(). vidtv only called dvb_unregister_frontend(), so
the second reference was never released. As a result,
__dvb_frontend_free() was never called, leaking the frontend private
data and its struct dvb_device.

The detach call was removed by commit 63101b756893 ("media: vidtv: fix
driver unbind/remove") because it caused an OOPS. The demod .release
callback freed vidtv_demod_state, and the I2C remove callbacks then
accessed the freed state.

That commit also removed those accesses from the I2C remove callbacks.
Restore the detach call, but remove the demod .release callback.
vidtv_demod_state is owned by the I2C client and is already freed by
vidtv_demod_i2c_remove(), so the frontend detach path should not free
it.

Tested with kmemleak and KASAN over 10 bind/unbind cycles. The reported
frontend and dvb_device leaks were present before the fix and were gone
after it, with no KASAN reports.

Reported-by: syzbot+32f018fd65e799f79ae0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=32f018fd65e799f79ae0
Fixes: 63101b756893 ("media: vidtv: fix driver unbind/remove")
Tested-by: syzbot+32f018fd65e799f79ae0@syzkaller.appspotmail.com
Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 2 ++
 drivers/media/test-drivers/vidtv/vidtv_demod.c  | 9 ---------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index fd69b4ee16f4..9887860b0198 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -474,6 +474,7 @@ static int vidtv_bridge_dvb_init(struct vidtv_dvb *dvb)
 fail_demod_probe:
 	for (i = i - 1; i >= 0; --i) {
 		dvb_unregister_frontend(dvb->fe[i]);
+		dvb_frontend_detach(dvb->fe[i]);
 fail_fe:
 		dvb_module_release(dvb->i2c_client_tuner[i]);
 fail_tuner_probe:
@@ -552,6 +553,7 @@ static void vidtv_bridge_remove(struct platform_device *pdev)
 
 	for (i = 0; i < NUM_FE; ++i) {
 		dvb_unregister_frontend(dvb->fe[i]);
+		dvb_frontend_detach(dvb->fe[i]);
 		dvb_module_release(dvb->i2c_client_tuner[i]);
 		dvb_module_release(dvb->i2c_client_demod[i]);
 	}
diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index 6e5fe402976b..3aa586004638 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -343,13 +343,6 @@ static int vidtv_diseqc_send_burst(struct dvb_frontend *fe,
 	return 0;
 }
 
-static void vidtv_demod_release(struct dvb_frontend *fe)
-{
-	struct vidtv_demod_state *state = fe->demodulator_priv;
-
-	kfree(state);
-}
-
 static const struct dvb_frontend_ops vidtv_demod_ops = {
 	.delsys = {
 		SYS_DVBT,
@@ -390,8 +383,6 @@ static const struct dvb_frontend_ops vidtv_demod_ops = {
 			FE_CAN_HIERARCHY_AUTO,
 	},
 
-	.release = vidtv_demod_release,
-
 	.set_frontend = vidtv_demod_set_frontend,
 	.get_frontend = vidtv_demod_get_frontend,
 
-- 
2.43.0

