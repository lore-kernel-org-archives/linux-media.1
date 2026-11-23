Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448401;
	b=WqjrXjyRyGcF1ZBa3I9N2Q+7TlCGsT/fPex3cNeFo1SMEKv86gLDR4YmmhIeiBgN6l5U
	 1P6q1ymqnfBZfhZdM0PX2j7JTwF2m6OLr3IQDIYppQCTQDSwxVp3IfeF1T+bvynfxUzp4
	 HqELV2b1J0Rg4IwllqXalVJ9LfOTDoqttj1e+xrkoJ4uupaGhZaXwz3mf8mVw+HI+B1pC
	 8jIgP+tbgHoDUmBDn7zTyyxDJ9g/EtSo7M3SWVs1WZnAHuGzE4neCGlx0/2sdVJJHew0F
	 ZBUh9bvw03kcfSBrvRAL89rbGRtWTr0f03Vox0B0H8o5ehpXenIgTF8uyPKLHOSbTmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
	b=JYrY1zHH1cpDuG/1dQy4+P76CegNrLkHRDJw5n1OUE7/9Kb4XjNOT9u2jsFzVLorgixq
	 yJFt1bhmw7sEatqx5iONAF0cNmVzfuVkSYW02pUSNtiZQnbttiuX2uQj5wsPoCCV0VN3v
	 Tu1RNGhEbw3DLEhsaWJfRvkrNoPqjZ5lN6nfZNRpc9LJIDAN0O/hqRzNiRS2yglFpfxaT
	 LqAQMhA0zhCqXL0x05krU9fJrubuY0V3wjafymUYCZFicDzpCxNpknqDMltgD6TtVYhKp
	 gN+ODx7EJOnvjUNlzzTQsE1hjpyOQpWGAq144oGBae2XDvCa1R1YYdvfcU1Mr+pcneg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ey3n1q32;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB513606A6A3
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB513606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ey3n1q32
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4321622c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448400; x=1796053200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
        b=Ey3n1q324fTuh2x1h9suUDuyT9u6me4RojFtG9Xcvc1AT46clONF8xtPfYWyM1+19+
         iov3A84C7JrwPrJtSrkMfD7enpeBj1q14ipGNFElnBQXOBz24o+DcJxlgzIvDfx4bpyS
         Ed34u7Fm51Ddq6t1CgxXthqb50DOUvNxe5mN6rkirZMI0wH9Acf8Ey+F+XxWnl+hurYl
         n+rEP6016lHlQi5p9AlD2oG8F7bSPfdCFaf36//xci8mNkecx44DQU0/F5DSqRijAUMI
         BF/rMroMdyqU0Q8gLj/Xym686a0uvlQFq1rgyrgTE57/0wKtzLLqXQl5ChdhTRk4j0IF
         dYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448400; x=1796053200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJX3Ex8nGduAqMG0gIZpmZez7/YWlooFiG7PfMDoYPQ=;
        b=KlhIz5tYyiJrR+dBen4TyWwdbQxXOP5F+/ag6qgJ/PfhhzmO9ljKKEJnuKXLJ0Jec0
         x2hvEh/SsYJz06cfWqk8fc+2vUVPatX2Y5m3yFQKXvOTZdoUXeN6UvoTr2tUW+pXPV0f
         KPVWLl8oT5xSSfN4icvS6nWkfrbIMFNDVYaHySq9RIpqKWqKRn/5kJDiIaAmD0XF2iap
         eRfH6FzzpJxZ5HZqtTP51YPgjN91d0GzMBhcaELze//O8b8yAiya6RvGNBR6FmcFswtZ
         te0y7/48eSWuX+Ntv7DSKkge/xrJY8pOmPQlhTsvIm7anx3kOGECP3CwFOSaMp3Jsw++
         QNxA==
X-Gm-Message-State: APuU4Z+wPctbkR0vaNQL3KhltG1FgIjY15dfaZI3FnBBMXtmOfXIK81K
	oucN5BsP2hP5v9RwYLxV5FNVpHgy4cPahgaAcY3TRPd82qvh5YBL+6eafmr+0w==
X-Gm-Gg: AZFdTZe7NXI1//uNaF+/j1kDMaD0mFN7gKYyZ+DnBJscjvt5qg9y514wiPnGJGmJRog
	JMoNpCQtxBmE1M3+sw0lzT913Cpj7JD4eUve6WKARbCxH8QJCrjPB8uh6JKZfwJhWNll5CMqtFK
	69Omu2dEedu1wSozNaIH+4iXzscY3zO10gwjgnPxBIRahuZA1QC3P/v+yNU71lfhO43n7oDYakM
	cJk9eO4uhj7rdGjVN8L69zA8S876mC6fyzO/j9NfI0obb9dApo6PyDcVZfIm7iCxAwMCN4VK/2f
	RYzdnAZFiQYTNVlR59ksb3ZmVwEKusRi3/6sWZuGzH9mvtExzBtY8TTW4OAla50ZuqHSU7ohTjn
	E029qL0oZCJh9Rs7d2cV4UDZHXHb/1iiQkEi+Sb9bSBX3lKhhOVZHDK8TtSdy0d0CyuQf6+0pNG
	5173XfpScYJv8R029y2TeHwA3BbYaDjJ4JO/WRXiZlHmRxpzuKKprT07VPmmrpP6TwVUCdbKwaD
	5XResTYabAqp7wD+ntKZNoWc+B5BgeOfUTQrXaSRCFYJUgyL8VUF5Y9Auf3ri+GJCHcX/Qrg7jE
	72jzVZkZ2XNdh4qeTXhvCVz9ZsKeTzMF6YPPfhO8afg9U3U=
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr11335466c88.17.1795448400054;
        Mon, 23 Nov 2026 07:40:00 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:59 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] media: i2c: ov5648: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:21 +0700
Message-Id: <20261123153927.2547169-11-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov5648_probe() ends with the device runtime suspended, and
ov5648_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov5648_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its GPIOs released.

After disabling runtime PM, call ov5648_sensor_power(sensor, false) if
the device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: e43ccb0a045f ("media: i2c: Add support for the OV5648 image sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov5648.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index bb06e66d28e0..7b817511ab93 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2603,6 +2603,10 @@ static void ov5648_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(subdev);
 	pm_runtime_disable(sensor->dev);
+	if (!pm_runtime_status_suspended(sensor->dev)) {
+		ov5648_sensor_power(sensor, false);
+		pm_runtime_set_suspended(sensor->dev);
+	}
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	mutex_destroy(&sensor->mutex);
 	media_entity_cleanup(&subdev->entity);
-- 
2.25.1

