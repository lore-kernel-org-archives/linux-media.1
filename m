Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448382;
	b=Cd2DRcrN86n0jIUU8qs39s/vWow/VimJVBktldBn3t3gpNIYVVGGkdym7mxS3GBAlv3x
	 2HLXfQqDqOXrK3QAlXW1zC2+V7w0Fdiy8IXZCNZI0SpSEFznLJOAbjc+/sX54PEJUIpcL
	 zU6yNsN5KwRjH78W8ySMlXfzJ1qQdTp/axTvVrOZwLQ/cLg21oZLczyREgMYcgORSpxq8
	 DrQowz1sKPFhkw16J+aB/ZvT8685pGEfBQSSZ1fJHWPZUNSkvPc3tj0zXN1DlnLAmI3xW
	 TertzJ/XXqgyonihgql14rdo1K4yFQue1ldzUFIM7RQrPUw1f8it6b4CvG8vSUtzQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
	b=NzgHbXsJWP7j4XtU32NQbLnawoNt4psZdkNsIaoEZj7r7hOQd0Rw6oa5M63wdNTLgLd8
	 R6eDI8bP7BtabORn+SYb87LpZz7NaQflnDXdpSMOLs7QS9qLWW4G1ohVVna+JEQGjxAKv
	 noxm1xjAbj4Kmh7cRwAlDlh5xDIH/7rTfyDsefTrlEAoW8ZkPYi81g8bl0BeBRqdE143z
	 h720Cnek21M83iTX3EEYrUtagkP5h1hTgGl2pAYMolylPhd9olTpr3MbKjvJ8q2y8AHnF
	 RZtxg7KD3F23dyaCZYxFdF7Wcz+ShMz6k21MQpgg1YZ+G1LL5CODNk7ti1SIlFeULsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Lbip2/cb";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B0606A681
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC5B0606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lbip2/cb
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b546061d58so7607703c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448381; x=1796053181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
        b=Lbip2/cbBCna80zi2kx4R0NYJr3D9fkZfE/lw33PANiyGYyOh2KPFz6T3481cPPX0Y
         Sk679aDN9vbIOFZGgNxeuFCrp6rbVkc4+nEod5w02Xe9RWOwuobOiu9B1VIVQ8Zm66hI
         8bIBjYEK+2Fj01s8wAH8TzPmQpVRxKN7X5Ycfr7QP1sME+sG81pXGQZbsZxYxE1L/+ol
         LfAyoQ08vkekzNEuxpvDdJSugbfXYm07iyamSqb82DrCVh87vOUiyQl85LMmYI/8hMnI
         1LTtzMDBLJlbx4I72LDBroAQGjiutIdh9BWHA0Wn7lBV5MTTvsaYITkwjNyEQo+alJ6J
         DCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448381; x=1796053181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIijkM6MY1bCZr/143mwHFpjqtMizBLsQ/aPcgegopA=;
        b=WSny/VCu6VqEP+Dp0aPj7cS6vU7PpmwInmPO2XbAYHVZ3s/6G0BhhuzzYNxsQN5gEd
         f1YBNAztB/JnjPjV1TwlLpRTtYhGHxIt3yQov67UN+1FdcsG247/PYt8HZKk5Q1tXOeU
         vuCt6wjvB6nlrVu6GIdeD8sS3QTLH7i9X7XoZoqGSrjMX0q8/DZuos/uBP9SSWEdytTB
         Pl8uMKjsMXRSK1KkUDtTGNqhd+JAPLsQnwjp2pSdaJ1K9Qs1IG+kRSFhVY5OgCruWiqR
         1NzkvJGEwM/NCXOz31P5r4MqP02EBo2DN2u0F/1/UfmmOit6oLMUAIB1ceXcJ0qdKv1p
         gs6g==
X-Gm-Message-State: APuU4Z/QUewmvBbDjdCQKOpAPHjs5uNVmO6BswtgW2yZ2RUUzLE07Yef
	z7b8EyqdBICnu3jO8QTz1gluItp5xG1GDQjy8pwGXwubK2+0wjrRzBu9
X-Gm-Gg: AZFdTZdbWeQ4Wm8RYDA66hal8V913yOCfma18xMNpCXAR50jhC/sJ6AW59yvFQ7FMAo
	I3sa41ALs5da8zRjSBPYPHduyaid3bRRj784OkdJSHcrsE26LDhi1PpFf9dqm8ufK7YBNU4wHPT
	gZNswWYKJsYwUniZ+yub6tFqOMnQ8IV3m/Evr0vEmoq3ZnnJFzfoWPPsxmZJ4cd1w6Z65xwOiKF
	N6nCdTH6MGn1AeVc/XxIEHR56pysv7mqVvZAI20n2qlfYh2dffxOoP1FDFsGcCt4QF+31V7vysq
	ESC+Ie+X1ZjlHzV2nfLTs2NHl0iMQvUe77IdccXzdWwxlulXhirgLl8MtLHRi3t1q64ls7KWoMj
	fAwTiIwhAKJFeMSMDXC6raAXg5HVXEWM3Os4EXldi0YojxE9tYlhNLFCs+OQOFI7PHwIM5LTgc9
	vn0DFYWIXEu64g8+l0qRSuBn3MeCdv63+CP+PaYqVghD1V0JVxMc9a1dvDQVMzgTidXKTDSgogD
	yChETEhx4Mm5ps+KzVH6UHwT/tTeEHNjlmrSa8PM28yEiqE2WX2ujx9vF7J5hU7TjHIcl5o7EDy
	o/Pw+1q+zuprw57/WO0EksLvp9u1RBipkpLX2vuxDrRcY1kAxmN21XIKUwILH9rLvb0L
X-Received: by 2002:a05:7022:ea8d:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b5568f6f77mr12668772c88.31.1795448380844;
        Mon, 23 Nov 2026 07:39:40 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:40 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] media: i2c: ov2740: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:14 +0700
Message-Id: <20261123153927.2547169-4-congnt264@gmail.com>
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

Move ov2740_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: ov2740: power off the sensor on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 31513d1524a3..ca2ea5d4e0a3 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1199,17 +1199,6 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 	return ret;
 }
 
-static void ov2740_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_subdev_cleanup(sd);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(&client->dev);
-}
-
 static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 			     size_t count)
 {
@@ -1458,6 +1447,17 @@ static int ov2740_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void ov2740_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_subdev_cleanup(sd);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(&client->dev);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 				 NULL);
 
-- 
2.25.1

