Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448393;
	b=PekOqDP3uSL1a1lDQSAh55gkf2huE3sQIm5tIfJKXyYsqp+jeJw0bzr1IxL3yuu4G0OF
	 JX4ichKpfkgFzrcHIBizS8C6NdXGOI8f5mwyQfD30XsIbn8Dgj1mVLyZW1rp7UVhu5Swe
	 B9s/yUMZJBEll4N0BbBvv3rk8O+Y2BeL7dnU0q4Dxt36BWZ3TH0vbm6pOx3Nv9xTEmuza
	 oS5x78gU3l/BpnBe65NFP7xulp0w3wTPL1mMJxDFbFd5wDNIXB6W7fqjoP8UoHTrqIhI9
	 7DQEha8Qi7Wt+XwrR+YLW8MkQoX8HpY3YEXezk7IA4BuaHLkSgZwjboznMb7DwGJGjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
	b=rSsaXbK+agSIhYE2tm5jiVGX7ofGjjc7U6o/TDlCPdhoxF6v0q+GOAjRx55TPXi6umr7
	 Ge3b4Tr90557t13DJXTiQGD9L4Gl2alLloU92zVyqkCUI25Mxaxd3J0Sg4Tno1ndIjfQA
	 2wVgBndRvg5DAretWJ4FlKjrkkIbEH/hK5AKIbOk5uOBw2qqFKS6eyiouQeCDWnxTYK+c
	 lt1Z9oDEjVo5rzRMghpvQwH5Qg6f/80wjVC/wFTl5KA5wvDoFaJPZlEV8HUunj7QukFYW
	 Ryoqnos62NiKULr0gBiC2iQMvR+ngbjZyS4AJD3/kAmV+sb+YHXVinsCdRwCNpbIfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok5SYxjV;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC5606A6BA
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5BC5606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ok5SYxjV
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-15ea896ddc8so5753025c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448392; x=1796053192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
        b=ok5SYxjV6o8dq6DuX0zneZHfwHZjH8ALj/ltadv9dglVJX4zrQMhi1d+nSS6DDhxKq
         FiXhxmJtgAQRaYKPyA3S3/vc9fmfFKvrMQF8ZDTbcpX14Gxzmzl+pKbG5oGcDtlj7vQ5
         glScRIbIaP8sQlBqqtx39E6AUVB0oZ0h9+vB9tdFGyECbO45sKHKrZOFewP2P8s2b96r
         QVb5JNQ2KETNfUUaUqkkGJEQB4AH9bOyj8w7PKaO7SVdvFglONOycMO3FBivnLhl5oUm
         1lzYcACT1q76kH4Is+Oo8xpJbxKjTlGvHQqM0huRD7IlQmIXn6PGIEoDDXXKPETVHjTJ
         MY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448392; x=1796053192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnFtEm3Izxz1UaZJoPtPCYt5FC5hB7rMwqRB7aaszpY=;
        b=xHrHyWGgUpjjG7vF7uSp5dzGCe9WKTGqbqgvwOpJPS70N9tDoqalw3VYVvsyIpBqwM
         vw6yL4TM8NE7Lv+F5Na5yxZqWx2exFIzzQ2gzTTJBu0fI/hq3WPL1+z42XVaLsJoGQzZ
         NuiqccDhZszcaFoDNJmUTTiSoKoQnEzLS+CC+KHracCQCKFqLloUk3bQutyUIOF4qdQk
         eRqPSm04OTuk7YqP1XyuluK9rxI4ZqyX8/uDhKNLff/QxdyCRxb78ycbZ/6zZrKgWpIv
         eGURmDjPR5baYT4gJCliBUFXV9JC3RPwqv4PksKLmtxEjtt11u/YzQMFTLsawYj7hQ91
         /4xQ==
X-Gm-Message-State: APuU4Z9AkVh8oAuZobwWuO6mg+v5JnA31PI1seXW9n2c/UbQh0ivX4T3
	RIDSJXpzmRlSbTgrU6pUGzY83Y95oNvmp63KodAMNlib8d+8WiBstv/E
X-Gm-Gg: AZFdTZdXlUKd4ugcuHlsE6FCqId16zqxrrOM7BJyEYaVQES4nWMTHEWdnPYRZzf835S
	dRXseD90A5dON+dbS94nw5kI6y3VudaAWqk2T+emEOPVE+hXB/1M90smrlTC3pn0OY2GpmwPTo8
	RBcbrxSwruwQeJ2vG1S9+pgpxvvIf3qXV413XwNmMljJB/6C8HjOUir0iaSpZQQa35Jf1wm+s3d
	n0EJu9Kcm3JhqzcKFlD/6MezNFvxZKwikh6z7HwA0iwEA1+e2yFEYmmyqyVUyMhWILMXMMXAhWn
	iM8NeImrkwQ8VMs52NL+6tx5G0QNl42JLG3gm+LPR9qK9aUsbJvg1hjF89x1C0x3WhVzi3+nIho
	f334X8RDSaC+cgfRWFupqRSzAh8eUPnkpX+f0uJC/EU3Uhl8m4SFcBvNv3BDOFm9A88qqPg1Czj
	zaxJNVhGSHaIwXzi3k/ggIgYthrVvX5ZtDj4E4zGb46SCGNPbWtsyZzlOEwy47eyIwr0OiBXf5A
	Apf0T2DFWxpJDJkzv1OgJy/mmb2RrdVvsj5cl2TuRCkErcEctVDAzSj+Ru/LWURX1pCF6xwl8pM
	A0svhFNgEyo/sqAAbDQBjeak1Tm44O4Jt11Q2R+DxpI26vY=
X-Received: by 2002:a05:7023:b12:b0:141:5281:8a41 with SMTP id a92af1059eb24-1b55687fbc9mr12426552c88.9.1795448391824;
        Mon, 23 Nov 2026 07:39:51 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:51 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Arec Kao <arec.kao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/16] media: i2c: ov13b10: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:18 +0700
Message-Id: <20261123153927.2547169-8-congnt264@gmail.com>
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

ov13b10_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov13b10_remove() calls pm_runtime_disable() and
pm_runtime_set_suspended() but never ov13b10_power_off(), so a device
that is still runtime active when the driver is unbound can keep its clock
and regulators enabled.

After disabling runtime PM, call ov13b10_power_off() if the device is
not already runtime suspended, and only then set the runtime PM status
to suspended. Avoid powering it off again when runtime suspend has
already done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 7ee850546822 ("media: Add sensor driver support for the ov13b10 camera.")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov13b10.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index f639a70f60dc..b4d67018c983 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -1689,7 +1689,10 @@ static void ov13b10_remove(struct i2c_client *client)
 	ov13b10_free_controls(ov13b);
 
 	pm_runtime_disable(ov13b->dev);
-	pm_runtime_set_suspended(ov13b->dev);
+	if (!pm_runtime_status_suspended(ov13b->dev)) {
+		ov13b10_power_off(ov13b->dev);
+		pm_runtime_set_suspended(ov13b->dev);
+	}
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
-- 
2.25.1

