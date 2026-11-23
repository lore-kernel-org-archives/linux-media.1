Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448404;
	b=FTPod/UevXTRm+SN8k2e9cZadBXxJI83FxHEdYFYbq614VPdk4xbplVsq+RYQiyNh5T8
	 fA9QRxo83LP3kOPE/ppzweYOcNxl27Oqos7zxt47J/OLhc1ewy8GeauFsgFkHoXhGRBnn
	 OYSxVN+O6e7+ctYfqJArYluwJAOEEIo0aawe9/Ei+RkKne9Qb/7f//WM1aev3w88VK7a4
	 y3lbMcNmX8y9mzV+Vpmo+xBeE5L0eZYPluPBwYZjTQ3g6Ig6t7oQojkYOyy+60H4dXZz1
	 xwK3kksVdQoVfv3qq5BUvW4ayIE6OE+dXqtHwTObBU4dAkdnFHC/0iOjhNi3aAqoxDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
	b=rWzkNHj+mUTCexrfjnd5pwM23NNDcJPqb9/IT28vj1W4MBevwMeGUYoZfBZzkCDfH41K
	 o6lVGmiBUnpRWMFE92qY8IuAQhk/kzNC99uBgS+ifEsXzvm0jUmTPTC5QVsbUYu/0xsd6
	 chAouVyTfdHt5RsHX/1a4MQ9gh54fEJmEVOSbOjmwQtiE96Qqat7TXGnoKo/9f/HbG09D
	 Ygp9OkIL3qi8CwqXqEgJzfuWZKRTTx0pfw5hiIBo78KTT9Gd3sKMSTDbwx0xSBy6GqcbJ
	 OAwMAUKYLYZWo1v535zL4/EbsQHk9g0mbiJYm6NF9BYDAFz60uDh6QtZJdVNJr6qIXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMAFUW01;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2052606A6BB
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2052606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMAFUW01
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753416c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448403; x=1796053203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
        b=DMAFUW01EGyBKKPHGz1YCRmTSB0oy5xhgTrKXgFMtP8k6vq5JkI4q8U8WWs7RQG8R3
         tpoYvdcRkYgEf4u7oWA2NUljx8lNGVHNiAKOTSKUrZ822WYyPGtd2IVIWHuWp87mvopT
         PzZ+YrAgE9fFZMcNTr371vzZ01o0A1w5oDZlwFUbCBHNaiG0+jPQfyi0m9RPxCdrVLsu
         OVtWNl825wP8bwIWOoYjlKyzQJTaiFBe0zRx79Q3Hw0FzkICkHW4f9KowL6p1uJBNi5D
         /S0IC39SgoKNfd554bQQkxkRW3mffYuIJvWrW1lgqnDzqT5Sl9XmyKxNSdb8gTHnHGiv
         6vZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448403; x=1796053203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JnXIma4YtN2iSsfSPRgrg8cOsz4M8vjVbnmrPKec7R0=;
        b=AdlUwrnTAnRcfxYFbKe0R0RAvVGm5w+Ll3MLso1JUABWQ5dX8WMfJqfLZMW+D6VFNb
         2K+aXQkaIz1fz+jNkuYzUFutOuv89uk9L6Qqg6+fUfGoNhcNuXM+OhoPAcWxJpsyYIhS
         eXzEss5dU2scrwO535JkGC3N/jItfffAaz5qNKAKFOILlAfCnaWH+TXk7BZ+O9Of6JPf
         I9jZuDliQpvImjmD940hNMoj4q0qepzcTEaOwcd0bFNsM+m9qYe0yEM+XGYGZnjj7z/K
         nTL3QSzk/l/ZTHs2SS7kZj7sWNXRQtDlh1X39538ttWijdhAAisReSJ9rLtmSNgPr67p
         OuLA==
X-Gm-Message-State: APuU4Z97qdanG/tbhVk8OP/s7owTvHtUJVsHtDcivVRMjb+t1IHBCpWq
	7WxkhPPWPxnL/ewKgSjdzMqEkbyRXUMvBUZoO5crC7pA2Ri+oUi6GDEk
X-Gm-Gg: AZFdTZffaMXxIqxeE3DRQCDlN8UMEn0Fen+UfbibhkYsm2uFsHm9IV0k0zpEE787u6I
	dF9U/5xeJxCmhUCwZPfSdu3+NWcLjTAccrOc2+m8I6lHN5RmQmHLfVDh9+bWqI6Rjgi+CCOTR/1
	pR3AZ4pPTps/+5ByKhUk2LMvVAnX0110De14gZ8PSKEpTj3NB5zG7gC0Jo/A1djS9CtaZT44jNw
	mZY7y2YXzs7t9OtdyHyKM2wOlUl4tG1Fbg0EeYlaRd2Ng6RaEHSxcbexHfIWVrrEObNvfqXj92s
	H8gNFNf2qtKeCW/jNSbEqNhdV/w3/3Em7UekloKX7nacc3hoehUmETqt7YnmufyQaY30Z2vk2XS
	SJI19LQs3XGhgwWqgjvrlpnXMbfqHZJiin+VbellbPudDCs3wTl3jOS7I/gn+lWeBjsCfZg69a7
	TTkGs4+YYEDiSDpoeZkbhSIfamupgoXrcrL/RMDvqzByBl4PlFQUYD2U8cILvdaAPLwddkwkkIh
	O3sZKz9VZBYhcHgfAEYX+GHKo61uUbLAJDYiDoExfVWAGVZ36x3GBQzHcgy3FNa+NdUJ4teP2N6
	c7J/hmodqAp/w+6mOnav8wbF2fsjRH/TAS5SZzdRVo1hVBYQ
X-Received: by 2002:a05:7022:3d14:b0:151:6e80:baa9 with SMTP id a92af1059eb24-1b55687f17dmr18299006c88.12.1795448402877;
        Mon, 23 Nov 2026 07:40:02 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:02 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	=?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= <kevin.lhopital@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/16] media: i2c: ov8865: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:22 +0700
Message-Id: <20261123153927.2547169-12-congnt264@gmail.com>
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

ov8865_probe() ends with the device runtime suspended, and
ov8865_s_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov8865_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its GPIOs released.

After disabling runtime PM, call ov8865_sensor_power(sensor, false) if
the device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 11c0d8fdccc5 ("media: i2c: Add support for the OV8865 image sensor")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov8865.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index c7dc97bf75f6..02948c5888f4 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -3118,6 +3118,10 @@ static void ov8865_remove(struct i2c_client *client)
 
 	v4l2_async_unregister_subdev(subdev);
 	pm_runtime_disable(sensor->dev);
+	if (!pm_runtime_status_suspended(sensor->dev)) {
+		ov8865_sensor_power(sensor, false);
+		pm_runtime_set_suspended(sensor->dev);
+	}
 	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
 	mutex_destroy(&sensor->mutex);
 	media_entity_cleanup(&subdev->entity);
-- 
2.25.1

