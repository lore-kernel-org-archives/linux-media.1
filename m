Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE921D798E
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122484; cv=none; b=UB3TLQh2FTu6zRm0VqGVUYGvJ3HDrGIeASdpWXPCR8piYPS56heb0tDhrsuc6pBGf90rz1mB1oK5NGXUIEg9q12Be3U9GqTBzqFze2n/S9rM4xAiC6/nZv6LDniJaMHFu/hO3Lii+75eBXqkYtLX7wKk+keU7D54R8uMI4YHNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122484; c=relaxed/simple;
	bh=w/aktebwl1Y3XGcI23NvEGJ5CAnVHvAXb/qbZPYpZaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGYUD/64a/PphY7AU+eLXYA0K/p5aOa2ICsIoNbALRM7JoG8ZI5XK+ygcyj9K2bacbTXtF2Z0erH5AngbUrdcOyMfsK9z/dYiKWHcRJLVCSxtJx48CZtSjw69PFG9UPeGEO9+Yu/Wn3R5ept5h94hgjir6Da8j/c0QjVtpaIED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZaFcAjuV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZaFcAjuV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so3504025e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122479; x=1790727279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=ZaFcAjuVYze3JesFBQXxiHNekH7ua22ghkYHsARl1JMy7QjA9bA2G6c1uE523IvghL
         cBNF0HqiJK1GWsotHY1oTEPu3dF7dhlWXKibZmqIEKq7WK5s+zHeXLOluRYXSCPaRru7
         OyO1+0qJyeG5qb35Bkg4jwY2J5ASQZiYJREy1ghtnoceJnF2lJA4Zu8qTeXJZ/Ijju47
         kkohcGNph8LmFK7KACCTb17sg5W7PjTI4qHeVCYjeuMSl9X2148/oBASzz9UoZnYQr57
         or5yn0z411Jg1M40G0FBgQFZlr8iwJQLywoJ8eRsv3hCd/SnWKcrhjYd4XxZu2SWLVd5
         Tf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122479; x=1790727279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=lVzgVZsXa+nIZjXk8JCJkllowpqtXfJ0YFBD8qKAa+1VtwDjKpu6UXb01bZcYfv+eR
         IfimTf//v1qIBqrKy7ySaPXZBMuyAVw1pbh9jbYCfkVScNiN5kDCTYRCL+3ikixTzWK6
         EQa6SRqbQsXaEwySmUdRvx0o0ax8j1rjHOc4VcUG2TM9amB4/DzrN8oW9HY3RibZMaM9
         Amd5+0lDfK91QZXLvjP1cGTXS1B87fQCdrq4zFhJzmTuRM4/osA7l/1WJ12zruWF5dov
         i0FMK4+ZMJFWLbkFDa/Vnu2iy78tDx81Lpu7C738aN/OpV5vIsuLGi7R08DpEKSiZQpE
         BL0A==
X-Gm-Message-State: AFuF++kz3lEWAZaDoHLbf1LAq/8BynP1X1poI9ASmOVeG3zI/G8yeNFW
	FWGJ523CL44P20IhCYbUMe9zqXfWvQQg7GY0R3pHWfDYT2A2/EuacPt/KmO1b/O/C2M=
X-Gm-Gg: AYBFou1Ptg6ZXLLiaAXUNgt8+LP3Wz0TterKesBm8e/kJ4oBFFvn9/ZxprYBTFFLjgz
	heFPMB+dzGQMQF21l56Tnwthg7kiEzW3MUbRPpGXeIv2bJ1rqPGf4Y5tbOpCMpucDG93pKGCPn5
	ulzGIo40GFw55CfIRNN3qrsV/In33f2qXyJK8G53YOoGFGmSNy55u+RVZdW+34ygikwyhE+5NTa
	SF/7EAlbE+DSOn96VzDIzy19wx10PhpdsfJMDDsVQ6zl4P0qgl8tSRVb78TAMkVEQTFP4g9dbd7
	eHZGaIqHb/zOnwsl9N4gn8mZMFlZzyt2rj6I8924Miy/FQTNZ76cej+/6lzbVBhQ9cLu3QRoo4h
	XRdpi6HiYyPNYnKL3FHuONCD8q094Bo7oTclEoP9LQ6442d7dCYgZDZScMD2A+KFRnHRcgKxEgG
	sWtfj4mV8q3F+WY6fDvf+4uIw6pFrZ6PIbWbklDs5kGcB+xEfGjRlDMiYPF6bvmPYJnuO2QAf4i
	ffnZ8fHCkERyOpggcyQesVSwx7uWgSOlH0eetBJ47zDtCWIX5MDBaxvBAnNBlKKUSswSAkHZpIc
	lHDwCzGyl3CGyD3Vh+4JGiC5NapKaxbFvSoEC/fHcGWy/7EX4rsY2x0SG9ciDDlInbEKD3ACf0f
	btfKyZhW4XikKg8Z5kgnlpxu8dtPugo1T
X-Received: by 2002:a05:600c:a013:b0:49f:d58f:1f8b with SMTP id 5b1f17b1804b1-49fdf12bd26mr8409485e9.18.1790122479138;
        Tue, 22 Sep 2026 17:14:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:38 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 4/6] media: drxk: stop accessing a disconnected device
Date: Wed, 23 Sep 2026 02:14:08 +0200
Message-ID: <20260923001410.30297-5-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
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

