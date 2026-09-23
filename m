Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5324A05D
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122490; cv=none; b=KjLsPmCz5/xmoluuwm0cIfrpqkiVALVPDWdiUXghtz1v/GzslXfMj39KL94YKZkDYTz2JYH1XlLMoMTl3tEGLsb5bA+HGpe0ZUbB6ws4jtLoODEOdgdC+XsYEVu5Bni2XPDpBxqFj9KYZA3aU8Eewfk0ynFjzj0ELcZENeExMBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122490; c=relaxed/simple;
	bh=cbGo4TQAahnvid5BzTcvwPcvLNuaLGXSG1MBAuo5OY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H4CUKFu83ThhjnV+3ic5Ui7nd6ds68Tqp4nK1+/IcPKxrxUHmV83YRpsMfv1duNZVLbr4o30pbyQmlujeO4mH5d/ZWs2V9Ys6yIAYKLzoPNPVhxdcR43nNb6JTzJDvODsSKXwwmI4wIW/V3bgNOCA0Cbad4SGREv4UVtomfad5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CysKucRj; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CysKucRj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so1728955e9.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122484; x=1790727284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9P3MjJHm5LPq6fNgfWUG9o64JUvZTiy872DYV+9qyA=;
        b=CysKucRjAeHbUCuu1hB8404+eSBj109byUFUwmhFgg4L6sF5S6GeXDOPDlsORn1+8T
         6DrC4GKo+nudfefJU5qot6RNuLEsmccusGn6Z+INVHw8vfjscnZwPyjaJjjlIo0ez1dm
         K/0eSpxxAkzNrrizfR3s4RKnxwKrRSCNZO9Ngcw6XAsLzUTKIv8AYySR7Qbbt6XG+QsC
         xBjh1c9kg6hY2t/MhC92GeIJGIU4exBrx5ff0pDMg4pyIQtI0kE7JZsdBTaiEkO1Now0
         vYP0fPmAR4sxRCwLc3PLgZ+OXMPWdg5ApzPmtIY8LQMqg+tp/1XvIzUp2+GreNnfuba9
         IqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122484; x=1790727284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9P3MjJHm5LPq6fNgfWUG9o64JUvZTiy872DYV+9qyA=;
        b=0jvYWARPU4tUg1HbDW2j/cGjEjk5CTBM2EPTqnQoadCnO7tObcTfP8zRwT0++QFHi/
         R6t/Z1PDAi7pn2XEtw8Zz60ZuIPEpjFABn2GZJdyPdEilJpTKJ9uWtG2AFRwsft1J+eg
         xzsC5UuqpH1bF+jGoOdiGNIe1/Uf0HdxdjwtXc/lJnRQ6zqcX/v5HlKJwFOm7RkqgNou
         F0RUljV+OozqP5Tx6VXXzSETBVoXzyix4uBQY3r4YRRbu5hMHmSRshOBmsTBPh5dplMC
         /Rq3a8H+NH92R1AFvdH9tp98YNbRQrIXEC99Tg4HDxJ7cRVVWWwHVzge2evECAtugXod
         tAVg==
X-Gm-Message-State: AFuF++mmrzEBCT4FmJqYx8G2jL9OZt1NccvkvtXSydjzVlqh9CoNzZj/
	OvZwo4+3yIpFmwASudbZIrxmOg3GmdYEOpw+l1nk3LtOPOi4/IisOBmH
X-Gm-Gg: AYBFou2StkJJwva+8b11no5TU4+KGTpRjqFP6YJZCgP/L3px+zAP27i9uzi9+WOj5Br
	wzCQxXNZkObyRrJYr1WT0mHiBbRAzWPNk7iNGVArlLMWajyx+f69/4KRi2oPIFkkl20vnLjODwH
	iIFCBhNCAE9BmaWxb4n1nrPIeV7ymV9Ze96mrcvhuYwWrXqOokRR+NkP8GQsFxrsU9CGJePkO6j
	WL1POP+8zSi+Jo+EKaP4zRbXUPc7fj5bdHXPgUmFyRgwkrECtNihKvCNgcridMCW8ySuVYnnlXF
	VutwcCj14XOfLp67u0hOHvAwvmPt2KR2D9Czzs051Xi0oYQ0WBdAsXRX1DmhM+XnFrqOYpmjVw8
	kie28C1zpAT0fZcJcQU+pucu4sczUu4fbzU7o5WPoiW0jFe8DgxO1ZnmePC2jzuXwDRqoGIxJ3h
	RTTv55YlqjEoOSrBUuzT4EOgX5sqeaWkgFm1o8lIK7WFh+MQSc2pOl60xp3QTG5CbFkfv0I2o32
	vwuv2/rkgSODX/k3cfxGwL8ddsXpl9KGzh7zqqhAb7A1XxwZMlBI3UiGYazcvsDKXmiqzsr8AIO
	dt5Ww6J7FPjEMkq9feaCW0I8ZQWDLWzxaUqNxgIwoL2Y3rFFlEXehvjaI7roY8SdbmSj5GFxH//
	UIAgNmha/5Kc1lsPosmvhRg==
X-Received: by 2002:a05:600c:8b83:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49fdf14578dmr9080065e9.24.1790122484156;
        Tue, 22 Sep 2026 17:14:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:42 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 6/6] media: dvb-core: wake up CA users on release
Date: Wed, 23 Sep 2026 02:14:10 +0200
Message-ID: <20260923001410.30297-7-pepe.schlehofer@gmail.com>
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

dvb_ca_en50221_release() sets ca->exit and waits for open users to close
the CA device, but read, write, poll and ioctl can continue and blocked
readers and pollers are not woken.

Return -ENODEV from CA read, write and ioctl operations and EPOLLERR
from poll after ca->exit is set, and wake the corresponding wait queues.
Keep the release wait so the existing lifetime protection remains in
place.

tvheadend keeps the CA device open and waits for it with epoll, so it
needs to observe the disconnect before it can close the device.

Fixes: 280a8ab81733 ("media: dvb-core: Fix use-after-free due to race condition at dvb_ca_en50221")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index 1b91ebb8f667..d478f995d5a9 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1353,6 +1353,9 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	if (mutex_lock_interruptible(&ca->ioctl_mutex))
 		return -ERESTARTSYS;
 
@@ -1460,6 +1463,9 @@ static ssize_t dvb_ca_en50221_io_write(struct file *file,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	/*
 	 * Incoming packet has a 2 byte header.
 	 * hdr[0] = slot_id, hdr[1] = connection_id
@@ -1618,6 +1624,9 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user *buf,
 
 	dprintk("%s\n", __func__);
 
+	if (ca->exit)
+		return -ENODEV;
+
 	/*
 	 * Outgoing packet has a 2 byte header.
 	 * hdr[0] = slot_id, hdr[1] = connection_id
@@ -1635,8 +1644,11 @@ static ssize_t dvb_ca_en50221_io_read(struct file *file, char __user *buf,
 		/* wait for some data */
 		status = wait_event_interruptible(ca->wait_queue,
 						  dvb_ca_en50221_io_read_condition
-						  (ca, &result, &slot));
+						  (ca, &result, &slot) ||
+						  ca->exit);
 	}
+	if (ca->exit)
+		return -ENODEV;
 	if ((status < 0) || (result < 0)) {
 		if (result)
 			return result;
@@ -1819,6 +1831,9 @@ static __poll_t dvb_ca_en50221_io_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &ca->wait_queue, wait);
 
+	if (ca->exit)
+		return EPOLLERR;
+
 	if (dvb_ca_en50221_io_read_condition(ca, &result, &slot) == 1)
 		mask |= EPOLLIN;
 
@@ -1965,6 +1980,13 @@ void dvb_ca_en50221_release(struct dvb_ca_en50221 *pubca)
 	ca->exit = 1;
 	mutex_unlock(&ca->remove_mutex);
 
+	/*
+	 * Wake up everyone blocked in read() or poll() on the CA device, so
+	 * that they see the error and close it. The wait below cannot finish
+	 * before the last user has closed the device.
+	 */
+	wake_up_interruptible_all(&ca->wait_queue);
+
 	if (ca->dvbdev->users < 1)
 		wait_event(ca->dvbdev->wait_queue,
 				ca->dvbdev->users == 1);
-- 
2.54.0 (Apple Git-157)

