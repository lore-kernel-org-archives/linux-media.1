Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ABE4078D3
	for <linux-media@vger.kernel.org>; Sun,  4 Oct 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108483; cv=none; b=MkbfAbUkk5qzsU76V5mGOmPqErV8P9lLECiPsqztSSENGZEsPloEPfeBysaxvmg49M9Safy86Aq4hcfW24Q60f5gc7M9xmLtFn0+UsW+TwF+eHI18Bme01klll/kyb75jIkxxi9KxAq6yp6AJOPDhR9MSThx3jAh2+N68q5q6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108483; c=relaxed/simple;
	bh=fAQubV0KGt+mvnDqdtN32qJ6AxjvJFXfRppXX/2h2Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2QUyQFmwpG+DbCKsxVzNMpADDb7zGrLt8BUY/xbF8FUUoCKs10hxNuRzTKuUGFkVR0INXEOfEPbqHfqLSqHAgL2G4zyb6//EyHI/goEkj/QEIZNXFzymA3BNQeq6XU8DfY0OpTV1Y0yEbHN8Lmbg0uuK86At/32/j+yrlvCgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibJ7zoyc; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibJ7zoyc"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso562227f8f.2
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2026 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108476; x=1791713276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwYDZcDVJkVuXt8AODa3dug8Nr5ODjsbg15/2zj5OhE=;
        b=ibJ7zoyc8BfVpUoDWJClQRqLKN9RqG2aIRrzfCRNyyYkb7+S6TDvCMT02pYNxc/BV2
         n6cFPhnmZq5MZ93EvOLeiTEvzBHCPSUwxei3SZh5ARqS0JE9BD6KjRyBKPVqVjhgsTea
         +UjBEB5ZleETVOW56ZqQFVl/qV2sdqr5CIKWklD8t9+VSOAU9XnTX9FpgnBXSOT2fS8w
         RyJvE6uV4Dw2ZOcHHH165y3tbKy59hD0v7YXSCGh3AJH950bKh4SqIrKggd7e7FSI4/Y
         Mo1ZOR0k4bHrOSKtGh3HAMaODG7KedMxV8cMMzTEMY9X4JRigxL2csMyxnFVXA2A6pI6
         dEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108476; x=1791713276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwYDZcDVJkVuXt8AODa3dug8Nr5ODjsbg15/2zj5OhE=;
        b=RJDGAxpoUSAMnpSYb+R62Yw5Jbl68zRDFS45PYtu1KBwXYR7V3Bmx2owhwfnCLzxQO
         xRbt6WC7OXGFOHg0bZYDpNGig5jF9SCWJ27nvLaO+oR1OiqIGU4tjSxHSUXkvi/Q43nY
         LyA39oGIkP14xbc4FkXgtC101MYIyj6QEsnjzvE8cMtCnuE6AoAbOMTTeWfoi3FQOp4X
         N8yK+mj+cM/rXXVBTlDbjAB4bJtsJeQoqoTY6fJhlax16Q3Yx/JCVyo9QBpKO9MepQ+J
         +EOO6JOC1jMQoJM2l/mXdCyQqXFKnRfls9fGYSe5DWMf7cmv78IS9y78QWTwyBTLhN0D
         Xt5Q==
X-Gm-Message-State: AFq9FYJ6VtbEHMU1Q30kjIXmUxYpBl8hA+r7h/jc9a+ZEnd9RZQnV6dE
	mJ5CHuOCABEj5XTqNhA7fNEujsBCHS4Pi3RHTWAKBfDzKovjGZr7Q5Nh
X-Gm-Gg: AYBFou0Cs9HtGE4UYUDFz3IaXGmaXCVEN92gBm0YAx//MSk+suWPCA2ieTFzGj21RhN
	o+fsPJcquVNux/mUiQDS0SBJttsE5qC4O4NZQHea5c4n2m2XSvaHQCENIyMkHTnUXHb8UhhTvbY
	QaHgbeVjryR8eWBx+rFsXOscXsCHngDZx6+Q8KEizgmI+dJbts6/c3Os7JwJSCQ8gQAic0Ku0Ep
	33QqVHjfUQ+6sobKk6ZyBHFCu/j6N5W6Wda/qfNsOJJdBmA3um2W4eS6DZG/g20muZkn20qt48H
	mz5B+VCbu7R20GRMiXNOsaM9tP5QRryjawkKCUax9BZaNiONxlQ6aKJxbeSh/1+GOotmSsg/AWz
	rXBroKNRdD/cEAtSfOKqk8Scsf9vXS2YuxlDzuacZr/GQ9gMkfnzoSyWK0P3Y0v8TvPd7/PZwvu
	p4P4EBZ1waI6JKTbZS+iHeKUk8u21/eXd00S2qwJDI1CK1hN6v2OH+Hx5fvOVqwCfhl3hGlrM/t
	O7aEW1UJagvWZASA8cWhUi9e7SzjAwUZPub5Ca4u+uiPOQQB4508Aflp2BkEiJpRPqjyUiyzOVW
	SsrqxT8HtnxV/z5NtZLLUUEnV+w9G4YCj8j332H7rKgNU1ULnCnLr2li9N1uK258fDBfdo+AV+A
	hERo0UZQ5rGEIyoAkLr9FGsDLj9LSQeZL
X-Received: by 2002:a05:6000:2909:b0:48a:fc9a:3765 with SMTP id ffacd0b85a97d-48b1273e480mr13971030f8f.46.1791108476108;
        Sun, 04 Oct 2026 03:07:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:55 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 5/6] media: dvb-core: dmxdev: wake up readers on release
Date: Sun,  4 Oct 2026 12:07:40 +0200
Message-ID: <20261004100741.71711-6-pepe.schlehofer@gmail.com>
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

dvb_dmxdev_release() sets dmxdev->exit and waits for open demux and DVR
files to close, but readers blocked in dvb_dmxdev_buffer_read() wait
only for data or buffer->error. Setting exit therefore does not wake a
blocked read or epoll wait. The release, for example on a USB
disconnect, then waits forever.

Wake the DVR and open filter wait queues on release, and make
dvb_dmxdev_buffer_read() also wait for exit and return -ENODEV once it
is set. Also return -ENODEV from dvb_demux_read() once exit is set, as
dvb_dvr_read() already does.

Check exit instead of storing -ENODEV in buffer->error. The buffer error
is cleared by the reader that reports it, and the section timeout and
ioctls such as DMX_STOP can overwrite or clear it. A second reader of
the same file could then miss the release and keep it waiting.

Blocking DMX_DQBUF waiters are not covered.

Fixes: 57861b432bda ("V4L/DVB (5511): Fix 2/3 for bug 7819: demux and dvr")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
v2: check dmxdev->exit in the readers instead of storing -ENODEV in the
buffer error. A reader could clear an -ENODEV set concurrently by the
release, as reported by Sashiko [1]. The section timeout and ioctls
such as DMX_STOP could also overwrite or clear it.

Pre-existing cases remain where the release waits for users that are
not woken up, such as a blocking DMX_DQBUF, or an ioctl that waits for
the filter mutex of a blocked read() while holding dmxdev->mutex. The
unlocked users check in dvb_dmxdev_release() also still races with a
concurrent close(), and waking the readers makes that race easier to
hit.

v1: https://lore.kernel.org/r/20260923001410.30297-6-pepe.schlehofer@gmail.com
[1] https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/N3XJE5MO4HP2LJYOKFHIRB564HATZCTI/

 drivers/media/dvb-core/dmxdev.c | 36 +++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 6a825d9bae43..8a744a96bc08 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -50,7 +50,8 @@ static int dvb_dmxdev_buffer_write(struct dvb_ringbuffer *buf,
 	return dvb_ringbuffer_write(buf, src, len);
 }
 
-static ssize_t dvb_dmxdev_buffer_read(struct dvb_ringbuffer *src,
+static ssize_t dvb_dmxdev_buffer_read(struct dmxdev *dmxdev,
+				      struct dvb_ringbuffer *src,
 				      int non_blocking, char __user *buf,
 				      size_t count, loff_t *ppos)
 {
@@ -75,10 +76,16 @@ static ssize_t dvb_dmxdev_buffer_read(struct dvb_ringbuffer *src,
 
 		ret = wait_event_interruptible(src->queue,
 					       !dvb_ringbuffer_empty(src) ||
-					       (src->error != 0));
+					       (src->error != 0) ||
+					       dmxdev->exit);
 		if (ret < 0)
 			break;
 
+		if (dmxdev->exit) {
+			ret = -ENODEV;
+			break;
+		}
+
 		if (src->error) {
 			ret = src->error;
 			dvb_ringbuffer_flush(src);
@@ -274,7 +281,7 @@ static ssize_t dvb_dvr_read(struct file *file, char __user *buf, size_t count,
 	if (dmxdev->exit)
 		return -ENODEV;
 
-	return dvb_dmxdev_buffer_read(&dmxdev->dvr_buffer,
+	return dvb_dmxdev_buffer_read(dmxdev, &dmxdev->dvr_buffer,
 				      file->f_flags & O_NONBLOCK,
 				      buf, count, ppos);
 }
@@ -998,7 +1005,7 @@ static ssize_t dvb_dmxdev_read_sec(struct dmxdev_filter *dfil,
 		hcount = 3 + dfil->todo;
 		if (hcount > count)
 			hcount = count;
-		result = dvb_dmxdev_buffer_read(&dfil->buffer,
+		result = dvb_dmxdev_buffer_read(dfil->dev, &dfil->buffer,
 						file->f_flags & O_NONBLOCK,
 						buf, hcount, ppos);
 		if (result < 0) {
@@ -1019,7 +1026,7 @@ static ssize_t dvb_dmxdev_read_sec(struct dmxdev_filter *dfil,
 	}
 	if (count > dfil->todo)
 		count = dfil->todo;
-	result = dvb_dmxdev_buffer_read(&dfil->buffer,
+	result = dvb_dmxdev_buffer_read(dfil->dev, &dfil->buffer,
 					file->f_flags & O_NONBLOCK,
 					buf, count, ppos);
 	if (result < 0)
@@ -1035,13 +1042,17 @@ dvb_demux_read(struct file *file, char __user *buf, size_t count,
 	struct dmxdev_filter *dmxdevfilter = file->private_data;
 	int ret;
 
+	if (dmxdevfilter->dev->exit)
+		return -ENODEV;
+
 	if (mutex_lock_interruptible(&dmxdevfilter->mutex))
 		return -ERESTARTSYS;
 
 	if (dmxdevfilter->type == DMXDEV_TYPE_SEC)
 		ret = dvb_dmxdev_read_sec(dmxdevfilter, file, buf, count, ppos);
 	else
-		ret = dvb_dmxdev_buffer_read(&dmxdevfilter->buffer,
+		ret = dvb_dmxdev_buffer_read(dmxdevfilter->dev,
+					     &dmxdevfilter->buffer,
 					     file->f_flags & O_NONBLOCK,
 					     buf, count, ppos);
 
@@ -1457,8 +1468,21 @@ EXPORT_SYMBOL(dvb_dmxdev_init);
 
 void dvb_dmxdev_release(struct dmxdev *dmxdev)
 {
+	int i;
+
 	mutex_lock(&dmxdev->mutex);
 	dmxdev->exit = 1;
+
+	/*
+	 * Wake up everyone blocked in read() or poll() on the demux and dvr
+	 * devices, so that they get -ENODEV or EPOLLERR, close their file
+	 * handles and let the waits below finish.
+	 */
+	wake_up_all(&dmxdev->dvr_buffer.queue);
+	for (i = 0; i < dmxdev->filternum; i++) {
+		if (dmxdev->filter[i].state >= DMXDEV_STATE_ALLOCATED)
+			wake_up_all(&dmxdev->filter[i].buffer.queue);
+	}
 	mutex_unlock(&dmxdev->mutex);
 
 	if (dmxdev->dvbdev->users > 1) {
-- 
2.54.0 (Apple Git-157)

