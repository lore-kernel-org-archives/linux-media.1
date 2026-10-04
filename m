Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ADD42047D
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108481; cv=none; b=ZB3sa7HdCEVqDclS29D6gGDTl2Av91WV0Dbwxays/dT/Usm3FsV7i+USsyFCR2+/hjSr9NmbnuQLr6EM3QGrW/QT800jAdZ3Z2FkAJRgVlA2sFAYMgVSsqt9PRnncoMj8pKSBjskQQTlIIXtiEi23UFxZWvFA8cpFvWFK7fxenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108481; c=relaxed/simple;
	bh=w/aktebwl1Y3XGcI23NvEGJ5CAnVHvAXb/qbZPYpZaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaLlpXGDlwZWDIz4xFRyS4vv5quQsQjapLBiG+bYKhyhwuGyqdiiA2WnyDKH8VXBUSTla5Av4b5lJNLVNxHamz20/0Fb9PeiSfXfMHDqc37t7HYrjSsr2aeuZXcuL5Dm7sI6BuE1HtRON6GyJH092HRxxPgW5ZVtC0qzWowl3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVC1sdbo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVC1sdbo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5106565e9.2
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108475; x=1791713275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=PVC1sdboPFGV77NYPF9giKf4qyQbA8sW+Hw9bF1JXpyZs0Nh92WyiqbIeFqlozDbDz
         nyl/X4zxdJjYlqrwTleG1b68/PSm1FIlV5ghW2WZJWCCnzMc1on4YG9EfuW8orZ6BOmh
         WllJVyG9NrzbLMy4oBkNMNpO7VMiQRk1mlT1HSg0fhI19xRGT4tlDR8TJ3TfZOx7wXeH
         d7domTPhFKTzHLFlwKMQ6N0j87x0Z0wfEejXjOG/jSCJVNY3eoDraVX0dr3ph3YHcvWX
         sgYycpbfpX36z+EXFk0zRzMocLkIilsREFbmDatYGbya2jQNRo/g076s0ZFNYIFWuZUs
         cLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108475; x=1791713275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=gWq64w5GvfhHcpnGLmfMz4QccmnAIKFCzIHkQILVXFLYl2F1ZJ0DndwqZwVWivv2on
         9tOrxkw+SSH4Q02bmIOGKvivGGv8Rtw7wcMyAR+0PhgoRk4jU4IS7QCyRsXa22Xpy7y1
         gelx31+aoh0zSK20mgbBZ4hQGdjdhJM3SaEoghYkfDLBXHrs1S4WyhORuApkM7gNFZlK
         8V4OMDFT1gITIEnzc5CmJAWupV9TNMWPibnLcWux5IfPD4iafKzMrDoLQBtBJPL5wB1q
         deBFZ34z19N0y0pcDN5BzZbfHG59MEGfDKF3ah0T4vAMRMl/x7LN/WcAtBspUk8Pkw9Z
         bETQ==
X-Gm-Message-State: AFuF++mSPWw1yb9sOD+i2OIJCU4ZnKWfFKG+pQZCRHZHvWcgGCdQh5Wi
	86m79/q40Ub9UFeI2WCOkungiuyhV9u91CEwq2Lllk43UDXEvffh8KIJ
X-Gm-Gg: AYBFou29RSTPQnZ31BKCZSrJXRyQ1FlnMM51bo9IZHq+p8A6hL5YKqC5I/JD0BCq4U/
	ZM2Fe5G5UW7bFUbzqgjxRtSGzFtHiHpmqX98G0XFM4FD5+vp+rxpqzu1djqkKXpIhqoeFD9g9zc
	aC6RkToTIRmsk54sBcn2yunxy5lyCDDRAp2yhleQ5MwieYjQmt6ZVxA93e2JQ83gEbb7+srRNHq
	WzM8Tt609H98Jy3b3T6mtYT2M8Uf8Nz3wg6p8JBH7JnOkzm/8yLCLM97GcNLGiev4D388c1E5fx
	0ETewVPCWWlSBXDcv2EGRX3XlTIgeZoEXFA7850qESEDQNoCU+9zQrfbhwxrVQxXTZEUIMjDkIX
	491S5Ay2PRuic8lbSEq1O3IgTZczjjl8rirASB41Olh34CuqSJv6FW2TGQVDgfE+htFCji2ATjw
	NJNyg3KopQQ3GCfeQr3JULHioVz+xvrxVPUJAflouIP0Ra0ne416YLc3U6Y0bAjcLHyMFbJOT41
	AZX1u0dKCrlT28YwjuVx+FHTCfPKXQrD/yn/M8rPo3T0GiHJWw+fz/8Q0pAzVmWS9n/upvwqlnS
	v4qqm8949M8gh0LGwhpaRIc+tsXF4z4Syez2vgcXwbsqqxqizJRSMVN5BLwN7SSUYC+LC4IqFe0
	NCVyWnrRYsg7d/CK2PRED5ma6+il+H0U=
X-Received: by 2002:a05:600c:3510:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-4a027559c6fmr132249245e9.15.1791108474647;
        Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 4/6] media: drxk: stop accessing a disconnected device
Date: Sun,  4 Oct 2026 12:07:39 +0200
Message-ID: <20261004100741.71711-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drxk continues frontend status polling after its USB device disappears.
read_status() keeps issuing I2C accesses, and drxk_get_stats() ignores
the error from get_lock_status(), so callers see "no signal".

Enter DRXK_NO_DEV when an I2C transfer returns -ENODEV and reject
further hardware accesses in that state. Propagate -ENODEV from
drxk_get_stats() so read_status() reports the disconnect.

Also check the state after the tuner's gate control in
drxk_set_parameters() before continuing demodulator setup.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 29 ++++++++++++++++++++++---
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 0815083e54eb..df5f5ea959ce 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -208,10 +208,27 @@ static void drxk_i2c_unlock(struct drxk_state *state)
 static int drxk_i2c_transfer(struct drxk_state *state, struct i2c_msg *msgs,
 			     unsigned len)
 {
+	int status;
+
+	/* Don't touch the bus once the device is known to be gone */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	if (state->drxk_i2c_exclusive_lock)
-		return __i2c_transfer(state->i2c, msgs, len);
+		status = __i2c_transfer(state->i2c, msgs, len);
 	else
-		return i2c_transfer(state->i2c, msgs, len);
+		status = i2c_transfer(state->i2c, msgs, len);
+
+	/*
+	 * -ENODEV from the I2C adapter means that the device is gone for
+	 * good, e.g. an unplugged USB bridge. Stop accessing it from now on.
+	 */
+	if (status == -ENODEV) {
+		state->m_drxk_state = DRXK_NO_DEV;
+		pr_warn("device is gone, stopping all I2C access\n");
+	}
+
+	return status;
 }
 
 static int i2c_read1(struct drxk_state *state, u8 adr, u8 *val)
@@ -6319,6 +6336,10 @@ static int drxk_set_parameters(struct dvb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 0);
 
+	/* The device may have disappeared while the tuner was programmed */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	old_delsys = state->props.delivery_system;
 	state->props = *p;
 
@@ -6487,7 +6508,9 @@ static int drxk_get_stats(struct dvb_frontend *fe)
 
 	/* get status */
 	state->fe_status = 0;
-	get_lock_status(state, &stat);
+	status = get_lock_status(state, &stat);
+	if (status == -ENODEV)
+		return status;
 	if (stat == MPEG_LOCK)
 		state->fe_status |= 0x1f;
 	if (stat == FEC_LOCK)
diff --git a/drivers/media/dvb-frontends/drxk_hard.h b/drivers/media/dvb-frontends/drxk_hard.h
index a850a876deee..dc6ee0bb6854 100644
--- a/drivers/media/dvb-frontends/drxk_hard.h
+++ b/drivers/media/dvb-frontends/drxk_hard.h
@@ -106,7 +106,7 @@ enum e_drxk_state {
 	DRXK_DTV_STARTED,
 	DRXK_ATV_STARTED,
 	DRXK_POWERED_DOWN,
-	DRXK_NO_DEV			/* If drxk init failed */
+	DRXK_NO_DEV			/* drxk init failed or device gone */
 };
 
 enum e_drxk_coef_array_index {
-- 
2.54.0 (Apple Git-157)

