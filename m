Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8E1F418F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509842; cv=none; b=U09eDYQCOiIt1vZeFj1DdoXmllZ3UBJvmwNTZZQnnTIJ5Gw3Lv4QPyt15PudKs3CTG9565J4ZSyq/i36/2TVIabjroNUU6zGS4a7mc6IVvovOho2Z+0yax4rk3Deh3p2hEc2oCwEOQpRhkXJA6JDQoUsWIS98LPgWhSSaMFoyCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509842; c=relaxed/simple;
	bh=BipMm5lfIubS+qYjp5SUJYYW1uuvMz3JC+XpwOMJdxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LE6i54+z1KARAPxCKFjmK1DJBONxSzMAEmrbt8avCeTPiABWNEPtyFdbGTHwKLLYUI+iWz/aaTkS2gWPtc0wTwWKn35MOX2Hjm88Ot5ept/m9oesuWBg1Wp/fQsO0XNvswZfK/T56WHmwRBxBTzSleRWe/xNwhgUOu0i/EgXDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jvgo9Y8A; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvgo9Y8A"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848d21bbaffso9424212b3a.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784509841; x=1785114641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PoNzHDaEUW12LTwmhuf1KATua1dYnVRtmO/lrvJtp80=;
        b=Jvgo9Y8AtrrVXDKcvzG/tBJGVoJ0FaPNbLREZKRI9DJNk0q5k2XH2OK7202x1aLvev
         Te3yAH+BYL2PDYicONEocRNfqsmJJFgc9pW79yoCrw5HjK3ySQ2NxbBBqQiPIH9cB02D
         OBtV65sLYjnk8E7kizjv3pP14Vv15VtWaCVVDcykUzeQ1/9mQUXfKh7YAEPldZkYn4q9
         1HJeMEmwCq+aVyAuWkhDP8DSn56SQWq2iGMiuTOMbpEXEoKKyFxYapnl8VXbEwxvbm23
         ax+TmqUPrA6UowUWekeRyeIUScFIzke2o4seZ4iemMtxyhsA8PbVndnU52YEUkJByGYK
         LMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509841; x=1785114641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PoNzHDaEUW12LTwmhuf1KATua1dYnVRtmO/lrvJtp80=;
        b=sfZdEh5rGTuPHfcfUfE4EjwhDhOKV4JwzUwOtq8EWBQZa/19n02BDEQ+LuKka2UNqi
         0B39yaRmDKjf0WVlYSzcuJhDc6/n+z5PBRmWoNuHzjQbj9lCQPMEgIDVi+qjDPX0KQOy
         tOqWUxRLO1YUhtvhG28gMGQGFaAVeAugtZYDF5hoAZPuFMznARq/Ik7buTqjhCvWL4ZN
         UI2MpaEPmqirsmFFgIzAAgKu9etIbtIohKqGiMQyEFfIWRYIVGPweSt857NC53pBbx91
         PNYkzK05o1WO2MoEyNfX4ubNrzOyLGbkSof/AEu751Be1QVOsSskqtvS268XpE8yOyyN
         +KUQ==
X-Gm-Message-State: AOJu0YzqfuX2eAghVlFY3h71Hd4Z452+Yl5/yrmHq4uCUmqzEW2xGHhw
	J8QF2crPtiBZ8MwftoRWfzakiMRHOOurbKNcVOS8Z55WVjvYJs5nlgG/RRFCVPXXZ9I=
X-Gm-Gg: AfdE7cmqVwrQDEvdHgUszukbki+kWrXx+Cv1ck3rmXIPY0O9Ds2obJNpmflP9McwlYp
	5FJSyZfD+rxHD9vWdzx6Oi1ayoGuMAlA09ptMZ1Nl7pdVRHQqwiBMFOq4a9xCkj04Ib6hwqNFcN
	ADo0Xl0l0w/eWlm1mn8usZ5xm6JSJG1MiAKARDAMW3idHe4dgX/sUSkP/wRC5p72B9gwPe2RzzZ
	/EoB2jEiYurR7Lxe1iS5n11HFFipgOCTe03uE7oTwdIHpFksNFfirsOD69XImRDJwz6UtNzEVti
	17/l/ddmUYelfW0dqwXWKAfFgCvfiipphAo2VLHjrlvgSwzmDvY+4p7y/5urfCf31rGpfEkGVKK
	BENmumkWMhlEN6i9G83Nyh9vB5YekLlpT6XcA9uujXgPeBLgq4t3jvkb3SYvSfGmNM/hsHRTGBu
	kj/4sq/vaLQllSYSGry8Kby1Dtnax4uNsof8ttflw=
X-Received: by 2002:a05:6a20:c98b:b0:3c3:853a:8d15 with SMTP id adf61e73a8af0-3c3ada1831bmr13664195637.72.1784509840815;
        Sun, 19 Jul 2026 18:10:40 -0700 (PDT)
Received: from White.tail445f11.ts.net ([45.119.30.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm27141680eec.17.2026.07.19.18.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:10:40 -0700 (PDT)
From: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	kees@kernel.org,
	stoth@linuxtv.org
Subject: [PATCH 2/3] media: dvb-frontends: cx24116: handle command I2C failures
Date: Mon, 20 Jul 2026 06:40:16 +0530
Message-ID: <20260720011017.11363-2-nikhilgurudasani314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720011017.11363-1-nikhilgurudasani314@gmail.com>
References: <20260720011017.11363-1-nikhilgurudasani314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx24116_cmd_execute() ignores command and execute-register write errors.
It also treats a negative execute-register read as a busy value until a
generic timeout is reported. In addition, the polling counter reuses the
command-write index, so longer commands receive fewer retries.

Return I2C failures immediately and use a fresh bounded polling counter.

Fixes: 0d46748c3f87 ("V4L/DVB (8986): cx24116: Adding DVB-S2 demodulator support")
Signed-off-by: Nikhil Gurudasani <nikhilgurudasani314@gmail.com>
---
 drivers/media/dvb-frontends/cx24116.c | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/media/dvb-frontends/cx24116.c b/drivers/media/dvb-frontends/cx24116.c
index 04b8f2fba4b0..39af918cb59f 100644
--- a/drivers/media/dvb-frontends/cx24116.c
+++ b/drivers/media/dvb-frontends/cx24116.c
@@ -533,22 +533,28 @@ static int cx24116_cmd_execute(struct dvb_frontend *fe, struct cx24116_cmd *cmd)
 	/* Write the command */
 	for (i = 0; i < cmd->len ; i++) {
 		dprintk("%s: 0x%02x == 0x%02x\n", __func__, i, cmd->args[i]);
-		cx24116_writereg(state, i, cmd->args[i]);
+		ret = cx24116_writereg(state, i, cmd->args[i]);
+		if (ret)
+			return ret;
 	}
 
 	/* Start execution and wait for cmd to terminate */
-	cx24116_writereg(state, CX24116_REG_EXECUTE, 0x01);
-	while (cx24116_readreg(state, CX24116_REG_EXECUTE)) {
+	ret = cx24116_writereg(state, CX24116_REG_EXECUTE, 0x01);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < 65; i++) {
+		ret = cx24116_readreg(state, CX24116_REG_EXECUTE);
+		if (ret < 0)
+			return ret;
+		if (!ret)
+			return 0;
+
 		msleep(10);
-		if (i++ > 64) {
-			/* Avoid looping forever if the firmware does
-				not respond */
-			printk(KERN_WARNING "%s() Firmware not responding\n",
-				__func__);
-			return -EREMOTEIO;
-		}
 	}
-	return 0;
+
+	dev_warn(&state->i2c->dev, "Firmware not responding\n");
+	return -EREMOTEIO;
 }
 
 static int cx24116_load_firmware(struct dvb_frontend *fe,
-- 
2.43.0

