Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6A331EA0;
	Thu, 16 Jul 2026 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784168681; cv=none; b=nUZ9oowZXYfk0oYfN7NURj+Am655gyNEsK8xKl/ab/EDe1OfQTbscboKpk6vmb7fpgvXjkWF33382YpGsWXHhJXw/utUXCTwIl2rvaAwiLuNHU3OlOYnDWC8A0GBfo0nJ36tggGe95/Ik70pq+f3rBouKckhw5EpAu4VlrN6ibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784168681; c=relaxed/simple;
	bh=6ACPL3xPY4kCzIozm4mfvh78P8la9Wyv79Is5pmDTXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qs8E4xYIjJv9CrW+z+okfjz4rsMJwiqx8VH1a3w41jDsUZhfPLgZcU/3rXizLNjVBxJAYJ9lRbS05v2loR0nsJtmyykMjUU6NdXnFzH7ARxzkvgvECE/WV5Nu8pjYnTE8GJiQKCUtDB6JYVtOfeMq4KydgtxC3Z0/CX3T6oIhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=c+qXtr+X; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="c+qXtr+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=on
	YXaGprWzuvN/rin+WZnE7OSsL6l57M2UyUD/tPwgQ=; b=c+qXtr+XudFU9Ya2BN
	KYvo1PSnrhhsGzkXhFN3EYbq+SBh5zTwdHrnrdlkolAkqe0+bYh91hqzjhx1H15g
	0TYCuKI2vFWS1/1ICc+aAei7RE5EeT2d1tIYADumyIOGmhUOibpeclInS9Yh1TDC
	aTs+KC0LJwcDTMEmNO9hIz+zs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgA3lErOQFhql9a+GQ--.46811S3;
	Thu, 16 Jul 2026 10:24:26 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v3 1/2] media: s2255: check firmware size before reading trailing marker
Date: Thu, 16 Jul 2026 10:23:57 +0800
Message-Id: <20260716022358.161471-2-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260716022358.161471-1-huanglei814@163.com>
References: <20260716022358.161471-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgA3lErOQFhql9a+GQ--.46811S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF13XF1UCr4xtw13CryxAFb_yoWkurb_ur
	n7uw1kG3W0yry5Wr42kr1SvrWrArW8Wr1ruFn2q3W5J3yjqa1UXr4DZw1Iq3Z8GanFyF1U
	Jas5XF4fuwn8WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0UPE3UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9Bv27WpYQNuRUwAA3f

From: Lei Huang <huanglei@kylinos.cn>

s2255_probe() reads a 4-byte marker and version from the last 8 bytes
of the firmware blob (fw->data[fw_size - 8] and [fw_size - 4]). If the
firmware file is shorter than 8 bytes, fw_size - 8 underflows and the
access reads out of bounds. Validate the firmware size before indexing.

Fixes: 14d962602c8b ("V4L/DVB (8752): s2255drv: firmware improvement patch")
Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index 0b8182edf8e4..3917913c3b47 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -2277,6 +2277,11 @@ static int s2255_probe(struct usb_interface *interface,
 	}
 	/* check the firmware is valid */
 	fw_size = dev->fw_data->fw->size;
+	if (fw_size < 8) {
+		dev_err(&interface->dev, "Firmware invalid: too small.\n");
+		retval = -ENODEV;
+		goto errorFWMARKER;
+	}
 	pdata = (__le32 *) &dev->fw_data->fw->data[fw_size - 8];
 
 	if (*pdata != S2255_FW_MARKER) {
-- 
2.25.1

