Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448385;
	b=1hWhZC54iYqHojbY7G+FDijMZMOROr8NOzWyKgygo7L0PswDzlQLltiWf6mRHucrNoMM
	 2seUeRB+QdNcjlKScUrJqLKIb2SajUGKezqnYlCDMgmFsAQcF9iIkpUSx8Oc2uAyF2BIB
	 53w0FsBfQPVCw90qI9Tg9HeUy36G6asx3T6+dG4LzSnuJSO7gA4apfZsNGsKvewTPiO2I
	 fkK8Ie31nra5yHPQQ7/1SDGIrVU7P4SsbVjzGhczoj+/AIajghawObnYaqGsC7N9aeIUk
	 IxwvZSokFYT5dAvblRC2AIPCBcGFhhw8nYdO5W1GuptLq+Z3oG5aakmDZQA022js9Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
	b=Ds+ICCK8Ujag+YbKEv4qgeCbrkkCyauB9er1JbVJX5GMdpV0ExRuq+9rSRKbj3y+ngTi
	 6bqjYhtHAHcD9HyUexUhhzJIH5LjXa9MuTYsi1Wbii7l8ku+eS6M0vFoJPJC51kif64tJ
	 VUn7RYJtrbTigr+Yf3N1xbperlLSAe2Cp8+QJruSkb6tqmzHFrZ63sRoTsvR3qkFYWg14
	 jD0TiXWDAA62otCIqstZOSl3rUBsxK+I+XhcTLuBIcChxjldJGEPl8+VAVkt/FLje7N1u
	 ipaFDqE0iVtbhFxYmIVjpViPr5wWkiR7P6hAEGW4UwA45npKS8WZOxohwwiIoTrJY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2iJ6ygL;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB24C606A693
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB24C606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2iJ6ygL
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so5752765c88.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448384; x=1796053184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
        b=c2iJ6ygLdNkbsPoO18wGJ4JUpSyLeDAcswpF72m+U35OWh7PKn5Dq68bzfI7KlBlZe
         kAuAMnXnUqH4plLvtGpzM8UCKYqD1r6699vGPzh1iYwaPVTlKLo92s6vtdUSpRXQAIy6
         cVdNL+CxzgaHeBp6vfoxRv0De8lW913NS5s1GSzaUYIcCH/bQpFDYjEXjE4q02WABJzw
         LrtPn+cBgRFYtQucFnEpJiwMOwY41QkA5bmJYqfsXQ6OO0ObWGT9bHesMSEo2sL37K7L
         e547FWmnzriNz//piUx4sbKHV+kqFVP74Ll14+v+FT5zvFKz7m0lRziMu82aKo3dgdtf
         4iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448384; x=1796053184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg6u6KS4BHnwCfzVFUldneMf5zb5FDtQCD09MbvPg5c=;
        b=Bg3F5MRdHqW+SyOkCGDxvmo38LKgKrVV46cOCZHQotILAK7YL06auoLor0lLHqd1hn
         iOLUP4zPUMwQVme/QdKzI/sNkKqdblYqI1HmBRo+4Lh9KEWV517y13gUE+8fXMkJ/v1K
         TrR9+Wg7QMGpPW1WP6jTAaHCG7lOZ9+cOFgR9LDUvHSvyBmxdN0q0szPX6Y9c8lwhnC/
         /Ft67m9LGuaZXYYXM6iQXf5to0Bf2KM5Mqg8TjH7LAtW4TDMcs/H6tfyxw4Xe5IKeVDg
         YEKMSB6DNIieAzDDZAcgvZRDPMBrYPnAR+gup5t8aLbrwB36zP0JQnFEPD1Z9dTIna72
         BzLA==
X-Gm-Message-State: APuU4Z+eJdfWBtHIf5HwAk/AxsVdXKkfMZfLff7VWNzidR25dr2caTYC
	3a0DggrTaEyayseV9Cw/1qDKTJOZG23Fx7CatGsX8syAKrI0zv/kfBy5puGIJA==
X-Gm-Gg: AZFdTZeJ1kkF0yhzQjCiyBjufAUKTO/jor/5d6xGwdoxFp5bVSoivnFeyKI9LcO/T3i
	XWVniM6pkRiwPVbdrHxwNixBgUAtvCqAf31Cza/NlyhcU/OC0JfKY16g5IdU7+YpzcmmJjisiw7
	m14i1LGcIu1oSWQ+bVktI5y+143wDuR3wtp4+wzuQ/XgKWXZ0vZBHK870VeDAPW9WpzldLCeOv7
	+E41PL8V+xizQwVdyZeS7Yox0UcGhzIrP7cc1GBCcvcAB88PK9uI4eZk0E8QcMMEJWyvrz97Svj
	uhd/L6cjyO9etw8gFyG1klGXbh0oUIAl0F+Ny9FA4LKrcwF2p1ooCbhmrV7pY33lhrj7j9wT4ql
	12OT6RKhB4uQeuBr7LA1g7AlGIGaLLD3K8/D9AZRLy6FDSe8ZerB+VxVnjBrmeyqwJRi66mGZlD
	HJ+M0xZXqPS/3Ymt39ZenTJIUiKpQ9/qQktUR6B+ThixYYZqtipe2bLaqeEDt82/Cy9PjFYa1no
	CsU7dJXKo9/AbpoIMey1vPDoHb2M5BzuE3W4tSvtMotds/W+ubCEGq7pydepsjfyCColZWfLo0e
	exNHeHN1xPTQboNzwo1z5OXaq0An7EALwXevYhyFkTv6lyg/8CI+HMXpARW/WCKqhNo9
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11352062c88.22.1795448383825;
        Mon, 23 Nov 2026 07:39:43 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:43 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Tu <shawnx.tu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] media: i2c: ov2740: power off the sensor on remove
Date: Mon, 23 Nov 2026 22:39:15 +0700
Message-Id: <20261123153927.2547169-5-congnt264@gmail.com>
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

ov2740_set_stream() takes a runtime PM reference with
pm_runtime_resume_and_get() when streaming starts and drops it when
streaming stops. ov2740_remove() only calls pm_runtime_disable(), which
does not run the runtime suspend callback, so a device that is still
runtime active when the driver is unbound can keep its regulators and clock
enabled and its reset and powerdown GPIOs released.

The probe error path already calls ov2740_suspend() when the sensor was
powered on. After disabling runtime PM in remove(), do the same if the
device is not runtime suspended, and set the runtime PM status to
suspended. Avoid powering it off again when runtime suspend has already
done so.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 866edc895171 ("media: i2c: Add ov2740 image sensor driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov2740.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ca2ea5d4e0a3..8e495c70b961 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1456,6 +1456,10 @@ static void ov2740_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		ov2740_suspend(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
-- 
2.25.1

