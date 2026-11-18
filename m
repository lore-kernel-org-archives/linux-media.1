Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039662;
	b=iFNhP3mRWXXYsb+J7qZVIO9wUjZ9CugAsB6QgSyt/83dPhXkp8X7qjfh+QfN+YfEL2dz
	 1b3e5JhVVaLPgSEA0HLl0pf0hFMiG35ZdehQC+lhL3lO/rCWHopsMj5XuXsT0I8VmJC6y
	 8pDK6AzDh8kgNJ289Xggg9HqzO7Ns/J5A6xN2S/f4qw9RsgGaGy6NUTJbiE8LAPIgMXNB
	 LyWggq1GRWPcGK58PEBO2aFcCcQTs18DtS6gIrIKgVb1bDIhDzBMsmzDGuD1RCADkEsrB
	 P7PntmMjrFLETIcjbZ1WnVmcSGw4xEUmL+Pc3n6o3S1PNYky33h+iUd2JTAkekbEsxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
	b=adiigZMTGxqIhxPJZLNpWi0hM7S3o+dDm0ZhRVQ9xCHQ7POwzLN4QdTYTG7Q/wdwVT59
	 M7UC5MpHe1qKSvY8qOX1/RWbEUeFib0pOBi/E2FAw+4dJ3+n4MooOkuoFER+csCXGpbtz
	 MzPpJF0RyUMFFwnFVFSM52PAF3lZusJ0U82DrI3kOePZU7dK/BGPTqUuM+IXYsxRSwsXY
	 W3bQXUngLZDXpS6k+Gyb/DCJN+r2FKLK2FWRiatbLoJJ5khlPtJV10jEY7iehcX3rVFZ5
	 3QzpLXi8TI17u6b6g9cxqmewiU2zIGOODSDbpt2b/H88RdzIXMYR7SNcwbxYdNa4Xug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoX7dFU3;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010B606A33A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 22:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8010B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoX7dFU3
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49465892f7bso1201212f8f.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039661; x=1795644461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
        b=FoX7dFU385w67J1ryrceOj3KbgzdpkBdi6EtKp1JZT2snD+6G2ckyl76WgIkgFNUGM
         e2m6Ov41KgSqCwYGCxUY9K3CNvx+vIa/b8aDUC5MtzvNG80MLYK2IAHvCUzQgCmf6/D1
         cfSTwqX5+uJhddEUAb9pJmJzZVFINv+xbwh4dWup9bJ+2YOAYHZmnBuIszpbV06JbJfw
         WR3Ud4UJPUtS1rii8OsK4xSxhn1nOalf8ROIYJ+F1pmKXafqmtUCp81HJzhit6ywLX3y
         X7bjTAdbSSji1kI4qgkjKbxT+/krlRscab2hRBpKjaVsbP+0bhVIhluFvwpfrx3q5OuD
         /gvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039661; x=1795644461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mGGAH9zwZqlB4RSR5d8imk8M2AT/E+I9ZFv5C+97Tg4=;
        b=ERv61kthoCmSG4FZGI442UjrLN/C9u94ImDRBAsHRALkFYZROR2Q/ARv7AFwnvohZR
         BOi+VaurBe0Lx89717JLTGDTW6afr/O/19ICdTH7JjFgFoOMTN3fLUYqLuarbSBxm52Q
         UNqk1XtM27MR0DLKZO+njJUoccQS6UK8yMdhlxlPiLS2zclpTPdkgZzQDou3x0cQghwY
         0MQ2IiwQSEuRA/KoVx35l4xwmjobSYhaupEi2KOtFayHF1bQ8LeTtJggEvIhqTSZd5Fq
         h0eb9J30Ww5qr6EMSzAGPH61+fra8lSeajgF9HM0oPOQ93Y/iQ6mx8hX4iIar1EpKVJT
         7Vzw==
X-Gm-Message-State: APuU4Z/c8Vgx7jxBWwWdxU5ZJbfEUBt8JtS4zfVh+E4ymG0lzScwctIz
	vwsWIIlpB+tJoe6iPx40e9p5Rq/AzBJ030Jf/i1rDT6RtO10ay3Rc0T6DH638SJ4yVY=
X-Gm-Gg: AZFdTZc219AH0JFdOAmZ3jvxm3YpuFT/nXgeX9U6v3wTlQelzaUkjPZ9oT0tyuIwejO
	WgePIiSCBH4iepVylHIz/9oakwuEH2ov7qvnJ7DzHE/6PgvNH4egIdR+soqnZ4zOPuXGMgtn9Dp
	mBTfrbWmGyjPHfwW/E5R6UNl80ArHlHgEt0EgZtwHyV15md8JcMmUEUXFhd1y+oGIUgYH6ZM1ei
	wjVbgn9ZkgGqYqhGJM92JH/p9bgQPOdLsb6+ezJUyim/lDUE7V+OXErwzO1r//kgzjplMP9Bn8P
	OWGh32H+HPPBeInWLOm97V9caQy8YaGxKK3tQTrjtobTCnAATp0DoIR2sVNxcMC78qfU9RJQ/RE
	mkNEgtffzT6JDTEARuTfM36Q5aZvB63j50S9gKv2F8Y+nwNrkUMsmEsp+WUOXiQhy3uwB6bBQIf
	ly1iRdbla9T127aqVuX6T2bTmLIKOdY4DivDhuuSdX7kZeCTk2IIuFjY7Sgksv2hArxyFGiuSSB
	AUVAARvAChCr+563LOkBlelgAKIOreWk9kZn1YTU9XeD07zpVif/59WcpGpYdv2d2jr9t3PQR4H
	gxWpdfa7hP28ujw9aOmpMMaNZ5cDBeqS8DGYed2yL6RS7HEaWKe+ta+Hw1sxxBgVlFQuGhVljh9
	sWgv3WIbPsr3ZgBvKCw==
X-Received: by 2002:a05:6000:220f:b0:49f:800e:aefc with SMTP id ffacd0b85a97d-4a639475777mr9194709f8f.14.1795039660723;
        Wed, 18 Nov 2026 14:07:40 -0800 (PST)
Received: from Enricos-MacBook-Pro ([2a01:4b00:b82b:de00:c5e0:cc6:391:83e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65541f3f7sm7541073f8f.24.2026.11.18.14.07.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 14:07:40 -0800 (PST)
From: Enrico Lorenzoni <enricolorenzoni59@gmail.com>
To: linux-media@vger.kernel.org,
	Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	Enrico Lorenzoni <enricolorenzoni59@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] media: cxd2880-spi: keep the TS thread alive until kthread_stop()
Date: Wed, 18 Nov 2026 22:07:31 +0000
Message-ID: <20261118220732.29246-3-enricolorenzoni59@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
References: <20261118220732.29246-1-enricolorenzoni59@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cxd2880_ts_read() is started with kthread_run() when the first feed is
started, and cxd2880_stop_feed() calls kthread_stop() on it when the last
feed goes away. The thread, however, returns as soon as an SPI command
fails, both for the initial TS buffer clear and for the buffer info read
in the main loop.

Returning from the thread function ends the task just as kthread_exit()
does, and the task can be freed before cxd2880_stop_feed() runs; the
kthread_stop() call then uses a task_struct that may no longer exist.
The kthread_stop() documentation asks the caller to make sure the
task_struct cannot go away if the thread may exit by itself, and this
driver does not hold a reference to it.

Keep the thread in its loop until kthread_should_stop() is true: report
SPI errors with a rate-limited message, wait for the same 10 ms that the
loop uses when no data is ready, and retry.

A change with the same loop behaviour (plus extra locking and counters
not included here) has been running in an out-of-tree build of this
driver on Raspberry Pi systems with TV HATs for several weeks; a 60 s
full-mux stream (19.5 Mbit/s) with concurrent register reads showed no
continuity errors. I do not have a reproducer for the use-after-free
itself, which needs an SPI error at the right time; this fix is from code
inspection.

The change and this changelog were prepared with the help of an AI coding
assistant (Anthropic Claude). I have reviewed them.

Fixes: bd24fcddf6b8 ("media: cxd2880-spi: Add support for CXD2880 SPI interface")
Cc: stable@vger.kernel.org
Signed-off-by: Enrico Lorenzoni <enricolorenzoni59@gmail.com> 
---
 drivers/media/spi/cxd2880-spi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/spi/cxd2880-spi.c b/drivers/media/spi/cxd2880-spi.c
index 36207940b..8e31771ac 100644
--- a/drivers/media/spi/cxd2880-spi.c
+++ b/drivers/media/spi/cxd2880-spi.c
@@ -278,18 +278,17 @@ static int cxd2880_ts_read(void *arg)
 	}
 
 	ret = cxd2880_spi_clear_ts_buffer(dvb_spi->spi);
-	if (ret) {
+	if (ret)
 		pr_err("set_clear_ts_buffer failed\n");
-		return ret;
-	}
 
 	start = ktime_get();
 	while (!kthread_should_stop()) {
 		ret = cxd2880_spi_read_ts_buffer_info(dvb_spi->spi,
 						      &info);
 		if (ret) {
-			pr_err("spi_read_ts_buffer_info error\n");
-			return ret;
+			pr_err_ratelimited("spi_read_ts_buffer_info error\n");
+			usleep_range(10000, 11000);
+			continue;
 		}
 
 		if (info.pkt_num > MAX_TRANS_PKT) {
-- 
2.47.3

