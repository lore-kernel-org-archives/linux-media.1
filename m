Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B93A4F2F;
	Tue, 31 Mar 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953672; cv=none; b=gLYFcQuJLWme4NZV7PfEGbw1B9EmYrKGxA/w0C/Iiyvgr/L+LDpHbzb43NB4GBQbPv8xQTG2yEhyUheMgJ8rUTC1nDxURKzuYoYhQ9nclpBWz7qWf4F1Nf2jZbTWDBC9mBG/logH0xl+rkVhdRX4xCsPixGKQl8hW8lJxzPSb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953672; c=relaxed/simple;
	bh=xi1QOP7H5Fq+2+3NrifV2SO4foFdnnXjyXhK10FFISc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=EvuqdHZeAYQ03NXsNqpe4amx5ebMSwFtsfxOxIkzPxmatoTMuyP8WvIrUVQGClUKX/aBF3jeYfM5IJG0QIgEvJ7T6Cm1PjZDluLmV9DB/z3fjgulf75CXidOqzfFtjPMy777BoQFUDferMMRixzPxyYqsSvqhZHNCS7xVRG6g6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=r8zjT6F8; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="r8zjT6F8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774953664; bh=MAAV4BE6YXMF6MXAEh3LK3zfRmj1ESRWC+6Hg1NazaM=;
	h=From:To:Cc:Subject:Date;
	b=r8zjT6F8SknBAfaShVZ6x68ECuJu769BnuMk1dEyLHkrh9GctvwrOp3G9tMhsvMG9
	 n8Pp76iXb8o57xpTWz5yJUsciiPFTLKk0UIPZufSFxitXnoXJWFRsNZxPPf9Z1WeTo
	 z/p3PTQVmok567jiRJpGQHMks2sS9rdtoe3dZFzg=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id A40230F4; Tue, 31 Mar 2026 18:41:00 +0800
X-QQ-mid: xmsmtpt1774953660top2k5fal
Message-ID: <tencent_7E7B0AD177D5FD62EB59C8E2BC22BD08BE05@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JukfmWWJoEchSJaa0ljeRx4DSUKyp2xfpzEnRVAv8LVTZYuYImJR
	 FF9Hjz7aQD/Kyi8WsusOck3O4jTuDXy/N4DHQ0a6jYoP0+huva5UvzHEsVJL8kalv6QkRc+mZa1A
	 R/CUrkfzb0u4/CFlA2AYanCR2y/eRMSWw7rAb4D+usm4kh8h5WA6m/4iCjcLgjadFkP9jmnvWOTe
	 C8xl7VATNOOIlhbBEWxmD/ml4Vz+EjWl6vZJvm40jPxCUUn4FVCX5gOMp0jv+z04UBJkYxncyTfQ
	 o68w9BdxyQuEOvWzPqmxid44f/D2k/jLKsb9TxQFA+LbCMPPMRXqEYwwSY5DFMHg2XS/fAFWk6Mm
	 vkIiEFYMkDPf1ZBoVg9LNJ6k+54Owf/CXI4FEKWOwdmr+b08bJ4PjHjpgSKD0OSTckyjBWjBK3tK
	 hhngx9DsaAIAzECcEn2uhiyLoHyqBdvUfQqKjsj7Ab5Ykh/41CvSoshHwwdbArHRyye+uK5fM6NI
	 jHXYH77BtWFJGjkatRhgQsESBY44RibBpVM6IVQwfAi8UOwobBvdqDpfusGlTG+g01aymAIiObkx
	 SVsf/2D99TI9A6Ms3vSoEUltPKYEyrEgq75BnalWVMvtpsO07d3b5BWYKxcmeeghNA+NYnHsHRq6
	 Q7j5sngFLaO9wqYOgp4KpSiNYQ45fYnWCjQfbch/X5JfvSBUl43jZkXNZL49hdKRbeB2UrX8xzgM
	 Kng3KGpWDM43sYVITOWolWxwcDOd/w3yn+bel3J5H2SDfQo8z5xV+2OFMiDtdbV1so/7JI8BRrNi
	 4yumKFUI7gPiF77eZPBX3DTotdl5i2rwsxyBxChvraNqqRzCAUFMJwJsDgVmEwJ1SJMEvQnhRSrL
	 h5rqlovUwM8ZKIuwYQ2VsnpgO9ElosTi3me8sZeY1/rmg183WSxjCC+kG2DkR/BArYFV2C8yFVt3
	 NNaCa7p60Sqh1p0/AX3UjE8yS3Dw/WKS1X5DJcLJe+bFGNkb3fD0EX2vq7woncmb2WsG5//hpZcj
	 3NqZDiLUde1LPfo21limKRWM7myDNrM4KAeSc14iiaAiJoh9gm
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH] media: i2c: upd64083: check return value of i2c_master_recv
Date: Tue, 31 Mar 2026 18:40:59 +0800
X-OQ-MSGID: <20260331104059.2343-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of i2c_master_recv() is not checked in
upd64083_log_status() and upd64083_read().

If the I2C transfer fails or returns fewer bytes than expected,
the buffer may contain invalid data, leading to incorrect status
logging or returning uninitialized values.

Fix this by checking for errors and incomplete transfers.

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/media/i2c/upd64083.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
index 5421dc5e32c9..3a5067beb228 100644
--- a/drivers/media/i2c/upd64083.c
+++ b/drivers/media/i2c/upd64083.c
@@ -77,10 +77,21 @@ static u8 upd64083_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	u8 buf[7];
+	int ret;
 
 	if (reg >= sizeof(buf))
 		return 0xff;
-	i2c_master_recv(client, buf, sizeof(buf));
+
+	ret = i2c_master_recv(client, buf, sizeof(buf));
+	if (ret < 0) {
+		v4l2_err(sd, "i2c read failed: %d\n", ret);
+		return 0xff;
+	}
+	if (ret != sizeof(buf)) {
+		v4l2_err(sd, "i2c read incomplete: %d bytes\n", ret);
+		return 0xff;
+	}
+
 	return buf[reg];
 }
 #endif
@@ -123,8 +134,18 @@ static int upd64083_log_status(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	u8 buf[7];
+	int ret;
+
+	ret = i2c_master_recv(client, buf, 7);
+	if (ret < 0) {
+		v4l2_err(sd, "i2c read failed: %d\n", ret);
+		return ret;
+	}
+	if (ret != sizeof(buf)) {
+		v4l2_err(sd, "i2c read incomplete: %d bytes\n", ret);
+		return -EIO;
+	}
 
-	i2c_master_recv(client, buf, 7);
 	v4l2_info(sd, "Status: SA00=%02x SA01=%02x SA02=%02x SA03=%02x "
 		      "SA04=%02x SA05=%02x SA06=%02x\n",
 		buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6]);
-- 
2.43.0

