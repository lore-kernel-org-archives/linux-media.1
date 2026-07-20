Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EF030DEBE;
	Mon, 20 Jul 2026 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516145; cv=none; b=B1MuiGhnc6fCL6Ro6EhrCxwQ8d/qeUCKghFhTHPCYeLGlil9N56A+I2x2k+Mf1jId0PJwV1+SS9jZ/9rWmctyQNwCY97fGd+FVZ8K/DLEgnaQRGc593EmxwvOJW9fSV1++vXFFpBD50g6/ioqh9avfcAKQjpT3kXuyaSc9rsMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516145; c=relaxed/simple;
	bh=tYc0rSHf59xvk6hwCOVS+nA/C2J7/Hhkkm28If3nxQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QN3DMrKuvOyo6hDzbo15mxOsQ5l2jD5wvfEmcY0NfjySK279feR4jjwsFb7MssUxwzMBHtMyib1M1TxtNQtbVxnTv30B7kCFKGHSM/l0nURqhh32yL4mVPnajO0pcs7Baet7xyZbVXFmQZlcL+TSyVzZUfACHyRAXtz8sQAiEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MYR3lHnF; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MYR3lHnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SI
	5Xza7vx1jANaFpKhsJ9QPkCe10bTifrZn3lAmEOaY=; b=MYR3lHnFEBnzu0MbOD
	pvBRiwK+Oyq5sNl7/ID+apHtnfnEc3hyjBzY7T4k+hFo3JyNTx3Y/wr1vfcylSnx
	U3ln8Mv97kb/UrcZB33X0up2Y/Ye8P783A6OUycU/WpgOiSV9B6VNJ6sFFlUcVEk
	JCey+elpooeoa/nz/2SgfqYQk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnZIkOjl1qWxR+Kw--.19016S8;
	Mon, 20 Jul 2026 10:55:15 +0800 (CST)
From: Lei Huang <huanglei814@163.com>
To: mchehab@kernel.org
Cc: johan@kernel.org,
	hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: [PATCH v2 16/17] media: s2255: Remove unnecessary braces from single-statement blocks
Date: Mon, 20 Jul 2026 10:55:07 +0800
Message-Id: <20260720025508.207815-7-huanglei814@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260720025508.207815-1-huanglei814@163.com>
References: <20260720025508.207815-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnZIkOjl1qWxR+Kw--.19016S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrWftw1DtFWrZr1rXryrJFb_yoW8AF4xpa
	95WFWvkry5Jw15XFWkJ3WUXa45X3WkJayUKFW2v3yDWr13A34DZryktFyxZrWDArySk3WS
	qrs0gr129r4jqFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcyCJUUUUU=
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC9BOZkGpdjhPMkAAA3Y

From: Lei Huang <huanglei@kylinos.cn>

Fix all 4 'WARNING: braces {} are not necessary for single statement
blocks' issues reported by checkpatch.pl in s2255drv.c. Remove braces
from single-statement if blocks where they are not needed.

Signed-off-by: Lei Huang <huanglei@kylinos.cn>
---
 drivers/media/usb/s2255/s2255drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/s2255/s2255drv.c b/drivers/media/usb/s2255/s2255drv.c
index a9ed663cece4..c66cca2e76dd 100644
--- a/drivers/media/usb/s2255/s2255drv.c
+++ b/drivers/media/usb/s2255/s2255drv.c
@@ -1978,9 +1978,8 @@ static int s2255_board_init(struct s2255_dev *dev)
 
 	pipe->transfer_buffer = kzalloc(pipe->max_transfer_size,
 					GFP_KERNEL);
-	if (!pipe->transfer_buffer) {
+	if (!pipe->transfer_buffer)
 		return -ENOMEM;
-	}
 	/* query the firmware */
 	fw_ver = s2255_get_fx2fw(dev);
 
@@ -2210,14 +2209,12 @@ static int s2255_probe(struct usb_interface *interface,
 
 	/* allocate memory for our device state and initialize it to zero */
 	dev = kzalloc_obj(struct s2255_dev);
-	if (!dev) {
+	if (!dev)
 		return -ENOMEM;
-	}
 
 	dev->cmdbuf = kzalloc(S2255_CMDBUF_SIZE, GFP_KERNEL);
-	if (!dev->cmdbuf) {
+	if (!dev->cmdbuf)
 		goto err_fwdata1;
-	}
 
 	refcount_set(&dev->num_channels, 0);
 	dev->pid = id->idProduct;
@@ -2266,9 +2263,8 @@ static int s2255_probe(struct usb_interface *interface,
 		goto err_fwurb;
 
 	dev->fw_data->pfw_data = kzalloc(CHUNK_SIZE, GFP_KERNEL);
-	if (!dev->fw_data->pfw_data) {
+	if (!dev->fw_data->pfw_data)
 		goto err_fwdata2;
-	}
 	/* load the first chunk */
 	if (request_firmware(&dev->fw_data->fw,
 			     FIRMWARE_FILE_NAME, &dev->udev->dev)) {
-- 
2.25.1

