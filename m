Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77FB3E8C68;
	Tue, 24 Mar 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350986; cv=none; b=XRNoAEK5iHCuh5Ko2XAhyc5+/8QVTKEf8TqK5uMJZnq//fznuKh/mxiXJ58PrwvS3gA+ff+ChhB32PUPsWF3pExcfFhVZj9oPTGNwfwSG1mb0Rqqo4VkYwBPkbGQmVyOjMZQQBMSl27izM3OLju+F5BBBqecTXhHKgWLwuAyP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350986; c=relaxed/simple;
	bh=GhqPc6paID1wkXzhbOIY2i0cRPZuvgNy3SFw15fV9SU=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ayAjB+BWuml60EEGi4RZ4eQ8k9v6OY30diMcbRfzvBt1WSBnfPQSzK2SAmzMEVb9vApQk6dCbooOn9q+LtRpuXuM4nHKg3P788b72eQBn9MczmrsQriVYRWD5yvCAbopJkjg44pVXpgSJkDCXYh2lqB42es/45u13jyVp7ZMaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hPWZb9Ek; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hPWZb9Ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774350975; bh=68/09ynWVNbhGYWkaH5OMoe2dINPFn4IEM8bmSz7+wA=;
	h=From:To:Cc:Subject:Date;
	b=hPWZb9Ekh6dnPLkK+UlF6BH3yycKt3nJ7Hyv+KC+r1K2zpF2gyq4AeZg0B6Tq8x+z
	 CGfTxQwYOTyMsUod4bd4XwhoPewCt1a8kcK3AeU6eJ8lDVJV1YyCWt9o8Hi0n4dbKP
	 HfYXTg00I08SrAU7vpxZCW02e4Gd6Ey4AAkTE1gw=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 40C2CA5C; Tue, 24 Mar 2026 19:16:12 +0800
X-QQ-mid: xmsmtpt1774350972tl2zn8vyy
Message-ID: <tencent_B699D7C2A422A968AB3B1CB17695E8C2FA05@qq.com>
X-QQ-XMAILINFO: MmCmH9jyqHC2KvLX4jzq6urZs5NW35tr1PJWf1HPFKM5Vs4xqsD8kSimVZLGTQ
	 s6Nd8FuMUPTnH8cDnVAJAY31a9PoY1BslZ0DhklDjYk4LBdK9tzpOElBmjD92wG1MHP2mN5ARSpw
	 arU5FSzx8ZOzoeOHdomknG7ZBH3Ddg5rZZzwIhzXrLfT6fWDSQWbqdWH2JOfl8XlR0r0UE9Y6kDL
	 1Y0pmnH2x2zOJSbmBWDUx9TjYeIxhjdy9PHrcdEfFfQilgt3uDrQ42Z5TiKsYuVXnueZp73xtmxg
	 LsZkRIhYYxMDgPMs1wSqeK+pEp9Sw47iinkRO6q0nw6wpeXix1UW3KCr0xYoPamZMpgqb6wqMLtr
	 3PZizA2f9ALsp3sdV9oqtlx90n81Jc0mOi7mFoSUe59I8JwLBgytZHY9q4/IGdNTuJ11JHXZsxKD
	 nnb902Ta+T8oorIAYwRKnGxhYtOIgNzZddqk0wfpaE3JcoYM3PssjBP45g40Vjx5uyORv6tmyvfT
	 fNPxKR92k8wheTv+ubE79va/Vp9R+BunCB2yZxizyPDPTFRDIHzDRL/oZrf5v7INgTngkbMd+qlY
	 TRugE+ySFt1NlSIXf33BFtaNr0AfNBS3jiaKU26IpxTge12sl/DY578/UZTNT7Dqfrvvki7x4nlV
	 OU0dBUbNeLj6n1SqbvatDemEY9H2E0vMKHwbdw3dwBoFyv0FYMNdgm6t6BGsyQq6MZsJUAxINw58
	 3JT86xnTKvaZKaMh2OdqaltEzjL4/OfbfgS4jFVlNhKbR0zQNLIgGv1OeHIu5osiM1JxAZOoiRYA
	 cdxlxq1SRGnIUwthIBFFJIOVSTODcbEe18Swb/H+QFyplzjvc9mxmgVygULm2A2RZtwtPdpiIFZU
	 57RleO3Ylgc75H29F/n9v4PgZTKoL44nJ4WBtF8LBDTZUvvVCLf1j/FvqCF+Mr59ZaDGoZMjVlg5
	 8MMvPLOnVt0dtBRzHYDATsejQbDjnkEGrUM2okqns58YbJ4RWjItS5JC8zT60MJnteIje5U9vxeu
	 SkGpnjs53ntSHrfnVU/jkdLxpCOCCSxI4QXB6AfGugC3XDhVj8nX7Ku57z8O6/S5nQ/C1d/JUive
	 X/xmPYleNLCm7u7mY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>,
	Markus <markus@example.com>
Subject: [PATCH v2] media: tuner: add error handling for I2C transfers in set_type()
Date: Tue, 24 Mar 2026 19:16:10 +0800
X-OQ-MSGID: <20260324111611.903-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In set_type(), multiple I2C transfers are performed to initialize
certain tuners (FMD1216ME, FMD1216MEX, TD1316). However, the return
values of i2c_master_send() are not checked.

If any of these I2C transfers fail, the tuner initialization may be
incomplete, leading to incorrect device state or silent failures.

Fix this by:
- Adding a helper function tuner_i2c_send() that checks the return
  value of i2c_master_send() and logs errors with %pe format
- Replacing direct i2c_master_send() calls with tuner_i2c_send()
- Propagating errors to the attach_failed path

This ensures that I2C communication failures during tuner
initialization are properly detected and handled.

Cc: Markus <markus@example.com>
Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/media/v4l2-core/tuner-core.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-core/tuner-core.c
index 004ec4d7beea..01f28436a1f8 100644
--- a/drivers/media/v4l2-core/tuner-core.c
+++ b/drivers/media/v4l2-core/tuner-core.c
@@ -280,6 +280,19 @@ static const struct analog_demod_ops tuner_analog_ops = {
  * Functions to select between radio and TV and tuner probe/remove functions
  */
 
+static int tuner_i2c_send(struct i2c_client *c, u8 *buf, int len)
+{
+	int ret = i2c_master_send(c, buf, len);
+
+	if (ret != len) {
+		int err = ret < 0 ? ret : -EIO;
+
+		dev_err(&c->dev, "I2C send failed: %pe\n", ERR_PTR(err));
+		return err;
+	}
+	return 0;
+}
+
 /**
  * set_type - Sets the tuner type for a given device
  *
@@ -351,11 +364,13 @@ static void set_type(struct i2c_client *c, unsigned int type,
 		buffer[1] = 0xdc;
 		buffer[2] = 0x9c;
 		buffer[3] = 0x60;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		mdelay(1);
 		buffer[2] = 0x86;
 		buffer[3] = 0x54;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		if (!dvb_attach(simple_tuner_attach, &t->fe,
 				t->i2c->adapter, t->i2c->addr, t->type))
 			goto attach_failed;
@@ -365,7 +380,8 @@ static void set_type(struct i2c_client *c, unsigned int type,
 		buffer[1] = 0xdc;
 		buffer[2] = 0x86;
 		buffer[3] = 0xa4;
-		i2c_master_send(c, buffer, 4);
+		if (tuner_i2c_send(c, buffer, 4))
+			goto attach_failed;
 		if (!dvb_attach(simple_tuner_attach, &t->fe,
 				t->i2c->adapter, t->i2c->addr, t->type))
 			goto attach_failed;
-- 
2.43.0

