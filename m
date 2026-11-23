Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448387;
	b=FjDzmqnLg8rVflHuFSjhmx2W+QBJwy0pSms5HuFKywuI+kZgCMrfKJJlQNTx7rK/OHte
	 o1PQi7tJy9o9otM+/L9K/OLTtFWpw1zfFNnl3RS5D6wUVe28LwGAZOhSOI3FPNdZPbbzk
	 WcCxL/aI6IRjBP0W1yQ3NueZlh+lb9wP9lAAdb8HtP+u91n73bDKfoLxFrFjP9AKiJ2UE
	 SUdic0U3FOuZdf0ke9WvHBA7uMo7tRHSA0AGRopP3WeFtF5CS4Gu0ELOwbML7lgvTm4Eo
	 MvwhWoCobwOQA3fc8/LvthAdDjGjHdNAMxhyfqDgMxnmPOmx+bFj6B6vBB+Yrpi+a6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
	b=jh6vYHbN4B+JLMfKq1O8GXEy9Cu7pVO5JV3bzaJ5wXrBuCw8ej6DwXcwAQgfTGcTUUsq
	 OmM9JtzamYE/zjk7u+uhnqGFJf5DxrtfP/pMlW0ESJ2ctLv30cgWcZvUiZMdGv4o6fQI1
	 Hd8C+ncVWKIxFyrcYUrvaJhWYrHGPm0y+FvsFwbHRo/9EsncHTejSRG/H6967RypAE7hY
	 rK5BBbVXy5WcVatt5eLIIY8LfVvPQU23JgD0m5wzxdEtgjjbSVuMJehct9gqMn2ULtt5V
	 wvtITpFVZAG/g0hWalGVbmfTCSXzPDe53C9cOPwKAfhkl9drdHnwxEMABAlimg1NWMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+Bj4Ciu;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75501606A6AD
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75501606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+Bj4Ciu
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so5051198c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448387; x=1796053187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
        b=g+Bj4Ciuucg7+rplxCzFkjO2jrw03UI2fqDGuTV0a1SwYfbO4dBdLXfNh5LMtu4LZQ
         qs3tIFXbg7dkEFiliFBYkxjUaboGTmDwIEX0S1n4xTXs0vl9ISuljIJYBXSaqyIjUE9U
         my+fjsJJHyf6efvVVQOP7Jd+ZxS1Syb846aThwSRNrHgyI8rjt8ffU4UHMaqCjLcG3yK
         Z3WxAhMQZJmmuqhF4Jw/lGlM25rGydSrM8aPV7lQarMxNjtyVeSe8GtQTfzHcdD6oLyc
         Vdb3V7WUoEbDYrW6K0+gKsPhZ1cXxNXUMR48o+Rgy7ntemd+1EDXF15mQHG5jIT+RMf8
         Pnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448387; x=1796053187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2es8tuJnBEC1bxJsfksjdYK11MeTT6qyf7M90vq1nE=;
        b=GGuDinjGKlNwT6RhB8Xms1aJQTamD/rLPNi4h+IzjGRKLq7+nRm6AXTSZuWxe3N3Gk
         T6sfKzhuuyEYaQsyBMfUi71udE1pifwuOeKbGhnXu05VrNSibzDC7W5xGR53Nk8jvPf5
         RqiNxD06/mLARp/1FDyaaHvQccq8jD/CQAWvt0mfEeYHFoDyRrTxFitup5fhT5EzdCIv
         L6gEq064uCWz6lqWgE+8+0ZT+1ButBYfmUCtvaCnovIP6aPbQU7kpyY2heY+0zzVdSR6
         G+P8EB+K0ScN1aE/ZAaxltCwgn19+ICX8XazqT18uPaW5+R7qM4JNb746wBxAt7IWOx2
         sEwg==
X-Gm-Message-State: APuU4Z8oiTTCqUd1eJN6Oo5kh8ncOekVdMMuBZPzsKgL0zwwwhLvAfmo
	M2RzcoPfbu85bApiHmwDcKr4CE9a/JFuz0JMKNVgCZ3aMe9T+Yv7sfbT
X-Gm-Gg: AZFdTZcU1glvF10HsnsFXAzuSdI1dcRKoNyE8b0vNDsi1SzXgPEkTYd9hIika2eQX4V
	8IJsoVTq2kOTYRjSyeIImfgK647QA6qSPAInP2Lv811Hkdg4agTm6xqEu2txnK9/NdQUUwljw3X
	vLYumyCAk0vBQ6zYCXzRRC1OcM8Te7Nmora8O9CddERTLmxsRhQopI80Q8+Lbd2rGlyVU/QgJwV
	jsdKe4ypGR/hVjVpsrfyYa8StzTJm1UYP3GIs12NALz2sYgMH66T1eWfio1LUrUyux01gprBwDp
	ThyZManpBVNbpNBD4wHj9Lq/k/WwLk8mEeu5DNBawzdwvBxeiX8mVFmrsj3vYhcRoMNj6dF8SFP
	cd4f9tFs3vSMDLuxlumJzMp1mN10R/gb29iZGWgsX032jZ4qL7N+jUJVrox00VRytN+6PPzlt+w
	XolG6JlmlT6ws+lm2YG9Q+NsuuDLTHOC3yUFF+xtDhc21ETThVwd0gArbsTIHJHX23J1cCPsjYC
	a6rpTzxCdAETXlyapF/DQhc4lix5VcVFwV2yXa9EHTX61vaQEy9TdPg0bolbrX/nipXPK+4QDX2
	gfCx7dFEOSwrBBvMyrRiAhcVVBsIcR9oyw==
X-Received: by 2002:a05:7022:b044:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1b5568e7699mr13828058c88.29.1795448386401;
        Mon, 23 Nov 2026 07:39:46 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:46 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] media: i2c: ak7375: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:16 +0700
Message-Id: <20261123153927.2547169-6-congnt264@gmail.com>
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

Move ak7375_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: ak7375: power off the lens driver on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ak7375.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index 1ece5708b4b2..2827fdb29298 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -228,16 +228,6 @@ static int ak7375_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void ak7375_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
-
-	ak7375_subdev_cleanup(ak7375_dev);
-	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
-}
-
 /*
  * This function sets the vcm position, so it consumes least current
  * The lens position is gradually moved in units of ctrl_steps,
@@ -334,6 +324,16 @@ static const struct of_device_id ak7375_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ak7375_of_table);
 
+static void ak7375_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ak7375_device *ak7375_dev = sd_to_ak7375_vcm(sd);
+
+	ak7375_subdev_cleanup(ak7375_dev);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
 static const struct dev_pm_ops ak7375_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(ak7375_vcm_suspend, ak7375_vcm_resume)
 	SET_RUNTIME_PM_OPS(ak7375_vcm_suspend, ak7375_vcm_resume, NULL)
-- 
2.25.1

