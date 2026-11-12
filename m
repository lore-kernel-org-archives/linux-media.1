Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466582;
	b=YNIGIMatkYeRgc/7jkKH65rvYJpbe7exvdPuGgFJlQOJEZdgnxWpfQEkBO+NpCU03cbU
	 MtZi8CYTWA6sbzsV6y2OmDE87I3/CoTEyLePEinhc/Bnv5dxAgb99norJrcG1H2ifq8NC
	 i/zjK+KgPV8jyjsnAUe6LlBed/Qj20IUNJYx3AvcZycd55Aq+pcGMxP6EacFwceb+G6Z0
	 UIGLSBi1lU2VgFi6s2WmnvpGgQTvQRUrtDAyUkqSVeBAseIRa9a66jxURWOOUzLVUJ9cH
	 W8S+d1FeUzHgIViHtvXpEXxoJj2sqTlmdgmULMmCQqWCmFcMUf8eGiSRpU9qmxNxNwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
	b=43c8SYpi3+Q/SyY7fTJ4Zr6aqw9TBGcnr4Nx55YRD3zO6RgRMdhjhlhvKDUBXJG9Ov//
	 4nhcLTQfkzG6DFeEQsoOTEl1suaCwgCUVRxTxcm+Yg6AQbImQ0vUPvpXtj/RnGAUMjrZD
	 BL5WZMVwd8NOK8Km4JaXTWSqsP5e7KqxBcLVjBshFdIRB9FN06vRAuarvIh6kuuVL71F7
	 CRNQOdlEcQhWLJ8gjAzuUADUlZlZhCxb9eN72vrMNcXSB6EU6hEejx1bIQC559RH9J85j
	 BA98wMvfSufGb+2cCMyE/Xa+hQ6B6RBIlXmXX1W6o+9G4A/dVmhofUDTkwyeHWDSIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrR1tH4;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD49606A89A
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 06:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD49606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrR1tH4
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533797e72e8so24856671cf.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 22:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466581; x=1795071381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
        b=tfrR1tH4wMon/iJLwE71zZ5ygcvlIRUqDsKCDxPD8+nXPK+7SbGjbpUgB4ux08bFwR
         kAedk4D1uytudKaOMM6K9vzrVi6TLbJ5GhyrXQeYI2kr4NcdaR/5c25OG+YH24qo4fUr
         CJ9dmIBr2gUuhlrPGg/3BUkOwNKoiVO4NHlC+Znl74NmN8uKi88uQ3w8HXwgrGyZD5vD
         jvIMF6xlzSNGLH8Z8sb8gNdNVzlC3rYRQ6QlbK5iUxajt0f9WYdv2I0zkzNtgxtovI0x
         4RznnMrCmGIK+8Jx/YEru48Hpp9cV5P+05YC6Pe0Ks3xVgudX2sabAVlzHwPYGEsCv1p
         MQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466581; x=1795071381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZG6VhCuHtrCJJzccAUt7IJkMQXU/fhnJBTGZBLb7Mhg=;
        b=pckG8dfY72nQslm/gv83LZcoHbadjKlwyR9jlVRFuI/26+RcKJqndfqCl2LtX88E8W
         qOTPSG9hNwsP0fq8YJ5F5Vu7cv4HtrNNESFgD837U0E2G7/1F9RbdmB0FTCB/tnNzPej
         ARkT3YLXgE1NVkYBybWJM3bo7y4gIrpKs+R3J0Qou11PU15OpWY27Ckp4ZYjpKaFmzM0
         vDSt5qig4FZxQy4d9y+miPeVXeJGnHOxwbP+mPk6Xx8NlTB8BbzQFH/2/8l1oNcqQ/gH
         FuNK8nzBX262WFnBrbLRAQoT2vQ2eCbea+yzBw7Q/ka0jiLdDyrTj4hXWhDbktkd5Wix
         O0pQ==
X-Forwarded-Encrypted: i=1; AL+hErG3gpFDGpCb9SfBTJ2fW7iw6+Ej25CJ2LiniCt+WLPlBO96kT0Q96DI7Yp+fHalbulhIiudQWFaezD8Ag==@vger.kernel.org
X-Gm-Message-State: APuU4Z8F3EwZRIJi0T+MNqRNebDjdiyMmWyOLeNuk81uk17rkbhRzr3C
	S9bi9kIHMLx75krii4oqTHNuKYiyZDxFsxFbTtcj33BevYaGmmQnI+Y=
X-Gm-Gg: AYBFou1deQ5l7CX02JzItVHdO+SJMEdPCgG2+o0gXXig1uzXTHnQLh0GkMPg/UjFWG8
	n8Zo2c/L4szua7K24oOUDHgjWqR8JL0eqmghRaMT4yoN2AxYRrGag1At6AXmolea5qvHTNPW5lR
	zn1CRsjabkCF+4WY/mDOQgBx2vOValAF2eScJFhwsfVPV28Ac7Ky0NXJJw4y4ZLu6pKbvkK3pfl
	knnGHUviyO6GwFaXnE3IztQUUXMM191kDYsT2dfQJsQIGXYX2VH/HRcQUnlP6s3HU/dP2Af6eaK
	SrS/pY0WAI/7OSNJ34UDqq7EyKdebzGRTaGf8K31slGChrX50C2Jwy3N1EV6ZLwJeGBswGNzb/F
	d7k4JgCt4sYmVM8P+N0acRY9IT7ah0wAn5y+au2JO4B6rF1ORNxI49ptDxoF+yY1PThRtl/8cUE
	v/fFHsOteARK5U/mwtYfnwTh7i5nIfu5rZmw343ge0tlnzvmosk8CL79mCunnTOaKwu3TloIU6p
	ONT/5AOE6M0daml/v/lxjdb43K44essXYby3vKpcWVxl9rYZgZGb+PaHpHK2YIWUQpJMGZ9EkEg
	B8V2DdGmWB9F43qriNQMmun67sENY33i7h2OzxPQYC3+fWTuboXYlbXgHgue5VD8Pbz25xhnWMD
	pvFBv+mend3nS1jwZxSHNVAE5lphcenFXYaYwr0D1Cfge4eyYolfN6Tk8e9rMtHnAZAl/Xr/9hT
	ebG7B670AmrdpyAW40qTWUfWTQLXa+Lvxo
X-Received: by 2002:a05:622a:34b:b0:537:8400:ab71 with SMTP id d75a77b69052e-556c04f78bamr79867681cf.39.1794466580744;
        Wed, 11 Nov 2026 22:56:20 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0318890sm63824076d6.4.2026.11.11.22.56.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:56:20 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: ir-hix5hd2: Disable the interrupt before freeing the rc device
Date: Thu, 12 Nov 2026 01:56:18 -0500
Message-ID: <20261112065618.34238-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

The devm-managed IRQ remains active while hix5hd2_ir_remove() disables
the clock and frees the rc device. The receiver may still be running
after open() or resume(), allowing the handler to access unclocked
registers or pass a freed rc device to the raw event code.

Call disable_irq() first to stop and synchronize the handler before
clock shutdown and rc device teardown. This must also precede
rc_unregister_device(), whose close callback can disable the clock or
reset the hardware.

Found by a static analysis tool under development.
Not tested on hardware.

Fixes: a84fcdaa9058 ("[media] rc: Introduce hix5hd2 IR transmitter driver")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 drivers/media/rc/ir-hix5hd2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index f74deb408218..e6770588399b 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -344,6 +344,7 @@ static void hix5hd2_ir_remove(struct platform_device *pdev)
 {
 	struct hix5hd2_ir_priv *priv = platform_get_drvdata(pdev);
 
+	disable_irq(priv->irq);
 	clk_disable_unprepare(priv->clock);
 	rc_unregister_device(priv->rdev);
 	rc_free_device(priv->rdev);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

